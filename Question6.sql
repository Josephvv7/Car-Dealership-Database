SELECT sc.*
FROM sales_contracts sc
JOIN vehicles v ON sc.VIN = v.VIN
JOIN inventory i ON v.VIN = i.VIN
WHERE i.dealership_id = 1 -- Hyrule Castle Motors
AND sc.sale_date BETWEEN '2023-01-01' AND '2023-12-31';
