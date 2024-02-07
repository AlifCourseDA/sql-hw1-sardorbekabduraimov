SELECT
    CASE
        WHEN track.milliseconds < (SELECT AVG(milliseconds) FROM track) THEN 'Short'
        ELSE 'Long'
    END AS album_length,
    SUM(invoice_line.unit_price * invoice_line.quantity) AS revenue
FROM invoice_line
JOIN track ON invoice_line.track_id = invoice_line.track_id
GROUP BY album_length
ORDER BY revenue DESC
