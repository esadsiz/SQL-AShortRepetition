SELECT * from "public"."employees";
/* employees tablosunun tamamini göster. */

SELECT * from "public"."salaries" WHERE "public"."salaries"."emp_no" > 10001;
/* salaries tablosunda emp_no'nun 10001'den fazla oldugu tüm verileri göster. */

SELECT first_name, last_name from "public"."employees" WHERE first_name = 'Mayumi' AND last_name = 'Schueller';
/* employees tablosunda first_name ve last_name sütunlarini bana göster, fakat bu tabloyu first_name'in 'Mayumi', last_name'in 'Schueller' olmasina göre filtrele. */

SELECT emp_no as "Employee #" from "public"."employees";
/* employees tablosundaki "emp_no" sütununun adini "Employee #" olarak degistir. */

SELECT emp_no as "Employee #", birth_date as "Birthday", first_name as "First Name" from "public"."employees";
/* employees tablosundaki emp_no sütununun adini "Employee #", 
                          birth_date sütununun adini "Birthday",
                          first_name sütununun adini "First Name" olarak yazdir. */
                          
SELECT DISTINCT rental_rate from film;
/* film tablosundaki "rental_rate" sütununu kendini tekrar eden bir value olmadan göster. */

SELECT rental_rate from film LIMIT 5;
/* Listelenecek tablonun satir sayisini 5 olarak limitler. */

SELECT CONCAT(emp_no, ' is a ', title) as "Employee Title" from "public"."titles";
/* titles tablosundaki her bir satir icin, emp_no ve title sütunlarindaki degerleri alir ve parantez icinde yazili cümleyi satir satir tablo seklinde yazdirir,
olusturulan bu yeni tablonun adini da "Employee Title" koyar */

SELECT emp_no, CONCAT(emp_no, ' is a ', title) as "Employee Title" from "public"."titles";
/* Bu ise ilk sütun olarak emp_no sütununu belirler, ikinci sütun olarak yanina Employee Title isimli sütunu yerlestirir. */



SELECT first_name, last_name from "public"."employees"
WHERE (first_name = 'Mayumi' AND last_name = 'Schueller')
or (first_name = 'Bezalel' AND last_name = 'Simmel');
/* employees tablosunda first_name ve last_name sütunlarini bana göster, fakat bu tabloyu first_name'in 'Mayumi', last_name'in 'Schueller' olmasina;
ayrica first_name'in 'Bezalel', last_name'in 'Simmel' olmasina göre filtrele. */

SELECT * from "public"."customers" WHERE gender = 'F' and state = 'OR' or gender = 'F' and state = 'NY';
/* Bu iki komut ayni calisir. */
SELECT * from "public"."customers" WHERE (state = 'OR' or state = 'NY') and gender = 'F'; 

SELECT * from "public"."customers" WHERE not age = 55;
/* customers tablosundaki age degeri 55 olmayanlari listeler. */

SELECT * FROM "public"."customers" where age is not null; /* NULL / TRUE / FALSE */
/* customers tablosundaki age degeri NULL olmayanlari listeler. */

--
--
--

SELECT MIN(emp_no) FROM employees;
/* employees tablosunun emp_no sütununun sahip oldugu minimum degeri tek satir tek sütun tablo seklinde yazdirir. */
-- ayrica AVG(), COUNT(), MAX(), MIN() gibi foksiyonlar da mevcuttur.

SELECT MAX(emp_no) FROM employees;
/* employees tablosunun emp_no sütununun sahip oldugu maximum degeri tek satir tek sütun tablo seklinde yazdirir. */

SELECT SUM(salary) FROM salaries;
/* salaries tablosunun salary sütununun sahip oldugu tüm degeleri toplar, tek satir tek sütun tablo seklinde yazdirir. */

SELECT COUNT(emp_no) FROM employees;
/* employees tablosunun emp_no sütununun tekrarlanan degerlerden kacinarak listeler. yani her value bir kez bastirilir. */
-- COUNT (DISTINCT emp_no) yaparsak, birbirinden farkli kac adet value'ya sahip oldugunu gösterir.

-- Bunlarin basina ROUND getirirsek de, örnegin ROUND(SUM(salary)), virgülden sonraki değer 5 ten küçükse asagiya;
-- 5 ve 5 ten büyükse; yukariya yuvarlanır. ROUND(sayi, 2) ise, virgülden sonra kac basamagin var olacagini belirler.

--
--
--

SELECT * FROM "public"."customers" WHERE age BETWEEN 55 AND 66;
/* customers tablosundaki age degeri 55 ile 66 arasinda (dahil) olanlari listeler. */
-- BETWEEN'den önce NOT da eklenebilir.

SELECT * FROM "public"."customers" WHERE age IN (55, 66, 77, 88);
/* customers tablosundaki age degeri 55, 66, 77, 88 olanlari listeler. */
-- IN'den önce NOT da eklenebilir.

SELECT * FROM "public"."customers" WHERE firstname LIKE 'M%';
/* '%M', '%M%', '_MA%', 'M_%_%' (M ile baslayan ve en az üc basamaga sahip),
'M_____T' (M ile baslayan T ile biten 7 harfli) (LIKE yerine ILIKE yazarsak büyük kücük harf önemsemeden arar.)*/
/* customers tablosundaki firstname degeri M ile baslayanlari listeler. */
-- LIKE'dan önce NOT da eklenebilir.

--
--
--

SELECT first_name, last_name FROM employees ORDER BY first_name;
/* employees tablosundaki first_name ve last_name'i alir, first_name'in alfabetik sirasina göre siralar. */

SELECT first_name, last_name FROM employees ORDER BY first_name, last_name;
/* böyle yaparsak her iki sütunu da kendi icinde alfabetik siraya göre siralar. */

SELECT first_name, last_name FROM employees ORDER BY first_name ASC, last_name DESC;
/* employees tablosundaki first_name ve last_name'i alir, first_name'i alfabetik siraya, last_name'i alfabetik siranin tersine göre siralar. */

SELECT first_name, last_name FROM employees ORDER BY length(first_name);
/* employees tablosundaki first_name ve last_name'i alir, first_name'deki value'larin uzunluklarina göre (azdan coka) siralar. */

SELECT employees.emp_no, salaries.salary FROM employees, salaries WHERE employees.emp_no = salaries.emp_no ORDER BY employees.emp_no;
/* employees tablosundan emp_no sütununu, salaries tablosundan salary sütununu al, "emp_no'lari ayni olduklari noktalarda bunlari bulustur,
   employees tablosunun emp_no sütununu baz alarak kücükten büyüge sirala." */
/* BURADA AMAC, FARKLI TABLOLARDA AYNI emp_no'YA SAHIP VERILERi BULUSTURMAK */

/* DAHA IYI BIR YOL */

--
--
--
--
--

-- JOINS --
SELECT employees.emp_no, salaries.salary, salaries.from_date, titles.title FROM employees
INNER JOIN salaries ON salaries.emp_no = employees.emp_no
INNER JOIN titles ON titles.emp_no = employees.emp_no AND titles.from_date = salaries.from_date
ORDER BY employees.emp_no ASC;
/* salaries'i employees'e bagla, emp_no'larinin ayni olduklari yerden.
ona da titles'i bagla, emp_no'larinin ayni olduklari yerden ve from_date'lerinin ayni olduklari yerden.
bunlari da employees'in emp_no'sunu baz alarak kücükten büyüge sirala." */

/* BURADA AMAC, FARKLI TABLOLARI SAHIP OLDUKLARI ORTAK SÜTUNLARIN ESLESEN DEGERLERINDEN YAKALAYIP BIRBIRINE BAGLAMAK.
YALNIZCA ESLESEN NOKTALARINDAN. YANI BAGLANMAK ISTENEN SÜTUNLAR ARASINDA DENK GELMEYEN, ÖRTÜSMEYEN, ORTAK OLMAYAN BIR SATIR VARSA BU SATIR ALINMAZ. */

-- BU HER IKI TABLONUN DA TAMAMINI ALIR.
SELECT * from customer FULL OUTER JOIN payment USING(customer_id);

-- BU, HER IKI TABLONUN DA DENK GELMEYEN, ÖRTÜSMEYEN SATIRLARINI ALIR.
SELECT * from customer FULL OUTER JOIN payment USING(customer_id) where customer_id is null or payment_id is null;

-- AYRICA GÖRÜLDÜGÜ GIBI ON ....emp_no=...emp_no yerine; USING(emp_no) kullanabiliriz. (Tablolari emp_no'larindan birlestirir.)

/* BIR DE LEFT JOIN VE RIGHT JOIN VARDIR,
LEFT JOIN, SOLDAKI TABLONUN DENK GELMEYEN, ÖRTÜSMEYEN SATIRLARINI DA, YANI TAMAMINI ALIR. / SONUNA WHERE sagtablo.key IS NULL EKLERSEK, KESISIMI DAHIL ETMEZ, A'NIN B'DEN FARKINI ALIR.
RIGHT JOIN, SAGDAKI TABLONUN DENK GELMEYEN, ÖRTÜSMEYEN SATIRLARINI DA, YANI TAMAMINI ALIR. / SONUNA WHERE soltablo.key IS NULL EKLERSEK, KESISIMI DAHIL ETMEZ, B'NIN A'DAN FARKINI ALIR. */
 
 --
 --
 --
 
 create table "A" (id INT);
 create table "B" (id INT);
 
 insert into "A" values (1);
 insert into "A" values (2);
 insert into "A" values (3);
 
 insert into "B" values (1);
 insert into "B" values (2);
 
 SELECT * FROM "A" cross join "B";
 /* A tablosunun her bir satiri icin B tablosunun tamamini yazdir, bunlari da yanyana birlestir.
 Yani ilk sütun 112233 seklinde giderken, buna karsilik öteki tablo 121212 seklinde gider. */
 
 SELECT *, max(salary) over() from salaries limit 100;
-- OVER() ile normalde tek satirdan olusan max(salary) tablomuzu her satira dagittik.
-- LIMIT 100 ile tablonun satir limitini 100 olarak belirledik.

--
--
--
--
--

-- UNION --
SELECT COUNT(emp_no), first_name FROM employees GROUP BY first_name
UNION ALL
SELECT COUNT(emp_no), last_name FROM employees GROUP BY last_name;
-- UNION, tablolari alt alta birlestirir, alta gelecek tabloyu üste baglarken yalnizca farkli olan satirlari alinir.
-- Yanina ALL eklersek ise kendini tekrar eden degerleri de yazdirir.
-- Satün sayilarinin ayni olmasi sarti vardir.

--
--
--
--
--

SHOW TIMEZONE;
/* Mevcut timezone'u gösterir.*/

set TIME ZONE 'UTC'; 
/* Yalnizca icinde bulunulan sessionun time zone'unu UTC olarak ayarlar.' */

ALTER USER postgres SET timezone = 'UTC';
/* Gecmis gelecek bütün sessionlarin timezone'unu UTC olarak ayarlar. */

SELECT NOW();
-- Simdiyi verir. Günüyle, ayiyla, yiliyla, saatiyle, ...

SELECT TIMEOFDAY();
-- Simdiyi verir. Günüyle, ayiyla, yiliyla, saatiyle, ... ; fakat Sali, Mart 19 seklinde.

SELECT CURRENT_TIME;
-- Simdinin saatini dakikasini saniyesini ve salisesini verir.

SELECT NOW()::date;
/* her ikisi de simdinin tarihini verir.*/
SELECT CURRENT_DATE;

SELECT TO_CHAR(CURRENT_DATE, 'dd/mm/yyyy');
/* Simdinin tarihini yazili formatta verir. */
-- 'dd/mm/yyyy' yerine 'MONTH-YYYY' de yazilabilir. 

SELECT date '12/09/2015';
/* yazili date'i verir */

select AGE(date '26/09/1994');
/* yazili tarihten bugüne kac yil kac ay gectigini verir. */

select AGE(date '26/09/1994', date '01/04/2021');
/* yazili tarihler arasi kac yil kac ay gectigini verir. */

select EXTRACT(day from date '26/09/1994'); /* MONTH, YEAR, QUARTER (kacinci ceyrekte oldugu.) */
/* yazili tarihin gününü verir. */

select * from payment where EXTRACT(dow from payment_date)= 1;
-- yazili tarihin gününü 7'ye böler, böylece 1 sorgusunu yaparak Pazartesi filtresi yapabiliriz.

select DATE_TRUNC('year', date '26/09/1994'); /* month, day */
/* yazili tarihin yili sabit kalir, ayi ve günü asagiya yuvarlanir. (01/01/1994) */

SELECT EXTRACT (year from interval '6 years 45 months'); /* month, day */
/* yazili zamana bakar, der ki 6 yil 45 ay 9 yil demektir, 9 bastirir. */

--
--
--

SELECT rental_rate/replacement_cost FROM film;
-- sütun degerlerini birbirine böler. (* + - da kullanilabilir.)

SELECT UPPER(first_name) || '' || LOWER(last_name) FROM customer;
-- sütundaki degerleri alir, tek bir sütunda yanyana koyar, yani birlestirir.
-- upper, string degeri büyük harfle yazdirir.
-- lower, string degeri kücük harfliye cevirir.

SELECT LEFT(first_name, 1) || '' || last_name FROM customer;
-- upper, string degerin yalnizca soldan ilk(1,2,3) basamagini alir.
-- Bir de RIGHT vardir, o da ayni seyi sagdan yapar.
-- LEN(first_name) ise sütundaki degerlerin karakter sayisini tablolar.
-- TRIM(first_name) sütundaki degerlerin (varsa) baslarindaki ve sonlarindaki fazlalik bosluklari kaldirir.
-- LTRIM degerin solundaki, RTRIM degerin sagindaki bosluklari kaldirir.
-- REVERSE(first_name) sütundaki degerleri tersten yazdirir.
-- CHARINDEX('e', first_name, 2) e'nin (ya da herhangi bir kelimenin), söz konusu degerin 2. basamagindan itibaren kacinci sirada oldugunu yazdirir.
-- REPLACE(first_name, ' ', '_') söz konusu degerin icindeki bosluklari alt cizgi ile degistir.
-- SUBSTRING(first_name, 1, 5) söz konusu degeri, 1. karakterden itibaren 5. karakterine kadar alir, gerisini atar.
-- ASCII('A') Büyük A'nin ASCII karsiligini bastirir.
-- CHAR(65) Icerisine yazili ASCII numarasinin harf karsiligini verir.

--
--
--

-- GROUP BY

SELECT dept_no, COUNT(emp_no) FROM dept_emp GROUP BY dept_no;
-- her bir dept_no degeri icin tabloya o dept_no'nun kendisini ve karsisina o dept_no'nun kac adet emp_no'ya sahip oldugunu yazdirir.
-- Burada, yazili count fonksiyonu her dept_no grubu(cinsi) icin ayri calisir. SUM(), AVG() COUNT() AGG() fonksiyonlari ile de kullanilabilir.

SELECT birth_date, COUNT(emp_no) FROM "public"."employees" GROUP BY birth_date HAVING EXTRACT(YEAR FROM birth_date)>1964 ORDER BY birth_date;
-- HAVING ise GROUP BY ile kullanilan bir filtreleme islemidir.

SELECT birth_date, gender, count(emp_no) from "public"."employees" group by birth_date, gender HAVING EXTRACT(YEAR from birth_date)>1964 order by birth_date;
-- GROUP BY'a gender'i da ekledik. Filtreleme islemi bu sekilde parametrelere de bölünebilir. Burada "birth_date yili 1964ten fazla olanlari, erkek ve kadin olarak ayirmis olduk."

SELECT count(emp_no), first_name, last_name FROM employees group by grouping sets(first_name, last_name);
-- GROUPING SETS'i pek anlayamadim, ama burada iki farkli tabloyu yukaridaki gibi uzun uzun yazmaksizin bu sekilde yanyana bagladik.

SELECT EXTRACT(year from birth_date),
       EXTRACT(MONTH from birth_date),
       EXTRACT(DAY from birth_date),
       count(emp_no)
from "employees"
group by
    ROLLUP (
        EXTRACT(year from birth_date),
        EXTRACT(MONTH from birth_date),
        EXTRACT(DAY from birth_date)
) order by
        EXTRACT(year from birth_date),
        EXTRACT(MONTH from birth_date),
        EXTRACT(DAY from birth_date)
-- ROLLUP sayesinde sunu yaptik, 1952'den 1965'e kadar her gün icin, o gün toplam kac kisi dogmus, onu listeledik.
-- Günler bitince ay toplamini yazdirdi, aylar bitince yil toplamini yazdirdi.
-- Bir yil bitince de öteki yila gecti. 
