-- CREATE TABLE

CREATE TABLE account
-- tablo ismi 'account'
(user_id SERIAL PRIMARY KEY,
-- bu sayede tabloya eklenen her yeni satirda bu id 3,4,5,6 seklinde artarak gider.
-- bir tabloda sadece ve sadece bir adet PRIMARY KEY olabilir
username VARCHAR(50) UNIQUE not NULL,
-- VARCHAR metinsel alan demek, 50 ise sahip olacagi maximum karakter sayisi demektir.
-- Bir de CHAR(10) vardir, bu da degerin örnegin tam olarak 10 karakterden olusmasi gerektigini belirtir. 
-- UNIQUE ayni degere sadece bir kez sahip olabilir.
-- NOT NULL bos birakilamaz.
PASSWORD VARCHAR(50) not null,
email VARCHAR(50) UNIQUE not NULL,
created_on TIMESTAMP not NULL,
-- TIMESTAMP zaman damgasi tipidir.
last_login TIMESTAMP
);

CREATE TABLE job(
    job_id SERIAL PRIMARY KEY,
    job_name VARCHAR(50) UNIQUE not NULL
);

CREATE TABLE account_job(
    user_id INTEGER REFERENCES account(user_id),
    job_id INTEGER REFERENCES job(job_id),
    hire_date TIMESTAMP
)

--
--
--

-- INSERT

INSERT INTO account(username, password, email, created_on)
VALUES ('Enes', 'enes123', 'enes@mail.com', current_timestamp)

INSERT INTO account_job(user_id, job_id, hire_date)
VALUES (1, 1, current_timestamp)

--
--
--

-- UPDATE

UPDATE account SET last_login = CURRENT_TIMESTAMP;

UPDATE account SET last_login = CURRENT_TIMESTAMP RETURNING last_login;

--
--
--

-- DELETE

DELETE FROM account WHERE username = 'enes';

--
--
--

-- ALTER

ALTER TABLE information RENAME TO new_info;
ALTER TABLE information RENAME COLUMN person TO personal;
