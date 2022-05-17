select id from (
select *,
lag(temperature,1) over(order by recordDate) as temp_lag,
    lag(recordDate,1) over(order by recordDate) as date_lag
from Weather)x
where x. temperature > x.temp_lag and DATEDIFF(x.recordDate,x.date_lag)=1
