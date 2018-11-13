-- profiles the query and exports to csv file the profiler

set autocommit on;
  alter session set profile='on';
  <insert your query here>;
  alter session set profile='off';
  alter session set NLS_NUMERIC_CHARACTERS='.,';
  alter session set NLS_TIMESTAMP_FORMAT='YYYY-MM-DD HH:MI:SS.ff3';

  flush statistics;

  export (
    select *
    from EXA_STATISTICS.EXA_USER_PROFILE_LAST_DAY
    where session_id = current_session
  )
  into LOCAL CSV
  FILE 'profile_output.csv';
