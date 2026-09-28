Create database Cab_booking_system;
use Cab_booking_system ;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY ,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    SignupDate DATE,
    City VARCHAR(50)
);

CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY ,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    LicenseNumber VARCHAR(20),
    JoiningDate DATE,
    City VARCHAR(50)
);

CREATE TABLE Cabs (
    CabID INT PRIMARY KEY ,
    DriverID INT,
    CabType VARCHAR(20) CHECK (CabType IN ('Sedan','SUV','Hatchback')),
    RegistrationNumber VARCHAR(20),
    Model VARCHAR(50),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY ,
    CustomerID INT,
    DriverID INT,
    CabID INT,
    BookingDate DATE,
    BookingTime TIME,
    PickupLocation VARCHAR(100),
    DropoffLocation VARCHAR(100),
    Status VARCHAR(20) CHECK (Status IN ('Completed','Cancelled','Ongoing')),
    Fare DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID),
    FOREIGN KEY (CabID) REFERENCES Cabs(CabID)
);

CREATE TABLE TripDetails (
    TripID INT PRIMARY KEY ,
    BookingID INT,
    TripStartTime DATETIME,
    TripEndTime DATETIME,
    DistanceKM DECIMAL(6,2),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY ,
    BookingID INT,
    CustomerID INT,
    DriverRating DECIMAL(2,1),
    Comments VARCHAR(255),
    CancellationReason VARCHAR(100),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, Name, Phone, Email, SignupDate, City) VALUES
(1, 'Rohan Sharma', '9876543210', 'rohan.sharma@mail.com', '2025-01-15', 'Mumbai'),
(2, 'Priya Singh', '9876543211', 'priya.singh@mail.com', '2025-02-10', 'Delhi'),
(3, 'Amit Kumar', '9876543212', 'amit.kumar@mail.com', '2025-01-20', 'Bangalore'),
(4, 'Sneha Patel', '9876543213', 'sneha.patel@mail.com', '2025-03-05', 'Mumbai'),
(5, 'Vikram Rao', '9876543214', 'vikram.rao@mail.com', '2025-02-25', 'Pune'),
(6, 'Anjali Gupta', '9876543215', 'anjali.gupta@mail.com', '2025-04-12', 'Delhi'),
(7, 'Karan Mehta', '9876543216', 'karan.mehta@mail.com', '2025-01-30', 'Bangalore'),
(8, 'Neha Joshi', '9876543217', 'neha.joshi@mail.com', '2025-05-18', 'Mumbai'),
(9, 'Suresh Reddy', '9876543218', 'suresh.reddy@mail.com', '2024-11-22', 'Hyderabad'),
(10, 'Pooja Nair', '9876543219', 'pooja.nair@mail.com', '2025-06-01', 'Chennai'),
(11, 'Arjun Desai', '9876543220', 'arjun.desai@mail.com', '2025-02-14', 'Pune'),
(12, 'Divya Iyer', '9876543221', 'divya.iyer@mail.com', '2025-04-29', 'Chennai'),
(13, 'Rahul Verma', '9876543222', 'rahul.verma@mail.com', '2024-10-03', 'Delhi'),
(14, 'Kavita Bhatt', '9876543223', 'kavita.bhatt@mail.com', '2025-01-08', 'Mumbai'),
(15, 'Sanjay Yadav', '9876543224', 'sanjay.yadav@mail.com', '2025-06-15', 'Hyderabad');
 

INSERT INTO Drivers (DriverID, Name, Phone, LicenseNumber, JoiningDate, City) VALUES
(101, 'Manoj Kumar', '8765432101', 'DL-MH-001', '2024-05-10', 'Mumbai'),
(102, 'Ramesh Yadav', '8765432102', 'DL-DL-002', '2024-06-15', 'Delhi'),
(103, 'Suresh Babu', '8765432103', 'DL-KA-003', '2024-07-20', 'Bangalore'),
(104, 'Dinesh Patil', '8765432104', 'DL-MH-004', '2024-08-05', 'Mumbai'),
(105, 'Ganesh Pawar', '8765432105', 'DL-MH-005', '2024-09-12', 'Pune'),
(106, 'Vijay Singh', '8765432106', 'DL-DL-006', '2024-10-01', 'Delhi'),
(107, 'Anil Kapoor', '8765432107', 'DL-KA-007', '2024-11-18', 'Bangalore'),
(108, 'Sunil Joshi', '8765432108', 'DL-MH-008', '2025-01-25', 'Mumbai'),
(109, 'Ravi Teja', '8765432109', 'DL-TS-009', '2024-12-10', 'Hyderabad'),
(110, 'Manish Tiwari', '8765432110', 'DL-TN-010', '2025-02-08', 'Chennai'),
(111, 'Deepak Chauhan', '8765432111', 'DL-MH-011', '2024-07-30', 'Pune'),
(112, 'Naveen Kumar', '8765432112', 'DL-TN-012', '2025-03-14', 'Chennai');
 

INSERT INTO Cabs (CabID, DriverID, CabType, RegistrationNumber, Model) VALUES
(1, 101, 'Sedan', 'MH12AB1234', 'Honda City'),
(2, 102, 'SUV', 'DL05CD5678', 'Toyota Innova'),
(3, 103, 'Hatchback', 'KA03EF9012', 'Maruti Swift'),
(4, 104, 'Sedan', 'MH14GH3456', 'Hyundai Verna'),
(5, 105, 'SUV', 'MH12IJ7890', 'Mahindra XUV500'),
(6, 106, 'Hatchback', 'DL08KL2345', 'Tata Tiago'),
(7, 107, 'Sedan', 'KA05MN6789', 'Honda Amaze'),
(8, 108, 'SUV', 'MH04OP1122', 'Toyota Fortuner'),
(9, 109, 'Hatchback', 'TS09QR3344', 'Maruti Baleno'),
(10, 110, 'Sedan', 'TN10ST5566', 'Honda City'),
(11, 111, 'SUV', 'MH12UV7788', 'Mahindra Scorpio'),
(12, 112, 'Hatchback', 'TN07WX9900', 'Hyundai i10');
 

INSERT INTO Bookings (BookingID, CustomerID, DriverID, CabID, BookingDate, BookingTime, PickupLocation, DropoffLocation, Status, Fare) VALUES
(121, 1, 101, 1, '2026-01-05', '08:15:00', 'Andheri', 'Bandra', 'Completed', 250.00),
(122, 2, 102, 2, '2026-01-06', '09:30:00', 'Connaught Place', 'Saket', 'Completed', 450.00),
(123, 3, 103, 3, '2026-01-07', '18:45:00', 'Whitefield', 'Koramangala', 'Completed', 320.00),
(124, 2, 104, 4, '2026-01-08', '07:00:00', 'Andheri', 'Powai', 'Cancelled', 0.00),
(125, 4, 101, 1, '2026-01-10', '12:20:00', 'Bandra', 'Andheri', 'Completed', 230.00),
(126, 5, 105, 5, '2026-01-11', '20:10:00', 'Kothrud', 'Hinjewadi', 'Completed', 480.00),
(127, 2, 106, 6, '2026-01-12', '06:50:00', 'Saket', 'Dwarka', 'Cancelled', 0.00),
(128, 6, 102, 2, '2026-01-13', '14:30:00', 'Rohini', 'Connaught Place', 'Completed', 410.00),
(129, 7, 107, 7, '2026-01-14', '17:15:00', 'Koramangala', 'Whitefield', 'Cancelled', 0.00),
(130, 8, 108, 8, '2026-01-17', '08:40:00', 'Powai', 'Andheri', 'Completed', 530.00),
(131, 9, 109, 9, '2026-01-18', '19:00:00', 'Gachibowli', 'Hitech City', 'Completed', 290.00),
(132, 10, 110, 10, '2026-01-19', '10:10:00', 'T Nagar', 'Adyar', 'Completed', 260.00),
(133, 3, 103, 3, '2026-01-20', '09:25:00', 'Koramangala', 'Whitefield', 'Completed', 315.00),
(134, 11, 111, 11, '2026-01-21', '21:00:00', 'Hinjewadi', 'Kothrud', 'Completed', 495.00),
(135, 1, 101, 1, '2026-01-24', '08:05:00', 'Andheri', 'Bandra', 'Completed', 245.00),
(136, 12, 112, 12, '2026-02-02', '11:30:00', 'Adyar', 'T Nagar', 'Completed', 255.00),
(137, 4, 104, 4, '2026-02-03', '15:45:00', 'Powai', 'Bandra', 'Completed', 310.00),
(138, 2, 102, 2, '2026-02-04', '07:20:00', 'Saket', 'Connaught Place', 'Cancelled', 0.00),
(139, 13, 106, 6, '2026-02-05', '13:10:00', 'Dwarka', 'Rohini', 'Completed', 350.00),
(140, 5, 105, 5, '2026-02-07', '18:30:00', 'Kothrud', 'Hinjewadi', 'Completed', 470.00),
(141, 14, 101, 1, '2026-02-08', '09:00:00', 'Bandra', 'Andheri', 'Completed', 270.00),
(142, 7, 107, 7, '2026-02-09', '06:30:00', 'Whitefield', 'Koramangala', 'Cancelled', 0.00),
(143, 3, 103, 3, '2026-02-10', '16:50:00', 'Koramangala', 'Whitefield', 'Completed', 330.00),
(144, 15, 109, 9, '2026-02-11', '20:40:00', 'Hitech City', 'Gachibowli', 'Completed', 295.00),
(145, 8, 108, 8, '2026-02-12', '12:15:00', 'Andheri', 'Powai', 'Completed', 520.00),
(146, 9, 109, 9, '2026-02-14', '17:35:00', 'Gachibowli', 'Hitech City', 'Cancelled', 0.00),
(147, 10, 110, 10, '2026-02-16', '08:50:00', 'Adyar', 'T Nagar', 'Completed', 265.00),
(148, 11, 111, 11, '2026-02-17', '19:20:00', 'Kothrud', 'Hinjewadi', 'Completed', 485.00),
(149, 1, 104, 4, '2026-02-18', '07:45:00', 'Andheri', 'Powai', 'Completed', 235.00),
(150, 3, 103, 3, '2026-02-19', '14:00:00', 'Koramangala', 'Whitefield', 'Completed', 325.00),
(151, 12, 112, 12, '2026-03-02', '10:30:00', 'T Nagar', 'Adyar', 'Cancelled', 0.00),
(152, 13, 106, 6, '2026-03-03', '21:10:00', 'Dwarka', 'Rohini', 'Completed', 355.00),
(153, 4, 101, 1, '2026-03-04', '09:55:00', 'Bandra', 'Andheri', 'Completed', 225.00),
(154, 14, 104, 4, '2026-03-06', '13:25:00', 'Powai', 'Bandra', 'Completed', 305.00),
(155, 2, 102, 2, '2026-03-07', '08:10:00', 'Connaught Place', 'Saket', 'Cancelled', 0.00),
(156, 6, 106, 6, '2026-03-08', '15:30:00', 'Rohini', 'Dwarka', 'Completed', 360.00),
(157, 7, 107, 7, '2026-03-09', '18:00:00', 'Koramangala', 'Whitefield', 'Cancelled', 0.00),
(158, 15, 109, 9, '2026-03-10', '11:40:00', 'Hitech City', 'Gachibowli', 'Completed', 300.00),
(159, 5, 105, 5, '2026-03-11', '20:20:00', 'Hinjewadi', 'Kothrud', 'Completed', 475.00),
(160, 8, 108, 8, '2026-03-13', '07:30:00', 'Powai', 'Andheri', 'Completed', 525.00),
(161, 1, 101, 1, '2026-04-03', '08:25:00', 'Andheri', 'Bandra', 'Completed', 240.00),
(162, 3, 103, 3, '2026-04-04', '17:10:00', 'Koramangala', 'Whitefield', 'Completed', 318.00),
(163, 14, 104, 4, '2026-04-05', '12:00:00', 'Powai', 'Bandra', 'Completed', 300.00),
(164, 6, 106, 6, '2026-04-07', '16:20:00', 'Rohini', 'Dwarka', 'Completed', 365.00),
(165, 2, 102, 2, '2026-04-08', '09:00:00', 'Saket', 'Connaught Place', 'Cancelled', 0.00),
(166, 1, 101, 1, '2026-05-02', '08:10:00', 'Andheri', 'Bandra', 'Completed', 248.00),
(167, 11, 111, 11, '2026-05-03', '19:00:00', 'Kothrud', 'Hinjewadi', 'Completed', 490.00),
(168, 3, 103, 3, '2026-05-05', '18:15:00', 'Koramangala', 'Whitefield', 'Completed', 322.00),
(169, 14, 104, 4, '2026-06-02', '13:00:00', 'Powai', 'Bandra', 'Completed', 308.00),
(170, 1, 101, 1, '2026-06-10', '08:20:00', 'Andheri', 'Bandra', 'Completed', 252.00);
 

INSERT INTO TripDetails (TripID, BookingID, TripStartTime, TripEndTime, DistanceKM) VALUES
(1, 121, '2026-01-05 08:23:00', '2026-01-05 08:50:00', 12.5),
(2, 122, '2026-01-06 09:45:00', '2026-01-06 10:25:00', 18.2),
(3, 123, '2026-01-07 18:55:00', '2026-01-07 19:30:00', 14.0),
(4, 125, '2026-01-10 12:25:00', '2026-01-10 12:55:00', 11.8),
(5, 126, '2026-01-11 20:25:00', '2026-01-11 21:25:00', 38.5),
(6, 128, '2026-01-13 14:40:00', '2026-01-13 15:20:00', 17.0),
(7, 130, '2026-01-17 08:50:00', '2026-01-17 09:40:00', 42.0),
(8, 131, '2026-01-18 19:08:00', '2026-01-18 19:40:00', 13.2),
(9, 132, '2026-01-19 10:18:00', '2026-01-19 10:50:00', 10.8),
(10, 133, '2026-01-20 09:30:00', '2026-01-20 10:05:00', 14.2),
(11, 134, '2026-01-21 21:15:00', '2026-01-21 22:05:00', 39.5),
(12, 135, '2026-01-24 08:12:00', '2026-01-24 08:40:00', 12.2),
(13, 136, '2026-02-02 11:38:00', '2026-02-02 12:05:00', 11.0),
(14, 137, '2026-02-03 16:00:00', '2026-02-03 16:30:00', 16.5),
(15, 139, '2026-02-05 13:20:00', '2026-02-05 13:55:00', 19.0),
(16, 140, '2026-02-07 18:50:00', '2026-02-07 19:35:00', 37.0),
(17, 141, '2026-02-08 09:10:00', '2026-02-08 09:35:00', 13.0),
(18, 143, '2026-02-10 17:05:00', '2026-02-10 17:35:00', 14.8),
(19, 144, '2026-02-11 20:50:00', '2026-02-11 21:20:00', 12.0),
(20, 145, '2026-02-12 12:30:00', '2026-02-12 13:20:00', 45.0),
(21, 147, '2026-02-16 09:05:00', '2026-02-16 09:25:00', 10.5),
(22, 148, '2026-02-17 19:35:00', '2026-02-17 20:20:00', 36.0),
(23, 149, '2026-02-18 07:55:00', '2026-02-18 08:20:00', 12.0),
(24, 150, '2026-02-19 14:10:00', '2026-02-19 14:45:00', 14.5),
(25, 152, '2026-03-03 21:20:00', '2026-03-03 22:00:00', 19.5),
(26, 153, '2026-03-04 10:05:00', '2026-03-04 10:30:00', 11.0),
(27, 154, '2026-03-06 13:35:00', '2026-03-06 14:10:00', 15.8),
(28, 156, '2026-03-08 15:40:00', '2026-03-08 16:20:00', 18.8),
(29, 158, '2026-03-10 11:50:00', '2026-03-10 12:15:00', 12.8),
(30, 159, '2026-03-11 20:35:00', '2026-03-11 21:10:00', 35.5),
(31, 160, '2026-03-13 07:45:00', '2026-03-13 08:05:00', 11.2),
(32, 161, '2026-04-03 08:35:00', '2026-04-03 09:00:00', 12.6),
(33, 162, '2026-04-04 17:20:00', '2026-04-04 17:50:00', 14.6),
(34, 163, '2026-04-05 12:10:00', '2026-04-05 14:00:00', 15.5),
(35, 164, '2026-04-07 16:30:00', '2026-04-07 17:05:00', 19.2),
(36, 166, '2026-05-02 08:18:00', '2026-05-02 08:45:00', 12.4),
(37, 167, '2026-05-03 19:10:00', '2026-05-03 19:55:00', 37.8),
(38, 168, '2026-05-05 18:25:00', '2026-05-05 18:58:00', 14.9),
(39, 169, '2026-06-02 13:08:00', '2026-06-02 13:42:00', 15.0),
(40, 170, '2026-06-10 08:30:00', '2026-06-10 08:58:00', 12.7);
 

INSERT INTO Feedback (FeedbackID, BookingID, CustomerID, DriverRating, Comments, CancellationReason) VALUES
(1, 121, 1, 4.5, 'Smooth and safe ride', NULL),
(2, 122, 2, 4.0, 'Driver was polite', NULL),
(3, 123, 3, 2.6, 'Took a longer route', NULL),
(4, 124, 2, NULL, NULL, 'Driver did not arrive on time'),
(5, 125, 4, 4.2, 'Comfortable cab', NULL),
(6, 126, 5, 3.8, 'Good driving', NULL),
(7, 127, 2, NULL, NULL, 'Customer changed plans'),
(8, 128, 6, 4.7, 'Excellent service', NULL),
(9, 129, 7, NULL, NULL, 'Driver requested cancellation'),
(10, 130, 8, 4.0, 'Pleasant experience', NULL),
(11, 131, 9, 4.0, 'Pleasant experience', NULL),
(12, 132, 10, 3.5, 'Average ride', NULL),
(13, 133, 3, 2.4, 'Rash driving', NULL),
(14, 134, 11, 4.8, 'Very professional driver', NULL),
(15, 135, 1, 4.6, 'Quick and safe', NULL),
(16, 136, 12, 3.9, 'Good experience overall', NULL),
(17, 137, 4, 4.0, 'Reached on time', NULL),
(18, 138, 2, NULL, NULL, 'High fare estimate'),
(19, 139, 13, 4.1, 'Driver was friendly', NULL),
(20, 140, 5, 3.7, 'Reached on time', NULL),
(21, 141, 14, 4.4, 'Clean cab and courteous driver', NULL),
(22, 142, 7, NULL, NULL, 'Traffic delay led to cancellation'),
(23, 143, 3, 2.5, 'Driver seemed distracted', NULL),
(24, 144, 15, 4.3, 'Very satisfied', NULL),
(25, 145, 8, 4.0, 'Good ride overall', NULL),
(26, 146, 9, NULL, NULL, 'Customer no-show'),
(27, 147, 10, 3.6, 'Decent service', NULL),
(28, 148, 11, 4.9, 'Outstanding driver', NULL),
(29, 149, 1, 4.5, 'Reliable as always', NULL),
(30, 150, 3, 2.7, 'Driver seemed distracted', NULL),
(31, 151, 12, NULL, NULL, 'Price surge issue'),
(32, 152, 13, 4.2, 'Good driving skills', NULL),
(33, 153, 4, 4.4, 'Comfortable and quick', NULL),
(34, 154, 14, 3.9, 'Satisfactory', NULL),
(35, 155, 2, NULL, NULL, 'Customer changed plans'),
(36, 156, 6, 4.0, 'Good experience', NULL),
(37, 157, 7, NULL, NULL, 'Driver cancelled due to distance'),
(38, 158, 15, 4.5, 'Very good driver', NULL),
(39, 159, 5, 3.8, 'Smooth trip', NULL),
(40, 160, 8, 4.3, 'Great service', NULL),
(41, 161, 1, 4.6, 'Reliable as always', NULL),
(42, 162, 3, 2.3, 'Rough driving experience', NULL),
(43, 163, 14, 3.5, 'Took a while but okay', NULL),
(44, 164, 6, 4.1, 'Good ride', NULL),
(45, 165, 2, NULL, NULL, 'High fare estimate'),
(46, 166, 1, 4.7, 'Excellent as usual', NULL),
(47, 167, 11, 4.8, 'Great long drive experience', NULL),
(48, 168, 3, 2.5, 'Driver distracted again', NULL),
(49, 169, 14, 4.0, 'Good ride', NULL),
(50, 170, 1, 4.6, 'Consistent quality', NULL);
 
 #1. Identify customers who have completed the most bookings?
 
 SELECT c.CustomerID, c.Name, COUNT(*) AS CompletedBookings
FROM Bookings b
JOIN Customers c ON c.CustomerID = b.CustomerID
WHERE b.Status = 'Completed'
GROUP BY c.CustomerID, c.Name
ORDER BY CompletedBookings DESC
LIMIT 5;  ------  #Rohan Sharma and Amit Kumar has completed most bookings.

#2. Find customers who have canceled more than 30% of their total bookings. What could be the reason for frequent cancellations?

Select 
	c.CustomerID, c.Name, count(*) as Total_Bookings,
    Sum(Case when b.Status ='Cancelled' Then 1 else 0 end) as Cancelled_Bookings,
    round(sum(Case when b.Status ='Cancelled' then 1 else 0 end) *100.0 / Count(*), 2) as CancelPercent 
    from Bookings b
    Join Customers c on c.CustomerID = b.CustomerID 
    Group By c.customerID, c.Name
    Having CancelPercent >30 
    Order By CancelPercent Desc; ----- # (Reason - Driver Delay, High Fares, Traffic)   
    
#3. Determine the busiest day of the week for bookings. How can the company optimize cab availability on peak days?

Select DAYNAME(BookingDate) as Day_Name,
	Count(*) as Total_Bookings from Bookings  
	Group By DAYNAME(BookingDate)
	Order by Total_Bookings DESC;
#4. Identify drivers who have received an average rating below 3.0 in the past three months. What strategies can be implemented to improve their performance?

Select d.DriverID, d.Name,
Round(Avg(F.DriverRating),2) as Average_rating
From Drivers d 
Join Bookings b on d.DriverID = b.DriverID
Join Feedback f on b.BookingID = f.BookingID
where f.DriverRating is Not Null 
Group by d.DriverID, d.Name
Having Avg(f.DriverRating)<3; ----- # Reason should may be customers are not comfartable with his driving skills.

#5 Find the top 5 drivers who have completed the longest trips in terms of distance. What does this say about their working patterns?

Select d.DriverID, d.Name,
Max(t.DistanceKM) as Longest_Trip
from Drivers d
Join Bookings b on d.DriverID = b.DriverID 
Join TripDetails t on b.BookingID = t.BookingID
Group by d.DriverID, d.Name
Order by Longest_Trip  DESC
Limit 5; --------- # Drivers handling long trips generate higher revenue.

#6 . Identify drivers with a high percentage of canceled trips. Could this indicate driver unreliability?

Select d.DriverID , d.Name,
Count(*) as Total_trips,
Sum( Case when b.Status='Cancelled' then 1 else 0 end) as Cancelled,
Round(sum(case when b.Status='Cancelled' then 1 else 0 end)*100/Count(*),2) as Cancel_Percentage 
From Drivers d
Join Bookings b on d.DriverID = b.DriverID
Group by d.DriverID, d.Name
Having Cancel_Percentage > 30; ------ # May indicate driver unreliability or route rejection.

#7 . Calculate the total revenue generated by completed bookings in the last 6 months. How has the revenue trend changed over time?
 
 SELECT sum(Fare) AS Total_Revenue
from Bookings
where Status='Completed'
and BookingDate >= DATE_SUB(
(Select MAX(BookingDate) From Bookings),
Interval 6 Month);

#8 . Identify the top 3 most frequently traveled routes based on PickupLocation and DropoffLocation. Should the company allocate more cabs to these routes?

Select PickupLocation,
DropoffLocation, count(*) as Trips
from Bookings
where Status='Completed'
Group by PickupLocation,DropoffLocation
Order by Trips DESC
Limit 3; ------- # Arrange more cabs on these routes.

#9 . Determine if higher-rated drivers tend to complete more trips and earn higher fares. Is there a direct correlation between driver ratings and earnings?
 
 Select d.DriverID,d.Name,
Round(Avg(f.DriverRating),2) as Avg_Rating,
Count(b.BookingID) as Trips,
Sum(b.Fare) as Earnings
from Drivers d
JOIN Bookings b ON d.DriverID=b.DriverID
JOIN Feedback f ON b.BookingID=f.BookingID
where b.Status='Completed'
Group by d.DriverID,d.Name
Order by Avg_Rating DESC; -------- # Higher-rated drivers generally complete more trips and earn more.

#10 . Analyze the average waiting time (difference between booking time and trip start time) for different pickup locations. How can this be optimized to reduce delays?

Select b.PickupLocation,
Round(Avg(TIMESTAMPDIFF(
minute,Concat(b.BookingDate,' ',b.BookingTime),
t.TripStartTime)),2) AS Avg_Wait_Minutes
From Bookings b
JOIN TripDetails t
on b.BookingID=t.BookingID
Group by b.PickupLocation
Order by Avg_Wait_Minutes DESC; -------- # Place drivers closer to high-wait locations.

#11 . Identify the most common reasons for trip cancellations from customer feedback.What actions can be taken to reduce cancellations?

Select CancellationReason,
Count(*) as Frequency
from Feedback
where CancellationReason is NOT NULL
Group by CancellationReason
Order by Frequency DESC;
#12 . Find out whether shorter trips (low-distance) contribute significantly to revenue.Should the company encourage more short-distance rides?

Select case 
when t.DistanceKM < 15 THEN 'Short Trip'
Else 'Long Trip' End as Trip_Type,
Count(*) as Trips,
Sum(b.Fare) as Revenue
From TripDetails t
JOIN Bookings b
on t.BookingID=b.BookingID
Group by Trip_Type; ------- # Short trips happen often and bring in a lot of revenue.


#13 . Compare the revenue generated from 'Sedan' and 'SUV' cabs. Should the company invest more in a particular vehicle type?

Select c.CabType,
sum(b.Fare) as Revenue
from Cabs c
JOIN Bookings b
on c.CabID=b.CabID
where b.Status='Completed'
group by c.CabType ; --------- # SUV generate the Highest Sales.

#14. Predict which customers are likely to stop using the service based on their last booking date and frequency of rides. How can customer retention be improved?
Select c.CustomerID,
c.Name, max(b.BookingDate) as Last_Booking,
Count(*) as Total_Bookings
From Customers c
JOIN Bookings b
on c.CustomerID=b.CustomerID
Group by c.CustomerID,c.Name
Having max(b.BookingDate) < Date_Sub(
(Select Max(BookingDate) from Bookings),
IntervaL 60 Day);  ------- # Loyalty rewards , Personalized discounts , Referral bonuses.

#15 Analyze whether weekend bookings differ significantly from weekday bookings.Should the company introduce dynamic pricing based on demand?

Select case
when Dayofweek(BookingDate) IN (1,7)
Then 'Weekend'
Else 'Weekday'
End as Booking_Type,
Count(*) as Total_Bookings,
sum(Fare) as Revenue
From Bookings
Where Status='Completed'
Group by Booking_Type; -------- # If weekend demand is outsatnding higher: Apply dynamic pricing. Increase active drivers.
 