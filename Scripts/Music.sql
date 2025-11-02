-- Таблица жанров
CREATE TABLE Genres (
	genre_id SERIAL PRIMARY KEY,
	name TEXT NOT NULL UNIQUE
);

-- Таблица исполнителей
CREATE TABLE Artists (
    artist_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

-- Таблица альбомов
CREATE TABLE Albums (
    album_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    release_year INTEGER CHECK(release_year > 0),
    CONSTRAINT unique_album_title UNIQUE(title)
);

-- Таблица треков
CREATE TABLE Tracks (
    track_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    duration INTEGER NOT NULL, --храним длительность в секундах
    album_id INTEGER REFERENCES Albums(album_id),
    CONSTRAINT unique_track_title UNIQUE(title)
);

-- Таблица сборников
CREATE TABLE Playlists (
    playlist_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    release_year INTEGER CHECK(release_year > 0)
);

-- Таблица для связи исполнителей и жанров
CREATE TABLE Artist_Genre (
    artist_id INTEGER REFERENCES Artists(artist_id),
    genre_id INTEGER REFERENCES Genres(genre_id),
    CONSTRAINT pk_artist_genre PRIMARY KEY (artist_id, genre_id)
);

-- Таблица для связи альбомов и исполнителей
CREATE TABLE Album_Artist (
    album_id INTEGER REFERENCES Albums(album_id),
    artist_id INTEGER REFERENCES Artists(artist_id),
    CONSTRAINT pk_album_artist PRIMARY KEY (album_id, artist_id)
);

-- Таблица для связи сборников и треков
CREATE TABLE Playlist_Track (
    playlist_id INTEGER REFERENCES Playlists(playlist_id),
    track_id INTEGER REFERENCES Tracks(track_id),
    CONSTRAINT pk_plailist_track PRIMARY KEY (playlist_id, track_id)
);