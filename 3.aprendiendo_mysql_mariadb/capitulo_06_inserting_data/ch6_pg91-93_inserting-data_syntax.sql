
USE `test`;

DROP TABLE IF EXISTS `books_s`;

CREATE TABLE `books_s` (
  `title` text,
  `author` text,
  `year` text DEFAULT '2021'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO books_s
VALUES('The Big Sleep', 'Raymond Chandler', '1934');

INSERT INTO books_s
VALUES('The Thirty-Nine Steps', 'John Buchan', DEFAULT);

INSERT INTO books_s
(author, title)
VALUES('Evelyn Waugh','Brideshead Revisited');

INSERT INTO books_s
(title, author, year)
VALUES('Visitation of Spirits','Randall Kenan','1989'),
 ('Heart of Darkness','Joseph Conrad','1902'),
 ('The Idiot','Fyodor Dostoevsky','1871');
