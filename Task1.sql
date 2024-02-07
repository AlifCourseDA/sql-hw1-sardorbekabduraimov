SELECT billing_country as BillingCountry, COUNT(*) AS Invoices
FROM Invoice
GROUP BY billing_country
ORDER BY Invoices;