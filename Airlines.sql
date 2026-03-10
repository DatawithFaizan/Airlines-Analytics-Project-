create database Airline;
use Airline;

select * from maindata;

-- 1. Total Number of Flights Count
SELECT COUNT(*) AS TotalFlights
FROM maindata;

-- 2. Count of Short Flights
SELECT COUNT(*) AS ShortFlightsCount
FROM maindata
WHERE `# Air Time` < 30 AND `# Air Time` > 0;

-- 3. Maximum Air Time
SELECT MAX(`# Air Time`) AS MaxAirTime
FROM maindata;

-- 4. Top 5 Carriers by Number of Flights
SELECT `%Unique Carrier Code`,
COUNT(*) AS FlightCount
FROM maindata
GROUP BY `%Unique Carrier Code`
ORDER BY FlightCount DESC
LIMIT 5;

-- 5. Flights by Month in 2013
SELECT `Month (#)`,
COUNT(*) AS FlightsInMonth
FROM maindata
WHERE Year = 2013
GROUP BY `Month (#)`
ORDER BY `Month (#)`;
    
-- 6. Average Distance Flown per Carrier
SELECT `%Unique Carrier Code`,
AVG(Distance) AS AverageDistance
FROM maindata
GROUP BY `%Unique Carrier Code`
ORDER BY AverageDistance DESC;
    
-- 7. Details of the Longest Flight
SELECT Year, `Month (#)`, `%Unique Carrier Code`, `Origin Airport Code`, `Destination Airport Code`, Distance
FROM maindata
ORDER BY Distance DESC
LIMIT 1;


-- 8. Load Factor by Carrier and Year
SELECT Year, 
`%Unique Carrier Code` AS Carrier,
CAST(SUM(`# Transported Passengers`) AS DECIMAL(10, 2)) / SUM(`# Available Seats`) AS AverageLoadFactor
FROM maindata
WHERE Year = 2008 AND `# Available Seats` > 0
GROUP BY Year, `%Unique Carrier Code`
ORDER BY AverageLoadFactor DESC;
    

-- 9. Stored Procedure: GetRouteTotalPayload
call airline.GetRouteTotalPayload('14485 - 13970', 'H6', 2008, @totalPayload);

-- 10. Stored Procedure: GetFlightsByCarrierAndYear
call airline.GetFlightsByCarrierAndYear('K5', 2008);


