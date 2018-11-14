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
