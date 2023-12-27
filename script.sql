-- todo = TABLE ACTEURS

-- création table des Acteurs
CREATE TABLE Actors (
	actor_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	role_actor VARCHAR(100) NOT NULL,
	birthday DATE,
	creation_dt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Création fonction (trigger)
CREATE OR REPLACE FUNCTION set_creation_date() -- déclare ma fonction
RETURNS TRIGGER AS $create_date_actors$ --  retourne la variable trigger
BEGIN -- démarre la fonction
	NEW.creation_dt := CURRENT_TIMESTAMP; -- attribut de la date et l'heure actuelles à la colonne creation_dt
	RETURN NEW; -- retourne la nouvelle ligne modifiée
END;
$create_date_actors$ LANGUAGE plpgsql; -- variable trigger + spécifie le langage

--Création du trigger (en appelant la fonction 'set_creation_date()')
CREATE TRIGGER set_creation_date_trigger
BEFORE INSERT ON Actors -- avant l'insertion dans la table Actors
FOR EACH ROW -- pour chaque ligne
EXECUTE FUNCTION set_creation_date(); -- exécute la fonction pour chaque nouvelle ligne insérée

-- Ajout données
insert into Actors (first_name, last_name, role_actor, birthday) 
values
	('DiCaprio', 'Leonardo', 'Dom Cobb', '1974-11-11'),
	('Ryan', 'Sebastian', 'Gosling', '1980-11-12'),
	('Freeman', 'Morgan', 'Ellis Boyd Redding', '1937-06-01'),
	('Reynolds', 'Ryan', 'Wade Wilson / Deadpool', '1976-10-23'),
	('Travolta', 'John', 'Vincent Vega', '1954-02-18'),
	('Bale', 'Christian', 'Bruce Wayne', '1974-01-30'),
	('Hanks', 'Tom', 'Forrest Gump', '1956-07-09'),
	('DiCaprio', 'Leonardo', 'Jack Dawson', '1974-11-11'),
	('Brando', 'Marlon', 'Vito Corleone', '1924-04-03'),
	('Reeves', 'Keanu', 'Neo', '1964-09-02'),
	('Norton', 'Edward', 'Narrator', '1969-08-18'),
	('Neeson', 'Liam', 'Oskar Schindler', '1952-06-07'),
	('Foster', 'Jodie', 'Clarice Starling', '1962-11-19'),
	('Eisenberg', 'Jesse', 'Mark Zuckerberg', '1983-10-05'),
	('De Niro', 'Robert', 'Henry Hill', '1943-08-17'),
	('Bogart', 'Humphrey', 'Rick Blaine', '1899-12-25');

-- Afficher table
select * from Actors;




-- todo = TABLE DIRECTEURS

-- création table des Réalisateurs
create table Directors (
	director_id serial primary key,
	first_name VARCHAR(100) not null,
	last_name VARCHAR(100) not null,
	creation_dt TIMESTAMP NOT NULL,
	modification_dt TIMESTAMP NOT null
);

-- Création fonction (trigger)
CREATE OR REPLACE FUNCTION set_creation_date() -- déclare ma fonction
RETURNS TRIGGER AS $create_date_directors$ --  retourne la variable trigger
BEGIN -- démarre la fonction
	NEW.creation_dt := CURRENT_TIMESTAMP; -- attribut de la date et l'heure actuelles à la colonne creation_dt
	RETURN NEW; -- retourne la nouvelle ligne modifiée
END;
$create_date_directors$ LANGUAGE plpgsql; -- variable trigger + spécifie le langage

--Création du trigger (en appelant la fonction 'set_creation_date()')
CREATE TRIGGER set_creation_date_trigger
BEFORE INSERT ON Directors -- avant l'insertion dans la table Actors
FOR EACH ROW -- pour chaque ligne
EXECUTE FUNCTION set_creation_date(); -- exécute la fonction pour chaque nouvelle ligne insérée

-- ajout données
insert into Directors (first_name, last_name) 
values
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
	('Curtiz', 'Michael');

-- Afficher table
select * from Directors;




-- todo = TABLE FILMS

-- Création de la table Films
create table Movies (
	movie_id serial primary key,
	title VARCHAR(100) not null,
	release_dt DATE not null,
	duration INT not null,
	actor_id serial REFERENCES Actors (actor_id),
	director_id serial REFERENCES Directors (director_id),
	creation_dt TIMESTAMP NOT NULL,
	modification_dt TIMESTAMP NOT null
);

-- Création fonction (trigger)
CREATE OR REPLACE FUNCTION set_creation_date() -- déclare ma fonction
RETURNS TRIGGER AS $create_date_movies$ --  retourne la variable trigger
BEGIN -- démarre la fonction
	NEW.creation_dt := CURRENT_TIMESTAMP; -- attribut de la date et l'heure actuelles à la colonne creation_dt
	RETURN NEW; -- retourne la nouvelle ligne modifiée
END;
$create_date_movies$ LANGUAGE plpgsql; -- variable trigger + spécifie le langage

--Création du trigger (en appelant la fonction 'set_creation_date()')
CREATE TRIGGER set_creation_date_trigger
BEFORE INSERT ON Movies -- avant l'insertion dans la table Actors
FOR EACH ROW -- pour chaque ligne
EXECUTE FUNCTION set_creation_date(); -- exécute la fonction pour chaque nouvelle ligne insérée

-- ajout données
-- todo NE PAS OUBLIER DE MODIFIER LES 'DEFAULT' -> ENTRÉE MANUELLE !!
insert into Movies (title, release_dt, duration, actor_id, director_id, creation_dt, modification_dt) 
values
	('Inception', '2010-07-16', 148, DEFAULT, DEFAULT),
	('La La Land', '2016-12-09', 128, DEFAULT, DEFAULT),
	('The Shawshank Redemption', '1994-09-23', 142, DEFAULT, DEFAULT),
	('Deadpool', '2016-02-12', 108, DEFAULT, DEFAULT),
	('Deadpool 2', '2018-05-10', 119, DEFAULT, DEFAULT),
	('Pulp Fiction', '1994-10-14', 154, DEFAULT, DEFAULT),
	('The Dark Knight', '2008-07-18', 152, DEFAULT, DEFAULT),
	('Forrest Gump', '1994-07-06', 142, DEFAULT, DEFAULT),
	('Titanic', '1997-12-19', 195, DEFAULT, DEFAULT),
	('The Godfather', '1972-03-24', 175, DEFAULT, DEFAULT),
	('The Matrix', '1999-03-31', 136, DEFAULT, DEFAULT),
	('Fight Club', '1999-10-15', 139, DEFAULT, DEFAULT),
	('Schindler''s List', '1993-11-30', 195, DEFAULT, DEFAULT),
	('The Silence of the Lambs', '1991-02-14', 118, DEFAULT, DEFAULT),
	('The Social Network', '2010-09-24', 120, DEFAULT, DEFAULT),
	('Goodfellas', '1990-09-19', 146, DEFAULT, DEFAULT),
	('Casablanca', '1942-11-26', 102, DEFAULT, DEFAULT);

-- Afficher table
select * from Movies;




-- todo = TABLE UTILISATEURS

-- Création de la table Utilisateurs
create table Users (
	user_id serial primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(250),
	password_user VARCHAR(50),
	role_user VARCHAR(50),
	favorite_movies_list VARCHAR(100),
	creation_dt TIMESTAMP NOT NULL,
	modification_dt TIMESTAMP NOT null
);

-- Création fonction (trigger)
CREATE OR REPLACE FUNCTION set_creation_date() -- déclare ma fonction
RETURNS TRIGGER AS $create_date_users$ --  retourne la variable trigger
BEGIN -- démarre la fonction
	NEW.creation_dt := CURRENT_TIMESTAMP; -- attribut de la date et l'heure actuelles à la colonne creation_dt
	RETURN NEW; -- retourne la nouvelle ligne modifiée
END;
$create_date_users$ LANGUAGE plpgsql; -- variable trigger + spécifie le langage

--Création du trigger (en appelant la fonction 'set_creation_date()')
CREATE TRIGGER set_creation_date_trigger
BEFORE INSERT ON Users -- avant l'insertion dans la table Actors
FOR EACH ROW -- pour chaque ligne
EXECUTE FUNCTION set_creation_date(); -- exécute la fonction pour chaque nouvelle ligne insérée

-- ajout données
insert into Users (first_name, last_name, email, password_user, role_user, favorite_movies_list, creation_dt, modification_dt) 
values
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
	('Liam', 'Reed', 'liam.reed@email.com', 'pass123', 14, 'user');

-- Afficher table
select * from Users;




-- todo = TABLE FILMS REGARDÉS

-- Création de la table relationnelle Watching
create table Watching (
	id serial primary key,
	movie_id int REFERENCES Movies (movie_id),
	user_id int REFERENCES Users (user_id)
);

-- ajout données
insert into Watching (user_id, movie_id) 
values
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

select * from Watching;




-- todo = TABLE FILMS FAVORIS





-- REQUÊTE SQL :

-- Les titres et dates de sortie des films du plus récent au plus ancien
select title, release_dt from Movies
order by release_dt desc;

-- Les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique

-- La liste des acteurs/actrices principaux pour un film donné

-- La liste des films pour un acteur/actrice donné

-- Ajouter un film

-- Ajouter un acteur/actrice

-- Modifier un film

-- Supprimer un acteur/actrice

-- Afficher les 3 derniers acteurs/actrices ajouté(e)s