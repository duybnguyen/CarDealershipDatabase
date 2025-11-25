USE CarDealershipDatabase;

SELECT
    dealerships.dealership_id,
    dealerships.name,
    dealerships.address,
    dealerships.phone
FROM dealerships,
     inventory,
     vehicles
WHERE dealerships.dealership_id = inventory.dealership_id
  AND inventory.vin = vehicles.vin
  AND vehicles.make = 'Ford'
  AND vehicles.model = 'Mustang'
  AND vehicles.color = 'Red';
