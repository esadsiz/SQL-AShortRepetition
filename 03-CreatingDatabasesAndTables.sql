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
 
-- Sayilar icin INT vardir. Booleanlar icin BIT vardir.
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
    -- Bu user_id sütunu account tablosunun user_id'si ile ayni olmali.
    -- Dolayisiyla account tablosunun user_id sütununu referans al diye belirtiriz.
    job_id INTEGER REFERENCES job(job_id),
    hire_date TIMESTAMP
)
-- Böylece account ve job tablolarindan referans alan account_job adinda araci bir tablo oluşturduk.

Tablo oluştur diyeceğiz.

--
--
--

-- INSERT

INSERT INTO account(username, password, email, created_on)
-- INSERT tabloya yeni bir kayit eklemek icin kullanilir.
-- Hangi tabloya? account tablosuna. Parantez icine de hangi alanlara kayit eklemek istiyorsak onlari yaziyoruz.
VALUES ('Enes', 'enes123', 'enes@mail.com', CURRENT_TIMESTAMP)
-- kayitlara eklenecek degerler de sirasiyla bu sekilde yazilir.

INSERT INTO CustomersWork (CustomerId, CompanyName, ContactName) SELECT CustomerId, CompanyName, ContactName from Customers;
-- Customers tablosunun yazili sütunlarini, CustomersWork tablosunun yazili sütunlarina yerlestir.
-- Komut satirinin sonuna bir de WHERE ContactName LIKE '%en%'; eklersek, sütunun tamamini degil, yalnizca sarta uyan satirlari alip yerlestirir.

INSERT INTO account_job(user_id, job_id, hire_date)
VALUES (1, 1, current_timestamp)
-- account_job isimli referans tablomuzun user_id sütununa, account tablosunun 1 numarali user_id'sini ata.
-- job_id ile de ayni seyi yap. sonra da bunlarin yanina zaman damgasini yapistir. 

--
--
--

-- UPDATE

UPDATE account SET last_login = CURRENT_TIMESTAMP;
-- UPDATE veritabaninda sarta uyan kayitlari güncellemek icin kullanilir.
-- account tablosunun last_login sütununu CURRENT_TIMESTAMP olarak ayarla.
-- burada tüm sütun degisir. daha spesifik olmak icin WHERE komutu ile filtreleme yapabiliriz.

UPDATE Customers SET CompanyName = CustomersWork.CompanyName FROM Customers INNER JOIN CustomersWork USING(CustomerID);
-- Customers tablosunun CompanyName sütununu (komple) degistir. Ne ile? CustomersWork tablosunun CompanyName sütunu ile.
-- Ama bu degisimi Customers tablosu ile CompanyName tablosunun kesisim noktalarini baz alarak yap.
-- Komut satirinin sonuna bir de WHERE CustomersWork.CompanyName LIKE '%TEST%'; eklersek, sadece bu sarta uyan satirlari alir koyar.

UPDATE account SET last_login = CURRENT_TIMESTAMP RETURNING last_login;
-- RETURNING ise yapilan islem sonrasi konsolda görmek istedigimiz yazili sütunlari basar. 

--
--
--

-- DELETE

DELETE FROM account WHERE username = 'enes';
-- DELETE veritabaninda sarta uyan kayitlari silmek icin kullanilir.
-- username'in 'enes' oldugu satiri sil.

DELETE Customers FROM Customers INNER JOIN CustomersWork USING(CustomerID) WHERE CustomersWork.CompanyName LIKE '%TEST%';

--
--
--

-- ALTER

ALTER TABLE information RENAME TO new_info;
-- information tablosunun adini new_info olarak degistir.

ALTER TABLE information RENAME COLUMN person TO people;
-- information tablosunun person sütununun adini people olarak degistir.

ALTER TABLE new_info ALTER COLUMN people DROP NOT NULL;
-- new_info tablosunun people sütunundan NOT NULL kuralini kaldirir.
-- bu islemin tam tersi ise DROP yerine SET yazmaktir.

ALTER TABLE new_info DROP COLUMN;
-- new_info tablosundan people sütununu kaldirir.
-- bu islemin tam tersi ise DROP yerine SET yazmaktir.
-- COLUMN'dan önce IF EXISTS yazarsak, eger mevcutsa demis oluruz.

--
--
--

-- CHECK

CREATE TABLE account
(user_id SERIAL PRIMARY KEY,
username VARCHAR(50) UNIQUE not NULL,
--..
--..
--..
birthdate DATE CHECK (birthdate > '1900-01-01'),
hiredate DATE CHECK (hire_date > birthdate),
salary INTEGER CHECK (salary > 0)     
);
-- CHECK, tablo olustururken sütuna sart getirmek icin kullanilir.
-- Örnegin burada girilecek dogum tarihi 1900-01-01 öncesi olamaz.
-- Maas, negatif sayi olamaz.
