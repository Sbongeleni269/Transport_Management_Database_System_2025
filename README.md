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

 - Eclipse → Right-click project → Properties → Java Build Path → Libraries → Add External JAR → select mysql-connector-java-8.0.x.jar.
   
  - Update DB credentials in TransportSystemGUI.java:
  
     - conn = DriverManager.getConnection(
     - 
           - "jdbc:mysql://localhost:3306/transportsystem",
           - "root",        // your MySQL username
           - "yourpassword" // your MySQL password
       
     - )
-------------------------------------------------------------------------------------------------------------------------------------------

## Database Summary
-------------------------------------------------------------------------------------------------------------------------------------------

- Available tables in my Database

 - If you click a table that is not available in my database dialogue box will appear notifying you.
 - ![img alt](https://github.com/Sbongeleni269/Transport_Management_Database_System_2025/blob/03431923599b75b3a0429bafa86c686fdcf7cff4/Images/Project%20Screenshorts/List%20of%20tables%20in%20DB.png)

- Script Screenshort (Part of the whole script)
  
 - ![img alt](https://github.com/Sbongeleni269/Transport_Management_Database_System_2025/blob/03431923599b75b3a0429bafa86c686fdcf7cff4/Images/Project%20Screenshorts/Scripts.png)
 - Script used to insert data to my database(To check if my database works)
 - Part of Script
   
  - ![img alt](https://github.com/Sbongeleni269/Transport_Management_Database_System_2025/blob/03431923599b75b3a0429bafa86c686fdcf7cff4/Images/Project%20Screenshorts/Data%20scripts.png)


-------------------------------------------------------------------------------------------------------------------------------------------

## Using the Application
-------------------------------------------------------------------------------------------------------------------------------------------

- THis is the front end
  
 - ![img alt](https://github.com/Sbongeleni269/Transport_Management_Database_System_2025/blob/03431923599b75b3a0429bafa86c686fdcf7cff4/Images/Project%20Screenshorts/Front%20end%20init.png)
   
- Select a table from the dropdown.
  
 - ![img alt](https://github.com/Sbongeleni269/Transport_Management_Database_System_2025/blob/03431923599b75b3a0429bafa86c686fdcf7cff4/Images/Project%20Screenshorts/Drop%20down%20list.png)

- View data: Click View Tables or Load button.
  
 - ![img alt](https://github.com/Sbongeleni269/Transport_Management_Database_System_2025/blob/03431923599b75b3a0429bafa86c686fdcf7cff4/Images/Project%20Screenshorts/After%20clicking%20view%20table.png)

- Insert data: Fill in the dynamic fields at the bottom → Click Inser.
  
 - ![img alt](https://github.com/Sbongeleni269/Transport_Management_Database_System_2025/blob/03431923599b75b3a0429bafa86c686fdcf7cff4/Images/Project%20Screenshorts/Insert%20Add%20button.png)

- Results to this...
  
 - ![img alt](https://github.com/Sbongeleni269/Transport_Management_Database_System_2025/blob/03431923599b75b3a0429bafa86c686fdcf7cff4/Images/Project%20Screenshorts/AFter%20Insert%20button.png)
   
- Delete a row: Select a row → Click Delete Data.
  
 - ![img alt](https://github.com/Sbongeleni269/Transport_Management_Database_System_2025/blob/03431923599b75b3a0429bafa86c686fdcf7cff4/Images/Project%20Screenshorts/delete%20data%20button.png)
   
- Delete by ID: Click Delete by ID → Enter the primary key → Click OK.
  
 - ![img alt](https://github.com/Sbongeleni269/Transport_Management_Database_System_2025/blob/03431923599b75b3a0429bafa86c686fdcf7cff4/Images/Project%20Screenshorts/Delete%20by%20Id.png)
-------------------------------------------------------------------------------------------------------------------------------------------

## Tips
-------------------------------------------------------------------------------------------------------------------------------------------

- Make sure MySQL is running before opening the app.
- Only tables with primary keys can use Delete by ID.
- Input fields adjust automatically based on table columns.
-------------------------------------------------------------------------------------------------------------------------------------------
