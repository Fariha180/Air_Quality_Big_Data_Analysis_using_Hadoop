-- Pig Job 5: Pollutant Analysis

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

-- Group by pollutant and measurement unit
grouped = GROUP clean_data BY (Parameter, Units);

-- Calculate observation count and average concentration
result = FOREACH grouped GENERATE
         group.Parameter AS Parameter,
         group.Units AS Units,
         COUNT(clean_data) AS Observation_Count,
         AVG(clean_data.ArithmeticMean) AS Average_Concentration;

-- Sort by pollutant name
sorted_result = ORDER result BY Parameter ASC;

STORE sorted_result INTO '/air_quality/pig_output/P5_PollutantAnalysis'
USING PigStorage('\t');
