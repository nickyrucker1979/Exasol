----  option 1  -----
alter session set profile = 'ON';
set autocommit off;
-- write query to profile

select * from sales where sales_id = 1;

commit;
flush statistics;  -- triggers the log server to write the profile or it will only run once a minute
alter session set profile = 'OFF';

select * from exa_user_profile_last_day
where session_id=current_session
and stmnt_id = current_statement-4;


-----  option 2  -----
-- write query below - example....
select
  count(*)
from
  table1 t1
  join table2 t2
    on t1.id = t2.id
where
  td.person_id = 10;

-- view the query profile
flush statistics;
select
  *
from
  exa_user_profile_last_day
where
  session_id = current_session
  and command_name = 'SELECT'
preferring high stmnt_id;
