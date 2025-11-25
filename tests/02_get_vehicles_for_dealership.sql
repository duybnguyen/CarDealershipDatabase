USE CarDealershipDatabase;

SELECT
    d.dealership_id,
    d.name AS dealership_name,
    v.vin,
    v.year,
    v.make,
    v.model,
    v.color,
    v.price,
    v.sold
FROM dealerships AS d
JOIN inventory  AS i ON d.dealership_id = i.dealership_id
JOIN vehicles   AS v ON i.vin = v.vin
WHERE d.dealership_id = 1;
