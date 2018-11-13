-- timezone view
select * from exa_time_zones where time_zone_name like '%GMT%';

-- timezone convert
convert_tz(ed.CREATED_AT, 'GMT', 'US/MOUNTAIN') as ENROLLMENT_CREATED_AT
