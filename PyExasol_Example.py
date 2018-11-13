import pyexasol

C = pyexasol.connect(
    dsn='', #connection_string
    user='',  # user
    password='' # password
    )

df = C.export_to_pandas("""
    select distinct discussion_title from CANVAS_DATA_NIGHTLY_IMPORTS.CANVAS_COURSE_DISCUSSIONS_VIEW
    where CANVAS_COURSE_ID = '10430000000008675'
    limit 10
 """)

print(df)
