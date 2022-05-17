select x.request_at as Day, round(sum(x.c_status)/sum(x.flag),2) as 'Cancellation Rate' from (
select a.request_at,1 as flag,
case when status= 'cancelled_by_driver' or status= 'cancelled_by_client' then 1
else 0
end as c_status
from Trips a join 
Users b on a.client_id=b.users_id 
join Users c on a.driver_id=c.users_id
where (b.banned='No' and c.banned='No') 
and (a.request_at between "2013-10-01" and "2013-10-03")
) x
group by x.request_at order by x.request_at;
