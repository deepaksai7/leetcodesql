select id,
case
when next_student is null and (select count(*) from Seat)%2<>0 then student
when id%2=0 then previous_student
when id%2<>0 then next_student

end as student
from (
select *,
lead(student) over(order by id) as next_student,
lag(student) over(order by id) as previous_student
from Seat
order by id)x
order by id;
