CREATE TABLE IF NOT EXISTS genre (
	genre_id SERIAL PRIMARY KEY NOT NULL,
	genre_name varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS performer (
	performer_id SERIAL PRIMARY KEY NOT NULL,
	performer_name varchar(50) NOT NULL,
	performer_alias varchar(50)    --псевдоним
);

/*таблица связи исполнителей и жанров*/
CREATE TABLE IF NOT EXISTS performer_genre (
	id SERIAL PRIMARY KEY,
	performer_id INTEGER NOT NULL REFERENCES performer(performer_id),
	genre_id INTEGER NOT NULL REFERENCES genre(genre_id)
);


CREATE TABLE IF NOT EXISTS album (
	album_id SERIAL PRIMARY KEY NOT NULL,
	album_name VARCHAR(50) NOT NULL,
	release_year INTEGER
);

/*таблица связи исполнителей и альбомов*/
CREATE TABLE IF NOT EXISTS album_performer (
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES album(album_id),
	performer_id INTEGER NOT NULL REFERENCES performer(performer_id)
);

CREATE TABLE IF NOT EXISTS track (
	track_id SERIAL PRIMARY KEY NOT NULL,
	track_name VARCHAR(50) NOT NULL,
	duration FLOAT,
	album_id INTEGER REFERENCES album(album_id)
);

/*сборник*/
CREATE TABLE IF NOT EXISTS collection (
	collection_id SERIAL PRIMARY KEY NOT NULL,
	collection_name VARCHAR(50) NOT NULL,
	collection_year INTEGER
);

/*состав сборника - таблица детализации*/
CREATE TABLE IF NOT EXISTS collection_track (
	id SERIAL PRIMARY KEY NOT NULL,
	collection_id INTEGER NOT NULL REFERENCES collection(collection_id),
	track_id INTEGER REFERENCES track(track_id)
);

