SELECT first_name, last_name, sum(total) as TotalMoneySpent
FROM invoice
JOIN customer ON invoice.customer_id=customer.customer_id
GROUP BY invoice.customer_id, first_name, last_name
ORDER BY TotalMoneySpent
LIMIT 1