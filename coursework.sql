/*
БД представляет собой информацию о пользователях, курсах, вакансиях предлагаемых для пользователей.
позволяет просматривать информацию о пользователях, хранит их сообщения, отклики на вакансии и кто на каких курсах обучается.
 */



DROP DATABASE IF EXISTS geekbrains;
CREATE DATABASE geekbrains;

USE geekbrains;


DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY, -- SERIAL == BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(80) UNIQUE,
    password_hash VARCHAR(120),
    phone BIGINT UNSIGNED DEFAULT NULL UNIQUE
);

DROP TABLE IF EXISTS profiles; 
CREATE TABLE profiles (
    user_id BIGINT UNSIGNED NOT NULL UNIQUE,
    gender CHAR(1),
    birthday DATE,
    hometown VARCHAR(100),
    created_at DATETIME DEFAULT NOW(),
    completed_the_course BIT DEFAULT 0, 
    
    FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    id SERIAL PRIMARY KEY, -- SERIAL == BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    user_id BIGINT UNSIGNED NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id)
);


DROP TABLE IF EXISTS profession; -- направления обучения
CREATE TABLE profession (
    id SERIAL,
    name_proffesion VARCHAR(50)
);

DROP TABLE IF EXISTS courses; -- курсы
CREATE TABLE courses (
    id SERIAL,
    profession_id BIGINT UNSIGNED NOT NULL,
    teacher_id BIGINT UNSIGNED NOT NULL,
    name_profession VARCHAR(50),
    price Decimal(10, 2) DEFAULT NULL,
    
    FOREIGN KEY (profession_id) REFERENCES profession(id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);


INSERT INTO users (firstname, lastname, email, password_hash, phone)
VALUES 
    ('Игорь','Иванов', 'ivan_igor12@mail.ru', '23EC81D2B9D34EB942D92B2E3B8F3B8F', '89653214988'),
    ('Агрипина','Нестерова', 'antigripin@gmail.com', '08D7F233AAA6BAB165934FFFCC9025BD', '89991223554'),
    ('Рустам','Абрагимов', 'russ_abr@mail.ru', '7BF270CC13B967808F2E2DACF177840C', '89654569982'),
    ('Рей','Далио', 'r_d22@gmail.com', '57EEEDFBA0CBC52BBAFAAE7505F43389', '3001506632'),
    ('Тихомир','Богданов', 'good_and_bad@ya.ru', 'A8F5F167F44F4964E6C998DEE827110C', '89814563321'),
    ('Борис','Смирнов', 'humster@mail.ru', '912EC803B2CE49E4A541068D495AB570', '89002589631'),
    ('Надежда','Окунева', 'fish_only@mail.ru', 'EB89F40DA6A539DD1B1776E522459763', '89526663214'),
    ('Тринити','Тейлор', 'kawa_ninja600@mail.ru', 'DDD9077EC23A2A2F7AD9AB72953A7D37', '89656583210'),
    ('Алан','Стюарт', 'excalibur2020@gmail.com', 'BFF149A0B87F5B0E00D9DD364E9DDAA0', '89009014523'),
    ('Глэдисс','Джонс', 'ds_gladiss@gmail.com', 'AC6D8EAD4A2BAFEB6B6D35DBA1E27B02', '89121124578'),
    ('Александр','Петров', 'petrov_alek@mail.ru', 'F9EF721F7854A65CD7CB02E69772687B', '03364075077'),
    ('Надежда','Архипова', 'hope_brains@gmail.com', '37A318D29459CE64C7EF33EDB97ECCA7', '91906042335'),
    ('Андрей','Воронин', 'bird_andry@mail.ru', '428577323F162219F0AEFB8C4417EF78', '20666101842'),
    ('Дарья','Цветкова', 'flowers_d@gmail.com', 'C09C12FAEE068C8E7D32A5935E39B5D8', '39750917679'),
    ('Даниил','Карпов', 'karpov_d@ya.ru', '6F9A6AA7463EB673A08423325A6FB584', '910956273797')
;


INSERT INTO profiles (user_id, gender, birthday, hometown)
VALUES 
    (1,'m', '1980-05-12', 'Санкт-Петербург'),
    (2,'f', '2000-04-23', 'Афины'),
    (3,'m', '1995-02-01', 'Грозный'),
    (4,'m', '1980-05-22', 'Лас Вегас'),
    (5,'m', '2000-01-31', 'Казань'),
    (6,'m', '1999-12-30', 'Москва'),
    (7,'f', '2002-02-06', 'Санкт-Петербург'),
    (8,'f', '1989-11-05', 'Нью Йорк'),
    (9,'m', '2001-08-03', 'Лондон'),
    (10,'m', '1996-09-22', 'Нью Йорк'),
    (11,'m', '1999-03-22', 'Екатеринбург'),
    (12,'f', '2002-06-26', 'Хабаровск'),
    (13,'m', '1991-02-02', 'Новгород'),
    (14,'f', '2001-09-22', 'Новгород'),
    (15,'m', '1993-04-26', 'Тихвин')
;


INSERT INTO teachers (user_id) 
VALUES 
    (11),
    (12),
    (13),
    (14),
    (15)
;


INSERT INTO profession (name_proffesion)
VALUES 
    ('аналитика'),
    ('менеджмент'),
    ('дизайн'),
    ('мобильная разработка'),
    ('веб-разработка'),
    ('факультеты')
;


INSERT INTO courses (profession_id, teacher_id, name_profession, price)
VALUES 
    (1, 1,'веб-аналитик', 95000),
    (1, 1, 'продуктовая аналитика', 95000),
    (3, 2, 'веб-дизайн', 102000),
    (3, 2, 'графический дизайн', 54000),
    (2, 3, 'директор по продажам', 180000),
    (2, 3, 'менеджер по продажам', 70000),
    (4, 4, 'программист IOS', 72000),
    (5, 5, 'веб-разработчик', 97500),
    (6, 5, 'Факультет Python разработки', 195900),
    (6, 4, 'Факульет IOS разработки', 210540)
;


DROP TABLE IF EXISTS user_courses;
CREATE TABLE user_courses (
    courses_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    
    FOREIGN KEY (courses_id) REFERENCES courses(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


INSERT INTO user_courses 
VALUES 
    (9, 1),
    (9, 2),
    (9, 10),
    (10, 1),
    (10, 3),
    (1, 5),
    (2, 4),
    (3, 6),
    (4, 7),
    (5, 8)
;

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
    id SERIAL,
    from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    body TEXT,
    
    INDEX messages_from_user_id (from_user_id),
    INDEX messages_to_user_id (to_user_id),
    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (to_user_id) REFERENCES users(id)
);

ALTER TABLE messages 
ADD CHECK(from_user_id <> to_user_id);

INSERT INTO messages (from_user_id, to_user_id, body)
VALUES 
    (1, 2, 'Проверка связи. Прием!!!'),
    (3, 11, 'Добрый день. У меня есть вопрос по ДЗ, можете подсказать??'),
    (1, 2, 'Прием. Проверка связи!!!'),
    (11, 3, 'Добрый. Да конечно задавайте свой вопрос.'),
    (5, 4, 'Привет. Как курсовая поживает, сделал? или откладываешь как всегда на последний день?'),
    (4, 5, 'Здарова. Уже почти доделал!'),
    (14, 6, 'Здравствуйте я веду курс Программист IOS, если будут вопросы завадайте, с радостью отвечу.'),
    (7, 15, 'Здравствуйте. Не успел вовремя сдать ДЗ, как я могу его сдать?'),
    (15, 7, 'Добрый вечер. Напишите в техподдержку и сошлитесь на это сообщение.'),
    (9, 13, 'Прием. Проверка связи!!!')
;


DROP TABLE IF EXISTS careers;
CREATE TABLE careers (
    id SERIAL,
    company_name VARCHAR(70)
);

DROP TABLE IF EXISTS vacancies;
CREATE TABLE vacancies (
    id SERIAL,
    career_id BIGINT UNSIGNED NOT NULL,
    vacancy VARCHAR(100),
    description TEXT,
    
    FOREIGN KEY (career_id) REFERENCES careers(id)
);


DROP TABLE IF EXISTS responses;
CREATE TABLE responses (
    id SERIAL,
    user_id BIGINT UNSIGNED NOT NULL,
    vacancy_id BIGINT UNSIGNED NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (vacancy_id) REFERENCES vacancies(id)
);


UPDATE profiles SET completed_the_course = 1 WHERE user_id BETWEEN 11 AND 15;

CREATE VIEW completed_course AS SELECT u.firstname, u.lastname FROM users u JOIN profiles p ON u.id = p.user_id WHERE p.completed_the_course = 1;
SELECT * FROM completed_course;


INSERT INTO careers (company_name)
VALUES 
    ('Бублик'),
    ('ТехЛб'),
    ('СпортИнв'),
    ('DevOl'),
    ('DevGame'),
    ('FrontSide'),
    ('Байки'),
    ('Фарма'),
    ('Банк&Брокер')
;

INSERT INTO vacancies (career_id, description)
VALUES 
    (1,'Требуется FullStack Python разработчик.'),
    (2, 'В команду нужен сильный IOS разработчик.'),
    (3, 'Требуется менеджер по продажам'),
    (4, 'Ищем backend Python разработчика.'),
    (5, 'Нужен IOS разрабочтик для мобильных приложений.'),
    (6, 'Требуется Frontend разработчик'),
    (7, 'Нужен директор по продажам!'),
    (8, 'Ищем backend Python разработчика.'),
    (9, 'Ищем опытного продуктового аналитика')
;

INSERT INTO responses (vacancy_id, user_id)
VALUES 
    (1, 1),
    (1, 2),
    (1, 10),
    (8, 1),
    (9, 4),
    (5, 1),
    (5, 3),
    (7, 8),
    (2, 1),
    (6, 6)
;


/*
-- на каком курсе ученики
SELECT us.id, concat(us.firstname, ' ', us.lastname) AS ученик, c.name_profession AS 'курс' FROM users us
JOIN user_courses uc ON us.id = uc.user_id
JOIN courses c ON c.id = uc.courses_id;


-- преподователи на курсах
SELECT concat(u.firstname,' ', u.lastname) AS 'преподаватель', c.name_profession AS 'курс' FROM users u
JOIN teachers t ON u.id = t.user_id
JOIN courses c ON t.id = c.teacher_id;



-- Процедура добавления пользователя в таблицы USERS и PROFILES.

DROP PROCEDURE IF EXISTS add_user;

DELIMITER //

CREATE PROCEDURE add_user (
    firstname varchar(100), 
    lastname varchar(100), 
    email varchar(100), 
    password_hash VARCHAR(120),
    phone varchar(12),
    gender CHAR(1),
    birthday DATE,
    hometown VARCHAR(100), OUT out_result varchar(200))
BEGIN
    DECLARE `_rollback` BOOL DEFAULT 0;
   	DECLARE code varchar(100);
   	DECLARE error_string varchar(100);
    DECLARE last_user_id int;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    begin
    	SET `_rollback` = 1;
    
	    GET stacked DIAGNOSTICS CONDITION 1
            code = RETURNED_SQLSTATE, error_string = MESSAGE_TEXT;
           
    	set out_result = concat('Error :', code, '. Text: ', error_string);
    end;
		        
    START TRANSACTION;
		INSERT INTO users (firstname, lastname, email, password_hash, phone)
		    VALUES (firstname, lastname, email, password_hash, phone);
	
		INSERT INTO profiles (user_id, gender, birthday, hometown)
		     VALUES (last_insert_id(), gender, birthday, hometown); 
	
	    IF `_rollback` = 1 THEN
	        ROLLBACK;
	    ELSE
		    set out_result = 'ok';
	        COMMIT;
	    END IF;
END//

DELIMITER ;


CALL add_user('Олег', 'Тихонов', 'email@mail.ru', '3SG46GHS244ZFGBFH6456D', '89456226587', 'm', '2000-12-06', 'Москва', @out_result);
SELECT @out_result;

DROP VIEW IF EXISTS user_data;
CREATE VIEW user_data AS 
    SELECT u.id, CONCAT(u.firstname, ' ', u.lastname) AS name, p.gender, p.birthday, p.hometown, u.phone FROM users u
    JOIN profiles p ON u.id = user_id 
    ORDER BY id DESC;

SELECT * FROM user_data;


SELECT * FROM profiles
ORDER BY user_id DESC;

-- количество откликов на вакансию

DROP VIEW IF EXISTS responses_count; 
CREATE VIEW responses_count AS SELECT count(id) AS count FROM responses WHERE user_id = 1;
SELECT * FROM responses_count;
*/
