-- First, drop existing tables if they exist (to avoid duplicate errors)
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS destination_t;
DROP TABLE IF EXISTS route_stop_t;
DROP TABLE IF EXISTS route_t;
DROP TABLE IF EXISTS port_t;
DROP TABLE IF EXISTS truck_station_t;
DROP TABLE IF EXISTS bus_station_t;
DROP TABLE IF EXISTS airport_t;
DROP TABLE IF EXISTS station_t;
DROP TABLE IF EXISTS maintenance_t;
DROP TABLE IF EXISTS business_t;
DROP TABLE IF EXISTS individual_t;
DROP TABLE IF EXISTS cargo_t;
DROP TABLE IF EXISTS fuel_consumption_t;
DROP TABLE IF EXISTS bus_t;
DROP TABLE IF EXISTS truck_t;
DROP TABLE IF EXISTS ship_t;
DROP TABLE IF EXISTS plane_t;
DROP TABLE IF EXISTS payment_t;
DROP TABLE IF EXISTS booking_t;
DROP TABLE IF EXISTS customer_t;
DROP TABLE IF EXISTS schedule_t;
DROP TABLE IF EXISTS vehicle_t;
DROP TABLE IF EXISTS maintenance_record_t;
DROP TABLE IF EXISTS driver_t;
DROP TABLE IF EXISTS employee_t;
DROP TABLE IF EXISTS partnership_t;
DROP TABLE IF EXISTS resource_t;
DROP TABLE IF EXISTS supplier_t;

SET FOREIGN_KEY_CHECKS = 1;

-- Supplier Table
CREATE TABLE supplier_t (
    supplier_id VARCHAR(13) NOT NULL,
    name VARCHAR(130),
    surname VARCHAR(120),
    contact_information VARCHAR(20),
    product_supplied VARCHAR(130),
    CONSTRAINT supplier_pk_cons PRIMARY KEY (supplier_id)
);

-- Resource Table
CREATE TABLE resource_t (
    supplier_id VARCHAR(13) NOT NULL,
    resource_reference VARCHAR(130) NOT NULL,
    resource_price FLOAT,
    CONSTRAINT resource_pk_cons PRIMARY KEY (resource_reference),
    CONSTRAINT resource_fk_cons FOREIGN KEY (supplier_id) REFERENCES supplier_t(supplier_id)
);

-- Partnership Table
CREATE TABLE partnership_t (
    partnership_ref VARCHAR(130) NOT NULL,
    company_name VARCHAR(130),
    agreement_details TEXT,
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT partnership_pk_cons PRIMARY KEY (partnership_ref)
);

-- Employee Table
CREATE TABLE employee_t (
    employee_id VARCHAR(13) NOT NULL,
    name VARCHAR(130),
    surname VARCHAR(130),
    job_title VARCHAR(130),
    shift_date DATE,
    start_time TIME,
    end_time TIME,
    CONSTRAINT employee_pk_cons PRIMARY KEY (employee_id)
);

-- Driver Table
CREATE TABLE driver_t (
    driver_id VARCHAR(13) NOT NULL,
    name VARCHAR(130),
    job_title VARCHAR(130),
    shift_date DATE,
    start_time TIME,
    end_time TIME,
    CONSTRAINT driver_pk_cons PRIMARY KEY (driver_id)
);

-- Maintenance Record Table
CREATE TABLE maintenance_record_t (
    record_id VARCHAR(130) NOT NULL,
    service_date DATE,
    service_time TIME,
    CONSTRAINT maintenance_record_pk_cons PRIMARY KEY (record_id)
);

-- Vehicle Table
CREATE TABLE vehicle_t (
    vehicle_id VARCHAR(100) NOT NULL,
    capacity INT,
    type VARCHAR(130),
    model VARCHAR(130),
    maintenance_status VARCHAR(130),
    driver_id VARCHAR(13) NOT NULL,
    record_id VARCHAR(130) NOT NULL,
    CONSTRAINT vehicle_pk_cons PRIMARY KEY (vehicle_id),
    CONSTRAINT vehicle_driver_fk_cons FOREIGN KEY (driver_id) REFERENCES driver_t(driver_id),
    CONSTRAINT vehicle_record_fk_cons FOREIGN KEY (record_id) REFERENCES maintenance_record_t(record_id)
);

-- Schedule Table
CREATE TABLE schedule_t (
    schedule_ref VARCHAR(130) NOT NULL,
    vehicle_id VARCHAR(100) NOT NULL,
    employee_id VARCHAR(13) NOT NULL,
    departure_time TIME,
    arrival_time TIME,
    CONSTRAINT schedule_pk_cons PRIMARY KEY (schedule_ref),
    CONSTRAINT schedule_vehicle_fk_cons FOREIGN KEY (vehicle_id) REFERENCES vehicle_t(vehicle_id),
    CONSTRAINT schedule_employee_fk_cons FOREIGN KEY (employee_id) REFERENCES employee_t(employee_id)
);

-- Customer Table
CREATE TABLE customer_t (
    customer_id VARCHAR(13) NOT NULL,
    name VARCHAR(130),
    contact_number VARCHAR(20),
    CONSTRAINT customer_pk_cons PRIMARY KEY (customer_id)
);

-- Booking Table
CREATE TABLE booking_t (
    booking_id VARCHAR(100) NOT NULL,
    customer_id VARCHAR(13) NOT NULL,
    vehicle_id VARCHAR(100) NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ticket_price FLOAT,
    CONSTRAINT booking_pk_cons PRIMARY KEY (booking_id),
    CONSTRAINT booking_customer_fk_cons FOREIGN KEY (customer_id) REFERENCES customer_t(customer_id),
    CONSTRAINT booking_vehicle_fk_cons FOREIGN KEY (vehicle_id) REFERENCES vehicle_t(vehicle_id)
);

-- Payment Table
CREATE TABLE payment_t (
    payment_reference VARCHAR(130) NOT NULL,
    payment_method VARCHAR(50),
    CONSTRAINT payment_valid_payment_method CHECK (payment_method IN ('Electronic Fund Transfer(EFT)', 'Cash')),
    amount_paid DECIMAL(65, 2),
    CONSTRAINT payment_valid_amount CHECK (amount_paid >= 50),
    payment_date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT payment_pk_cons PRIMARY KEY (payment_reference)
);

-- Plane Table
CREATE TABLE plane_t (
    plane_id VARCHAR(130) NOT NULL,
    vehicle_id VARCHAR(100) NOT NULL,
    aircraft_type VARCHAR(130),
    max_altitude FLOAT,
    runway_length_req FLOAT,
    engine_type VARCHAR(130),
    CONSTRAINT plane_pk_cons PRIMARY KEY (plane_id),
    CONSTRAINT plane_vehicle_fk_cons FOREIGN KEY (vehicle_id) REFERENCES vehicle_t(vehicle_id)
);

-- Ship Table
CREATE TABLE ship_t (
    ship_id VARCHAR(130) NOT NULL,
    vehicle_id VARCHAR(100) NOT NULL,
    ship_type VARCHAR(130),
    max_displacement DECIMAL(65, 4),
    deck_count INT DEFAULT 1,
    CONSTRAINT ship_valid_deck_count CHECK (deck_count >= 0),
    CONSTRAINT ship_pk_cons PRIMARY KEY (ship_id),
    CONSTRAINT ship_vehicle_fk_cons FOREIGN KEY (vehicle_id) REFERENCES vehicle_t(vehicle_id)
);

-- Truck Table
CREATE TABLE truck_t (
    truck_no_plate VARCHAR(100) NOT NULL,
    vehicle_id VARCHAR(100) NOT NULL,
    truck_type VARCHAR(130),
    maxload_capacity DECIMAL(65, 4),
    CONSTRAINT truck_pk_cons PRIMARY KEY (truck_no_plate),
    CONSTRAINT truck_vehicle_fk_cons FOREIGN KEY (vehicle_id) REFERENCES vehicle_t(vehicle_id)
);

-- Bus Table
CREATE TABLE bus_t (
    bus_no_plate VARCHAR(100) NOT NULL,
    vehicle_id VARCHAR(100) NOT NULL,
    bus_type VARCHAR(130),
    no_of_doors INT DEFAULT 1,
    CONSTRAINT bus_valid_no_of_doors CHECK (no_of_doors >= 1),
    accessibility_features VARCHAR(200),
    CONSTRAINT bus_pk_cons PRIMARY KEY (bus_no_plate),
    CONSTRAINT bus_vehicle_fk_cons FOREIGN KEY (vehicle_id) REFERENCES vehicle_t(vehicle_id)
);

-- Fuel Consumption Table
CREATE TABLE fuel_consumption_t (
    fuel_id VARCHAR(130) NOT NULL,
    fuel_type VARCHAR(130) NOT NULL,
    amount_used DECIMAL(65, 4) DEFAULT 0,
    CONSTRAINT fuel_valid_amount_used CHECK (amount_used >= 0),
    cost DECIMAL(65, 2) DEFAULT 0,
    CONSTRAINT fuel_valid_cost CHECK (cost >= 30),
    CONSTRAINT fuel_pk_cons PRIMARY KEY (fuel_id)
);

-- Cargo Table
CREATE TABLE cargo_t (
    cargo_id VARCHAR(130) NOT NULL,
    customer_id VARCHAR(13) NOT NULL,
    description VARCHAR(130),
    weight DECIMAL(65, 2),
    volume DECIMAL(65, 4),
    destination VARCHAR(200),
    CONSTRAINT cargo_pk_cons PRIMARY KEY (cargo_id),
    CONSTRAINT cargo_customer_fk_cons FOREIGN KEY (customer_id) REFERENCES customer_t(customer_id)
);

-- Individual Table
CREATE TABLE individual_t (
    individual_reference VARCHAR(130) NOT NULL,
    customer_id VARCHAR(13) NOT NULL,
    email_address VARCHAR(130),
    CONSTRAINT individual_pk_cons PRIMARY KEY (individual_reference),
    CONSTRAINT individual_customer_fk_cons FOREIGN KEY (customer_id) REFERENCES customer_t(customer_id)
);

-- Business Table
CREATE TABLE business_t (
    company_email VARCHAR(130),
    company_id VARCHAR(130) NOT NULL,
    customer_id VARCHAR(13) NOT NULL,
    CONSTRAINT business_pk_cons PRIMARY KEY (company_id),
    CONSTRAINT business_customer_fk_cons FOREIGN KEY (customer_id) REFERENCES customer_t(customer_id)
);

-- Maintenance Table
CREATE TABLE maintenance_t (
    maintenance_id VARCHAR(130) NOT NULL,
    vehicle_id VARCHAR(100) NOT NULL,
    cost DECIMAL(65, 2),
    CONSTRAINT maintenance_valid_cost CHECK (cost >= 0),
    service_type VARCHAR(200),
    CONSTRAINT maintenance_pk_cons PRIMARY KEY (maintenance_id),
    CONSTRAINT maintenance_vehicle_fk_cons FOREIGN KEY (vehicle_id) REFERENCES vehicle_t(vehicle_id)
);

-- Station Table
CREATE TABLE station_t (
    station_id VARCHAR(130) NOT NULL,
    name VARCHAR(130),
    CONSTRAINT station_valid_name CHECK (LENGTH(name) >= 3),
    location VARCHAR(200),
    capacity DECIMAL(65, 3),
    CONSTRAINT station_pk_cons PRIMARY KEY (station_id)
);

-- Airport Table
CREATE TABLE airport_t (
    airport_code VARCHAR(130) NOT NULL,
    station_id VARCHAR(130) NOT NULL,
    runway_length DECIMAL(65, 4),
    area_category VARCHAR(130),
    CONSTRAINT airport_pk_cons PRIMARY KEY (airport_code),
    CONSTRAINT airport_station_fk_cons FOREIGN KEY (station_id) REFERENCES station_t(station_id)
);

-- Bus Station Table
CREATE TABLE bus_station_t (
    bus_station_code VARCHAR(130) NOT NULL,
    station_id VARCHAR(130) NOT NULL,
    terminal_size DECIMAL(65, 4),
    CONSTRAINT bus_station_valid_terminal_size CHECK (terminal_size >= 1),
    no_of_platforms INT DEFAULT 1,
    CONSTRAINT bus_station_validate_no_of_platforms CHECK (no_of_platforms >= 1),
    area_category VARCHAR(130),
    CONSTRAINT bus_station_pk_cons PRIMARY KEY (bus_station_code),
    CONSTRAINT bus_station_station_fk_cons FOREIGN KEY (station_id) REFERENCES station_t(station_id)
);

-- Truck Station Table
CREATE TABLE truck_station_t (
    truck_station_code VARCHAR(130) NOT NULL,
    station_id VARCHAR(130) NOT NULL,
    warehouse_capacity DECIMAL(65, 4),
    freight_handling_capacity DECIMAL(65, 4),
    highway_access VARCHAR(130),
    CONSTRAINT truck_station_pk_cons PRIMARY KEY (truck_station_code),
    CONSTRAINT truck_station_station_fk_cons FOREIGN KEY (station_id) REFERENCES station_t(station_id)
);

-- Port Table
CREATE TABLE port_t (
    port_code VARCHAR(130) NOT NULL,
    station_id VARCHAR(130) NOT NULL,
    docking_capacity FLOAT,
    cargo_handling_equipment VARCHAR(200),
    CONSTRAINT port_pk_cons PRIMARY KEY (port_code),
    CONSTRAINT port_station_fk_cons FOREIGN KEY (station_id) REFERENCES station_t(station_id)
);

-- Route Table
CREATE TABLE route_t (
    route_id VARCHAR(130) NOT NULL,
    origin VARCHAR(200),
    destination VARCHAR(200),
    distance DECIMAL(65, 2),
    estimated_time TIME,
    CONSTRAINT route_pk_cons PRIMARY KEY (route_id)
);

-- Route Stop Table
CREATE TABLE route_stop_t (
    route_station_id VARCHAR(130) NOT NULL,
    route_id VARCHAR(130) NOT NULL,
    station_id VARCHAR(130) NOT NULL,
    sequence_number VARCHAR(200),
    arrival_time TIME,
    departure_time TIME,
    CONSTRAINT route_stop_pk_cons PRIMARY KEY (route_station_id),
    CONSTRAINT route_stop_route_fk_cons FOREIGN KEY (route_id) REFERENCES route_t(route_id),
    CONSTRAINT route_stop_station_fk_cons FOREIGN KEY (station_id) REFERENCES station_t(station_id)
);

-- Destination Table
CREATE TABLE destination_t (
    route_id VARCHAR(130) NOT NULL,
    destination_id VARCHAR(130) NOT NULL,
    report VARCHAR(200),
    destination VARCHAR(200),
    CONSTRAINT destination_pk_cons PRIMARY KEY (destination_id),
    CONSTRAINT destination_route_fk_cons FOREIGN KEY (route_id) REFERENCES route_t(route_id)
);