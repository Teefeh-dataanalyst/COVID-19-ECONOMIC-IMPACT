SELECT TOP (1000) [ID]
      ,[DATE]
      ,[CONFIRMED_CASE]
      ,[NEW_CASE]
      ,[TOTAL_CASE]
      ,[DEATH_CASE]
      ,[GLOBAL_CONFIRMED_CASE]
      ,[PERCENTAGE_GCC]
      ,[GLOBAL_NEW_CASES]
      ,[PERCENTAGE_GNC]
      ,[GLOBAL_DEATH_CASES]
      ,[PERCENTAGE_GDC]
      ,[WEATHER]
      ,[BUYING_RATE]
      ,[CENTRAL_RATE]
      ,[SELLING_RATE]
      ,[SHARE_INDEX]
      ,[OIL_PRICE]
      ,[GROSS_RESERVES]
      ,[LIQUID_RESERVES]
  FROM [COVIDNIGERIA].[dbo].[covid19_eco]


  DELETE FROM covid19_eco
  WHERE ID IS NULL
  OR DATE IS NULL;

 -- 1] How did the number of daily new cases change over time?
 
 SELECT DATE, NEW_CASE
  FROM [COVIDNIGERIA].[dbo].[covid19_eco]
  ORDER BY DATE;

  -- 2] What was the peak of new cases in a single day?
  SELECT TOP 1 DATE, NEW_CASE
  FROM covid19_eco
  ORDER BY NEW_CASE DESC ;

  --3] How did global confirmed cases correlate with local confirmed cases?
  SELECT GLOBAL_CONFIRMED_CASE, TOTAL_CASE
  FROM covid19_eco
  ORDER BY DATE;


  -- 4] How did exchange rates(buying, central, selling rates) fluctuates during major COVID-19 peaks?
  SELECT TOTAL_CASE, BUYING_RATE, CENTRAL_RATE, SELLING_RATE
  FROM covid19_eco
  ORDER BY TOTAL_CASE DESC;

  -- 5] Was there a significant change in oil prices during spikes in confirmed cases?
  SELECT TOTAL_CASE, OIL_PRICE
  FROM covid19_eco
  ORDER BY TOTAL_CASE DESC;

  -- 6] Did gross reserves and liquid reserves decrease during the pandemic?
  SELECT DATE, TOTAL_CASE, GROSS_RESERVES, LIQUID_RESERVES
  FROM covid19_eco
  ORDER BY TOTAL_CASE ;

  -- 7] How did the share index react to rising covid 19 cases?
  SELECT DATE, TOTAL_CASE, SHARE_INDEX
  FROM covid19_eco
  ORDER BY DATE ;

  -- 8] Did weather conditions show any correlation with daily covid 19 cases?
  SELECT DATE, WEATHER, NEW_CASE
  FROM covid19_eco
  ORDER BY DATE;

