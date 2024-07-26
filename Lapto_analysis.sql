CREATE DATABASE Laptop;
USE Laptop;

ALTER TABLE cleaned_laptop_data
rename TO Laptop_data;
SELECT* FROM Laptop_data;

-- 1. Top 10 Expensive laptop of each brand
SELECT Brand, MAX(latest_price) AS Max_price
FROM laptop_data
GROUP BY brand
ORDER BY Max_price DESC
LIMIT 10;

-- 2. TOP 10 chipest laptop of each brand
SELECT Brand, Min(latest_price) as Min_price From laptop_data 
GROUP BY brand
ORDER BY Min_price DESC
LIMIT 10;
 
 
 -- 3. Top 5 laptop with highest rating
select * from 
laptop_data
order by ratings desc
limit 5;

-- 4. Top 5 laptop with lowest rating
select * from 
laptop_data
order by ratings Asc
limit 5;

-- 5. Laptops With NO Extra fithure 
SELECT brand , Avg(latest_price) as Avg_latest_price
FROM laptop_data
WHERE graphic_card_gb=0 AND warranty=0 AND TouchScreen='No' AND msoffice='No'
GROUP BY brand
ORDER BY brand, Avg_latest_price DESC;


-- 6. Price Comparison by Processor Brand
SELECT brand, processor_brand, AVG(latest_price) AS avg_price
FROM laptop_data
GROUP BY brand, processor_brand
ORDER BY avg_price DESC;


-- 7. Change in Price
SELECT brand, Avg(latest_price) AS Avg_latest_price, Avg(old_price) AS Avg_old_price, Avg(latest_price-old_price) AS Avg_change_price
FROM laptop_data
GROUP BY brand;

-- 8. laptop prices  with graphic card
DELIMITER //
CREATE PROCEDURE graphic_card_gb(IN Graphic_card Int,)
BEGIN
SELECT brand, latest_price, old_price, discount
FROM laptop_data
WHERE graphic_card_gb= Graphic_card;
END //
DELIMITER ;

CALL graphic_card_gb(2);


