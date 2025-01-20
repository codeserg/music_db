/* Задание 2*/

/* Примечание: я храню длительност треков в секундах */

/* 1. Название и продолжительность самого длительного трека. */

SELECT DISTINCT track_name , duration AS duration_seconds, duration/60 AS duration_minutes FROM track
WHERE duration  = (SELECT max(duration) FROM track);

/* 2. Название треков, продолжительность которых не менее 3,5 минут. */

SELECT track_name , duration AS duration_seconds, duration/60 AS duration_minutes FROM track
WHERE duration/60 > 3.5;

/* 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно. */

SELECT collection_name, collection_year FROM collection
WHERE collection_year BETWEEN 2018 AND 2020;

/* 4. Исполнители, чьё имя состоит из одного слова.*/ 

SELECT performer_name FROM performer  
WHERE performer_name NOT LIKE '% %';

/* 5. Название треков, которые содержат слово «мой» или «my». */

SELECT track_name FROM track
WHERE track_name ~* '\mmy\M' OR track_name ~* '\mмой\M';

/* Задание 3*/

/* 1. Количество исполнителей в каждом жанре. */

SELECT g.genre_name, count(id) FROM genre g
LEFT JOIN performer_genre pg ON g.genre_id = pg.genre_id
LEFT JOIN performer p ON p.performer_id = pg.performer_id
GROUP BY g.genre_name ;

/* 2.Количество треков, вошедших в альбомы 2019–2020 годов.*/

SELECT count(*) FROM track t
JOIN album a ON t.album_id = a.album_id 
WHERE a.release_year BETWEEN 2019 AND 2020;

/* 3. Средняя продолжительность треков по каждому альбому.*/

SELECT album_name, avg(t.duration) AS avg_duration, avg(t.duration)/60 AS avg_duration_minutes FROM album a
JOIN track t  ON  a.album_id  = t.album_id 
GROUP BY album_name ;

/* 4. Все исполнители, которые не выпустили альбомы в 2020 году. */

SELECT n.performer_name FROM performer n
WHERE n.performer_name NOT IN 
	(SELECT p.performer_name FROM performer p 
	LEFT JOIN album_performer ap ON p.performer_id=ap.performer_id 
	LEFT JOIN album a ON ap.album_id  = a.album_id 
	WHERE release_year  = 2020);

/* 5. Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).*/

SELECT DISTINCT c.collection_name  FROM collection c
LEFT JOIN collection_track ct  ON c.collection_id =ct.collection_id
LEFT JOIN track t ON ct.track_id  = t.track_id  
LEFT JOIN album a ON t.album_id  = a.album_id 
LEFT JOIN album_performer ap ON a.album_id  = ap.album_id 
LEFT JOIN performer p ON p.performer_id  =ap.performer_id 
WHERE p.performer_name = 'Imagine Dragons';

/* Задание 4*/

/* 1. Названия альбомов, в которых присутствуют исполнители более чем одного жанра.*/

SELECT DISTINCT a.album_name FROM album a
JOIN album_performer ap  ON a.album_id  = ap.album_id 
WHERE ap.performer_id  IN (
	SELECT performer_id FROM performer_genre pg
	GROUP BY performer_id 
	HAVING count(*)>1
)
;
/* 2. Наименования треков, которые не входят в сборники.*/

SELECT t.track_name FROM track t 
WHERE t.track_id  NOT IN (
	SELECT ct.track_id FROM collection_track ct 
);

/* 3. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько. */

SELECT DISTINCT p.performer_name FROM performer p 
JOIN album_performer ap ON p.performer_id = ap.performer_id
JOIN track t ON ap.album_id  = t.album_id 
WHERE t.duration  = (SELECT min(duration) FROM track);

/* 4. Названия альбомов, содержащих наименьшее количество треков. */

/* Примечание: треков немного, поэтому в выборку попали почти все альбомы */

SELECT a.album_name FROM track tk
JOIN album a  ON tk.album_id  = a.album_id 
GROUP BY a.album_name 
HAVING count(*) = (
	SELECT min(cnt) FROM (
		SELECT count(*) AS cnt FROM track t
		GROUP BY album_id));

