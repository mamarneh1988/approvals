CREATE TABLE "EBA_DEMO_APPR_DEPT" 
   (	"DEPTNO" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOT NULL ENABLE, 
	"DNAME" VARCHAR2(14), 
	"LOC" VARCHAR2(13), 
	 CONSTRAINT "EBA_DEMO_APPR_DEPT_PK" PRIMARY KEY ("DEPTNO")
  USING INDEX  ENABLE
   )  ROWDEPENDENCIES ;

CREATE TABLE "EBA_DEMO_APPR_EMP" 
   (	"EMPNO" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 8000 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOT NULL ENABLE, 
	"ENAME" VARCHAR2(10), 
	"JOB" VARCHAR2(9), 
	"MGR" NUMBER(4,0), 
	"HIREDATE" DATE, 
	"SAL" NUMBER(7,2), 
	"COMM" NUMBER(7,2), 
	"DEPTNO" NUMBER, 
	 CONSTRAINT "EBA_DEMO_APPR_EMP_PK" PRIMARY KEY ("EMPNO")
  USING INDEX  ENABLE
   )  ROWDEPENDENCIES ;

CREATE TABLE "EBA_DEMO_APPR_SAL_HISTORY" 
   (	"ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOT NULL ENABLE, 
	"EMPNO" NUMBER, 
	"NEW_SAL" NUMBER, 
	"APPROVAL_DATE" DATE, 
	"OLD_SAL" NUMBER, 
	"TASK_ID" NUMBER, 
	 CONSTRAINT "EBA_DEMO_APPR_SAL_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   ) ;

CREATE TABLE "EBA_DEMO_APPR_LAPTOP_REQUESTS" 
   (	"ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOT NULL ENABLE, 
	"EMPNO" NUMBER NOT NULL ENABLE, 
	"STATUS" VARCHAR2(8) DEFAULT 'PENDING' NOT NULL ENABLE, 
	"DECISION_DATE" DATE, 
	"APPROVER" VARCHAR2(80), 
	"LAPTOP_TYPE" VARCHAR2(10), 
	"NEED_BY" DATE, 
	"ORDER_DATE" DATE, 
	"DELIVERED_DATE" DATE, 
	 CONSTRAINT "LAPTOP_REQUEST_STATUS_CK" CHECK (status IN ('APPROVED','REJECTED','PENDING')) ENABLE
   )  ROWDEPENDENCIES ;

CREATE TABLE "EBA_DEMO_APPR_APPROVERS" 
   (	"ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOT NULL ENABLE, 
	"USERNAME" VARCHAR2(50 CHAR), 
	"TASK_DEF_STATIC_ID" VARCHAR2(50 CHAR), 
	"JOB_CODES" VARCHAR2(50 CHAR), 
	"PARTICIPANT_ROLE" VARCHAR2(8 CHAR), 
	"MIN_SALARY" NUMBER, 
	 CONSTRAINT "APPROVERS_PARTICPANT_ROLE_CK" CHECK (participant_role='APPROVER' or participant_role='ADMIN') ENABLE, 
	 CONSTRAINT "APPROVERS_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   ) ;

ALTER TABLE "EBA_DEMO_APPR_EMP" ADD CONSTRAINT "EBA_DEMO_APPR_WORKS_IN_DEPT" FOREIGN KEY ("DEPTNO")
	  REFERENCES "EBA_DEMO_APPR_DEPT" ("DEPTNO") ON DELETE SET NULL ENABLE;

ALTER TABLE "EBA_DEMO_APPR_SAL_HISTORY" ADD CONSTRAINT "EBA_DEMO_APPR_SAL_EMPNO_FK" FOREIGN KEY ("EMPNO")
	  REFERENCES "EBA_DEMO_APPR_EMP" ("EMPNO") ON DELETE CASCADE ENABLE;

CREATE OR REPLACE EDITIONABLE PACKAGE "EBA_DEMO_APPR" as
    function get_approver_for(p_task_def_static_id varchar2, 
                              p_empno number, 
                              p_job varchar2, 
                              p_proposed_sal number) return varchar2;
    function get_admin_for(p_task_def_static_id varchar2, 
                           p_empno number, 
                           p_job varchar2, 
                           p_proposed_sal number) return varchar2;    
    function user_has_open_approvals return boolean;
    function user_has_open_admin_tasks return boolean;
    procedure validate_admin_and_approver(p_task_def_static_id varchar2, 
                                          p_empno number, 
                                          p_proposed_sal number,
                                          p_admin out varchar2,
                                          p_approver out varchar2);                                                                                          
    function details_task_url(p_app_id number, p_task_id number, p_url varchar2)  return varchar2;
    function approvers_for_task(p_task_id number) return varchar2;
    function admins_for_task(p_task_id number) return varchar2;
    function get_laptop_approver(p_renewal_count number) return varchar2;    
end;
/


CREATE OR REPLACE EDITIONABLE PACKAGE BODY "EBA_DEMO_APPR" as
   function get_participant_for_role(p_task_def_static_id varchar2, 
                                      p_job varchar2, 
                                      p_proposed_sal number, 
                                      p_role varchar2) return varchar2 is
        l_ret varchar2(4000);
        l_include_fallback_entries boolean := false;
        l_current_user varchar2(200) := apex_application.g_user;
    begin
        apex_debug.info('### get_participant_for_role '||
                        '(taskdef=%s)(job=%s)(role=%s)',
                        p_task_def_static_id,p_job,p_role);
        apex_debug.info('### get_participant_for_role (curruser=%s)',
                        l_current_user);        
        for j in (select username,job_codes
                    from eba_demo_appr_approvers 
                    where task_def_static_id = upper(p_task_def_static_id)
                    and (job_codes is null
                         or p_job is null 
                         or (':'||job_codes||':' like '%:'||upper(p_job)||':%')
                        )
                    and (min_salary <= p_proposed_sal or min_salary is null)
                    and participant_role = upper(p_role) 
                    and (participant_role = 'ADMIN' or username != l_current_user)
                    order by job_codes nulls last
                   ) loop
            -- Only include the fallback entries with null JOB_CODES
            -- if no more specific ones found
            if j.job_codes is null 
               and not l_include_fallback_entries 
               and l_ret is null then
                l_include_fallback_entries := true;
            end if;
            if j.job_codes is not null or l_include_fallback_entries then
                if l_ret is not null then
                    l_ret := l_ret ||',';
                end if;
                l_ret := l_ret || upper(j.username);
            end if;
        end loop;
        apex_debug.info('### get_participant_for_role (returning=%s)', l_ret);      
        return l_ret;
    end;
    --
    function get_approver_for(p_task_def_static_id varchar2, 
                              p_job varchar2, 
                              p_proposed_sal number) return varchar2 is
    begin
        return get_participant_for_role(p_task_def_static_id,
                                        p_job,
                                        p_proposed_sal,
                                        'APPROVER');
    end;
    --
    function get_admin_for(p_task_def_static_id varchar2, 
                           p_job varchar2, 
                           p_proposed_sal number) 
                           return varchar2 is
    begin
        return get_participant_for_role(p_task_def_static_id,
                                        p_job,
                                        p_proposed_sal,
                                        'ADMIN');
    end;    
    --
    function get_approver_for(p_task_def_static_id varchar2, 
                              p_empno number, 
                              p_job varchar2, 
                              p_proposed_sal number) return varchar2 is
    begin
       apex_debug.info('### get_approver_for '||
                       '(taskdef=%s)(empno=%s)(job=%s)(sal=%s)',
                        p_task_def_static_id,p_empno,p_job,p_proposed_sal);
        return get_participant_for_role(p_task_def_static_id,
                                        p_job,
                                        p_proposed_sal,
                                        'APPROVER');
    end;
    --
    function get_admin_for(p_task_def_static_id varchar2, 
                           p_empno number, 
                           p_job varchar2, 
                           p_proposed_sal number) return varchar2 is
    begin
       apex_debug.info('### get_admin_for '||
                       '(taskdef=%s)(empno=%s)(job=%s)(sal=%s)',
                        p_task_def_static_id,p_empno,p_job,p_proposed_sal);
        return get_participant_for_role(p_task_def_static_id,
                                        p_job,
                                        p_proposed_sal,
                                        'ADMIN');
    end;    
    --    
    function user_has_open_approvals return boolean is
        l_app_user varchar2(30) := apex_application.g_user;
    begin
        for j in (select null 
                   from apex_task_participants tp
                   left join apex_tasks t on t.task_id = tp.task_id
                   where tp.participant = l_app_user
                   and t.state_code in ('UNASSIGNED','ASSIGNED')
                   and tp.participant_type = 'POTENTIAL_OWNER'
                   and (t.initiator is null or t.initiator != l_app_user)
                   fetch first row only) loop
            apex_debug.info('### Returning true for user %s '||
                            'having open approvals tasks',l_app_user);
            return true;
        end loop;
        return false;
    end;
    function user_has_open_admin_tasks return boolean is
        l_app_user varchar2(30) := apex_application.g_user;
    begin
        for j in (select null 
                   from apex_task_participants tp
                   left join apex_tasks t on t.task_id = tp.task_id
                   where tp.participant = l_app_user
                   and t.state_code in ('UNASSIGNED','ASSIGNED')
                   and tp.participant_type = 'BUSINESS_ADMIN'
                   fetch first row only) loop
            apex_debug.info('### Returning true for user %s '||
                            'having open admin tasks',l_app_user);
            return true;
        end loop;
        return false;
    end;
    --
    function details_task_url(p_app_id number, p_task_id number, p_url varchar2) return varchar2 is
    begin
        return apex_plugin_util.replace_substitutions (
                    p_value => replace(replace(p_url, '&APP_ID.', p_app_id), '&TASK_ID.', p_task_id),
                    p_escape => false);
    end;
    --
    procedure validate_admin_and_approver(p_task_def_static_id varchar2, 
                                          p_empno number,
                                          p_proposed_sal number,
                                          p_admin out varchar2,
                                          p_approver out varchar2) is
        l_job eba_demo_appr_emp.job%type;
    begin
        select job
        into l_job
        from eba_demo_appr_emp
        where empno = p_empno;
        p_admin := get_admin_for(p_task_def_static_id,
                                 p_empno,
                                 l_job,
                                 p_proposed_sal);
        p_approver := get_approver_for(p_task_def_static_id,
                                       p_empno,
                                       l_job,
                                       p_proposed_sal);
    end;
    --
    /*
     * Workaround for RDBMS 21c issue directly using listagg() against view w/ json_table()
     */
    function admins_for_task(p_task_id number) return varchar2 is
        l_ret varchar2(2000);
    begin
        -- Return admins as CSV
        select listagg(participant,', ')
               within group (order by participant)
        into l_ret
        from apex_task_participants
        where task_id = p_task_id
        and participant_type = 'BUSINESS_ADMIN';
        return l_ret; 
    end;
    --
    function approvers_for_task(p_task_id number) return varchar2 is
        l_ret varchar2(2000);
    begin
        -- Return approvers as CSV leaving out initiator
        select listagg(participant,', ')
               within group (order by participant)
        into l_ret
        from apex_task_participants tp, apex_tasks t
        where tp.task_id = p_task_id
        and t.task_id = tp.task_id
        and participant_type = 'POTENTIAL_OWNER'
        and (t.initiator is null or t.initiator != tp.participant);
        return l_ret; 
    end;
    function get_laptop_approver(p_renewal_count number) return varchar2 is
    begin
        return 
          case p_renewal_count
            when 0 then 'JANE'
            when 1 then 'STEVE'
            else 'BO'
          end;
    end;    
end;
/

CREATE OR REPLACE EDITIONABLE PACKAGE "EBA_DEMO_APPR_DATA" as
    procedure install_sample_data;
    function missing_demo_user_accounts return varchar2;
end;
/


CREATE OR REPLACE EDITIONABLE PACKAGE BODY "EBA_DEMO_APPR_DATA" is
    procedure delete_sample_data is
      l_app_id number := v('APP_ID');
    begin
        delete from eba_demo_appr_sal_history;
        delete from eba_demo_appr_emp;
        delete from eba_demo_appr_dept;
        delete from eba_demo_appr_approvers;
        -- Delete rows related only to completed or canceled tasks
        -- to avoid having the "Reset Demo Data" feature of the demo
        -- end up "stranding" any pending Laptop Request tasks by
        -- inadvertently deleting their corresponding system of record row.
        delete from eba_demo_appr_laptop_requests 
        where id in (select detail_pk 
                        from apex_tasks 
                       where task_def_static_id = 'LAPTOP_REQUEST'
                       and   application_id     = l_app_id
                       and   state_code         in ('COMPLETED','CANCELED'));
    end;
    --
    procedure insert_sample_data is
    begin
        insert into eba_demo_appr_approvers (username,task_def_static_id,job_codes,participant_role,min_salary)
        values ('STEVE','SALARY_CHANGE','MANAGER','APPROVER',3000);
        insert into eba_demo_appr_approvers (username,task_def_static_id,job_codes,participant_role,min_salary)
        values ('JANE','SALARY_CHANGE','SALESMAN:ANALYST:MANAGER','APPROVER',null);
        insert into eba_demo_appr_approvers (username,task_def_static_id,job_codes,participant_role,min_salary)
        values ('BO','SALARY_CHANGE','CLERK:MANAGER:PRESIDENT','APPROVER',null);
        insert into eba_demo_appr_approvers (username,task_def_static_id,job_codes,participant_role,min_salary)
        values ('PAT','SALARY_CHANGE',null,'ADMIN',null);
        insert into eba_demo_appr_approvers (username,task_def_static_id,job_codes,participant_role,min_salary)
        values ('PAT','SALARY_CHANGE',null,'APPROVER',null);
        insert into eba_demo_appr_dept (deptno,dname,loc)
        values (10,'ACCOUNTING','NEW YORK');
        insert into eba_demo_appr_dept (deptno,dname,loc)
        values (20,'RESEARCH','DALLAS');
        insert into eba_demo_appr_dept (deptno,dname,loc)
        values (30,'SALES','CHICAGO');
        insert into eba_demo_appr_dept (deptno,dname,loc)
        values (40,'OPERATIONS','BOSTON');
        insert into eba_demo_appr_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
        values (7369,'SMITH','CLERK',7902,to_date('17-DEC-80','DD-MON-RR'),800,null,20);
        insert into eba_demo_appr_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
        values (7499,'ALLEN','SALESMAN',7698,to_date('20-FEB-81','DD-MON-RR'),1600,300,30);
        insert into eba_demo_appr_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
        values (7521,'WARD','SALESMAN',7698,to_date('22-FEB-81','DD-MON-RR'),1250,500,30);
        insert into eba_demo_appr_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
        values (7566,'JONES','MANAGER',7839,to_date('02-APR-81','DD-MON-RR'),2975,null,20);
        insert into eba_demo_appr_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
        values (7654,'MARTIN','SALESMAN',7698,to_date('28-SEP-81','DD-MON-RR'),1250,1400,30);
        insert into eba_demo_appr_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
        values (7698,'BLAKE','MANAGER',7839,to_date('01-MAY-81','DD-MON-RR'),2850,null,30);
        insert into eba_demo_appr_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
        values (7782,'CLARK','MANAGER',7839,to_date('09-JUN-81','DD-MON-RR'),2450,null,10);
        insert into eba_demo_appr_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
        values (7788,'SCOTT','ANALYST',7566,to_date('09-DEC-82','DD-MON-RR'),3000,null,20);
        insert into eba_demo_appr_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
        values (7839,'KING','PRESIDENT',null,to_date('17-NOV-81','DD-MON-RR'),5000,null,10);
        insert into eba_demo_appr_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
        values (7844,'TURNER','SALESMAN',7698,to_date('08-SEP-81','DD-MON-RR'),1500,0,30);
        insert into eba_demo_appr_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
        values (7876,'ADAMS','CLERK',7788,to_date('12-JAN-83','DD-MON-RR'),1100,null,20);
        insert into eba_demo_appr_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
        values (7900,'JAMES','CLERK',7698,to_date('03-DEC-81','DD-MON-RR'),950,null,30);
        insert into eba_demo_appr_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
        values (7902,'FORD','ANALYST',7566,to_date('03-DEC-81','DD-MON-RR'),3000,null,20);
        insert into eba_demo_appr_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno)
        values (7934,'MILLER','CLERK',7782,to_date('23-JAN-82','DD-MON-RR'),1300,null,10);
        declare
            l_num_adjustments number;
            l_pct_adjustment number;
            l_inc_sal number;
            l_cur_sal number;
            l_prev_sal number;
            l_period number;
            l_today date := trunc(sysdate);
        begin
        for e in (select empno, sal, hiredate, 
                  extract(year from sysdate) - 
                  extract(year from hiredate) as years 
                    from eba_demo_appr_emp) loop
            if e.years < 3 then
                insert into eba_demo_appr_sal_history(empno,new_sal,approval_date)
                values (e.empno,e.sal,e.hiredate);
            end if;
            -- random number of salary adjustments between sysdate and hiredate
            select round(dbms_random.value(1.5, e.years/2+0.5), 0)
            into l_num_adjustments
            from dual;
            l_cur_sal := e.sal;
            l_inc_sal := l_cur_sal;
            l_period := round(e.years / l_num_adjustments,0) * 12;
            for j in 1..l_num_adjustments loop
                -- random percent of adjustment  
                insert into eba_demo_appr_sal_history(empno,new_sal,approval_date)
                        values (e.empno,l_inc_sal,add_months(l_today,(-1)*l_period*j));
                select round((1 - round(dbms_random.value(2.5, 25), 0)/100)*l_cur_sal,-1)
                into l_inc_sal
                from dual;                
                l_cur_sal := l_inc_sal;
            end loop;
        end loop;
        end;        
    end;  
    --
    procedure install_sample_data is
    begin
        delete_sample_data;
        insert_sample_data;
        commit;
    end;
    --
    function user_exists(p_username varchar2) return boolean is
    begin
        return not apex_util.is_username_unique(p_username);
    end;     
    --
    function missing_demo_user_accounts return varchar2 is
        l_ret varchar2(255);
    begin
      for u in (select column_value 
                 from table(apex_string.split('BO,JANE,PAT,STEVE',','))) loop
        if not user_exists(u.column_value) then
            if l_ret is not null then
                l_ret := l_ret||',';
            end if;
            l_ret := l_ret||u.column_value;
        end if;
      end loop;
      return l_ret;
    end;     
end;
/

