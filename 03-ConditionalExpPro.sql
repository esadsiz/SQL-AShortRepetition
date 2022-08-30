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

--
--
--

--
