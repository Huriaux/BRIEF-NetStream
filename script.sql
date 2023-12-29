-- todo = TABLE  'ACTEURS'
--remarque : j'ai volontairement retiré la colonne 'role de l'acteur' et j'ai choisi de plutôt l'intégrer dans une table de liaison.
-- Car j'avais des acteurs qui jouaient dans plusieurs films mais dans des rôles différents et celà créer des doublons actor_id.
-- J'ai juger ma méthode plus clair, même si elle m'a donné plus de travail et de réflexion. 

-- création table des Acteurs
CREATE TABLE IF NOT EXISTS Actors (
	actor_id SERIAL PRIMARY KEY,
	last_name VARCHAR(100) NOT null,
	first_name VARCHAR(100) NOT null,
	birthday DATE,
	creation_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	modification_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	-- Ajout de la contrainte d'unicité sur nom et prénom de l'acteur
	UNIQUE (last_name, first_name)
);

-- Création fonction (trigger) => si ON AJOUTE des données
CREATE OR REPLACE FUNCTION set_creation_date() -- déclare ma fonction
RETURNS TRIGGER AS $create_date_actors$ --  retourne la variable trigger
BEGIN -- démarre la fonction
	NEW.creation_dt := CURRENT_TIMESTAMP; -- attribut de la date et l'heure actuelles à la colonne creation_dt
	RETURN NEW; -- retourne la nouvelle ligne modifiée
END;
$create_date_actors$ LANGUAGE plpgsql; -- variable trigger + spécifie le langage

--Création du trigger (en appelant la fonction 'set_creation_date()')
CREATE trigger set_creation_date_trigger
BEFORE INSERT ON Actors -- avant l'insertion dans la table Actors
FOR EACH ROW -- pour chaque ligne
EXECUTE FUNCTION set_creation_date(); -- exécute la fonction pour chaque nouvelle ligne insérée

-- Ajout données
INSERT INTO Actors (last_name, first_name, birthday)
VALUES
	('DiCaprio', 'Leonardo', '1974-11-11'),
	('Gosling', 'Ryan', '1980-11-12'),
	('Freeman', 'Morgan', '1937-06-01'),
	('Reynolds', 'Ryan', '1976-10-23'),
	('Travolta', 'John', '1954-02-18'),
	('Bale', 'Christian', '1974-01-30'),
	('Hanks', 'Tom', '1956-07-09'),
	('Brando', 'Marlon', '1924-04-03'),
	('Reeves', 'Keanu', '1964-09-02'),
	('Norton', 'Edward', '1969-08-18'),
	('Neeson', 'Liam', '1952-06-07'),
	('Foster', 'Jodie', '1962-11-19'),
	('Eisenberg', 'Jesse', '1983-10-05'),
	('De Niro', 'Robert', '1943-08-17'),
	('Bogart', 'Humphrey', '1899-12-25')
-- clause ON CONFLICT pour éviter d'insérer des données déjà existantes
ON CONFLICT (last_name, first_name) DO NOTHING;

-- Création fonction (trigger) => si ON MODIFIE des données
CREATE OR REPLACE FUNCTION set_modification_date()
RETURNS TRIGGER AS $update_date_actors$ --  retourne la variable trigger
BEGIN -- démarre la fonction
	NEW.modification_dt := CURRENT_TIMESTAMP; -- attribut de la date et l'heure actuelles à la colonne modification_dt
	RETURN NEW; -- retourne la nouvelle ligne modifiée
END;
$update_date_actors$ LANGUAGE plpgsql; -- variable trigger + spécifie le langage

--Création du trigger (en appelant la fonction 'set_modification_date()')
CREATE TRIGGER set_modification_date_trigger
BEFORE UPDATE ON Actors -- avant l'insertion dans la table Actors
FOR EACH ROW -- pour chaque ligne
EXECUTE FUNCTION set_modification_date(); -- exécute la fonction pour chaque nouvelle ligne insérée

-- Afficher table
SELECT * FROM Actors;

-- + 3 (derniers) acteurs ajoutés avant les requêtes
SELECT * FROM Actors;
INSERT INTO Actors (last_name, first_name, birthday) 
VALUES
	('Jolie', 'Angelina', '1975-06-04'),
	('Smith', 'Will', '1968-09-25'),
	('Winslet', 'Kate', '1975-10-05');




-- todo = [TABLE DE LIAISON]  'RÔLES' <---> 'ACTEURS'

-- Création de la table relationnelle 'Roles'
CREATE TABLE IF NOT EXISTS Roles (
	role_id SERIAL PRIMARY KEY,
	role_actor VARCHAR(100) NOT NULL,
	actor_id INT NOT NULL REFERENCES Actors (actor_id)
);

-- ajout données
INSERT INTO Roles (role_actor, actor_id) 
VALUES
	('Dom Cobb', 1),
	('Sebastian', 2),
	('Ellis Boyd Redding', 3),
	('Wade Wilson / Deadpool', 4),
	('Vincent Vega', 5),
	('Bruce Wayne', 6),
	('Forrest Gump', 7),
	('Jack Dawson', 1),
	('Vito Corleone', 8),
	('Neo', 9),
	('Narrator', 10),
	('Oskar Schindler', 11),
	('Clarice Starling', 12),
	('Mark Zuckerberg', 13),
	('Henry Hill', 14),
	('Rick Blaine', 15);

SELECT * FROM Roles;




-- todo = TABLE  'DIRECTEURS'

-- création table des Réalisateurs
CREATE TABLE IF NOT EXISTS Directors (
	director_id SERIAL PRIMARY KEY,
	last_name VARCHAR(100) NOT NULL,
	first_name VARCHAR(100) NOT NULL,
	creation_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	modification_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UNIQUE (last_name, first_name)
);

-- Création fonction (trigger)
CREATE OR REPLACE FUNCTION set_creation_date()
RETURNS TRIGGER AS $create_date_directors$
BEGIN -- démarre la fonction
	NEW.creation_dt := CURRENT_TIMESTAMP;
	RETURN NEW;
END;
$create_date_directors$ LANGUAGE plpgsql;

--Création du trigger (en appelant la fonction 'set_creation_date()')
CREATE TRIGGER set_creation_date_trigger
BEFORE INSERT ON Directors
FOR EACH ROW
EXECUTE FUNCTION set_creation_date();

-- ajout données
INSERT INTO Directors (last_name, first_name) 
VALUES
	('Nolan', 'Christopher'),
	('Chazelle', 'Damien'),
	('Darabont', 'Frank'),
	('Miller', 'Tim'),
	('Leitch', 'David'),	
	('Tarantino', 'Quentin'),
	('Zemeckis', 'Robert'),
	('Cameron', 'James'),
	('Coppola', 'Francis Ford'),
	('Wachowski', 'Lana'),
	('Spielberg', 'Steven'),
	('Demme', 'Jonathan'),
	('Fincher', 'David'),
	('Scorsese', 'Martin'),
	('Curtiz', 'Michael')
ON CONFLICT (last_name, first_name) DO NOTHING;

-- Création fonction (trigger) => si ON MODIFIE des données
CREATE OR REPLACE FUNCTION set_modification_date()
RETURNS TRIGGER AS $update_date_directors$
BEGIN 
	NEW.modification_dt := CURRENT_TIMESTAMP; 
	RETURN NEW; 
END;
$update_date_directors$ LANGUAGE plpgsql; 

--Création du trigger (en appelant la fonction 'set_modification_date()')
CREATE TRIGGER set_modification_date_trigger
BEFORE UPDATE ON Directors 
FOR EACH ROW 
EXECUTE FUNCTION set_modification_date(); 

-- Afficher table
SELECT * FROM Directors;




-- todo = TABLE  'FILMS'

-- Création de la table Films
CREATE TABLE IF NOT EXISTS Movies (
	movie_id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	release_dt DATE NOT NULL,
	duration INT NOT NULL,
	actor_id INT NOT NULL REFERENCES Actors (actor_id),
	director_id INT NOT NULL REFERENCES Directors (director_id),
	creation_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	modification_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UNIQUE (title)
);

-- Création fonction (trigger)
CREATE OR REPLACE FUNCTION set_creation_date()
RETURNS TRIGGER AS $create_date_movies$
BEGIN -- démarre la fonction
	NEW.creation_dt := CURRENT_TIMESTAMP;
	RETURN NEW;
END;
$create_date_movies$ LANGUAGE plpgsql;

--Création du trigger (en appelant la fonction 'set_creation_date()')
CREATE TRIGGER set_creation_date_trigger
BEFORE INSERT ON Movies
FOR EACH ROW
EXECUTE FUNCTION set_creation_date();

-- ajout données
INSERT INTO Movies (title, release_dt, duration, actor_id, director_id) 
VALUES
	('Inception', '2010-07-16', 148, 1, 1),
	('La La Land', '2016-12-09', 128, 2, 2),
	('The Shawshank Redemption', '1994-09-23', 142, 3, 3),
	('Deadpool', '2016-02-12', 108, 4, 4),
	('Deadpool 2', '2018-05-10', 119, 4, 5),
	('Pulp Fiction', '1994-10-14', 154, 5, 6),
	('The Dark Knight', '2008-07-18', 152, 6, 1),
	('Forrest Gump', '1994-07-06', 142, 7, 7),
	('Titanic', '1997-12-19', 195, 1, 8),
	('The Godfather', '1972-03-24', 175, 8, 9),
	('The Matrix', '1999-03-31', 136, 9, 10),
	('Fight Club', '1999-10-15', 139, 10, 13),
	('Schindler''s List', '1993-11-30', 195, 11, 11),
	('The Silence of the Lambs', '1991-02-14', 118, 12, 12),
	('The Social Network', '2010-09-24', 120, 13, 13),
	('Goodfellas', '1990-09-19', 146, 14, 14),
	('Casablanca', '1942-11-26', 102, 15, 15)
ON CONFLICT (title) DO NOTHING;



-- Création fonction (trigger) => si ON MODIFIE des données
CREATE OR REPLACE FUNCTION set_modification_date()
RETURNS TRIGGER AS $update_date_movies$
BEGIN 
	NEW.modification_dt := CURRENT_TIMESTAMP; 
	RETURN NEW; 
END;
$update_date_movies$ LANGUAGE plpgsql; 

--Création du trigger (en appelant la fonction 'set_modification_date()')
CREATE TRIGGER set_modification_date_trigger
BEFORE UPDATE ON Movies 
FOR EACH ROW 
EXECUTE FUNCTION set_modification_date(); 

-- Afficher table
SELECT * FROM Movies;




-- todo = TABLE  'UTILISATEURS'

-- Création de la table Utilisateurs
CREATE TABLE IF NOT EXISTS Users (
	user_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(250),
	password_user VARCHAR(50),
	role_user VARCHAR(50),
	favorite_movies_list VARCHAR(100),
	creation_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	modification_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	UNIQUE (email, password_user)
);

-- Création fonction (trigger)
CREATE OR REPLACE FUNCTION set_creation_date()
RETURNS TRIGGER AS $create_date_users$
BEGIN 
	NEW.creation_dt := CURRENT_TIMESTAMP;
	RETURN NEW; 
END;
$create_date_users$ LANGUAGE plpgsql;

--Création du trigger (en appelant la fonction 'set_creation_date()')
CREATE TRIGGER set_creation_date_trigger
BEFORE INSERT ON Users
FOR EACH ROW
EXECUTE FUNCTION set_creation_date();

-- ajout données
INSERT INTO Users (first_name, last_name, email, password_user, favorite_movies_list, role_user) 
VALUES
	('John', 'Doe', 'john.doe@email.com', 'password123', 2, 'user'),
	('Jane', 'Smith', 'jane.smith@email.com', 'pass456', 14, 'user'),
	('Alice', 'Johnson', 'alice.johnson@email.com', 'abc123', 7, 'user'),
	('Bob', 'Williams', 'bob.williams@email.com', 'qwerty', 7, 'admin'),
	('Emily', 'Davis', 'emily.davis@email.com', 'pass123', 1, 'user'),
	('Michael', 'Jones', 'michael.jones@email.com', 'letmein', 2, 'user'),
	('Sophia', 'Brown', 'sophia.brown@email.com', 'iloveyou', 13, 'user'),
	('Daniel', 'Moore', 'daniel.moore@email.com', 'password', 11, 'user'),
	('Olivia', 'Taylor', 'olivia.taylor@email.com', 'passpass', 5, 'user'),
	('William', 'Hill', 'william.hill@email.com', '123456', 15, 'user'),
	('Ava', 'Clark', 'ava.clark@email.com', 'hello123', 3,  'user'),
	('James', 'Johnson', 'james.johnson@email.com', 'passpass', 6, 'admin'),
	('Mia', 'Walker', 'mia.walker@email.com', 'password123', 2, 'user'),
	('Benjamin', 'Young', 'benjamin.young@email.com', 'qwerty123', 4, 'user'),
	('Emma', 'Hall', 'emma.hall@email.com', 'letmein123', 8, 'user'),
	('Logan', 'Ward', 'logan.ward@email.com', 'iloveyou123', 9, 'user'),
	('Avery', 'Baker', 'avery.baker@email.com', 'pass456', 11, 'user'),
	('Elijah', 'Fisher', 'elijah.fisher@email.com', 'abc123', 10, 'user'),
	('Grace', 'Cooper', 'grace.cooper@email.com', 'qwerty', 14, 'user'),
	('Liam', 'Reed', 'liam.reed@email.com', 'pass123', 14, 'user')
ON CONFLICT (email, password_user) DO NOTHING;

-- Création fonction (trigger) => si ON MODIFIE des données
CREATE OR REPLACE FUNCTION set_modification_date()
RETURNS TRIGGER AS $update_date_users$
BEGIN 
	NEW.modification_dt := CURRENT_TIMESTAMP; 
	RETURN NEW; 
END;
$update_date_users$ LANGUAGE plpgsql; 

--Création du trigger (en appelant la fonction 'set_modification_date()')
CREATE TRIGGER set_modification_date_trigger
BEFORE UPDATE ON Users 
FOR EACH ROW 
EXECUTE FUNCTION set_modification_date(); 

-- Afficher table
SELECT * FROM Users;




-- todo = [TABLE DE LIAISON]  'FILMS REGARDÉS'  (movie_id <---> user_id)

-- Création de la table relationnelle Watching
CREATE TABLE IF NOT EXISTS Watching (
	id SERIAL PRIMARY KEY,
	movie_id INT REFERENCES Movies (movie_id),
	user_id INT REFERENCES Users (user_id)
);

-- ajout données
INSERT INTO Watching (user_id, movie_id) 
VALUES
	(1, 6),
	(2, 2),
	(3, 4),
	(4, 11),
	(5, 10),
	(6, 1),
	(7, 12),
	(8, 14),
	(9, 5),
	(10, 1),
	(11, 3),
	(12, 9),
	(13, 14),
	(14, 10),
	(15, 1),
	(16, 14),
	(17, 4),
	(18, 8),
	(19, 13),
	(20, 6);

SELECT * FROM Watching;