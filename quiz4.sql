CREATE TABLE sightings(
    squirrel_id BIGSERIAL NOT NULL PRIMARY KEY,
    campus_id INT NOT NULL, 
    color VARCHAR(100) NOT NULL,
    highlight_color VARCHAR(100) NOT NULL,
    activity VARCHAR(100) NOT NULL,
    behavior VARCHAR(100) NOT NULL
); 

INSERT INTO sightings(squirrel_id, campus_id, color, highlight_color, activity, behavior) 
VALUES (1, 10, 'brown', 'cinnamon', 'foraging', 'calm'); 

INSERT INTO sightings(squirrel_id, campus_id, color, highlight_color, activity, behavior) 
VALUES (2, 7, 'grey', 'white', 'eating', 'calm');

INSERT INTO sightings(squirrel_id, campus_id, color, highlight_color, activity, behavior) 
VALUES (3, 4, 'brown', 'cinnamon', 'climbing', 'calm');

INSERT INTO sightings(squirrel_id, campus_id, color, highlight_color, activity, behavior) 
VALUES (4, 17, 'black', 'white', 'jumping', 'aggressive');

INSERT INTO sightings(squirrel_id, campus_id, color, highlight_color, activity, behavior) 
VALUES (5, 16, 'grey', 'black', 'chasing', 'calm');

INSERT INTO sightings(squirrel_id, campus_id, color, highlight_color, activity, behavior) 
VALUES (6, 4, 'brown', 'cinnamon', 'running', 'defensive');

INSERT INTO sightings(squirrel_id, campus_id, color, highlight_color, activity, behavior) 
VALUES (7, 15, 'white', '', 'climbing', 'skittish');

CREATE TABLE campus_location(
    campus_id BIGSERIAL NOT NULL PRIMARY KEY, 
    building VARCHAR(100) NOT NULL, 
    specific_location VARCHAR(100),
    longitude FLOAT(10) NOT NULL,
    latitude FLOAT(10) NOT NULL
);

INSERT INTO campus_location(campus_id, building, specific_location, longitude, latitude) 
VALUES (10, 'library', 'tree', 25.0121, 39.5328);
INSERT INTO campus_location(campus_id, building, specific_location, longitude, latitude) 
VALUES (7, 'boylan hall', 'steps', 16.062049, 51.502484);
INSERT INTO campus_location(campus_id, building, specific_location, longitude, latitude) 
VALUES (4, 'pond', 'bench', -42.191799, -21.413805);
INSERT INTO campus_location(campus_id, building, specific_location, longitude, latitude) 
VALUES (17, 'ingersoll', 'trash can', 33.460774, -19.105487);
INSERT INTO campus_location(campus_id, building, specific_location, longitude, latitude) 
VALUES (16, 'WEB', 'table', 108.167660, -6.767699);
INSERT INTO campus_location(campus_id, building, specific_location, longitude, latitude) 
VALUES (14, 'west quad', 'lawn', 115.944218, 30.070453);
INSERT INTO campus_location(campus_id, building, specific_location, longitude, latitude) 
VALUES (15, 'library cafe', 'trash can', 106.79719, -7.08005);

SELECT * FROM sightings JOIN campus_location ON sightings.campus_id = campus_location.campus_id;