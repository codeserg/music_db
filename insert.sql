INSERT INTO performer (performer_id,performer_name,performer_alias) VALUES
	 (1,'Beyonce','Бейонсе'),
	 (2,'Eminem','Эминем'),
	 (3,'Taylor Swift','Тейлор Свифт'),
	 (4,'Billie Eilish','Билли Айлиш'),
	 (6,'Lady Gaga','Lady Gaga'),
	 (5,'Imagine Dragons','Имэджн Дрэгонс');

INSERT INTO genre (genre_id,genre_name) VALUES
	 (1,'Поп'),
	 (2,'R&B'),
	 (3,'Хип-хоп'),
	 (4,'Рэп'),
	 (5,'Кантри'),
	 (6,'Соул'),
	 (7,'Электропоп'),
	 (8,'Альтернативный рок'),
	 (9,'Альтернативный поп'),
	 (10,'Инди-рок');

INSERT INTO album (album_id,album_name,release_year) VALUES
	 (1,'Lemonade',2016),
	 (2,'Beyonce',2013),
	 (3,'4',2011),
	 (4,'The Fame',2008),
	 (5,'Born This Way',2011),
	 (6,'Chromatica',2020),
	 (8,'Smoke + Mirrors',2015),
	 (9,'Evolve',2017),
	 (10,'1989',2014),
	 (11,'Red',2012),
	 (12,'Folklore',2020),
	 (14,'The Eminem Show',2002),
	 (15,'Recovery',2010),
	 (16,'When We All Fall Asleep, Where Do We Go?',2019),
	 (18,'Don''t Smile at Me',2017),
	 (7,'Night Visions',2019),
	 (13,'The Marshall Mathers LP',2019);

INSERT INTO collection (collection_id,collection_name,collection_year) VALUES
	 (2,'Grammy Nominees',2020),
	 (3,'Billboard Top Hits',2018),
	 (4,'MTV Hits',2022),
	 (1,'Now That''s What I Call Music!',2019);

INSERT INTO track (track_id,track_name,duration,album_id) VALUES
	 (1,'Radioactive',180,7),
	 (2,'Demons',150,7),
	 (4,'Just Dance',155,4),
	 (3,'Believer',140,9),
	 (5,'Poker Face',220,4),
	 (6,'Born This Way',140,5),
	 (7,'The Way I Am',190,13),
	 (8,'The Real Slim Shady',170,13),
	 (9,'Ocean Eyes',165,18),
	 (10,'When the Party''s Over',170,18),
	 (11,'Shake It Off',250,10),
	 (12,'Blank Space',200,10),
	 (13,'Not Afraid',150,15),
	 (15,'My Dad''s Gone Crazy',245,14),
	 (14,'My strange addiction',240,16),
	 (16,'Rain on Me',190,6),
	 (17,'my own',220,4),
	 (18,'own my',140,5),
	 (19,'my',190,13),
	 (20,'oh my god',170,13),
	 (21,'myself',165,18),
	 (22,'by myself',170,18),
	 (23,'bemy self',250,10),
	 (24,'myself by',200,10),
	 (25,'by myself by',150,15),
	 (26,'beemy',245,14),
	 (27,'premyne',240,16);

	

INSERT INTO album_performer (id,album_id,performer_id) VALUES
	 (1,1,1),
	 (2,2,1),
	 (3,3,1),
	 (7,7,5),
	 (8,8,5),
	 (9,9,5),
	 (10,10,3),
	 (11,11,3),
	 (12,12,3),
	 (13,13,2),
	 (14,14,2),
	 (15,15,2),
	 (16,16,4),
	 (18,18,4),
	 (4,4,6),
	 (5,5,6),
	 (6,6,6);

INSERT INTO collection_track (id,collection_id,track_id) VALUES
	 (1,1,10),
	 (2,1,3),
	 (3,1,15),
	 (4,1,2),
	 (5,2,7),
	 (6,2,8),
	 (7,2,9),
	 (8,2,10),
	 (9,3,14),
	 (10,3,13),
	 (11,3,15),
	 (12,3,1),
	 (13,3,4),
	 (14,4,5),
	 (15,4,10),
	 (16,4,2),
	 (17,4,8),
	 (18,4,12);

INSERT INTO performer_genre (id,performer_id,genre_id) VALUES
	 (2,1,2),
	 (3,2,3),
	 (4,2,4),
	 (5,3,1),
	 (6,3,5),
	 (7,5,8),
	 (8,5,10),
	 (9,4,7),
	 (10,4,9),
	 (11,6,7),
	 (12,6,1);