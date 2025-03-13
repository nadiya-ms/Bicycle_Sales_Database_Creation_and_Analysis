--In which states the stores are located in and the number of orders and total quantity of each state.

select s.state,
	COUNT(distinct s.store_id) as stores,
	COUNT(distinct o.order_id) as orders,
	SUM(oi.quantity) as quantity
from sales.stores as s
left join sales.orders as o
	on o.store_id = s.store_id
left join sales.order_items as oi 
	on oi.order_id = o.order_id
group by s.state;

select b.brand_name,
	SUM(s.quantity) as total_stock,
	SUM(s.quantity*list_price) as stock_value
from production.brands as b 
left join production.products as p 
	on p.brand_id = b.brand_id
left join production.stocks as s
	on s.product_id = p.product_id
group by b.brand_name
order by stock_value DESC;
	

-- The number of bicycles in stock by year and category 
SELECT 
	model_year,
	category_name,
    SUM(quantity) AS total
FROM production.products AS pp
INNER JOIN production.categories AS pc
	ON pp.category_id = pc.category_id
INNER JOIN production.brands AS pb
	ON pp.brand_id = pb.brand_id
INNER JOIN production.stocks AS ps
	ON pp.product_id = ps.product_id
GROUP BY model_year, category_name
ORDER BY model_year, category_name;


/* */
