SELECT support_rep_id, COUNT(customer.customer_id) as serviced_customers_count, SUM(total) as total_sale, SUM(total)/COUNT(customer.customer_id) as average_revenue
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY support_rep_id
