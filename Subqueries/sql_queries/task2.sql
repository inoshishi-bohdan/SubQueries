SELECT surname, name, ROUND(SUM(price_with_discount * product_amount), 2) AS total_expenses
FROM
person INNER JOIN customer ON person.id = customer.person_id
INNER JOIN customer_order ON customer.person_id = customer_order.customer_id
INNER JOIN order_details ON customer_order.id = order_details.customer_order_id
WHERE birth_date BETWEEN "2000-01-01" AND "2010-12-31" 
GROUP BY customer.person_id HAVING total_expenses > (SELECT AVG(sum)  
    FROM (SELECT SUM(price_with_discount * product_amount) as sum
    FROM person INNER JOIN customer ON person.id = customer.person_id
    INNER JOIN customer_order ON customer.person_id = customer_order.customer_id
    INNER JOIN order_details ON customer_order.id = order_details.customer_order_id
    GROUP BY customer.person_id
    ))
ORDER BY total_expenses, surname