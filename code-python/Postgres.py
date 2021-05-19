import time

import psycopg2

select_request = """
WITH entity_with_property AS (SELECT ite.id, ite.entity, p.property
                              FROM id_to_entity ite
                                       JOIN property p ON ite.id = p.entity)
SELECT ewps.id       AS subject_id,
       ewps.entity   AS subject,
       ewps.property AS subject_property,
       itp.predicate,
       ewpo.id       AS object_id,
       ewpo.entity   AS object,
       ewpo.property AS object_property
FROM triple t
         JOIN id_to_predicate itp ON t.predicate = itp.id
         JOIN entity_with_property ewps ON t.subject = ewps.id
         JOIN entity_with_property ewpo ON t.object = ewpo.id;
"""
print("Trying connect to database")
con = psycopg2.connect(database="postgres", user="postgres", password="postgres", host="0.0.0.0", port="6666")
print("Database opened successfully\n")

cur = con.cursor()

print("Request sent\n")
t1 = time.time_ns()
cur.execute(select_request)
t2 = time.time_ns()
print("Response get with time " + str(t2 - t1) + "ns")

select_response = cur.fetchall()

print("Response length " + str(len(select_response)))

print("Response content:")
for row in select_response:
    print(row)
print("Response content finish\n")

con.close()
