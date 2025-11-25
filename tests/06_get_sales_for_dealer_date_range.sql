USE CarDealershipDatabase;

SELECT
    sales_contracts.sales_contract_id,
    sales_contracts.sale_date,
    dealerships.dealership_id,
    dealerships.name,
    vehicles.vin,
    vehicles.year,
    vehicles.make,
    vehicles.model,
    sales_contracts.customer_name,
    sales_contracts.salesperson_name,
    sales_contracts.sale_price,
    sales_contracts.payment_type,
    sales_contracts.down_payment,
    sales_contracts.term_months
FROM sales_contracts,
     dealerships,
     vehicles
WHERE sales_contracts.dealership_id = dealerships.dealership_id
  AND sales_contracts.vin = vehicles.vin
  AND sales_contracts.dealership_id = 1
  AND sales_contracts.sale_date >= '2024-02-01'
  AND sales_contracts.sale_date <= '2024-12-31'
ORDER BY sales_contracts.sale_date;
