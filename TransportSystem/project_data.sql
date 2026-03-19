-- Insert into supplier_t
INSERT INTO supplier_t (supplier_id, name, surname, contact_information, product_supplied) VALUES
('SUP001', 'John', 'Smith', '1234567890', 'Vehicle Parts'),
('SUP002', 'Emily', 'Johnson', '2345678901', 'Fuel'),
('SUP003', 'Michael', 'Williams', '3456789012', 'Maintenance Tools'),
('SUP004', 'Sarah', 'Brown', '4567890123', 'Electronics'),
('SUP005', 'David', 'Jones', '5678901234', 'Tires'),
('SUP006', 'Jessica', 'Garcia', '6789012345', 'Lubricants'),
('SUP007', 'Robert', 'Miller', '7890123456', 'Brake Systems'),
('SUP008', 'Jennifer', 'Davis', '8901234567', 'Lighting'),
('SUP009', 'Thomas', 'Rodriguez', '9012345678', 'Suspension'),
('SUP010', 'Lisa', 'Martinez', '0123456789', 'Interior Parts');

-- Insert into resource_t
INSERT INTO resource_t (supplier_id, resource_reference, resource_price) VALUES
('SUP001', 'ENG001', 1200.50),
('SUP002', 'FUEL001', 3.75),
('SUP003', 'TOOL001', 89.99),
('SUP004', 'ELEC001', 450.00),
('SUP005', 'TIRE001', 199.99),
('SUP006', 'LUB001', 15.50),
('SUP007', 'BRAKE001', 320.75),
('SUP008', 'LIGHT001', 45.25),
('SUP009', 'SUSP001', 275.00),
('SUP010', 'INT001', 89.99);

-- Insert into partnership_t
INSERT INTO partnership_t (partnership_ref, company_name, agreement_details) VALUES
('PART001', 'Global Logistics', 'Exclusive parts supply'),
('PART002', 'Fuel Masters', 'Bulk fuel discount'),
('PART003', 'Tech Auto', 'Electronics maintenance'),
('PART004', 'Tire World', 'Tire replacement program'),
('PART005', 'Lube Pro', 'Monthly lubrication service'),
('PART006', 'Brake Systems Inc', 'Brake maintenance contract'),
('PART007', 'Lighting Solutions', 'Vehicle lighting upgrades'),
('PART008', 'Suspension Experts', 'Quarterly suspension checks'),
('PART009', 'Interior Designs', 'Custom interior packages'),
('PART010', 'Engine Masters', 'Engine overhaul services');

-- Insert into employee_t
INSERT INTO employee_t (employee_id, name, surname, job_title, shift_date, start_time, end_time) VALUES
('EMP001', 'James', 'Wilson', 'Manager', '2023-01-15', '08:00:00', '17:00:00'),
('EMP002', 'Mary', 'Taylor', 'Mechanic', '2023-01-15', '09:00:00', '18:00:00'),
('EMP003', 'William', 'Anderson', 'Driver', '2023-01-16', '07:00:00', '16:00:00'),
('EMP004', 'Patricia', 'Thomas', 'Accountant', '2023-01-16', '08:30:00', '17:30:00'),
('EMP005', 'Christopher', 'Jackson', 'Technician', '2023-01-17', '10:00:00', '19:00:00'),
('EMP006', 'Linda', 'White', 'Dispatcher', '2023-01-17', '06:00:00', '15:00:00'),
('EMP007', 'Daniel', 'Harris', 'Supervisor', '2023-01-18', '08:00:00', '17:00:00'),
('EMP008', 'Barbara', 'Martin', 'Cleaner', '2023-01-18', '14:00:00', '23:00:00'),
('EMP009', 'Matthew', 'Thompson', 'Mechanic', '2023-01-19', '09:00:00', '18:00:00'),
('EMP010', 'Susan', 'Garcia', 'Receptionist', '2023-01-19', '10:00:00', '19:00:00');

-- Insert into driver_t
INSERT INTO driver_t (driver_id, name, job_title, shift_date, start_time, end_time) VALUES
('DRV001', 'Richard', 'Truck Driver', '2023-01-20', '06:00:00', '15:00:00'),
('DRV002', 'Karen', 'Bus Driver', '2023-01-20', '07:00:00', '16:00:00'),
('DRV003', 'Joseph', 'Delivery Driver', '2023-01-21', '08:00:00', '17:00:00'),
('DRV004', 'Nancy', 'Long Haul Driver', '2023-01-21', '09:00:00', '18:00:00'),
('DRV005', 'Charles', 'Shuttle Driver', '2023-01-22', '05:00:00', '14:00:00'),
('DRV006', 'Betty', 'Taxi Driver', '2023-01-22', '10:00:00', '19:00:00'),
('DRV007', 'Thomas', 'Chauffeur', '2023-01-23', '11:00:00', '20:00:00'),
('DRV008', 'Margaret', 'School Bus Driver', '2023-01-23', '06:30:00', '15:30:00'),
('DRV009', 'Donald', 'Tour Bus Driver', '2023-01-24', '08:00:00', '17:00:00'),
('DRV010', 'Sandra', 'Freight Driver', '2023-01-24', '07:00:00', '16:00:00');

-- Insert into maintenance_record_t
INSERT INTO maintenance_record_t (record_id, service_date, service_time) VALUES
('REC001', '2023-01-01', '09:00:00'),
('REC002', '2023-01-02', '10:00:00'),
('REC003', '2023-01-03', '11:00:00'),
('REC004', '2023-01-04', '08:00:00'),
('REC005', '2023-01-05', '13:00:00'),
('REC006', '2023-01-06', '14:00:00'),
('REC007', '2023-01-07', '15:00:00'),
('REC008', '2023-01-08', '16:00:00'),
('REC009', '2023-01-09', '09:30:00'),
('REC010', '2023-01-10', '10:30:00');

-- Insert into vehicle_t
INSERT INTO vehicle_t (vehicle_id, capacity, type, model, maintenance_status, driver_id, record_id) VALUES
('VEH001', 4, 'Car', 'Toyota Camry', 'Good', 'DRV001', 'REC001'),
('VEH002', 50, 'Bus', 'Volvo Buses', 'Excellent', 'DRV002', 'REC002'),
('VEH003', 2, 'Truck', 'Freightliner', 'Fair', 'DRV003', 'REC003'),
('VEH004', 200, 'Plane', 'Boeing 737', 'Excellent', 'DRV004', 'REC004'),
('VEH005', 500, 'Ship', 'Cargo Ship', 'Good', 'DRV005', 'REC005'),
('VEH006', 3, 'Van', 'Ford Transit', 'Good', 'DRV006', 'REC006'),
('VEH007', 30, 'Minibus', 'Mercedes Sprinter', 'Fair', 'DRV007', 'REC007'),
('VEH008', 150, 'Train', 'Bullet Train', 'Excellent', 'DRV008', 'REC008'),
('VEH009', 2, 'Motorcycle', 'Harley Davidson', 'Poor', 'DRV009', 'REC009'),
('VEH010', 20, 'Boat', 'Yacht', 'Excellent', 'DRV010', 'REC010');

-- Insert into schedule_t
INSERT INTO schedule_t (schedule_ref, vehicle_id, employee_id, departure_time, arrival_time) VALUES
('SCH001', 'VEH001', 'EMP001', '08:00:00', '17:00:00'),
('SCH002', 'VEH002', 'EMP002', '09:00:00', '18:00:00'),
('SCH003', 'VEH003', 'EMP003', '10:00:00', '19:00:00'),
('SCH004', 'VEH004', 'EMP004', '11:00:00', '20:00:00'),
('SCH005', 'VEH005', 'EMP005', '12:00:00', '21:00:00'),
('SCH006', 'VEH006', 'EMP006', '13:00:00', '22:00:00'),
('SCH007', 'VEH007', 'EMP007', '14:00:00', '23:00:00'),
('SCH008', 'VEH008', 'EMP008', '15:00:00', '24:00:00'),
('SCH009', 'VEH009', 'EMP009', '16:00:00', '01:00:00'),
('SCH010', 'VEH010', 'EMP010', '17:00:00', '02:00:00');

-- Insert into customer_t
INSERT INTO customer_t (customer_id, name, contact_number) VALUES
('CUST001', 'ABC Corporation', '1112223333'),
('CUST002', 'XYZ Enterprises', '2223334444'),
('CUST003', 'John Doe', '3334445555'),
('CUST004', 'Jane Smith', '4445556666'),
('CUST005', 'Acme Inc', '5556667777'),
('CUST006', 'Global Corp', '6667778888'),
('CUST007', 'Mike Johnson', '7778889999'),
('CUST008', 'Sarah Williams', '8889990000'),
('CUST009', 'David Brown', '9990001111'),
('CUST010', 'Emily Davis', '0001112222');

-- Insert into booking_t
INSERT INTO booking_t (booking_id, customer_id, vehicle_id, booking_date, ticket_price) VALUES
('BOOK001', 'CUST001', 'VEH001', '2023-01-01 08:00:00', 150.00),
('BOOK002', 'CUST002', 'VEH002', '2023-01-02 09:00:00', 200.00),
('BOOK003', 'CUST003', 'VEH003', '2023-01-03 10:00:00', 175.50),
('BOOK004', 'CUST004', 'VEH004', '2023-01-04 11:00:00', 500.00),
('BOOK005', 'CUST005', 'VEH005', '2023-01-05 12:00:00', 350.75),
('BOOK006', 'CUST006', 'VEH006', '2023-01-06 13:00:00', 125.00),
('BOOK007', 'CUST007', 'VEH007', '2023-01-07 14:00:00', 180.25),
('BOOK008', 'CUST008', 'VEH008', '2023-01-08 15:00:00', 220.00),
('BOOK009', 'CUST009', 'VEH009', '2023-01-09 16:00:00', 90.50),
('BOOK010', 'CUST010', 'VEH010', '2023-01-10 17:00:00', 300.00);

-- Insert into payment_t
INSERT INTO payment_t (payment_reference, payment_method, amount_paid, payment_date_time) VALUES
('PAY001', 'Electronic Fund Transfer(EFT)', 150.00, '2023-01-01 08:30:00'),
('PAY002', 'Cash', 200.00, '2023-01-02 09:30:00'),
('PAY003', 'Electronic Fund Transfer(EFT)', 175.50, '2023-01-03 10:30:00'),
('PAY004', 'Cash', 500.00, '2023-01-04 11:30:00'),
('PAY005', 'Electronic Fund Transfer(EFT)', 350.75, '2023-01-05 12:30:00'),
('PAY006', 'Cash', 125.00, '2023-01-06 13:30:00'),
('PAY007', 'Electronic Fund Transfer(EFT)', 180.25, '2023-01-07 14:30:00'),
('PAY008', 'Cash', 220.00, '2023-01-08 15:30:00'),
('PAY009', 'Electronic Fund Transfer(EFT)', 90.50, '2023-01-09 16:30:00'),
('PAY010', 'Cash', 300.00, '2023-01-10 17:30:00');

-- Insert into plane_t
INSERT INTO plane_t (plane_id, vehicle_id, aircraft_type, max_altitude, runway_length_req, engine_type) VALUES
('PLANE001', 'VEH004', 'Commercial', 35000, 8000, 'Jet'),
('PLANE002', 'VEH001', 'Private', 45000, 5000, 'Turboprop'),
('PLANE003', 'VEH002', 'Cargo', 40000, 10000, 'Jet'),
('PLANE004', 'VEH003', 'Military', 50000, 7000, 'Jet'),
('PLANE005', 'VEH005', 'Commercial', 38000, 9000, 'Jet'),
('PLANE006', 'VEH006', 'Private', 42000, 6000, 'Piston'),
('PLANE007', 'VEH007', 'Cargo', 37000, 8500, 'Turboprop'),
('PLANE008', 'VEH008', 'Commercial', 39000, 7500, 'Jet'),
('PLANE009', 'VEH009', 'Private', 43000, 5500, 'Turbofan'),
('PLANE010', 'VEH010', 'Military', 48000, 6500, 'Jet');

-- Insert into ship_t
INSERT INTO ship_t (ship_id, vehicle_id, ship_type, max_displacement, deck_count) VALUES
('SHIP001', 'VEH005', 'Cargo', 50000.0000, 3),
('SHIP002', 'VEH001', 'Cruise', 80000.0000, 12),
('SHIP003', 'VEH002', 'Tanker', 300000.0000, 5),
('SHIP004', 'VEH003', 'Container', 150000.0000, 4),
('SHIP005', 'VEH004', 'Fishing', 2000.0000, 2),
('SHIP006', 'VEH006', 'Naval', 100000.0000, 8),
('SHIP007', 'VEH007', 'Yacht', 500.0000, 3),
('SHIP008', 'VEH008', 'Ferry', 15000.0000, 4),
('SHIP009', 'VEH009', 'Research', 8000.0000, 3),
('SHIP010', 'VEH010', 'Barge', 250000.0000, 2);

-- Insert into truck_t
INSERT INTO truck_t (truck_no_plate, vehicle_id, truck_type, maxload_capacity) VALUES
('TRK001', 'VEH003', 'Semi', 40000.0000),
('TRK002', 'VEH001', 'Pickup', 2000.0000),
('TRK003', 'VEH002', 'Delivery', 5000.0000),
('TRK004', 'VEH004', 'Dump', 30000.0000),
('TRK005', 'VEH005', 'Tanker', 35000.0000),
('TRK006', 'VEH006', 'Flatbed', 25000.0000),
('TRK007', 'VEH007', 'Box', 18000.0000),
('TRK008', 'VEH008', 'Refrigerated', 22000.0000),
('TRK009', 'VEH009', 'Tow', 10000.0000),
('TRK010', 'VEH010', 'Cement', 28000.0000);

-- Insert into bus_t
INSERT INTO bus_t (bus_no_plate, vehicle_id, bus_type, no_of_doors, accessibility_features) VALUES
('BUS001', 'VEH002', 'City', 2, 'Wheelchair ramp'),
('BUS002', 'VEH001', 'School', 1, 'None'),
('BUS003', 'VEH003', 'Coach', 1, 'Toilet facility'),
('BUS004', 'VEH004', 'Double Decker', 2, 'Stair lift'),
('BUS005', 'VEH005', 'Minibus', 1, 'Wheelchair space'),
('BUS006', 'VEH006', 'Articulated', 3, 'Low floor'),
('BUS007', 'VEH007', 'Shuttle', 1, 'None'),
('BUS008', 'VEH008', 'Tour', 2, 'Audio guide'),
('BUS009', 'VEH009', 'Electric', 2, 'USB charging'),
('BUS010', 'VEH010', 'Hybrid', 2, 'Wheelchair ramp');

-- Insert into fuel_consumption_t
INSERT INTO fuel_consumption_t (fuel_id, fuel_type, amount_used, cost) VALUES
('FUEL001', 'Diesel', 50.0000, 187.50),
('FUEL002', 'Gasoline', 30.0000, 112.50),
('FUEL003', 'Jet Fuel', 500.0000, 1500.00),
('FUEL004', 'Marine Diesel', 200.0000, 600.00),
('FUEL005', 'Electric', 100.0000, 30.00),
('FUEL006', 'CNG', 40.0000, 120.00),
('FUEL007', 'LPG', 35.0000, 105.00),
('FUEL008', 'Biofuel', 60.0000, 210.00),
('FUEL009', 'Hybrid', 25.0000, 75.00),
('FUEL010', 'Hydrogen', 10.0000, 50.00);

-- Insert into cargo_t
INSERT INTO cargo_t (cargo_id, customer_id, description, weight, volume, destination) VALUES
('CRG001', 'CUST001', 'Electronics', 500.00, 10.0000, 'New York'),
('CRG002', 'CUST002', 'Furniture', 1200.00, 25.0000, 'Los Angeles'),
('CRG003', 'CUST003', 'Clothing', 300.00, 15.0000, 'Chicago'),
('CRG004', 'CUST004', 'Food', 800.00, 20.0000, 'Houston'),
('CRG005', 'CUST005', 'Machinery', 2500.00, 30.0000, 'Miami'),
('CRG006', 'CUST006', 'Chemicals', 1500.00, 18.0000, 'Seattle'),
('CRG007', 'CUST007', 'Vehicles', 3000.00, 50.0000, 'Boston'),
('CRG008', 'CUST008', 'Construction', 2000.00, 35.0000, 'Denver'),
('CRG009', 'CUST009', 'Pharmaceuticals', 400.00, 8.0000, 'Atlanta'),
('CRG010', 'CUST010', 'Artwork', 200.00, 5.0000, 'San Francisco');

-- Insert into individual_t
INSERT INTO individual_t (individual_reference, customer_id, email_address) VALUES
('IND001', 'CUST003', 'john.doe@email.com'),
('IND002', 'CUST004', 'jane.smith@email.com'),
('IND003', 'CUST007', 'mike.johnson@email.com'),
('IND004', 'CUST008', 'sarah.williams@email.com'),
('IND005', 'CUST009', 'david.brown@email.com'),
('IND006', 'CUST010', 'emily.davis@email.com'),
('IND007', 'CUST001', 'individual1@email.com'),
('IND008', 'CUST002', 'individual2@email.com'),
('IND009', 'CUST005', 'individual3@email.com'),
('IND010', 'CUST006', 'individual4@email.com');

-- Insert into business_t
INSERT INTO business_t (company_email, company_id, customer_id) VALUES
('abc@corp.com', 'COMP001', 'CUST001'),
('xyz@enterprises.com', 'COMP002', 'CUST002'),
('acme@inc.com', 'COMP003', 'CUST005'),
('global@corp.com', 'COMP004', 'CUST006'),
('business1@email.com', 'COMP005', 'CUST003'),
('business2@email.com', 'COMP006', 'CUST004'),
('business3@email.com', 'COMP007', 'CUST007'),
('business4@email.com', 'COMP008', 'CUST008'),
('business5@email.com', 'COMP009', 'CUST009'),
('business6@email.com', 'COMP010', 'CUST010');

-- Insert into maintenance_t
INSERT INTO maintenance_t (maintenance_id, vehicle_id, cost, service_type) VALUES
('MNT001', 'VEH001', 250.00, 'Oil Change'),
('MNT002', 'VEH002', 500.00, 'Brake Service'),
('MNT003', 'VEH003', 1200.00, 'Engine Overhaul'),
('MNT004', 'VEH004', 3000.00, 'Avionics Check'),
('MNT005', 'VEH005', 800.00, 'Hull Cleaning'),
('MNT006', 'VEH006', 150.00, 'Tire Rotation'),
('MNT007', 'VEH007', 400.00, 'Transmission Service'),
('MNT008', 'VEH008', 2000.00, 'Electrical System'),
('MNT009', 'VEH009', 100.00, 'Chain Lubrication'),
('MNT010', 'VEH010', 600.00, 'Navigation System');

-- Insert into station_t
INSERT INTO station_t (station_id, name, location, capacity) VALUES
('STN001', 'Central Station', 'Main City', 1000.000),
('STN002', 'North Terminal', 'North District', 500.000),
('STN003', 'South Depot', 'South Area', 750.000),
('STN004', 'East Hub', 'Eastern Suburbs', 600.000),
('STN005', 'West Yard', 'Western Region', 450.000),
('STN006', 'Downtown Terminal', 'City Center', 800.000),
('STN007', 'Uptown Station', 'Business District', 650.000),
('STN008', 'Riverside Depot', 'Riverfront', 550.000),
('STN009', 'Hillside Terminal', 'Mountain Area', 400.000),
('STN010', 'Airport Station', 'Near Airport', 900.000);

-- Insert into airport_t
INSERT INTO airport_t (airport_code, station_id, runway_length, area_category) VALUES
('AIR001', 'STN010', 10000.0000, 'International'),
('AIR002', 'STN001', 8000.0000, 'Domestic'),
('AIR003', 'STN002', 6000.0000, 'Regional'),
('AIR004', 'STN003', 12000.0000, 'International'),
('AIR005', 'STN004', 7500.0000, 'Domestic'),
('AIR006', 'STN005', 5000.0000, 'Private'),
('AIR007', 'STN006', 9000.0000, 'International'),
('AIR008', 'STN007', 6500.0000, 'Domestic'),
('AIR009', 'STN008', 5500.0000, 'Regional'),
('AIR010', 'STN009', 7000.0000, 'Private');

-- Insert into bus_station_t
INSERT INTO bus_station_t (bus_station_code, station_id, terminal_size, no_of_platforms, area_category) VALUES
('BST001', 'STN001', 5000.0000, 10, 'Urban'),
('BST002', 'STN002', 3000.0000, 6, 'Suburban'),
('BST003', 'STN003', 4000.0000, 8, 'Urban'),
('BST004', 'STN004', 2500.0000, 5, 'Suburban'),
('BST005', 'STN005', 3500.0000, 7, 'Urban'),
('BST006', 'STN006', 6000.0000, 12, 'Metropolitan'),
('BST007', 'STN007', 2000.0000, 4, 'Suburban'),
('BST008', 'STN008', 4500.0000, 9, 'Urban'),
('BST009', 'STN009', 1500.0000, 3, 'Rural'),
('BST010', 'STN010', 5000.0000, 10, 'Metropolitan');

-- Insert into truck_station_t
INSERT INTO truck_station_t (truck_station_code, station_id, warehouse_capacity, freight_handling_capacity, highway_access) VALUES
('TRKST001', 'STN001', 20000.0000, 5000.0000, 'Direct'),
('TRKST002', 'STN002', 15000.0000, 4000.0000, 'Direct'),
('TRKST003', 'STN003', 25000.0000, 6000.0000, 'Indirect'),
('TRKST004', 'STN004', 18000.0000, 4500.0000, 'Direct'),
('TRKST005', 'STN005', 22000.0000, 5500.0000, 'Indirect'),
('TRKST006', 'STN006', 30000.0000, 7000.0000, 'Direct'),
('TRKST007', 'STN007', 12000.0000, 3000.0000, 'Indirect'),
('TRKST008', 'STN008', 28000.0000, 6500.0000, 'Direct'),
('TRKST009', 'STN009', 10000.0000, 2500.0000, 'Indirect'),
('TRKST010', 'STN010', 35000.0000, 8000.0000, 'Direct');

-- Insert into port_t
INSERT INTO port_t (port_code, station_id, docking_capacity, cargo_handling_equipment) VALUES
('PRT001', 'STN001', 10, 'Cranes, Forklifts'),
('PRT002', 'STN002', 5, 'Forklifts'),
('PRT003', 'STN003', 15, 'Cranes, Conveyors'),
('PRT004', 'STN004', 8, 'Forklifts, Hoists'),
('PRT005', 'STN005', 20, 'Cranes, Stackers'),
('PRT006', 'STN006', 12, 'Forklifts, Conveyors'),
('PRT007', 'STN007', 6, 'Forklifts'),
('PRT008', 'STN008', 18, 'Cranes, Stackers'),
('PRT009', 'STN009', 4, 'Forklifts'),
('PRT010', 'STN010', 25, 'Cranes, Conveyors, Stackers');

-- Insert into route_t
INSERT INTO route_t (route_id, origin, destination, distance, estimated_time) VALUES
('RT001', 'New York', 'Boston', 215.00, '04:00:00'),
('RT002', 'Los Angeles', 'San Francisco', 382.00, '06:30:00'),
('RT003', 'Chicago', 'Detroit', 283.00, '05:15:00'),
('RT004', 'Houston', 'Dallas', 239.00, '04:45:00'),
('RT005', 'Miami', 'Orlando', 235.00, '04:30:00'),
('RT006', 'Seattle', 'Portland', 173.00, '03:45:00'),
('RT007', 'Denver', 'Salt Lake City', 518.00, '09:00:00'),
('RT008', 'Atlanta', 'Charlotte', 245.00, '04:30:00'),
('RT009', 'Phoenix', 'Tucson', 113.00, '02:30:00'),
('RT010', 'Philadelphia', 'Washington DC', 142.00, '03:15:00');

-- Insert into route_stop_t
INSERT INTO route_stop_t (route_station_id, route_id, station_id, sequence_number, arrival_time, departure_time) VALUES
('RST001', 'RT001', 'STN001', '1', '08:00:00', '08:15:00'),
('RST002', 'RT001', 'STN002', '2', '10:00:00', '10:15:00'),
('RST003', 'RT002', 'STN003', '1', '09:00:00', '09:20:00'),
('RST004', 'RT002', 'STN004', '2', '12:00:00', '12:20:00'),
('RST005', 'RT003', 'STN005', '1', '07:00:00', '07:10:00'),
('RST006', 'RT003', 'STN006', '2', '10:00:00', '10:10:00'),
('RST007', 'RT004', 'STN007', '1', '08:30:00', '08:45:00'),
('RST008', 'RT004', 'STN008', '2', '11:00:00', '11:15:00'),
('RST009', 'RT005', 'STN009', '1', '06:00:00', '06:30:00'),
('RST010', 'RT005', 'STN010', '2', '09:00:00', '09:30:00');

-- Insert into destination_t
INSERT INTO destination_t (route_id, destination_id, report, destination) VALUES
('RT001', 'DEST001', 'On time', 'Boston'),
('RT002', 'DEST002', 'Delayed', 'San Francisco'),
('RT003', 'DEST003', 'On time', 'Detroit'),
('RT004', 'DEST004', 'Early', 'Dallas'),
('RT005', 'DEST005', 'On time', 'Orlando'),
('RT006', 'DEST006', 'Cancelled', 'Portland'),
('RT007', 'DEST007', 'Delayed', 'Salt Lake City'),
('RT008', 'DEST008', 'On time', 'Charlotte'),
('RT009', 'DEST009', 'Early', 'Tucson'),
('RT010', 'DEST010', 'On time', 'Washington DC');