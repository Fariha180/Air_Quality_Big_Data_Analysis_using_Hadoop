-- Pig Job 2: Location Analysis

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

-- Group by State and County
grouped = GROUP clean_data BY (State, County);

-- Calculate average pollutant concentration for each location
result = FOREACH grouped GENERATE
         group.State AS State,
         group.County AS County,
         AVG(clean_data.ArithmeticMean) AS Average_Concentration;

-- Sort locations by State and County
sorted_result = ORDER result BY State ASC, County ASC;

STORE sorted_result INTO '/air_quality/pig_output/P2_LocationAnalysis'
USING PigStorage('\t');
