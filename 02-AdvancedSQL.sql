SELECT dept_no, count(emp_no) from dept_emp group by dept_no;
-- her bir dept_no degeri icin tabloya o dept_no'nun kendisini ve o dept_no'nun kac adet emp_no'ya sahip oldugunu yazdir.

SELECT birth_date, count(emp_no) from "public"."employees" group by birth_date HAVING EXTRACT(YEAR from birth_date)>1964 order by birth_date;
-- HAVING ise GROUP BY ile kullanilan bir filtreleme islemidir.

SELECT birth_date, gender, count(emp_no) from "public"."employees" group by birth_date, gender HAVING EXTRACT(YEAR from birth_date)>1964 order by birth_date;
-- GROUP BY'a gender'i da ekledik. Filtreleme islemi bu sekilde parametrelere de bölünebilir. Burada "birth_date yili 1964ten fazla olanlari, erkek ve kadin olarak ayirmis olduk."

SELECT count(emp_no), first_name FROM employees group by first_name
union ALL
SELECT count(emp_no), last_name from employees group by last_name;
-- UNION, tablolari alt alta birlestirir, yanina ALL eklersek kendini tekrar eden degerleri de yazdirir.

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
