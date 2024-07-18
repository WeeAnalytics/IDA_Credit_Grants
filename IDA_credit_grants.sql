--Create a view that shows the country group based on World Bank's classification for data from 2017 - 2022

CREATE VIEW 
    credit_grants_region AS

    SELECT credit_grants.country,
           credit_grants.original_principal_amount,
           EXTRACT( YEAR FROM credit_grants.effective_date_most_recent_) AS effective_year,
           countries_regions.region
    
    FROM credit_grants 
    LEFT JOIN countries_regions
    ON credit_grants.country = countries_regions.country
    
    WHERE EXTRACT(YEAR FROM credit_grants.effective_date_most_recent_) IN ('2017','2018','2019','2020','2021','2022');


-- Which are the 2 regions with the highest principal? What is the trend of their principal vs GDP over the years from 2017-2022. 

WITH 
--find the principal for each year
total_principal AS (
    SELECT region,
           effective_year,
           SUM(original_principal_amount) AS principal
    FROM credit_grants_region
    WHERE region IS NOT NULL
    GROUP BY region, effective_year
   ),
--determine which region has the highest principal
principal_rank AS (
    SELECT effective_year, 
           region, 
           principal,
           RANK() OVER (PARTITION BY effective_year ORDER BY principal DESC) AS rank
    FROM total_principal
    
),
--add up population for each region
population_region AS (
       SELECT 
       distinct_country_population.region,
       SUM(distinct_country_population."2017") AS population_2017,
       SUM(distinct_country_population."2018") AS population_2018,
       SUM(distinct_country_population."2019") AS population_2019,
       SUM(distinct_country_population."2020") AS population_2020,
       SUM(distinct_country_population."2021") AS population_2021,
       SUM(distinct_country_population."2022") AS population_2022
       
FROM (
    SELECT DISTINCT
    credit_grants_region.country,
    credit_grants_region.region, 
    world_popn."2017",
    world_popn."2018",
    world_popn."2019",
    world_popn."2020",
    world_popn."2021",
    world_popn."2022"
       
FROM credit_grants_region
LEFT JOIN world_popn
ON credit_grants_region.country = world_popn.country
) AS distinct_country_population
GROUP BY distinct_country_population.region
ORDER BY population_2017,population_2018,population_2019,population_2020,population_2021,population_2022

),
-- find the total gdp for each region
GDP_region AS (
       SELECT 
       distinct_country_GDP.region,
       SUM(distinct_country_GDP."2017") AS GDP_2017,
       SUM(distinct_country_GDP."2018") AS GDP_2018,
       SUM(distinct_country_GDP."2019") AS GDP_2019,
       SUM(distinct_country_GDP."2020") AS GDP_2020,
       SUM(distinct_country_GDP."2021") AS GDP_2021,
       SUM(distinct_country_GDP."2022") AS GDP_2022
       
FROM (
    SELECT DISTINCT
    credit_grants_region.country,
    credit_grants_region.region, 
    GDP."2017",
    GDP."2018",
    GDP."2019",
    GDP."2020",
    GDP."2021",
    GDP."2022"
       
FROM credit_grants_region
LEFT JOIN GDP
ON credit_grants_region.country = GDP.country
) AS distinct_country_GDP
GROUP BY distinct_country_GDP.region
ORDER BY GDP_2017,GDP_2018,GDP_2019,GDP_2020,GDP_2021,GDP_2022
)

SELECT effective_year, rank, principal_rank.region, principal,

        CASE 
       WHEN effective_year = 2017 THEN GDP_region.GDP_2017 
       WHEN effective_year = 2018 THEN GDP_region.GDP_2018
       WHEN effective_year = 2019 THEN GDP_region.GDP_2019
       WHEN effective_year = 2020 THEN GDP_region.GDP_2020
       WHEN effective_year = 2021 THEN GDP_region.GDP_2021
       WHEN effective_year = 2022 THEN GDP_region.GDP_2022
       ELSE NULL
       END AS GDP,

       CASE 
       WHEN effective_year = 2017 THEN population_region.population_2017 
       WHEN effective_year = 2018 THEN population_region.population_2018
       WHEN effective_year = 2019 THEN population_region.population_2019
       WHEN effective_year = 2020 THEN population_region.population_2020
       WHEN effective_year = 2021 THEN population_region.population_2021
       WHEN effective_year = 2022 THEN population_region.population_2022
       ELSE NULL
       END AS population,

       CASE 
       WHEN effective_year = 2017 THEN GDP_region.GDP_2017 - principal 
       WHEN effective_year = 2018 THEN GDP_region.GDP_2018 - principal 
       WHEN effective_year = 2019 THEN GDP_region.GDP_2019 - principal 
       WHEN effective_year = 2020 THEN GDP_region.GDP_2020 - principal 
       WHEN effective_year = 2021 THEN GDP_region.GDP_2021 - principal 
       WHEN effective_year = 2022 THEN GDP_region.GDP_2022 - principal 
       ELSE NULL
       END AS GDP_net_principal,

       CASE 
       WHEN effective_year = 2017 THEN GDP_region.GDP_2017/population_region.population_2017 
       WHEN effective_year = 2018 THEN GDP_region.GDP_2018/population_region.population_2018
       WHEN effective_year = 2019 THEN GDP_region.GDP_2019/population_region.population_2019
       WHEN effective_year = 2020 THEN GDP_region.GDP_2020/population_region.population_2020
       WHEN effective_year = 2021 THEN GDP_region.GDP_2021/population_region.population_2021
       WHEN effective_year = 2022 THEN GDP_region.GDP_2022/population_region.population_2022
       ELSE NULL
       END AS GDP_per_capita


      
FROM principal_rank
LEFT JOIN population_region
ON principal_rank.region = population_region.region
LEFT JOIN GDP_region
ON principal_rank.region = GDP_region.region
WHERE rank<=2
ORDER BY effective_year
;


