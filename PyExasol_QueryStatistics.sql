select
    pysql.*
from
    EXA_STATISTICS.EXA_DBA_AUDIT_SESSIONS pys
    join EXA_STATISTICS.EXA_DBA_AUDIT_SQL pysql
      on pys.SESSION_ID = pysql.SESSION_ID
where
      pys.client = 'PyEXASOL 0.5.5'
limit 100;
