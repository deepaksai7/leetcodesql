select a.name from salesperson a where a.sales_id not in (
select b.sales_id from orders b join company c on b.com_id=c.com_id where c.name='RED'
)
