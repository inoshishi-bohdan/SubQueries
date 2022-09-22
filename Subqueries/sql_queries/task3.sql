SELECT customer_order_id as order_id, COUNT(customer_order_id) as items_count
FROM 
customer_order INNER JOIN order_details ON customer_order.id = order_details.customer_order_id
WHERE operation_time BETWEEN "2021-01-01" AND "2021-12-31"
GROUP BY customer_order_id HAVING items_count > (SELECT AVG(sum)
FROM(SELECT COUNT(customer_order_id) as sum
FROM customer_order INNER JOIN order_details ON customer_order.id = order_details.customer_order_id
GROUP BY customer_order_id))
ORDER BY items_count, order_id