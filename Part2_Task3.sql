SELECT billing_country, SUM(total) as total_sales_per_country, SUM(total)/(SELECT SUM(total) FROM invoice)*100 AS percent
FROM invoice
GROUP BY billing_country
ORDER BY total_sales_per_country DESC