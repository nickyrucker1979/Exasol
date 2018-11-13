EXPORT
(
select distinct
  e.TERM_NAME,
  c.SCHOOL_COLLEGE,
  LEFT(c.CODE,4) 'PROGRAM',
  c.COURSE_NAME,
  e.USER_SORTABLE_NAME as 'Teacher_Name'
from
  CANVAS_DATA.CANVAS_COURSE_VIEW c
  join CANVAS_DATA.CANVAS_ENROLLMENTS_VIEW e
    on c.CANVAS_COURSE_ID = e.CANVAS_COURSE_ID
where
  (c.term = 'Summer 2018' or c.TERM ='Fall 2018')
  and e.ENROLLMENT_TYPE = 'Teacher'
  and e.ENROLLMENT_STATE = 'active'
)

INTO LOCAL CSV FILE '/Users/nickyrucker/documents/Canvas_SummerFall2018_Courses.csv'
WITH COLUMN NAMES
COLUMN SEPARATOR = ','
;
