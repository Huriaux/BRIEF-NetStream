# BRIEF-NetStream


## REQUÊTE SQL :

1) Les titres et dates de sortie des films du plus récent au plus ancien
```sql
SELECT title, release_dt FROM Movies
ORDER BY release_dt DESC;
```

2) Les noms, prénoms et âges des acteurs/actrices de plus de 50 ans dans l'ordre alphabétique
```sql
-- (j'ai modifié l'âge de la consigne car je me suis aperçu trop tard que je n'ai aucun acteur de moins de 30 ans)

SELECT last_name, first_name, age
FROM (
  SELECT last_name, first_name, EXTRACT(YEAR FROM AGE(NOW(), birthday)) AS age
  FROM Actors
) AS actor_age
WHERE age <= 50;
```

3) La liste des acteurs/actrices principaux pour un film donné
```sql
SELECT Movies.movie_id, Movies.title, Actors.actor_id, Actors.last_name, Actors.first_name
FROM Movies
INNER JOIN Actors ON Movies.actor_id = Actors.actor_id
WHERE Movies.title = 'Deadpool';
```

4) La liste des films pour un acteur/actrice donné
```sql
SELECT Actors.actor_id, Actors.last_name, Actors.first_name, Movies.movie_id, Movies.title
FROM Actors
INNER JOIN Movies ON  Actors.actor_id = Movies.actor_id
WHERE Actors.last_name = 'Reynolds';
```

5) Ajouter un film (avec une faute d'orthographe dans le nom)
```sql
-- ("Il faut sauver le soldat Ryan", "1998-07-24", "169 minutes", "Hanks", "Tom", "Captain John Miller", "1956-07-09", "Spielberg", "Steven")
SELECT * FROM Movies;
INSERT INTO Movies (Title, release_dt, duration, actor_id, director_id)
	VALUES 	('Il faut sauver le soldat Bryan', '1998-07-24', 169, 7, 11);
  ```

6) Ajouter un acteur/actrice
```sql
SELECT * FROM Actors;
INSERT INTO Actors (last_name, first_name, birthday) 
VALUES
	('Damon', 'Matt', '1970-10-08');
```

7) Modifier un film (--> Title : faute d'orthographe)
```sql
SELECT * FROM Movies;
UPDATE Movies SET title = 'Il faut sauver le soldat Ryan' WHERE movie_id = 18;
```

8) Supprimer un acteur/actrice
```sql
SELECT FROM Actors;
DELETE FROM Actors WHERE actor_id = 16;
```

9) Afficher les 3 derniers acteurs/actrices ajouté(e)s
```sql
SELECT actor_id, last_name, first_name, creation_dt FROM Actors
ORDER BY creation_dt DESC
LIMIT 3;
```