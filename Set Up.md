**===========================**

**Transport Management System**

**===========================**

**Overview**

**===========================**



The Transport Management System is a Java-based GUI application that allows users to manage transportation operations. Users can view, insert, and delete data in a MySQL database. The system supports dynamic interaction with all tables in the database without hardcoding table structures.

===============================================================================================================



Features

=========



**View Tables**: Select any table from the database and view its contents.



**Insert Data**: Dynamically insert new rows into the selected table using input fields generated from the table structure.



**Delete Data**: Delete selected rows directly from the table view.



**Delete by ID**: Delete a specific entry by entering the primary key value.



**Dynamic Form Fields**: Input fields adjust based on the selected table.



**Requirements**

**============**



**Java JDK 8 or higher**



**Eclipse IDE (or any Java IDE)**



**MySQL Server 8.0**



**MySQL Connector/J (compatible with MySQL 8.0, e.g., mysql-connector-java-8.0.x.jar)**

**===============================================================================================================**



**Installation \& Setup**

**===============================================================================================================**



Clone or download the project to your computer.



**Set up MySQL database:**

**======================**



Create a database (e.g., transportsystem).



Import the SQL scripts (tables.sql) included in this project to create all tables and relationships.



**Add MySQL Connector/J to your project build path:**

**=================================================**



In Eclipse: Right-click project → Properties → Java Build Path → Libraries → Add External JARs → Select mysql-connector-java-8.0.x.jar.

===============================================================================================================

**Configure database connection in TransportSystemGUI.java:**

**=========================================================**



conn = DriverManager.getConnection(

&#x20;   "jdbc:mysql://localhost:3306/transportsystem",

&#x20;   "root",        // your MySQL username

&#x20;   "yourpassword" // your MySQL password

);

===============================================================================================================



**Run the application:**

**====================**



Right-click TransportSystemGUI.java → Run As → Java Application.

===============================================================================================================



**How to Use**

**===========**



Select a Table from the dropdown list at the top.



**View Table Data:**

**===============**



Click View Tables to display the selected table in the main panel.



**Insert Data:**

**============**



Fill in the fields shown at the bottom (these are generated dynamically based on the table columns).



Click Insert Data to add a new record.



**Delete Data:**

**============**



Select a row in the table.



Click Delete Data to remove that row.



**Delete by ID:**

**=============**



**Click Delete by ID.**

**==================**



Enter the primary key value of the record you want to delete.

===============================================================================================================



**Notes**

**=====**



Ensure the database is running before launching the application.



Only tables with primary keys can use Delete by ID.



The application dynamically adjusts input fields to match the selected table, so no hardcoded changes are necessary when tables are added or updated.

===============================================================================================================



**Troubleshooting**

**===============**



**JDBC Driver not found**: Ensure the MySQL Connector/J JAR is added to the project build path.



**Cannot connect to database**: Verify MySQL is running and the connection URL, username, and password are correct.



**Table not found errors**: Make sure the database and tables exist, and their names match the dropdown.



===============================================================================================================

**Author**:



Sbongeleni Magudulela



A Computer Science Graduate

