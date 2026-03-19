-------------------------------------------------------------------------------------------------------------------------------------------
# Transport Management Database System 2025 – Quick Start
-------------------------------------------------------------------------------------------------------------------------------------------
# Overview

A Java GUI application to manage transport operations. View, insert, and delete data in your MySQL database dynamically.

## Requirements
-------------------------------------------------------------------------------------------------------------------------------------------

- Java JDK 8+
- MySQL 8.0
- MySQL Connector/J (mysql-connector-java-8.0.x.jar)
- Eclipse IDE (or any Java IDE)

-------------------------------------------------------------------------------------------------------------------------------------------

## Setup
-------------------------------------------------------------------------------------------------------------------------------------------

- Import project into your IDE.
- Setup MySQL:
- Create database: transportsystem
- Import provided SQL scripts to create tables.
- Add MySQL Connector/J to project:
- 
-- Eclipse → Right-click project → Properties → Java Build Path → Libraries → Add External JAR → select mysql-connector-java-8.0.x.jar.
-- Update DB credentials in TransportSystemGUI.java:
  
--- conn = DriverManager.getConnection(

---- "jdbc:mysql://localhost:3306/transportsystem",
---- "root",        // your MySQL username
---- "yourpassword" // your MySQL password

--- );
-------------------------------------------------------------------------------------------------------------------------------------------

## Using the Application
-------------------------------------------------------------------------------------------------------------------------------------------

- Select a table from the dropdown.
- ![My System Screenshot](https://example.com/transport_screenshot.pn)
- View data: Click View Tables.
- Insert data: Fill in the dynamic fields at the bottom → Click Insert Data.
- Delete a row: Select a row → Click Delete Data.
- Delete by ID: Click Delete by ID → Enter the primary key → Click OK.
-------------------------------------------------------------------------------------------------------------------------------------------

## Tips
-------------------------------------------------------------------------------------------------------------------------------------------

- Make sure MySQL is running before opening the app.
- Only tables with primary keys can use Delete by ID.
- Input fields adjust automatically based on table columns.
-------------------------------------------------------------------------------------------------------------------------------------------
