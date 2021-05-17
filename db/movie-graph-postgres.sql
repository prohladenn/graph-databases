DROP TABLE IF EXISTS triple;
CREATE TABLE triple
(
    subject   integer NOT NULL,
    predicate integer NOT NULL,
    object    integer NOT NULL,
    PRIMARY KEY (subject, predicate, object)
);

DROP TABLE IF EXISTS id_to_entity;
CREATE TABLE id_to_entity
(
    id     SERIAL,
    entity varchar(30) NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS id_to_predicate;
CREATE TABLE id_to_predicate
(
    id        SERIAL,
    predicate varchar(15) NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS property;
CREATE TABLE property
(
    entity   integer NOT NULL,
    property jsonb   NOT NULL,
    primary key (entity)
);


-- Type:PERSON
WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Keanu') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Keanu Reeves", "born":1964}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Carrie') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Carrie-Anne Moss", "born":1967}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Laurence') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Laurence Fishburne", "born":1961}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Hugo') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Hugo Weaving", "born":1960}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('LillyW') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Lilly Wachowski", "born":1967}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('LanaW') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Lana Wachowski", "born":1965}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JoelS') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Joel Silver", "born":1952}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Emil') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Emil Eifrem", "born":1978}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Charlize') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Charlize Theron", "born":1975}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Al') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Al Pacino", "born":1940}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Taylor') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Taylor Hackford", "born":1944}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('TomC') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Tom Cruise", "born":1962}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JackN') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Jack Nicholson", "born":1937}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('DemiM') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Demi Moore", "born":1962}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('KevinB') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Kevin Bacon", "born":1958}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('KieferS') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Kiefer Sutherland", "born":1966}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('NoahW') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Noah Wyle", "born":1971}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('CubaG') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Cuba Gooding Jr.", "born":1968}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('KevinP') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Kevin Pollak", "born":1957}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JTW') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"J.T. Walsh", "born":1943}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JamesM') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"James Marshall", "born":1967}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('ChristopherG') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Christopher Guest", "born":1948}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('RobR') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Rob Reiner", "born":1947}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('AaronS') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Aaron Sorkin", "born":1961}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('KellyM') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Kelly McGillis", "born":1957}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('ValK') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Val Kilmer", "born":1959}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('AnthonyE') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Anthony Edwards", "born":1962}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('TomS') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Tom Skerritt", "born":1933}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('MegR') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Meg Ryan", "born":1961}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('TonyS') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Tony Scott", "born":1944}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JimC') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Jim Cash", "born":1941}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('ReneeZ') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Renee Zellweger", "born":1969}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('KellyP') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Kelly Preston", "born":1962}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JerryO') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Jerry O`Connell", "born":1974}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JayM') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name": "Jay Mohr", "born":1970}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('BonnieH') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Bonnie Hunt", "born":1961}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('ReginaK') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Regina King", "born":1971}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JonathanL') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Jonathan Lipnicki", "born":1996}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('CameronC') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Cameron Crowe", "born":1957}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('RiverP') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"River Phoenix", "born":1970}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('CoreyF') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Corey Feldman", "born":1971}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('WilW') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Wil Wheaton", "born":1972}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JohnC') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"John Cusack", "born":1966}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('MarshallB') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Marshall Bell", "born":1942}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('HelenH') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Helen Hunt", "born":1963}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('GregK') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Greg Kinnear", "born":1963}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JamesB') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"James L. Brooks", "born":1940}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('AnnabellaS') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Annabella Sciorra", "born":1960}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('MaxS') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Max von Sydow", "born":1929}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('WernerH') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Werner Herzog", "born":1942}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Robin') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Robin Williams", "born":1951}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('VincentW') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Vincent Ward", "born":1956}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('EthanH') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Ethan Hawke", "born":1970}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('RickY') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Rick Yune", "born":1971}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JamesC') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"James Cromwell", "born":1940}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('ScottH') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Scott Hicks", "born":1953}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('ParkerP') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Parker Posey", "born":1968}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('DaveC') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Dave Chappelle", "born":1973}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('SteveZ') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Steve Zahn", "born":1967}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('TomH') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Tom Hanks", "born":1956}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('NoraE') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Nora Ephron", "born":1941}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('RitaW') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Rita Wilson", "born":1956}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('BillPull') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Bill Pullman", "born":1953}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('VictorG') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Victor Garber", "born":1949}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('RosieO') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Rosie O`Donnell", "born":1962}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JohnS') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"John Patrick Stanley", "born":1950}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Nathan') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Nathan Lane", "born":1956}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('BillyC') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Billy Crystal", "born":1948}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('CarrieF') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Carrie Fisher", "born":1956}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('BrunoK') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Bruno Kirby", "born":1949}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('LivT') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Liv Tyler", "born":1977}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Brooke') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Brooke Langton", "born":1970}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Gene') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Gene Hackman", "born":1930}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Orlando') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Orlando Jones", "born":1968}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Howard') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Howard Deutch", "born":1950}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('ChristianB') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Christian Bale", "born":1974}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('ZachG') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Zach Grenier", "born":1954}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('MikeN') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Mike Nichols", "born":1931}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('RichardH') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Richard Harris", "born":1930}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('ClintE') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Clint Eastwood", "born":1930}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Takeshi') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Takeshi Kitano", "born":1947}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Dina') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Dina Meyer", "born":1968}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('IceT') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Ice-T", "born":1958}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('RobertL') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Robert Longo", "born":1953}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('HalleB') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Halle Berry", "born":1966}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JimB') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Jim Broadbent", "born":1949}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('TomT') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Tom Tykwer", "born":1965}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('DavidMitchell') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"David Mitchell", "born":1969}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('StefanArndt') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Stefan Arndt", "born":1961}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('IanM') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Ian McKellen", "born":1939}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('AudreyT') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Audrey Tautou", "born":1976}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('PaulB') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Paul Bettany", "born":1971}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('RonH') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Ron Howard", "born":1954}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('NatalieP') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Natalie Portman", "born":1981}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('StephenR') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Stephen Rea", "born":1946}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JohnH') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"John Hurt", "born":1940}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('BenM') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Ben Miles", "born":1967}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('EmileH') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Emile Hirsch", "born":1985}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JohnG') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"John Goodman", "born":1960}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('SusanS') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Susan Sarandon", "born":1946}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('MatthewF') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Matthew Fox", "born":1966}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('ChristinaR') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Christina Ricci", "born":1980}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Rain') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Rain", "born":1982}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('NaomieH') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Naomie Harris"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('MichaelD') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Michael Clarke Duncan", "born":1957}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('DavidM') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"David Morse", "born":1953}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('SamR') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Sam Rockwell", "born":1968}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('GaryS') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Gary Sinise", "born":1955}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('PatriciaC') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Patricia Clarkson", "born":1959}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('FrankD') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Frank Darabont", "born":1959}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('FrankL') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Frank Langella", "born":1938}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('MichaelS') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Michael Sheen", "born":1969}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('OliverP') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Oliver Platt", "born":1960}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('DannyD') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Danny DeVito", "born":1944}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JohnR') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"John C. Reilly", "born":1965}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('EdH') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Ed Harris", "born":1950}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('BillPax') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Bill Paxton", "born":1955}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('PhilipH') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Philip Seymour Hoffman", "born":1967}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JanB') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Jan de Bont", "born":1943}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('RobertZ') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Robert Zemeckis", "born":1951}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('MilosF') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Milos Forman", "born":1932}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('DianeK') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Diane Keaton", "born":1946}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('NancyM') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Nancy Meyers", "born":1949}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('ChrisC') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Chris Columbus", "born":1958}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JuliaR') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Julia Roberts", "born":1967}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Madonna') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Madonna", "born":1954}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('GeenaD') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Geena Davis", "born":1956}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('LoriP') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Lori Petty", "born":1963}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('PennyM') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Penny Marshall", "born":1943}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('PaulBlythe') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Paul Blythe"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('AngelaScope') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Angela Scope"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JessicaThompson') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"Jessica Thompson"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JamesThompson') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Person", "name":"James Thompson"}' FROM new_id ni;

-- Type:MOVIE
WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('AsGoodAsItGets') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"As Good as It Gets", "released":1997, "tagline":"A comedy from the heart that goes for the throat."}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('WhatDreamsMayCome') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"What Dreams May Come", "released":1998, "tagline":"After life there is more. The end is just the beginning."}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('SnowFallingonCedars') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Snow Falling on Cedars", "released":1999, "tagline":"First loves last. Forever."}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('YouveGotMail') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"You`ve Got Mail", "released":1998, "tagline":"At odds in life... in love on-line."}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('SleeplessInSeattle') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Sleepless in Seattle", "released":1993, "tagline":"What if someone you never met, someone you never saw, someone you never knew was the only someone for you?"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('TheMatrix') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"The Matrix", "released":1999, "tagline":"Welcome to the Real World"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('TheMatrixReloaded') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"The Matrix Reloaded", "released":2003, "tagline":"Free your mind"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('TheMatrixRevolutions') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"The Matrix Revolutions", "released":2003, "tagline":"Everything that has a beginning has an end"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('TheDevilsAdvocate') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"The Devil`s Advocate", "released":1997, "tagline":"Evil has its winning ways"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('AFewGoodMen') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"A Few Good Men", "released":1992, "tagline":"In the heart of the nation`s capital, in a courthouse of the U.S. government, one man will stop at nothing to keep his honor, and one will stop at nothing to find the truth."}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('TopGun') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Top Gun", "released":1986, "tagline":"I feel the need, the need for speed."}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JerryMaguire') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Jerry Maguire", "released":2000, "tagline":"The rest of his life begins now."}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JoeVersustheVolcano') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Joe Versus the Volcano", "released":1990, "tagline":"A story of love, lava and burning desire."}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('WhenHarryMetSally') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"When Harry Met Sally", "released":1998, "tagline":"Can two friends sleep together and still love each other in the morning?"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('ThatThingYouDo') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"That Thing You Do", "released":1996, "tagline":"In every life there comes a time when that thing you dream becomes that thing you do"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('TheReplacements') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"The Replacements", "released":2000, "tagline":"Pain heals, Chicks dig scars... Glory lasts forever"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('StandByMe') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Stand By Me", "released":1986, "tagline":"For some, it`s the last real taste of innocence, and the first real taste of life. But for everyone, it`s the time that memories are made of."}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('RescueDawn') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"RescueDawn", "released":2006, "tagline":"Based on the extraordinary true story of one man`s fight for freedom"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('TheBirdcage') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"The Birdcage", "released":1996, "tagline":"Come as you are"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Unforgiven') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Unforgiven", "released":1992, "tagline":"It`s a hell of a thing, killing a man"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('JohnnyMnemonic') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Johnny Mnemonic", "released":1995, "tagline":"The hottest data on earth. In the coolest head in town"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('CloudAtlas') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Cloud Atlas", "released":2012, "tagline":"Everything is connected"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('TheDaVinciCode') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"The Da Vinci Code", "released":2006, "tagline":"Break The Codes"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('VforVendetta') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"V for Vendetta", "released":2006, "tagline":"Freedom! Forever!"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('SpeedRacer') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Speed Racer", "released":2008, "tagline":"Speed has no limits"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('NinjaAssassin') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Ninja Assassin", "released":2009, "tagline":"Prepare to enter a secret world of assassins"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('TheGreenMile') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"The Green Mile", "released":1999, "tagline":"Walk a mile you`ll never forget."}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('FrostNixon') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Frost/Nixon", "released":2008, "tagline":"400 million people were waiting for the truth."}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Hoffa') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Hoffa", "released":1992, "tagline":"He didn`t want law. He wanted justice."}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Apollo13') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Apollo 13", "released":1995, "tagline":"Houston, we have a problem."}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('Twister') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Twister", "released":1996, "tagline":"Don`t Breathe. Don`t Look Back."}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('CastAway') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Cast Away", "released":2000, "tagline":"At the edge of the world, his journey begins."}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('OneFlewOvertheCuckoosNest') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"One Flew Over the Cuckoo`s Nest", "released":1975, "tagline":"If he`s crazy, what does that make you?"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('SomethingsGottaGive') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Something`s Gotta Give", "released":2003}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('BicentennialMan') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Bicentennial Man", "released":1999, "tagline":"One robot`s 200 year journey to become an ordinary man."}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('CharlieWilsonsWar') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"Charlie Wilson`s War", "released":2007, "tagline":"A stiff drink. A little mascara. A lot of nerve. Who said they couldn`t bring down the Soviet empire."}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('ThePolarExpress') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"The Polar Express", "released":2004, "tagline":"This Holiday Season... Believe"}' FROM new_id ni;

WITH new_id AS (INSERT INTO id_to_entity (entity) VALUES ('ALeagueofTheirOwn') RETURNING id)
INSERT INTO property SELECT ni.id, '{"type": "Movie", "title":"A League of Their Own", "released":1992, "tagline":"Once in a lifetime you get a chance to do something different."}' FROM new_id ni;

-- Predicates
INSERT INTO id_to_predicate (predicate) VALUES ('ACTED_IN');
INSERT INTO id_to_predicate (predicate) VALUES ('DIRECTED');
INSERT INTO id_to_predicate (predicate) VALUES ('PRODUCED');
INSERT INTO id_to_predicate (predicate) VALUES ('WROTE');
INSERT INTO id_to_predicate (predicate) VALUES ('FOLLOWS');
INSERT INTO id_to_predicate (predicate) VALUES ('REVIEWED');

-- Predicate:ACTED_IN
WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Keanu'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrix')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Carrie'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrix')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Laurence'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrix')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Hugo'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrix')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Emil'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrix')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Keanu'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrixReloaded')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Carrie'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrixReloaded')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Laurence'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrixReloaded')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Hugo'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrixReloaded')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Keanu'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrixRevolutions')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Carrie'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrixRevolutions')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Laurence'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrixRevolutions')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Hugo'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrixRevolutions')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Keanu'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheDevilsAdvocate')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Charlize'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheDevilsAdvocate')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Al'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheDevilsAdvocate')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TomC'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AFewGoodMen')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JackN'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AFewGoodMen')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'DemiM'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AFewGoodMen')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'KevinB'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AFewGoodMen')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'KieferS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AFewGoodMen')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'NoahW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AFewGoodMen')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CubaG'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AFewGoodMen')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'KevinP'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AFewGoodMen')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JTW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AFewGoodMen')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JamesM'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AFewGoodMen')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ChristopherG'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AFewGoodMen')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AaronS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AFewGoodMen')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TomC'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TopGun')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'KellyM'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TopGun')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ValK'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TopGun')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AnthonyE'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TopGun')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TomS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TopGun')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'MegR'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TopGun')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TomC'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JerryMaguire')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CubaG'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JerryMaguire')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ReneeZ'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JerryMaguire')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'KellyP'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JerryMaguire')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JerryO'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JerryMaguire')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JayM'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JerryMaguire')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'BonnieH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JerryMaguire')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ReginaK'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JerryMaguire')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JonathanL'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JerryMaguire')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'WilW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'StandByMe')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RiverP'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'StandByMe')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JerryO'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'StandByMe')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CoreyF'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'StandByMe')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JohnC'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'StandByMe')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'KieferS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'StandByMe')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'MarshallB'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'StandByMe')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JackN'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AsGoodAsItGets')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'HelenH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AsGoodAsItGets')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'GregK'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AsGoodAsItGets')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CubaG'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AsGoodAsItGets')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Robin'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'WhatDreamsMayCome')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CubaG'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'WhatDreamsMayCome')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AnnabellaS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'WhatDreamsMayCome')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'MaxS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'WhatDreamsMayCome')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'WernerH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'WhatDreamsMayCome')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'EthanH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SnowFallingonCedars')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RickY'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SnowFallingonCedars')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'MaxS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SnowFallingonCedars')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JamesC'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SnowFallingonCedars')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TomH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'YouveGotMail')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'MegR'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'YouveGotMail')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'GregK'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'YouveGotMail')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ParkerP'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'YouveGotMail')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'DaveC'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'YouveGotMail')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SteveZ'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'YouveGotMail')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TomH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SleeplessInSeattle')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'MegR'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SleeplessInSeattle')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RitaW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SleeplessInSeattle')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'BillPull'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SleeplessInSeattle')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'VictorG'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SleeplessInSeattle')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RosieO'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SleeplessInSeattle')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TomH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JoeVersustheVolcano')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'MegR'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JoeVersustheVolcano')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Nathan'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JoeVersustheVolcano')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'BillyC'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'WhenHarryMetSally')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'MegR'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'WhenHarryMetSally')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CarrieF'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'WhenHarryMetSally')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'BrunoK'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'WhenHarryMetSally')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TomH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ThatThingYouDo')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LivT'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ThatThingYouDo')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Charlize'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ThatThingYouDo')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Keanu'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheReplacements')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Brooke'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheReplacements')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Gene'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheReplacements')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Orlando'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheReplacements')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'MarshallB'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RescueDawn')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ChristianB'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RescueDawn')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ZachG'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RescueDawn')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SteveZ'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RescueDawn')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Robin'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheBirdcage')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Nathan'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheBirdcage')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Gene'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheBirdcage')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RichardH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Unforgiven')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ClintE'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Unforgiven')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Gene'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Unforgiven')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Keanu'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JohnnyMnemonic')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Takeshi'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JohnnyMnemonic')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Dina'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JohnnyMnemonic')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'IceT'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JohnnyMnemonic')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TomH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CloudAtlas')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Hugo'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CloudAtlas')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'HalleB'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CloudAtlas')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JimB'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CloudAtlas')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TomH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheDaVinciCode')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'IanM'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheDaVinciCode')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AudreyT'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheDaVinciCode')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'PaulB'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheDaVinciCode')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Hugo'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'VforVendetta')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'NatalieP'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'VforVendetta')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'StephenR'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'VforVendetta')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JohnH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'VforVendetta')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'BenM'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'VforVendetta')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'EmileH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SpeedRacer')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JohnG'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SpeedRacer')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SusanS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SpeedRacer')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'MatthewF'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SpeedRacer')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ChristinaR'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SpeedRacer')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Rain'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SpeedRacer')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'BenM'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SpeedRacer')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Rain'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'NinjaAssassin')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'NaomieH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'NinjaAssassin')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RickY'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'NinjaAssassin')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'BenM'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'NinjaAssassin')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TomH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheGreenMile')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'MichaelD'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheGreenMile')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'DavidM'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheGreenMile')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'BonnieH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheGreenMile')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JamesC'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheGreenMile')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SamR'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheGreenMile')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'GaryS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheGreenMile')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'PatriciaC'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheGreenMile')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'FrankL'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'FrostNixon')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'MichaelS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'FrostNixon')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'KevinB'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'FrostNixon')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'OliverP'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'FrostNixon')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SamR'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'FrostNixon')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JackN'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Hoffa')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'DannyD'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Hoffa')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JTW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Hoffa')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JohnR'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Hoffa')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TomH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Apollo13')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'KevinB'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Apollo13')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'EdH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Apollo13')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'BillPax'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Apollo13')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'GaryS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Apollo13')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'BillPax'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Twister')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'HelenH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Twister')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ZachG'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Twister')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'PhilipH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Twister')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TomH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CastAway')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'HelenH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CastAway')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JackN'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'OneFlewOvertheCuckoosNest')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'DannyD'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'OneFlewOvertheCuckoosNest')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JackN'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SomethingsGottaGive')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'DianeK'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SomethingsGottaGive')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Keanu'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SomethingsGottaGive')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Robin'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'BicentennialMan')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'OliverP'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'BicentennialMan')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TomH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CharlieWilsonsWar')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JuliaR'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CharlieWilsonsWar')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'PhilipH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CharlieWilsonsWar')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TomH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ThePolarExpress')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TomH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ALeagueofTheirOwn')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'GeenaD'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ALeagueofTheirOwn')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LoriP'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ALeagueofTheirOwn')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RosieO'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ALeagueofTheirOwn')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Madonna'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ALeagueofTheirOwn')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'BillPax'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ALeagueofTheirOwn')
INSERT INTO triple SELECT s.id , 1, o.id FROM s, o;

-- Predicate:DIRECTED
WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LillyW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrix')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LanaW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrix')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LillyW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrixReloaded')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LanaW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrixReloaded')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LillyW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrixRevolutions')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LanaW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrixRevolutions')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Taylor'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheDevilsAdvocate')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RobR'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AFewGoodMen')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TonyS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TopGun')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CameronC'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JerryMaguire')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RobR'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'StandByMe')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JamesB'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AsGoodAsItGets')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'VincentW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'WhatDreamsMayCome')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ScottH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SnowFallingonCedars')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'NoraE'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'YouveGotMail')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'NoraE'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SleeplessInSeattle')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JohnS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JoeVersustheVolcano')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RobR'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'WhenHarryMetSally')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TomH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ThatThingYouDo')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Howard'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheReplacements')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'WernerH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RescueDawn')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'MikeN'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheBirdcage')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ClintE'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Unforgiven')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RobertL'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JohnnyMnemonic')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TomT'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CloudAtlas')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LillyW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CloudAtlas')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LanaW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CloudAtlas')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RonH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheDaVinciCode')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JamesM'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'VforVendetta')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LillyW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SpeedRacer')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LanaW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SpeedRacer')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JamesM'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'NinjaAssassin')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'FrankD'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheGreenMile')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RonH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'FrostNixon')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'DannyD'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Hoffa')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RonH'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Apollo13')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JanB'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Twister')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RobertZ'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CastAway')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'MilosF'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'OneFlewOvertheCuckoosNest')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'NancyM'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SomethingsGottaGive')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ChrisC'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'BicentennialMan')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'MikeN'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CharlieWilsonsWar')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RobertZ'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ThePolarExpress')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'PennyM'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'ALeagueofTheirOwn')
INSERT INTO triple SELECT s.id, 2, o.id FROM s, o;

-- Predicate:PRODUCED
WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JoelS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrix')
INSERT INTO triple SELECT s.id, 3, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JoelS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrixReloaded')
INSERT INTO triple SELECT s.id, 3, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JoelS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheMatrixRevolutions')
INSERT INTO triple SELECT s.id, 3, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CameronC'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JerryMaguire')
INSERT INTO triple SELECT s.id, 3, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'RobR'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'WhenHarryMetSally')
INSERT INTO triple SELECT s.id, 3, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'NoraE'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'WhenHarryMetSally')
INSERT INTO triple SELECT s.id, 3, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'StefanArndt'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CloudAtlas')
INSERT INTO triple SELECT s.id, 3, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LillyW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'VforVendetta')
INSERT INTO triple SELECT s.id, 3, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LanaW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'VforVendetta')
INSERT INTO triple SELECT s.id, 3, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JoelS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'VforVendetta')
INSERT INTO triple SELECT s.id, 3, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JoelS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SpeedRacer')
INSERT INTO triple SELECT s.id, 3, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LillyW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'NinjaAssassin')
INSERT INTO triple SELECT s.id, 3, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LanaW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'NinjaAssassin')
INSERT INTO triple SELECT s.id, 3, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JoelS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'NinjaAssassin')
INSERT INTO triple SELECT s.id, 3, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'NancyM'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SomethingsGottaGive')
INSERT INTO triple SELECT s.id, 3, o.id FROM s, o;

-- Predicate:WROTE
WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AaronS'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AFewGoodMen')
INSERT INTO triple SELECT s.id, 4, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JimC'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TopGun')
INSERT INTO triple SELECT s.id, 4, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CameronC'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JerryMaguire')
INSERT INTO triple SELECT s.id, 4, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'NoraE'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'WhenHarryMetSally')
INSERT INTO triple SELECT s.id, 4, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'DavidMitchell'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CloudAtlas')
INSERT INTO triple SELECT s.id, 4, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LillyW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'VforVendetta')
INSERT INTO triple SELECT s.id, 4, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LanaW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'VforVendetta')
INSERT INTO triple SELECT s.id, 4, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LillyW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SpeedRacer')
INSERT INTO triple SELECT s.id, 4, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'LanaW'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SpeedRacer')
INSERT INTO triple SELECT s.id, 4, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'NancyM'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'SomethingsGottaGive')
INSERT INTO triple SELECT s.id, 4, o.id FROM s, o;

-- Predicate:FOLLOWS
WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JamesThompson'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JessicaThompson')
INSERT INTO triple SELECT s.id, 5, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AngelaScope'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JessicaThompson')
INSERT INTO triple SELECT s.id, 5, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'PaulBlythe'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AngelaScope')
INSERT INTO triple SELECT s.id, 5, o.id FROM s, o;

-- Predicate:REVIEWED
WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JessicaThompson'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'CloudAtlas')
INSERT INTO triple SELECT s.id, 6, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JessicaThompson'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheReplacements')
INSERT INTO triple SELECT s.id, 6, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JamesThompson'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheReplacements')
INSERT INTO triple SELECT s.id, 6, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'AngelaScope'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheReplacements')
INSERT INTO triple SELECT s.id, 6, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JessicaThompson'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'Unforgiven')
INSERT INTO triple SELECT s.id, 6, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JessicaThompson'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheBirdcage')
INSERT INTO triple SELECT s.id, 6, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JessicaThompson'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheDaVinciCode')
INSERT INTO triple SELECT s.id, 6, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JamesThompson'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'TheDaVinciCode')
INSERT INTO triple SELECT s.id, 6, o.id FROM s, o;

WITH s AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JessicaThompson'),
     o AS (SELECT ite.id FROM id_to_entity ite WHERE entity = 'JerryMaguire')
INSERT INTO triple SELECT s.id, 6, o.id FROM s, o;

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
