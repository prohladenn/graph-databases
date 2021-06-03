DROP TABLE IF EXISTS entity CASCADE;
CREATE TABLE entity
(
    id       SERIAL PRIMARY KEY,
    title    varchar(30) UNIQUE NOT NULL,
    property jsonb
);

DROP TABLE IF EXISTS predicate CASCADE;
CREATE TABLE predicate
(
    id    SERIAL PRIMARY KEY,
    title varchar(15) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS triple;
CREATE TABLE triple
(
    subject   integer NOT NULL REFERENCES entity (id),
    predicate integer NOT NULL REFERENCES predicate (id),
    object    integer NOT NULL REFERENCES entity (id),
    property  jsonb,
    PRIMARY KEY (subject, predicate, object)
);

/* Заполнение таблицы entity и predicate */
INSERT INTO entity (title, property)
VALUES ('TomH', '{"type": "Person", "name": "Tom Hanks", "born": 1956}'),
       ('RonH', '{"type": "Person", "name": "Ron Howard", "born": 1954}'),
       ('TheDaVinciCode', '{"type": "Movie", "title": "The Da Vinci Code", "released": 2006, "genres": "Thriller"}');

INSERT INTO predicate (title)
VALUES ('ACTED_IN'),
       ('DIRECTED');

/* Вспомогательные функции для получения уникального идентификатора сущности и отношения*/
DROP FUNCTION IF EXISTS getEntity;
CREATE FUNCTION getEntity(varchar) RETURNS integer
AS 'SELECT id FROM entity WHERE title = $1;'
    LANGUAGE SQL
    IMMUTABLE
    RETURNS NULL ON NULL INPUT;

DROP FUNCTION IF EXISTS getPredicate;
CREATE FUNCTION getPredicate(varchar) RETURNS integer
AS 'SELECT id FROM predicate WHERE title = $1;'
    LANGUAGE SQL
    IMMUTABLE
    RETURNS NULL ON NULL INPUT;

/* Заполнение таблицы triple */
INSERT INTO triple (subject, predicate, object, property)
SELECT getEntity('TomH'), getPredicate('ACTED_IN'), getEntity('TheDaVinciCode'), '{"role":"Dr. Robert Langdon"}';

INSERT INTO triple (subject, predicate, object)
SELECT getEntity('RonH'), getPredicate('DIRECTED'), getEntity('TheDaVinciCode');
