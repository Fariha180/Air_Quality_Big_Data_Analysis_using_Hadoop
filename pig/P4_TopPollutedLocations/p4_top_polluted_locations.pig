-- Pig Job 4: Top 10 Polluted Locations

data = LOAD '/air_quality/pig_input/Air_Quality_Pig.tsv'
       USING PigStorage('\t')
       AS (
           Year:int,
           State:chararray,
           County:chararray,
           Parameter:chararray,
           Units:chararray,
           ArithmeticMean:double,
           MaxValue:double,
           Latitude:double,
           Longitude:double
       );

-- Remove header row
clean_data = FILTER data BY Year IS NOT NULL AND MaxValue IS NOT NULL;

-- Group by pollutant and location
grouped = GROUP clean_data BY (Parameter, State, County);

-- Find the highest pollution value for each pollutant-location combination
result = FOREACH grouped GENERATE
         group.Parameter AS Parameter,
         group.State AS State,
         group.County AS County,
         MAX(clean_data.MaxValue) AS Highest_Value;

-- Sort from highest to lowest
sorted_result = ORDER result BY Highest_Value DESC;

-- Select top 10
top10 = LIMIT sorted_result 10;

STORE top10 INTO '/air_quality/pig_output/P4_TopPollutedLocations'
USING PigStorage('\t');
