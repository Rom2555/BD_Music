-- жанры
INSERT INTO Genres(name)
VALUES ('Русский рок'),
       ('Шансон'),
       ('Поп-музыка'),
       ('Классический рок');

-- исполнители
INSERT INTO Artists(name)
VALUES ('Кино'),
       ('ДДТ'),
       ('Виктор Цой'),
       ('Сергей Лазарев'),
       ('Михаил Круг'),
       ('Ночные Снайперы'),
       ('Стас Михайлов');

-- альбомы
INSERT INTO Albums(title, release_year)
VALUES ('Группа крови', 1988),
       ('Что такое осень?', 1991),
       ('Нашествие', 2018),
       ('Мир без войны', 2019),
       ('Горький мёд', 2020),
       ('Без меня', 2020),
       ('Жизнь удалась', 2019);

-- треки
INSERT INTO Tracks(title, duration, album_id)
VALUES ('Группа крови', 240, 1),
       ('Звезда по имени Солнце', 230, 1),
       ('Родина', 310, 2),
       ('Моя Москва', 220, 3),
       ('Последний герой', 350, 4),
       ('Осень', 250, 5),
       ('My Way', 210, 6),
       ('Буду пьяным', 260, 7);

-- сборники
INSERT INTO Playlists(title, release_year)
VALUES ('Лучшая классика русского рока', 2018),
       ('Русская попса', 2019),
       ('Шансон хит-парад', 2020),
       ('Лучший шансон 2019', 2019);

-- связи исполнители и жанры
INSERT INTO Artist_Genre(artist_id, genre_id)
VALUES
(
	(SELECT artist_id FROM Artists WHERE name = 'Кино'),
	(SELECT genre_id FROM Genres WHERE name = 'Русский рок')
),
(
	(SELECT artist_id FROM Artists WHERE name = 'ДДТ'),
	(SELECT genre_id FROM Genres WHERE name = 'Классический рок')
),
(
	(SELECT artist_id FROM Artists WHERE name = 'Виктор Цой'),
	(SELECT genre_id FROM Genres WHERE name = 'Русский рок')),
(
	(SELECT artist_id FROM Artists WHERE name = 'Сергей Лазарев'),
	(SELECT genre_id FROM Genres WHERE name = 'Поп-музыка')
),
(
	(SELECT artist_id FROM Artists WHERE name = 'Михаил Круг'),
	(SELECT genre_id FROM Genres WHERE name = 'Шансон')
),
(
	(SELECT artist_id FROM Artists WHERE name = 'Ночные Снайперы'),
	(SELECT genre_id FROM Genres WHERE name = 'Русский рок')
),
(
	(SELECT artist_id FROM Artists WHERE name = 'Стас Михайлов'),
	(SELECT genre_id FROM Genres WHERE name = 'Шансон')
);

-- связи исполнители и альбомы
INSERT INTO Album_Artist(album_id, artist_id)
VALUES
(
	(SELECT album_id FROM Albums WHERE title = 'Группа крови'),
	(SELECT artist_id FROM Artists WHERE name = 'Кино')
),
(
	(SELECT album_id FROM Albums WHERE title = 'Что такое осень?'),
	(SELECT artist_id FROM Artists WHERE name = 'ДДТ')
),
(
	(SELECT album_id FROM Albums WHERE title = 'Нашествие'),
	(SELECT artist_id FROM Artists WHERE name = 'Виктор Цой')
),
(
	(SELECT album_id FROM Albums WHERE title = 'Мир без войны'),
	(SELECT artist_id FROM Artists WHERE name = 'Сергей Лазарев')
),
(
	(SELECT album_id FROM Albums WHERE title = 'Горький мёд'),
	(SELECT artist_id FROM Artists WHERE name = 'Михаил Круг')
),
(
	(SELECT album_id FROM Albums WHERE title = 'Без меня'),
	(SELECT artist_id FROM Artists WHERE name = 'Ночные Снайперы')
),
(
	(SELECT album_id FROM Albums WHERE title = 'Жизнь удалась'),
	(SELECT artist_id FROM Artists WHERE name = 'Стас Михайлов')
);

-- связи сборники и треки
INSERT INTO Playlist_Track(playlist_id, track_id)
VALUES
(
	(SELECT playlist_id FROM Playlists WHERE title = 'Лучшая классика русского рока'),
	(SELECT track_id FROM Tracks WHERE title = 'Группа крови')
),
(
	(SELECT playlist_id FROM Playlists WHERE title = 'Русская попса'),
	(SELECT track_id FROM Tracks WHERE title = 'Моя Москва')
),
(
	(SELECT playlist_id FROM Playlists WHERE title = 'Шансон хит-парад'),
	(SELECT track_id FROM Tracks WHERE title = 'Буду пьяным')
),
(
	(SELECT playlist_id FROM Playlists WHERE title = 'Лучший шансон 2019'),
	(SELECT track_id FROM Tracks WHERE title = 'Осень')
);