WITH entity_with_property AS (SELECT ite.id, ite.entity, p.property
                              FROM id_to_entity ite
                                       JOIN property p ON ite.id = p.entity)
SELECT ewps.entity   AS subject,
       ewps.property AS subject_property,
       itp.predicate,
       ewpo.entity   AS object,
       ewpo.property AS object_property
FROM triple t
         JOIN id_to_predicate itp ON t.predicate = itp.id
         JOIN entity_with_property ewps ON t.subject = ewps.id
         JOIN entity_with_property ewpo ON t.object = ewpo.id;
