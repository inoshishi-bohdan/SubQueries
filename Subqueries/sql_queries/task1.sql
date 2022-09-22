SELECT product.id, title as product, price
FROM product INNER JOIN product_title ON product_title.id = product.product_title_id
WHERE price >= 2*(select min(price) from product)
ORDER BY price, product