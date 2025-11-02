-- Название и продолжительность самого длинного трека
SELECT title AS track_name, duration
FROM Tracks
ORDER BY duration DESC
LIMIT 1;

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT title AS track_name
FROM Tracks
WHERE duration >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT title AS playlist_name
FROM Playlists
WHERE release_year BETWEEN 2018 AND 2020;

-- Исполнители, чье имя состоит из одного слова
SELECT name AS artist_name
FROM Artists
WHERE name NOT LIKE '% %';

-- Название треков, которые содержат слово "мой" "my"
SELECT title AS track_name
FROM Tracks
WHERE LOWER(title) LIKE '%мой%' OR LOWER(title) LIKE '%my%';

-- Количество исполнителей в каждом жанре.
SELECT g.name AS genre_name, COUNT(*) AS number_of_artists
FROM Genres g
JOIN Artist_Genre ag ON g.genre_id = ag.genre_id
GROUP BY g.genre_id;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.track_id) AS tracks_count
FROM Tracks t
JOIN Albums a ON t.album_id = a.album_id
WHERE a.release_year IN (2019, 2020);

-- Средняя продолжительность треков по каждому альбому
SELECT a.title AS album_title, AVG(t.duration) AS avg_duration
FROM Tracks t
JOIN Albums a ON t.album_id = a.album_id
GROUP BY a.album_id;

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT DISTINCT ar.name AS artist_name
FROM Artists ar
LEFT JOIN Album_Artist aa ON ar.artist_id = aa.artist_id
LEFT JOIN Albums al ON aa.album_id = al.album_id
WHERE al.release_year != 2020 OR al.release_year IS NULL;


-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT p.title AS playlist_name
FROM Playlists p
JOIN Playlist_Track pt ON p.playlist_id = pt.playlist_id
JOIN Tracks t ON pt.track_id = t.track_id
JOIN Album_Artist aa ON t.album_id = aa.album_id
JOIN Artists a ON aa.artist_id = a.artist_id
WHERE a.name = 'Кино'
GROUP BY p.title;