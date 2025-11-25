USE CarDealershipDatabase;

SELECT
    vin,
    year,
    make,
    model,
    color,
    mileage,
    price,
    sold,
    body_style
FROM vehicles
WHERE vin = '1FAFP404X1F192837';
