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

SELECT CONCAT(emp_no, ' is a ', title) as "Employee Title" from "public"."titles";
/* titles tablosundaki her bir satir icin, emp_no ve title sütunlarindaki degerleri alir ve parantez icinde yazili cümleyi satir satir tablo seklinde yazdirir,
olusturulan bu yeni tablonun adini da "Employee Title" koyar */

SELECT emp_no, CONCAT(emp_no, ' is a ', title) as "Employee Title" from "public"."titles";
/* Bu ise ilk sütun olarak emp_no sütununu belirler, ikinci sütun olarak yanina Employee Title isimli sütunu yerlestirir. */

SELECT count(emp_no) FROM "public"."employees";
/* employees tablosunun emp_no sütununun kac adet degere sahip oldugunu tek satir tek sütun tablo seklinde yazdirir. */

SELECT min(emp_no) FROM "public"."employees";
/* employees tablosunun emp_no sütununun sahip oldugu minimum degeri tek satir tek sütun tablo seklinde yazdirir. */

SELECT max(emp_no) FROM "public"."employees";
/* employees tablosunun emp_no sütununun sahip oldugu maximum degeri tek satir tek sütun tablo seklinde yazdirir. */

SELECT sum(salary) FROM "public"."salaries";
/* salaries tablosunun salary sütununun sahip oldugu tüm degeleri toplar, tek satir tek sütun tablo seklinde yazdirir. */

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

SELECT sum(coalesce(age, 50)) from "public"."customers";
/* coalesce age sütunundaki null degerleri yakalar ve degerlerini 50 ile degistirir, ardindan bunlar sum ile toplanir. */

SELECT * from "public"."customers" WHERE age BETWEEN 55 and 66;
/* customers tablosundaki age degeri 55 ile 66 arasinda (dahil) olanlari listeler. */

SELECT * from "public"."customers" WHERE age in (55, 66, 77, 88);
/* customers tablosundaki age degeri 55, 66, 77, 88 olanlari listeler. */

SELECT * from "public"."customers" WHERE firstname like 'M%';
/* '%M', '%M%', '_MA%', 'M_%_%' (M ile baslayan ve en az üc basamaga sahip),
'M_____T' (M ile baslayan T ile biten 7 harfli) (LIKE yerine ILIKE yazarsak büyük kücük harf önemsemeden arar.)*/
/* customers tablosundaki firstname degeri M ile baslayanlari listeler. */

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

SELECT DISTINCT age from "public"."customers";
/* customers tablosundaki age sütununu tekrarlanan degerlerden kacinarak listeler. yani her value bir kez bastirilir. */

SELECT first_name, last_name from employees order BY first_name;
/* employees tablosundaki first_name ve last_name'i alir, first_name'in alfabetik sirasina göre siralar. */

SELECT first_name, last_name from employees order BY first_name, last_name;
/* böyle yaparsak her iki sütunu da kendi icinde alfabetik siraya göre siralar. */

SELECT first_name, last_name from employees order BY first_name ASC, last_name DESC;
/* employees tablosundaki first_name ve last_name'i alir, first_name'i alfabetik siraya, last_name'i alfabetik siranin tersine göre siralar. */
