select distinct a.id,
case when a.p_id is null then 'Root'
when a.id  in (select b.p_id from Tree b) is null then 'Leaf'
when a.id  in (select b.p_id from Tree b) is not null then 'Inner'
End as type
 from Tree a, Tree b
 order by a.id;
