# Memahami Table
SELECT * FROM orders_1 LIMIT 5;
SELECT * FROM orders_2 LIMIT 5;
SELECT * FROM customer LIMIT 5;

# Total Revenue Berdasarkan Mode Pengiriman pada Semester-1 dan Semester-2
SELECT ship_mode, SUM(sales) AS revenue_1 from orders_1 WHERE ship_date IS NOT NULL GROUP BY ship_mode;
SELECT ship_mode, SUM(sales) AS revenue_2 from orders_2 WHERE ship_date IS NOT NULL GROUP BY ship_mode;

# Menghitung Persentasi Keseluruhan Penjualan
SELECT semester, SUM(sales) AS revenue
FROM (SELECT order_id, ship_date, sales, "1" AS semester FROM orders_1
      UNION
      SELECT order_id, ship_date, sales, "2" AS semester FROM orders_2)
      AS tabel_a
WHERE ship_date IS NOT NULL
GROUP BY semester;

# Apakah Jumlah Customers drm.com semakin bertambah?
SELECT semester, COUNT(DISTINCT customer_id) AS total_customers
FROM (SELECT customer_id, create_date, "1" AS semester FROM customer
      WHERE create_date BETWEEN '2018-01-01' AND '2018-06-30'
      UNION
      SELECT customer_id, create_date, "2" AS semester FROM customer
      WHERE create_date BETWEEN '2018-07-01' AND '2018-12-30')
      AS tabel_b
GROUP BY semester;

# Seberapa Banyak Customers Tersebut yang Sudah Melakukan Transaksi?
SELECT semester, COUNT(DISTINCT customer_id) AS total_customers
FROM (SELECT customer_id, create_date, "1" AS semester FROM customer
      WHERE create_date BETWEEN '2018-01-01' AND '2018-06-30'
      UNION
      SELECT customer_id, create_date, "2" AS semester FROM customer
      WHERE create_date BETWEEN '2018-07-01' AND '2018-12-30')
      AS tabel_b
WHERE customer_id IN (SELECT DISTINCT customer_id FROM orders_1
                      UNION
                      SELECT DISTINCT customer_id FROM orders_2)
GROUP BY semester;

# Category Produk Apa Saja yang Paling Banyak Diorder oleh Customer di Semester-2
SELECT * FROM (SELECT category_id, COUNT(DISTINCT order_id) AS total_order, SUM(sales) AS total_penjualan
               FROM (SELECT product_id, order_id, sales, ship_mode, LEFT(product_id, 6) AS category_id
                     FROM orders_2
                     WHERE ship_date IS NOT NULL)
               AS tabel_c
               GROUP BY category_id) AS product
ORDER BY total_order DESC;

# Seberapa Banyak Customers yang Tetap Aktif Bertransaksi Setelah Transaksi Pertamanya di Tahun 2018?
SELECT COUNT(DISTINCT customer_id) as total_customers FROM orders_1;
#menghasilkan 207
SELECT "1" AS semester, (COUNT(DISTINCT customer_id) * 100) / 207 AS S2 FROM orders_1
WHERE customer_id IN(SELECT DISTINCT customer_id FROM orders_2);
