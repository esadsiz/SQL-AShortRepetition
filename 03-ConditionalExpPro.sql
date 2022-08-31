-- CASE

SELECT customer_id,
CASE
       WHEN (customer_id <= 100) THEN 'Premium'
       WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus'
       ELSE 'Normal'
END
FROM customer;

-- Eger customer_id <= 100 ise 'Premium', 100 ile 200 arasindaysa 'Plus', hicbiri degilse 'Normal' yazdir.
-- Nereye? case isimli bir sütuna. customer_id sütununun her bir degeri icin bu sarti kontrol eder ve karsisina
-- Premium, Plus ya da Normal yazdirir.

SELECT customer_id,
CASE customer_id
       WHEN 1 THEN 'Winner'
       WHEN 2 THEN 'Second Place'
       ELSE 'Others'
END
FROM customer;

-- Eger customer_id 1 ise 'Winner', 2 ise 'Second Place', hicbiri degilse 'Others' yazdir.
-- Nereye? case isimli bir sütuna. customer_id sütununun her bir degeri icin bu sarti kontrol eder ve karsisina
-- Winner, Second Place ya da Others yazdirir.

-- CASE'den END'e kadar parantez icine alinip basina senaryoya göre SUM, AVG vs konularak fonksiyona sokulabilir. Bu durumda tabi tek satir tek sütun döndürür.

--
--
--

-- COALESCE

SELECT coalesce(firstname, 'no firstname available'), lastname from "public"."customers";
/* coalesce firsname sütunundaki null degerleri yakalar ve yerlerine null degeri yerine 2. parametrede yazili mesaji bastirir.' */

SELECT SUM(COALESCE(age, 50)) FROM customers;
/* coalesce age sütunundaki null degerleri yakalar ve degerlerini 50 ile degistirir, ardindan bunlar sum ile toplanir. */

--
--
--

-- CAST

SELECT CAST('5' AS INTEGER)
SELECT '10'::INTEGER
-- 5 stringini integer tipine cevirir.

--
--
--

-- NULLIF

SELECT Magaza_Adi, NULLIF (Gercek, Hedef) FROM Satis_Verisi;
-- NULLIF, parantez icerisine yazili iki degeri karsilastirir, aynilar ise NULL yazdirir, degiller ise 1. parametredeki degeri yazdirir.

--
--
--

-- VIEW

-- Create View : Yeni view oluşturmak için kullanılır.
-- Alter View : Daha önceden oluşturulmuş bir view üzerinde değişiklik yapılmak için kullanılır.
-- Drop View : Daha önceden oluşturulmuş bir view i veritabanından silmek için kullanılır.
