# Comparative Analysis of Cyclistic Bike Users

## Introduction
Cyclistic is a bike-share fictional company in Chicago. There are two categories of riders according to its pricing plan - casual riders and annual members. Those who purchase single or full ride passes are referred to as casual riders and those who purchase annual memberships are called Cyclistic members.

## Project Overview
The goal of this project was to analyze how the casual riders and annual members use bikes differently. The project utilized the last 12 months data of Cyclistic bike trips data from Feb 2023 - Jan 2024. It was oberved that the casual riders prefer weekends with longer trips for leisure, while annual members favor weekdays with shorter commutes for work/regular purposes.

## Business Understanding
The Cylclistic financial team believes that the company can make significant growth by increasing the number of annual memberships. For this purpose, the marketing analytics team, lead by Lily Moreno, have to devise a marketing strategy with the aim to convert the casual riders into annual members. Hence, it is important to understand the different riding behaviours of both members.

## Data Understanding
The data for Cyclistic bike trips came from "https://divvy-tripdata.s3.amazonaws.com/index.html". Data for the past 12 months, from February 1, 2023, to January 31, 2024 (inclusive) was used. The data consisted of approximately 5.67 million unique trips and composed of 13 fields. The fields included information on type of ride, member type, starting and ending times and stations along with geographical coordinates. The number card below shows the breadown of rides conducted by both members:

![Sheet 1](https://github.com/kamranshafikhan/Comparative_Analysis_of_Cyclistic_Bike_Users/assets/61063685/9b24e011-93b2-46a3-b868-a24eb77c968a)

## Tools Used
* MS Excel -  Data Exploration and Cleaning
* MS SQL - Data Cleaning, Transformation and Analysis

## Findings
After performing our analysis, we have come up with the following findings that are supported by the adjoining visuals:

### Ride Count by Each Month
Ridership peaked during the months of June, July, and August for both members. While annual members dominated overall, the gap narrowed during these summer months.

![Sheet 2](https://github.com/kamranshafikhan/Comparative_Analysis_of_Cyclistic_Bike_Users/assets/61063685/8c994b0d-6543-4394-a473-6169c7b08311)

### Median Ride Duration by Season
Casual members take longer trips year round with the biggest difference in summer. This suggest that the casual riders enjoy lesiure rides (longer durations) while annual members use bikes for commutes (shorter rides)

![Sheet 3 (1)](https://github.com/kamranshafikhan/Comparative_Analysis_of_Cyclistic_Bike_Users/assets/61063685/e12805d0-abd9-4e86-b0e6-a246808c2dfd)

### Ride Count by Weekday
Casual riders ride more on weekends while annual members prefer the weekdays. Although annual members dominate overall, the gap is narrowed on the weekends.

![Sheet 4](https://github.com/kamranshafikhan/Comparative_Analysis_of_Cyclistic_Bike_Users/assets/61063685/8d7391d7-b0d2-4a0e-8bcb-eb0a03aadb4c)

### Ride Count by Time of Day
In the morning time (6 - 11 am) the ride count of casual riders is lesser as compared to afternoon and evening.

![Sheet 5](https://github.com/kamranshafikhan/Comparative_Analysis_of_Cyclistic_Bike_Users/assets/61063685/5564ad51-503a-4dba-badf-adbda2430c4b)

## Recommendations

Based on the above visuals and the story it is communicating we have concluded the following top three recommendations to develop the future marketing strategy:

### Target Peak Season (Jun  - Aug)
Marketing campaigns aimed at converting casual riders to annual memberships can be most effective during peak ridership months: June, July, and August. These months see the highest
overall ride counts for both categories, with a narrower gap between casual and annual member usage compared to other months.

### Weekend Packages for Casual Riders 
As annual members take shorter trips mostly on weekdays, while casual riders take longer rides mostly on weekends, this usage patterns indicate that annual members ride for commute while casual riders use it for leisure and recreation. Hence, consider offering weekend packages that cater to casual riders’ preferences while also showcasing the benefits of annual membership.

### Targeted Marketing by Time of Day
Casual members demonstrate a higher usage rate during evenings and afternoons compared to mornings. As a result, tailor the marketing campaigns to these specific time frames.

## Conclusion
The analysis of Cyclistic user data reveals distinct patterns between casual and annual members. By taking into account these considerations, an effective marketing strategy can be devised with the goal to convert the casual riders into annual members.

