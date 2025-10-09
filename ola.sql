create database ola;
use ola;
#retrieve all successful bookings
create view Successful_bookings as 
SELECT * FROM bookings
where Booking_Status ='Success';
select * from Successful_bookings; 

#2 avg ride distance for each vechcile type
CREATE VIEW  ride_distance_for_each_vehicle as
select Vehicle_type ,avg(Ride_Distance)
 as avg_distance from bookings 
 group by Vehicle_type;
 
 #get the total number of canceled rides by customers:
 CREATE VIEW canceled__ride_by_customers as
 SELECT COUNT(*) FROM bookings
 WHERE Booking_Status="Canceled by Customer";
 SELECT * from canceled__ride_by_customers;
 
 #list the top 5 customers who booked the highest no of rides
CREATE VIEW top_5_customers as
 SELECT Customer_ID,COUNT(Booking_ID) as total_rides
 FROM bookings
 GROUP BY Customer_ID
 ORDER BY total_rides DESC LIMIT 5;
 select * from top_5_customers;
 
 #GET the no of rides canceled by drivers due to Personal and Car-related issues
 CREATE VIEW rides_canceled_by_drivers_due_to_P_and_C_issues as
 select count(*) from bookings 
 where Canceled_Rides_by_Driver="Personal & Car related issue";
 select * from rides_canceled_by_drivers_due_to_P_and_C_issues;
SELECT V_TAT
FROM bookings
LIMIT 5;

SET SQL_SAFE_UPDATES = 0;
UPDATE bookings
SET 
    Date = IFNULL(NULLIF(Date, ''), 'NA'),
    Time = IFNULL(NULLIF(Time, ''), 'NA'),
    Booking_ID = IFNULL(NULLIF(Booking_ID, ''), 'NA'),
    Booking_Status = IFNULL(NULLIF(Booking_Status, ''), 'NA'),
    Customer_ID = IFNULL(NULLIF(Customer_ID, ''), 'NA'),
    Vehicle_Type = IFNULL(NULLIF(Vehicle_Type, ''), 'NA'),
    Pickup_Location = IFNULL(NULLIF(Pickup_Location, ''), 'NA'),
    Drop_Location = IFNULL(NULLIF(Drop_Location, ''), 'NA'),
    V_TAT = IFNULL(NULLIF(V_TAT, ''), 'NA'),
    C_TAT = IFNULL(NULLIF(C_TAT, ''), 'NA'),
    Canceled_Rides_by_Customer = IFNULL(NULLIF(Canceled_Rides_by_Customer, ''), 'NA'),
    Canceled_Rides_by_Driver = IFNULL(NULLIF(Canceled_Rides_by_Driver, ''), 'NA'),
    Incomplete_Rides = IFNULL(NULLIF(Incomplete_Rides, ''), 'NA'),
    Incomplete_Rides_Reason = IFNULL(NULLIF(Incomplete_Rides_Reason, ''), 'NA'),
    Payment_Method = IFNULL(NULLIF(Payment_Method, ''), 'NA'),
    Driver_Ratings = IFNULL(NULLIF(Driver_Ratings, ''), 'NA'),
    Customer_Rating = IFNULL(NULLIF(Customer_Rating, ''), 'NA'),
    `Vehicle Images` = IFNULL(NULLIF(`Vehicle Images`, ''), 'NA');
    SET SQL_SAFE_UPDATES = 1;
    
#find the max and min driver ratings for prime sedan bookings:
CREATE VIEW max_and_min_driver_ratings AS 
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type="Prime Sedan";
select * from max_and_min_driver_ratings;

#retrieve all rides where payment mode was using UPI:
CREATE VIEW UPI_PAYMENT AS
SELECT * FROM bookings where Payment_Method="UPI";

#FIND THE AVG CUSTOMER RATING PER VECHILE TYPE:
SELECT Vehicle_Type,avg(Customer_Rating) as avg_customer_rating
FROM bookings 
group by Vehicle_Type;

#calculate the total booking value of rides completed succesfully:
CREATE VIEW  total_success_rides_value as
SELECT sum(Booking_Value) as  total_success_rides_value
from  bookings where Booking_Status="success";
select * from  total_success_rides_value;
 
#list all incomplete rides along with the reason
CREATE VIEW Incomplete_Rides_Reason  as
SELECT Booking_ID,Incomplete_Rides_Reason 
from bookings
where Incomplete_Rides="Yes";
select * from Incomplete_Rides_Reason ;



 