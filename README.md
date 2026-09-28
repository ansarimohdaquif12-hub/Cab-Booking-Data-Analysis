# Cab-Booking-Data-Analysis
SQL Data Analysis Project for Cab Booking System
# 🚕 Cab Booking System — SQL Data Analysis Project

## 📌 Project Overview

The **Cab Booking System SQL Project** is a database and data analysis project developed using **MySQL**.

The project represents a cab-booking business where customers book cabs, drivers complete trips, and customers provide feedback. SQL queries are used to analyze bookings, cancellations, revenue, drivers, customers, routes, trip distances, and other business-related information.

The main objective of this project is to use SQL to answer real-world business questions and generate useful insights from the cab booking data.

---

## 🎯 Project Objectives

* Design a relational database for a cab booking system.
* Store customer, driver, cab, booking, trip, and feedback information.
* Use SQL queries to analyze business performance.
* Identify customer booking and cancellation patterns.
* Analyze driver performance and ratings.
* Analyze revenue generated from completed bookings.
* Identify frequently traveled routes.
* Analyze trip distances and waiting times.
* Understand common cancellation reasons.
* Compare revenue across different cab types.
* Analyze weekday and weekend booking patterns.

---

## 🛠️ Tools & Technologies

* **Database:** MySQL
* **Language:** SQL
* **Database Design:** Relational Database
* **Project Type:** SQL Data Analysis / Business Intelligence
* **Repository:** GitHub

---

## 🗄️ Database Structure

The database is named:

```sql
Cab_booking_system
```

The project contains the following six tables:

### 1. Customers

Stores customer information such as:

* Customer ID
* Name
* Phone
* Email
* Signup Date
* City

### 2. Drivers

Stores driver information such as:

* Driver ID
* Name
* Phone
* License Number
* Joining Date
* City

### 3. Cabs

Stores cab information such as:

* Cab ID
* Driver ID
* Cab Type
* Registration Number
* Model

Cab types include:

* Sedan
* SUV
* Hatchback

### 4. Bookings

Stores booking information such as:

* Booking ID
* Customer ID
* Driver ID
* Cab ID
* Booking Date
* Booking Time
* Pickup Location
* Drop-off Location
* Booking Status
* Fare

Booking status includes:

* Completed
* Cancelled
* Ongoing

### 5. TripDetails

Stores trip-related information such as:

* Trip ID
* Booking ID
* Trip Start Time
* Trip End Time
* Distance in KM

### 6. Feedback

Stores customer feedback and cancellation information such as:

* Feedback ID
* Booking ID
* Customer ID
* Driver Rating
* Comments
* Cancellation Reason

---

## 🔗 Database Relationships

The project uses primary keys and foreign keys to connect the tables.

```text
Customers
    │
    └── Bookings
          │
          ├── Drivers
          │
          ├── Cabs
          │
          └── TripDetails
          
Bookings
    │
    └── Feedback
```

The relationships help combine information from multiple tables for analysis.

For example:

* Customers → Bookings
* Drivers → Bookings
* Cabs → Bookings
* Bookings → TripDetails
* Bookings → Feedback

---

## 📊 Business Questions & SQL Analysis

This project contains **15 business questions** that are answered using SQL queries.

### 1. Customers with the Most Completed Bookings

Identifies customers who completed the highest number of bookings.

**Finding:** Rohan Sharma and Amit Kumar have completed the most bookings in the provided analysis.

---

### 2. Customers with More Than 30% Cancellation Rate

Identifies customers whose cancelled bookings are more than 30% of their total bookings.

The analysis also considers possible cancellation reasons such as:

* Driver delay
* High fares
* Traffic
* Customer changing plans

---

### 3. Busiest Day of the Week

Analyzes the number of bookings for each day of the week to identify the busiest booking day.

This can help the company plan cab availability according to demand.

---

### 4. Drivers with Average Rating Below 3.0

Identifies drivers whose average customer rating is below 3.0.

The analysis can help identify drivers who may need improvement in areas such as driving skills, customer service, and overall ride experience.

---

### 5. Drivers Handling the Longest Trips

Identifies the top 5 drivers based on the longest trip distance.

The analysis provides an understanding of drivers handling longer-distance trips, which can contribute to higher revenue.

---

### 6. Drivers with High Cancellation Percentage

Identifies drivers with a cancellation percentage greater than 30%.

A high cancellation percentage may indicate issues such as driver reliability or route rejection and can be investigated further.

---

### 7. Total Revenue from Completed Bookings

Calculates the total revenue generated from completed bookings during the analyzed six-month period.

This helps understand the financial performance of the cab booking business.

---

### 8. Top 3 Frequently Traveled Routes

Identifies the top 3 routes based on pickup and drop-off locations.

The analysis can help the company understand high-demand routes and consider allocating more cabs to those routes.

---

### 9. Driver Ratings vs Trips and Earnings

Compares:

* Average driver rating
* Number of completed trips
* Total earnings

The analysis explores whether higher-rated drivers tend to complete more trips and generate higher fares.

---

### 10. Average Waiting Time by Pickup Location

Calculates the average waiting time between the booking time and trip start time for different pickup locations.

This can help identify locations where customers experience longer waiting times.

Possible optimization includes placing drivers closer to high-wait locations.

---

### 11. Common Reasons for Trip Cancellations

Analyzes customer feedback to identify the most common cancellation reasons.

This can help the company understand why cancellations happen and develop strategies to reduce them.

---

### 12. Short Trips vs Revenue

Categorizes trips into:

* Short Trip — less than 15 KM
* Long Trip — 15 KM or more

The analysis compares the number of trips and revenue generated by each category.

---

### 13. Sedan vs SUV Revenue

Compares revenue generated by different cab types, particularly:

* Sedan
* SUV

The analysis in the project indicates that SUVs generate the highest sales among the analyzed cab types.

---

### 14. Customers Who May Stop Using the Service

Identifies customers whose last booking was more than 60 days before the latest booking date in the dataset.

Possible customer-retention strategies include:

* Loyalty rewards
* Personalized discounts
* Referral bonuses

---

### 15. Weekend vs Weekday Bookings

Compares:

* Total bookings
* Revenue

between weekend and weekday bookings.

This analysis can help the company understand demand patterns and evaluate whether demand-based pricing and additional active drivers may be useful.

---

## 🧠 SQL Concepts Used

The project demonstrates several important SQL concepts:

* `CREATE DATABASE`
* `CREATE TABLE`
* Primary Keys
* Foreign Keys
* `INSERT INTO`
* `SELECT`
* `WHERE`
* `JOIN`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `LIMIT`
* Aggregate Functions

  * `COUNT()`
  * `SUM()`
  * `AVG()`
  * `MAX()`
* `CASE`
* `ROUND()`
* Date Functions

  * `DAYNAME()`
  * `DAYOFWEEK()`
  * `DATE_SUB()`
* `TIMESTAMPDIFF()`
* Subqueries
* Conditional aggregation

---

## 📁 Project Files

```text
Cab-Booking-SQL-Project/
│
├── Capstone_Project.sql
└── README.md
```

### `Capstone_Project.sql`

Contains:

* Database creation
* Table creation
* Sample data
* Relationships
* Business analysis queries
* Query-based findings

---

## 🔍 Key Areas of Analysis

The project focuses on the following business areas:

| Area            | Analysis                                |
| --------------- | --------------------------------------- |
| 👤 Customers    | Bookings, cancellations and retention   |
| 🚗 Drivers      | Ratings, trips and cancellations        |
| 🚕 Cabs         | Cab types and revenue                   |
| 📅 Bookings     | Demand and booking patterns             |
| 🛣️ Routes      | Frequently traveled routes              |
| 💰 Revenue      | Completed booking revenue               |
| ⏱️ Waiting Time | Pickup-location delays                  |
| ⭐ Feedback      | Driver ratings and cancellation reasons |
| 📍 Trips        | Distance and trip patterns              |

---

## 📈 Business Insights

Based on the SQL analysis included in this project:

* Customer booking activity can be used to identify frequent customers.
* High cancellation percentages can help identify areas requiring investigation.
* Driver ratings can be used to monitor service quality.
* Long-distance trips can contribute significantly to driver earnings and business revenue.
* Frequently traveled routes can help in planning cab availability.
* Waiting-time analysis can help improve driver allocation.
* Cancellation reasons can help the company understand customer and driver issues.
* Short and long trips can be compared to understand their contribution to revenue.
* Different cab types can be compared based on revenue generation.
* Customers with long gaps between bookings can be targeted with retention strategies.
* Weekend and weekday booking patterns can help with demand planning.

---

## 💡 Possible Business Improvements

Based on the analysis, the cab company can consider:

1. Improving driver availability during high-demand periods.
2. Monitoring drivers with high cancellation rates.
3. Providing training to drivers with consistently low ratings.
4. Allocating more cabs to frequently traveled routes.
5. Positioning drivers closer to locations with high waiting times.
6. Analyzing common cancellation reasons and taking corrective actions.
7. Using loyalty programs and personalized offers for inactive customers.
8. Monitoring demand differences between weekdays and weekends.
9. Evaluating cab-type performance based on revenue.
10. Using SQL-based reports to support regular business decisions.

---

## ▶️ How to Run the Project

### Step 1 — Install MySQL

Install **MySQL Server** and **MySQL Workbench**.

### Step 2 — Open the SQL File

Open:

```text
Capstone_Project.sql
```

in MySQL Workbench.

### Step 3 — Execute the Script

Run the complete SQL script.

The script will:

1. Create the `Cab_booking_system` database.
2. Create the required tables.
3. Insert the sample data.
4. Run the analysis queries.

### Step 4 — Explore the Queries

After creating the database, execute the individual analysis queries to explore the business questions and results.

---

## 👨‍💻 Project Purpose

This project was created as a practical **SQL Data Analysis / Business Intelligence project** to demonstrate the ability to work with relational databases and solve real-world business problems using SQL.

It demonstrates how raw transactional data can be transformed into meaningful business insights using SQL queries.

---

## 📌 Conclusion

The **Cab Booking System SQL Project** demonstrates the use of MySQL for database creation, data management, relational joins, aggregation, date analysis, and business intelligence.

The project focuses on real-world questions related to customers, drivers, bookings, cancellations, trips, feedback, routes, and revenue.

Overall, the project provides practical experience in using SQL to analyze business data and support data-driven decision-making.

---

## ⭐ Skills Demonstrated

**SQL | MySQL | Data Analysis | Relational Database | Business Intelligence | Data Cleaning | Aggregation | Joins | Subqueries | Business Problem Solving**

---

## 📬 Project Links

**GitHub:** Add your GitHub repository link here

**LinkedIn:** Add your LinkedIn profile link here

---

### 📄 Dataset & SQL Script

The complete database structure, sample records, and analysis queries are available in:

`Capstone_Project.sql`
