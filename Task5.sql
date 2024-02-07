SELECT billing_country, first_name, last_name, total_money_spent
FROM
(SELECT max_spent_values_for_countries.billing_country, total_money_spent_by_customer.customer_id, total_money_spent
 FROM (SELECT billing_country, max(total_money_spent) as max_spent_value
       FROM (SELECT invoice.billing_country, invoice.customer_id, sum(total) as total_money_spent
             FROM invoice
                      JOIN customer ON invoice.customer_id = customer.customer_id
             GROUP BY invoice.billing_country, invoice.customer_id) as users_money_spent
                JOIN customer ON users_money_spent.customer_id = customer.customer_id
       GROUP BY billing_country) AS max_spent_values_for_countries

          JOIN (SELECT invoice.billing_country, invoice.customer_id, sum(total) as total_money_spent
                FROM invoice
                         JOIN customer ON invoice.customer_id = customer.customer_id
                GROUP BY invoice.billing_country, invoice.customer_id) AS total_money_spent_by_customer
               ON max_spent_values_for_countries.billing_country = total_money_spent_by_customer.billing_country
                   AND max_spent_values_for_countries.max_spent_value = total_money_spent_by_customer.total_money_spent
 ) AS customers_spend_max_by_countries

JOIN customer ON customer.customer_id=customers_spend_max_by_countries.customer_id