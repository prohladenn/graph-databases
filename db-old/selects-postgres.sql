WITH entity_with_property AS (SELECT e.id, e.title, p.property
                              FROM entity e
                                       JOIN property p ON e.id = p.entity_id)
SELECT ewps.id       AS subject_id,
       ewps.title    AS subject_title,
       ewps.property AS subject_property,
       p.title       AS property_title,
       ewpo.id       AS object_id,
       ewpo.title    AS object_title,
       ewpo.property AS object_property
FROM triple t
         JOIN predicate p ON t.predicate = p.id
         JOIN entity_with_property ewps ON t.subject = ewps.id
         JOIN entity_with_property ewpo ON t.object = ewpo.id;
