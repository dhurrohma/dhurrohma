# Memahami Table
SELECT * FROM orders_1 LIMIT 5;
SELECT * FROM orders_2 LIMIT 5;
SELECT * FROM customer LIMIT 5;

# Total Revenue Berdasarkan Mode Pengiriman pada Quarter-1 (Jan, Feb, Mar) dan Quarter 2 (Apr, Mei, Jun)
SELECT ship_mode, SUM(sales) AS revenue_1 from orders_1 WHERE ship_date IS NOT NULL GROUP BY ship_mode;
SELECT ship_mode, SUM(sales) AS revenue_2 from orders_2 WHERE ship_date IS NOT NULL GROUP BY ship_mode;

# Menghitung Persentasi Keseluruhan Penjualan
SELECT quarter, SUM(sales) AS revenue
FROM (SELECT order_id, ship_date, sales, "1" AS quarter FROM orders_1
      UNION
      SELECT order_id, ship_date, sales, "2" AS quarter FROM orders_2)
      AS tabel_a
WHERE ship_date IS NOT NULL
GROUP BY quarter;

# Apakah Jumlah Customers drm.com semakin bertambah?
SELECT quarter, COUNT(DISTINCT customer_id) AS total_customers
FROM (SELECT customer_id, create_date, QUARTER(create_date) AS quarter FROM customer
      WHERE create_date BETWEEN '2018-01-01' AND '2018-06-30')
      AS tabel_b
GROUP BY quarter;

# Seberapa Banyak Customers Tersebut yang Sudah Melakukan Transaksi?
SELECT quarter, COUNT(DISTINCT customer_id) AS total_customers
FROM (SELECT customer_id, create_date, QUARTER(create_date) AS quarter FROM customer
      WHERE create_date BETWEEN '2018-01-01' AND '2018-06-30')
      AS tabel_b
WHERE customer_id IN (SELECT DISTINCT customer_id FROM orders_1
                      UNION
                      SELECT DISTINCT customer_id FROM orders_2)
GROUP BY quarter;

# Category Produk Apa Saja yang Paling Banyak Diorder oleh Customer di Quarter-2
SELECT * FROM (SELECT category_id, COUNT(DISTINCT order_id) AS total_order, SUM(sales) AS total_penjualan
               FROM (SELECT product_id, order_id, sales, ship_mode, LEFT(product_id, 6) AS category_id
                     FROM orders_2
                     WHERE ship_date IS NOT NULL)
               AS tabel_c
               GROUP BY category_id) AS product
ORDER BY total_order DESC;

# Seberapa Banyak Customers yang Tetap Aktif Bertransaksi Setelah Transaksi Pertamanya?
