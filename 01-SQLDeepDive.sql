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

SELECT coalesce(firstname, 'no firstname available'), lastname from "public"."customers";
/* coalesce firsname sütunundaki null degerleri yakalar ve yerlerine null degeri yerine 2. parametrede yazili mesaji bastirir.' */

--
--
--

SELECT SUM(COALESCE(age, 50)) FROM customers;
/* coalesce age sütunundaki null degerleri yakalar ve degerlerini 50 ile degistirir, ardindan bunlar sum ile toplanir. */
-- ayrica AVG(), COUNT(), MAX(), MIN() gibi foksiyonlar da mevcuttur.

SELECT MIN(emp_no) FROM employees;
/* employees tablosunun emp_no sütununun sahip oldugu minimum degeri tek satir tek sütun tablo seklinde yazdirir. */

SELECT MAX(emp_no) FROM employees;
/* employees tablosunun emp_no sütununun sahip oldugu maximum degeri tek satir tek sütun tablo seklinde yazdirir. */

SELECT SUM(salary) FROM salaries;
/* salaries tablosunun salary sütununun sahip oldugu tüm degeleri toplar, tek satir tek sütun tablo seklinde yazdirir. */

SELECT COUNT(emp_no) FROM employees;
/* employees tablosunun emp_no sütununun tekrarlanan degerlerden kacinarak listeler. yani her value bir kez bastirilir. */
-- COUNT (DISTINCT emp_no) yaparsak, birbirinden farkli kac adet value'ya sahip oldugunu gösterir. 

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

show TIMEZONE;
/* Mevcut timezone'u gösterir.*/

set TIME ZONE 'UTC'; 
/* Yalnizca icinde bulunulan sessionun time zone'unu UTC olarak ayarlar.' */

show TIMEZONE;
/* Mevcut timezone'u gösterir.*/

ALTER USER postgres SET timezone = 'UTC';
/* Gecmis gelecek bütün sessionlarin timezone'unu UTC olarak ayarlar. */

SELECT NOW()::date;
/* her ikisi de simdinin tarihini verir.*/
SELECT CURRENT_DATE;

SELECT TO_CHAR(CURRENT_DATE, 'dd/mm/yyyy');
/* Simdinin tarihini yazili formatta verir. */

SELECT date '12/09/2015';
/* yazili date'i verir */

select AGE(date '26/09/1994');
/* yazili tarihten bugüne kac yil kac ay gectigini verir. */

select AGE(date '26/09/1994', date '01/04/2021');
/* yazili tarihler arasi kac yil kac ay gectigini verir. */

select EXTRACT(day from date '26/09/1994'); /* MONTH, YEAR */
/* yazili tarihin gününü verir. */

select DATE_TRUNC('year', date '26/09/1994'); /* month, day */
/* yazili tarihin yili sabit kalir, ayi ve günü asagiya yuvarlanir. (01/01/1994) */

SELECT EXTRACT (year from interval '6 years 45 months'); /* month, day */
/* yazili zamana bakar, der ki 6 yil 45 ay 9 yil demektir, 9 bastirir. */

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
/* employees tablosundan emp_no sütununu, salaries tablosundan salary sütununu al, "emp_no'lari ayni olduklari noktalarda bunlari bulustur, employees tablosunun emp_no sütununu baz alarak kücükten büyüge sirala." */
/* BURADA AMAC, FARKLI TABLOLARDA AYNI emp_no'YA SAHIP VERILERi BULUSTURMAK */

/* DAHA IYI BIR YOL */

SELECT employees.emp_no, salaries.salary, salaries.from_date, titles.title FROM employees
INNER JOIN salaries ON salaries.emp_no = employees.emp_no
INNEr JOIN titles ON titles.emp_no = employees.emp_no and titles.from_date = salaries.from_date
order by employees.emp_no ASC;
/* employees tablosundan emp_no sütununu,
   salaries tablosundan salary sütununu 
   titles tablosunda title sütununu al,
salaries'i employees'e bagla, emp_no'larinin ayni olduklari yerden.
ona da titles'i bagla, emp_no'larinin ayni olduklari yerden ve from_date'lerinin ayni olduklari yerden.
bunlari da employees'in emp_no'sunu baz alarak kücükten büyüge sirala." */

/* BURADA AMAC, FARKLI TABLOLARI SAHIP OLDUKLARI ORTAK SÜTUNLARDAN TUTUP BIRBIRINE BAGLAMAK.
YALNIZCA KESISIM NOKTALARINDAN, YANI BAGLANMAK ISTENEN SÜTUNLAR ARASINDA DENK GELMEYEN, ÖRTÜSMEYEN, ORTAK OLMAYAN BIR SATIR VARSA BU SATIR ALINMAZ. */

/* BIR DE LEFT JOIN VE RIGHT JOIN VARDIR,
LEFT JOIN, SOLDAKI TABLONUN DENK GELMEYEN, ÖRTÜSMEYEN SATIRLARINI DA, YANI TAMAMINI ALIR. / SONUNA WHERE sagtablo.key IS NULL EKLERSEK, KESISIMI DAHIL ETMEZ, A'NIN B'DEN FARKINI ALIR.
RIGHT JOIN, SAGDAKI TABLONUN DENK GELMEYEN, ÖRTÜSMEYEN SATIRLARINI DA, YANI TAMAMINI ALIR. / SONUNA WHERE soltablo.key IS NULL EKLERSEK, KESISIMI DAHIL ETMEZ, B'NIN A'DAN FARKINI ALIR.

FULL JOIN ISE HER IKI TABLONUN DA DENK GELMEYEN, ÖRTÜSMEYEN SATIRLARINI ALIR.

AYRICA ON ....emp_no=...emp_no yerine; USING(emp_no) kullanabiliriz. (Bunlari emp_no'larindan birlestirir.)
 */
 
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
