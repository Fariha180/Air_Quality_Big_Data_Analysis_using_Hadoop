-- Pig Job 3: Pollution Trend

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
clean_data = FILTER data BY Year IS NOT NULL;

-- Group by Year and Pollutant
grouped = GROUP clean_data BY (Year, Parameter);

-- Calculate average concentration
result = FOREACH grouped GENERATE
         group.Year AS Year,
         group.Parameter AS Parameter,
         AVG(clean_data.ArithmeticMean) AS Average_Concentration;

-- Sort by year and pollutant
sorted_result = ORDER result BY Year ASC, Parameter ASC;

STORE sorted_result INTO '/air_quality/pig_output/P3_PollutionTrend'
USING PigStorage('\t');
