DROP DATABASE IF EXISTS CarDealershipDatabase;

CREATE DATABASE IF NOT EXISTS CarDealershipDatabase;
USE CarDealershipDatabase;

CREATE TABLE dealerships (
    dealership_id INT NOT NULL AUTO_INCREMENT,
    name          VARCHAR(50) NOT NULL,
    address       VARCHAR(50) NOT NULL,
    phone         VARCHAR(12),
    CONSTRAINT pk_dealerships PRIMARY KEY (dealership_id)
);

CREATE TABLE vehicles (
    vin          VARCHAR(17) NOT NULL,
    year         INT NOT NULL,
    make         VARCHAR(30) NOT NULL,
    model        VARCHAR(30) NOT NULL,
    color        VARCHAR(20),
    mileage      INT,
    price        DECIMAL(10,2),
    sold         BIT NOT NULL DEFAULT 0,
    body_style   VARCHAR(20),
    CONSTRAINT pk_vehicles PRIMARY KEY (vin)
);

CREATE TABLE inventory (
    dealership_id INT NOT NULL,
    vin           VARCHAR(17) NOT NULL,
    date_added    DATE,
    CONSTRAINT pk_inventory PRIMARY KEY (dealership_id, vin),
    CONSTRAINT fk_inventory_dealership
        FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    CONSTRAINT fk_inventory_vehicle
        FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

CREATE TABLE sales_contracts (
    sales_contract_id INT NOT NULL AUTO_INCREMENT,
    vin               VARCHAR(17) NOT NULL,
    dealership_id     INT NOT NULL,
    customer_name     VARCHAR(60) NOT NULL,
    sale_price        DECIMAL(10,2) NOT NULL,
    sale_date         DATE NOT NULL,
    salesperson_name  VARCHAR(60),
    payment_type      ENUM('CASH', 'FINANCE') DEFAULT 'CASH',
    down_payment      DECIMAL(10,2),
    term_months       INT,
    CONSTRAINT pk_sales_contracts PRIMARY KEY (sales_contract_id),
    CONSTRAINT fk_sales_vehicle
        FOREIGN KEY (vin) REFERENCES vehicles(vin),
    CONSTRAINT fk_sales_dealership
        FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id)
);

CREATE TABLE lease_contracts (
    lease_contract_id     INT NOT NULL AUTO_INCREMENT,
    vin                   VARCHAR(17) NOT NULL,
    dealership_id         INT NOT NULL,
    customer_name         VARCHAR(60) NOT NULL,
    lease_start           DATE NOT NULL,
    lease_end             DATE NOT NULL,
    monthly_payment       DECIMAL(10,2) NOT NULL,
    annual_mileage_allowance INT,
    CONSTRAINT pk_lease_contracts PRIMARY KEY (lease_contract_id),
    CONSTRAINT fk_lease_vehicle
        FOREIGN KEY (vin) REFERENCES vehicles(vin),
    CONSTRAINT fk_lease_dealership
        FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id)
);

INSERT INTO dealerships (name, address, phone) VALUES
('Downtown Motors',      '123 Main St',      '555-111-2222'),
('Suburban Auto Plaza',  '456 Elm St',       '555-333-4444'),
('Highway Imports',      '789 Highway Rd',   '555-555-6666');

INSERT INTO vehicles (vin, year, make, model, color, mileage, price, sold, body_style) VALUES
('1HGCM82633A004352', 2019, 'Honda',    'Civic',   'Blue',  23000, 18999.00, b'0', 'Sedan'),
('1FAFP404X1F192837', 2020, 'Ford',     'Mustang', 'Red',   12000, 29999.00, b'0', 'Coupe'),
('1GNEK13ZX3R298765', 2018, 'Chevrolet','Tahoe',   'Black', 45000, 34999.00, b'1', 'SUV'),
('2T1BURHE5JC123456', 2021, 'Toyota',   'Corolla', 'White',  8000, 19999.00, b'1', 'Sedan'),
('WDBUF56X88B123456', 2017, 'Mercedes', 'C300',    'Silver',38000, 25999.00, b'0', 'Sedan'),
('3VWDP7AJ5DM123456', 2022, 'Volkswagen','Jetta',  'Gray',   5000, 21999.00, b'0', 'Sedan'),
('5YJ3E1EA7KF123456', 2020, 'Tesla',    'Model 3', 'Red',   15000, 39999.00, b'1', 'Sedan'),
('1N4AL3AP4GC123456', 2019, 'Nissan',   'Altima',  'Blue',  27000, 17999.00, b'0', 'Sedan');

INSERT INTO inventory (dealership_id, vin, date_added) VALUES
(1, '1HGCM82633A004352', '2024-01-10'),
(1, '1FAFP404X1F192837', '2024-02-05'),
(1, '1GNEK13ZX3R298765', '2023-11-20'),

(2, '2T1BURHE5JC123456', '2024-03-01'),
(2, 'WDBUF56X88B123456', '2023-12-15'),
(2, '3VWDP7AJ5DM123456', '2024-04-02'),

(3, '5YJ3E1EA7KF123456', '2024-01-25'),
(3, '1N4AL3AP4GC123456', '2024-02-18');

INSERT INTO sales_contracts
(vin, dealership_id, customer_name, sale_price, sale_date,
 salesperson_name, payment_type, down_payment, term_months)
VALUES
('1GNEK13ZX3R298765', 1, 'Alice Johnson', 33999.00, '2024-02-15',
 'Mark Smith', 'FINANCE', 5000.00, 60),

('2T1BURHE5JC123456', 2, 'Brian Lee',     19499.00, '2024-03-20',
 'Susan Clark', 'CASH',    19499.00, NULL),

('5YJ3E1EA7KF123456', 3, 'Dana Patel',    38999.00, '2024-04-10',
 'Chris Young', 'FINANCE', 8000.00, 72);

INSERT INTO lease_contracts
(vin, dealership_id, customer_name, lease_start, lease_end,
 monthly_payment, annual_mileage_allowance)
VALUES
('1HGCM82633A004352', 1, 'Evan Miller', '2024-05-01', '2027-05-01',
 299.00, 12000),

('WDBUF56X88B123456', 2, 'Fiona Davis', '2024-02-01', '2026-02-01',
 449.00, 15000);
