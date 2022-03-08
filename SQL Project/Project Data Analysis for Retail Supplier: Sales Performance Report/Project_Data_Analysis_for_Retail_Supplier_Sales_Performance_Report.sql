-- Overall Performance by Year
SELECT YEAR(date) AS years, SUM(sale_dollars) AS sales, COUNT(bottles_sold) AS number_of_order 
FROM `iowa_drink_sales`
WHERE bottles_sold > 0
GROUP BY YEAR(date);

-- Overall Performance by Product Sub Category
SELECT YEAR(date) AS years, category_name, SUM(sale_dollars) AS sales
FROM `iowa_drink_sales`
WHERE YEAR(date) >= 2020 AND YEAR(date) <= 2022 AND bottles_sold > 0
GROUP BY YEAR(date), category_name
ORDER BY YEAR(date) ASC, SUM(sale_dollars) DESC;

-- City Store Effectiveness and Efficiency Based on Years
SELECT YEAR(date) AS years, city, SUM(sale_dollars) AS sales
FROM `iowa_drink_sales`
WHERE bottles_sold > 0
GROUP BY years, city
ORDER BY years ASC, sales DESC;

-- City Store Effectiveness and Efficiency by Category in 2021
SELECT YEAR(date) AS years, category_name, city, SUM(sale_dollars) AS sales
FROM `iowa_drink_sales`
WHERE YEAR(date) = 2021 AND bottles_sold > 0
GROUP BY category_name
ORDER BY sales DESC;

-- Stores Transactions per Year
SELECT YEAR(date) as years, COUNT(DISTINCT store_name) AS number_of_store
FROM `iowa_drink_sales`
WHERE bottles_sold > 0
GROUP BY years;
