-- Pig Job 1: Average Pollutant Concentration

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

-- Group records by pollutant
grouped = GROUP clean_data BY Parameter;

-- Calculate average concentration
result = FOREACH grouped GENERATE
         group AS Parameter,
         AVG(clean_data.ArithmeticMean) AS Average_Concentration;

-- Sort by pollutant name
sorted_result = ORDER result BY Parameter ASC;

STORE sorted_result INTO '/air_quality/pig_output/P1_AveragePollutant'
USING PigStorage('\t');

