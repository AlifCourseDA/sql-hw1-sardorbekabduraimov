SELECT billing_city as City, sum(total) as SumOfAllInvoicesTotal
FROM invoice
GROUP BY billing_city
ORDER BY SumOfAllInvoicesTotal
LIMIT 5;