--  Use this to create connection with the querying user's permissions
import from jdbc
  at 'jdbc:postgresql://...'
  user ''
  identified by ''
      statement
        'select * from requests
        limit 100'
    ;


-- Create remote connection
create connection
  canvas_redshift_nr -- database connection name
to 'jdbc:postgresql://....'  -- database jdbc connection /database name
user ''  -- remote db username
identified by '';  -- remote db password


-- To query connected datasource
;with requests_data as
(
  select * from
    (
      import from jdbc at CANVAS_REDSHIFT_NR
      statement
        'select * from requests
        limit 10000'
    )
)

select * from requests_data rd
limit 10;


-- Import data from connected datasource
import into
  CANVAS_DATA_STG.REQUESTS
from jdbc at
  CANVAS_REDSHIFT_NR
statement
  'select * from requests limit 1000000'
ERRORS INTO
  CANVAS_DATA_STG.ERROR_TABLE ('Requests Import') REJECT LIMIT unlimited
;
