Create database MaintenanceDB;

use MaintenanceDB;

select * from dbo.machine_data



SELECT 
    type,
    machine_failure,
    COUNT(DISTINCT product_id) AS unique_products
FROM machine_data
GROUP BY type, machine_failure;






--Average Air Temperature for Diffterent Machine Type
select Type,Machine_failure,Avg(Air_temperature_K) as [Avg Air Temperature]from dbo.machine_data group by Type,Machine_failure order by type

--Effect of Tool Wear and Torque on Machine Failure
select  machine_failure,avg(Tool_wear_min) [Avg Tool Wear],
	avg(Torque_Nm)[Avg Torque] from machine_data
		group by Machine_failure

--Effect of RPM on Machine_Failure
select Machine_failure,avg(Rotational_Speed_rpm) [Avg RPM] from machine_data group by Machine_failure



--Root Cause Analysis
SELECT 
    Machine_failure,
    AVG(Tool_wear_min) AS Tool_wear,
    AVG(Torque_Nm) AS Torque,
    AVG(Rotational_speed_rpm) AS RPM,
    AVG(Process_temperature_K - Air_temperature_K) AS Temp_diff
FROM dbo.machine_data
GROUP BY Machine_failure;


---Failure Rate
with Failure_Rate as (
select Type,Count(*) as Total,
sum(machine_failure) [Failures],
cast(round(sum(machine_failure)*100.0/count(*),2) as decimal(5,2)) [Failure_rate] 
from machine_data
group by Type
)
select * from Failure_Rate

--Risk Level Analysis
alter view Risk_level_view as
SELECT *,
   CASE
    WHEN Tool_wear_min > 130 OR Torque_Nm > 45 THEN 'High Risk'
    WHEN Tool_wear_min > 100 OR Torque_Nm > 40 THEN 'Medium Risk'
    ELSE 'Low Risk'
    end as Risk_level
FROM machine_data;

SELECT 
    Type,
    COUNT(*) AS Total,
    CAST(ROUND(SUM(machine_failure)*100.0/COUNT(*),2) AS DECIMAL(5,2)) AS Failure_Rate,
    Risk_Level
FROM Risk_level_view
GROUP BY Type, Risk_Level
ORDER BY
    CASE 
        WHEN Risk_Level = 'High Risk' THEN 1
        WHEN Risk_Level = 'Medium Risk' THEN 2
        WHEN Risk_Level = 'Low Risk' THEN 3
    END,
    Failure_Rate DESC;

