-- création table des Acteurs
CREATE table Actors (
	actor_id serial PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) not null,
	role_actor VARCHAR(100) not null,
	birthday DATE,
	creation_dt TIMESTAMP NOT NULL,
	modification_dt TIMESTAMP NOT null
);

-- ajout données
insert into Actors (first_name, last_name, role_actor, birthday, creation_dt, modification_dt) 
values
	('DiCaprio', 'Leonardo', 'Dom Cobb', '1974-11-11', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Ryan', 'Sebastian', 'Gosling', '1980-11-12', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Freeman', 'Morgan', 'Ellis Boyd Redding', '1937-06-01', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Travolta', 'John', 'Vincent Vega', '1954-02-18', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Bale', 'Christian', 'Bruce Wayne', '1974-01-30', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Hanks', 'Tom', 'Forrest Gump', '1956-07-09', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('DiCaprio', 'Leonardo', 'Jack Dawson', '1974-11-11', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Brando', 'Marlon', 'Vito Corleone', '1924-04-03', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Reeves', 'Keanu', 'Neo', '1964-09-02', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Norton', 'Edward', 'Narrator', '1969-08-18', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Neeson', 'Liam', 'Oskar Schindler', '1952-06-07', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Foster', 'Jodie', 'Clarice Starling', '1962-11-19', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Eisenberg', 'Jesse', 'Mark Zuckerberg', '1983-10-05', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('De Niro', 'Robert', 'Henry Hill', '1943-08-17', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Bogart', 'Humphrey', 'Rick Blaine', '1899-12-25', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

select * from Actors;




-- création table des Réalisateurs
create table Directors (
	director_id serial primary key,
	first_name VARCHAR(100) not null,
	last_name VARCHAR(100) not null,
	creation_dt TIMESTAMP NOT NULL,
	modification_dt TIMESTAMP NOT null
);

-- ajout données
insert into Directors (first_name, last_name, creation_dt, modification_dt) 
values
	('Nolan', 'Christopher', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Chazelle', 'Damien', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Darabont', 'Frank', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Tarantino', 'Quentin', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Nolan', 'Christopher', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Zemeckis', 'Robert', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Cameron', 'James', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Coppola', 'Francis Ford', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Wachowski', 'Lana', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Fincher', 'David', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Spielberg', 'Steven', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Demme', 'Jonathan', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Fincher', 'David', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Scorsese', 'Martin', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Curtiz', 'Michael', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

select * from Directors;




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

-- ajout données
insert into Movies (title, release_dt, duration, actor_id, director_id, creation_dt, modification_dt) 
values
	('Inception', '2010-07-16', 148, DEFAULT, DEFAULT, to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('La La Land', '2016-12-09', 128, DEFAULT, DEFAULT, to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('The Shawshank Redemption', '1994-09-23', 142, DEFAULT, DEFAULT, to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Pulp Fiction', '1994-10-14', 154, DEFAULT, DEFAULT, to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('The Dark Knight', '2008-07-18', 152, DEFAULT, DEFAULT, to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Forrest Gump', '1994-07-06', 142, DEFAULT, DEFAULT, to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Titanic', '1997-12-19', 195, DEFAULT, DEFAULT, to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('The Godfather', '1972-03-24', 175, DEFAULT, DEFAULT, to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('The Matrix', '1999-03-31', 136, DEFAULT, DEFAULT, to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Fight Club', '1999-10-15', 139, DEFAULT, DEFAULT, to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Schindler''s List', '1993-11-30', 195, DEFAULT, DEFAULT, to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('The Silence of the Lambs', '1991-02-14', 118, DEFAULT, DEFAULT, to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('The Social Network', '2010-09-24', 120, DEFAULT, DEFAULT, to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Goodfellas', '1990-09-19', 146, DEFAULT, DEFAULT, to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Casablanca', '1942-11-26', 102, DEFAULT, DEFAULT, to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

select * from Movies;




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

-- ajout données
insert into Users (first_name, last_name, email, password_user, role_user, favorite_movies_list, creation_dt, modification_dt) 
values
	('John', 'Doe', 'john.doe@email.com', 'password123', 2, 'user', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Jane', 'Smith', 'jane.smith@email.com', 'pass456', 14, 'user', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Alice', 'Johnson', 'alice.johnson@email.com', 'abc123', 7, 'user', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Bob', 'Williams', 'bob.williams@email.com', 'qwerty', 7, 'admin', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Emily', 'Davis', 'emily.davis@email.com', 'pass123', 1, 'user', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Michael', 'Jones', 'michael.jones@email.com', 'letmein', 2, 'user', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Sophia', 'Brown', 'sophia.brown@email.com', 'iloveyou', 13, 'user', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Daniel', 'Moore', 'daniel.moore@email.com', 'password', 11, 'user', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Olivia', 'Taylor', 'olivia.taylor@email.com', 'passpass', 5, 'user', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('William', 'Hill', 'william.hill@email.com', '123456', 15, 'user', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Ava', 'Clark', 'ava.clark@email.com', 'hello123', 3,  'user', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('James', 'Johnson', 'james.johnson@email.com', 'passpass', 6, 'admin', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Mia', 'Walker', 'mia.walker@email.com', 'password123', 2, 'user', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Benjamin', 'Young', 'benjamin.young@email.com', 'qwerty123', 4, 'user', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Emma', 'Hall', 'emma.hall@email.com', 'letmein123', 8, 'user', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Logan', 'Ward', 'logan.ward@email.com', 'iloveyou123', 9, 'user', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Avery', 'Baker', 'avery.baker@email.com', 'pass456', 11, 'user', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Elijah', 'Fisher', 'elijah.fisher@email.com', 'abc123', 10, 'user', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Grace', 'Cooper', 'grace.cooper@email.com', 'qwerty', 14, 'user', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')),
	('Liam', 'Reed', 'liam.reed@email.com', 'pass123', 14, 'user', to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), to_timestamp('2023-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

select * from Users;




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


-- REQUÊTE SQL :
