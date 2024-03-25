/* 
	SQL Code for performing Data Cleaning, Manipulation and Analysis
	on Cyclistic Rides Dataset from Febuaury 2023 - Januaury 2024

	Data Source: https://divvy-tripdata.s3.amazonaws.com/index.html
*/



-- Creating a new table which will contain the data records of all months

/* 
	The new table 'all_trips_data' was created using the SQL Server Managment Studio.
	All the column names and their data types were the same as of the other tables
*/

-- Inserting all the records from the month tables into the new table "all_trip_data"

INSERT INTO
	Cyclistic_Database..all_trip_data
SELECT * FROM Cyclistic_Database..['202302-divvy-tripdata$']
UNION
SELECT * FROM Cyclistic_Database..['202303-divvy-tripdata$']
UNION
SELECT * FROM Cyclistic_Database..['202304-divvy-tripdata$']
UNION
SELECT * FROM Cyclistic_Database..['202305-divvy-tripdata$']
UNION
SELECT * FROM Cyclistic_Database..['202306-divvy-tripdata$']
UNION
SELECT * FROM Cyclistic_Database..['202307-divvy-tripdata$']
UNION
SELECT * FROM Cyclistic_Database..['202308-divvy-tripdata$']
UNION
SELECT * FROM Cyclistic_Database..['202309-divvy-tripdata$']
UNION
SELECT * FROM Cyclistic_Database..['202310-divvy-tripdata$']
UNION
SELECT * FROM Cyclistic_Database..['202311-divvy-tripdata$']
UNION
SELECT * FROM Cyclistic_Database..['202312-divvy-tripdata$']
UNION
SELECT * FROM Cyclistic_Database..['202401-divvy-tripdata$']

/* Viewing the top 100 rows in descending order by "started_at" column
   to ensure that the merge is successful */

SELECT 
	TOP(100) *
FROM
	Cyclistic_Database..all_trip_data
ORDER BY 
	started_at DESC

/* 
	Transforming Data by creating two new columns:

	1) ride_length - difference between the started_at and ended_at times. This will give us the
	   time it tool for each ride to complete.
	2) day_of_week - the day of the week in which the ride started.

*/

											-- Creating the ride_length column


-- Running a test query to ensure that the transformation is successful
SELECT
	TOP(50) started_at, ended_at, CONVERT(varchar(100), ended_at - started_at, 108) AS ride_length
FROM
	Cyclistic_Database..all_trip_data
ORDER BY
	started_at ASC


-- Adding a new column to the table
ALTER TABLE
	Cyclistic_Database..all_trip_data
ADD
	ride_length varchar(100)


-- Updating the table with the column values
UPDATE
	Cyclistic_Database..all_trip_data
SET
	ride_length = CONVERT(varchar(100), ended_at - started_at, 108)
FROM
	Cyclistic_Database..all_trip_data;


-- Checking the first 50 rows to ensure that the successful transformation has taken place.
SELECT
	TOP(50) *
FROM
	Cyclistic_Database..all_trip_data
ORDER BY
	started_at ASC



											-- Creating the day_of_week column

-- Running a test query to ensure that the transformation is successful
SELECT 
	TOP(50) started_at, DATENAME(weekday, started_at) AS day_of_week
FROM
	Cyclistic_Database..all_trip_data


-- Adding a new column to the table
ALTER TABLE
	Cyclistic_Database..all_trip_data
ADD
	day_of_week nvarchar(100)


-- Updating the table with the column values
UPDATE
	Cyclistic_Database..all_trip_data
SET 
	day_of_week = DATENAME(weekday, started_at)
FROM
	Cyclistic_Database..all_trip_data


-- Checking the first 50 rows to ensure that the successful transformation has taken place.
SELECT
	TOP(50) *
FROM
	Cyclistic_Database..all_trip_data



/*
	Each of the 12 tables were explored and cleaned indivually in MS EXCEL and following conclusions were made:
	
	1) Setting a threshold of minimum and maximum ride lenghts to obtain better accuracy. The minimum threshold is
	   30 seconds and upper threshold is 12 hours. This threshold is set due to the following reasons:
	   a) It is practically impossible for a cycle ride to have duration of less than 30 seconds. Upon examination, these 
		  rides had the same starting and ending station indicating that the rides were practically not conducted. More than
		  half of these rides were from the category "electric bikes" indicating that there might be a starting issue with
		  these type of bikes. Other than that, system or technical issues, or human error might be the causes.
	   b) It is also not possible for a rider to use a bike for more than 12 hours due to limited human capacity. This might
		  also indicate some technical or system errors. It can be also attributed to the fact that the rider might have forgotten
		  to end his/her/zir ride and the timer might have been on for a long time.
	   c) Records above and below these thresholds account for only 2% of the total records in each table. Hence, this data is 
		  is very small compared to the whole. So we can safely remove this data on account of irrevelancy.

Note: An original copy of each table is saved. So, if for any reason, the records with outlier values are required than it is readily 
available.
*/

-- Filtering the records for rides less than 30 seconds

SELECT 
	TOP(50) *
FROM
	Cyclistic_Database..all_trip_data
WHERE 
	ride_length < '00:00:30'


-- Removing those records which have ride_length value less than 30 seconds

DELETE FROM
	Cyclistic_Database..all_trip_data
WHERE
	ride_length < '00:00:30'


-- Filtering those records for rides greater than 12 hours

SELECT 
	*
FROM
	Cyclistic_Database..all_trip_data
WHERE
	ride_length > '12:00:00'


-- Removing those records which have ride_length value greater than 12 hours

DELETE FROM
	Cyclistic_Database..all_trip_data
WHERE
	ride_length > '12:00:00'


-- Retrieving the maximum and minimum values of ride_length to make sure that the removal is successful

SELECT 
	MIN(ride_length) AS min_of_ride_length, MAX(ride_length) AS max_of_ride_length
FROM
	Cyclistic_Database..all_trip_data


-- Finding the total ride count of all 12 months for each member category
SELECT 
	member_casual, COUNT(ride_id) AS total_rides
FROM
	Cyclistic_Database..all_trip_data
GROUP BY
	member_casual


-- Finding the ride count of each member category by month
SELECT 
	MONTH(started_at) AS rides_month, member_casual, COUNT(ride_id) AS ride_count
FROM
	Cyclistic_Database..all_trip_data
GROUP BY
	MONTH(started_at), member_casual
ORDER BY
	rides_month ASC


-- Finding the total ride count by weekday for both member category
SELECT
	 day_of_week, member_casual, COUNT(ride_id) AS ride_count
FROM
	Cyclistic_Database..all_trip_data
GROUP BY
	 day_of_week, member_casual
ORDER BY
	 day_of_week ASC


-- Analyzing the time of each day where most frequent rides occur

-- Creating a new column by the name time_of_day
ALTER TABLE
	Cyclistic_Database..all_trip_data
ADD
	time_of_day nvarchar(255);

UPDATE
	Cyclistic_Database..all_trip_data
SET
	time_of_day = CASE
					WHEN DATEPART(HOUR, started_at) BETWEEN 6 and 11 THEN 'Morning'
					WHEN DATEPART(HOUR, started_at) BETWEEN 12 and 16 THEN 'Afternoon'
					ELSE 'Evening'
					END;

-- Finding the ride count by each time period
SELECT
	 member_casual, time_of_day, COUNT(ride_id) AS ride_count
FROM
	Cyclistic_Database..all_trip_data
GROUP BY
	 member_casual, time_of_day



