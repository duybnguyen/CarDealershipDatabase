USE CarDealershipDatabase;

SELECT
    v.vin,
    v.year,
    v.make,
    v.model,
    d.dealership_id,
    d.name        AS dealership_name,
    d.address,
    d.phone
FROM vehicles    AS v
JOIN inventory   AS i ON v.vin = i.vin
JOIN dealerships AS d ON i.dealership_id = d.dealership_id
WHERE v.vin = '1FAFP404X1F192837';
