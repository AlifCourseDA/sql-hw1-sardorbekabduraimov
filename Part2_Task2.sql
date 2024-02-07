SELECT album.album_id, album.title, SUM(total) as revenue
FROM (SELECT *, unit_price * quantity as total
FROM invoice_line) as invoice_line_with_total
JOIN track ON invoice_line_with_total.track_id = track.track_id
JOIN album ON track.album_id = album.album_id
GROUP BY album.album_id, album.title
ORDER BY revenue DESC
LIMIT 1