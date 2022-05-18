select distinct d.id,d.visit_date,d.people from stadium d, (
select a.id as Aid, a.people as Apeople, b.id as Bid, b.people as Bpeople, c.id as Cid, c.people as Cpeople from stadium a ,stadium b ,stadium c 
where a.people>=100 and b.people>=100 and c.people>=100
and (b.id=a.id+1 and c.id=b.id+1 and c.id=a.id+2)
) x
where d.id=Aid or d.id=Bid or d.id=Cid
order by d.visit_date asc;
