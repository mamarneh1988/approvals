begin
    begin
        execute immediate 'drop table eba_demo_appr_sal_history cascade constraints';
    exception
        when others then
            if sqlcode != -942 then
                raise;
            end if;
    end;
    begin
        execute immediate 'drop table eba_demo_appr_emp cascade constraints';
    exception
        when others then
            if sqlcode != -942 then
                raise;
            end if;                
    end;
    begin
        execute immediate 'drop table eba_demo_appr_dept cascade constraints';
    exception
        when others then
            if sqlcode != -942 then
                raise;
            end if;                
    end;
    begin
        execute immediate 'drop table eba_demo_appr_approvers cascade constraints';
    exception
        when others then
            if sqlcode != -942 then
                raise;
            end if;
    end;
    begin
        execute immediate 'drop table eba_demo_appr_laptop_requests cascade constraints';
    exception
        when others then
            if sqlcode != -942 then
                raise;
            end if;
    end;    
end;   
/