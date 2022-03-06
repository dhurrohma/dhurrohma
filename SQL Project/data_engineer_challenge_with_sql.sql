SELECT * FROM ms_produk WHERE harga >= 50000 AND harga <= 150000;

SELECT * FROM ms_produk WHERE nama_produk LIKE '%Ikat Pinggang%';

SELECT * FROM ms_pelanggan 
WHERE nama_pelanggan LIKE '%S.H%' OR nama_pelanggan LIKE '%Ir.%' OR nama_pelanggan LIKE '%Drs.%';

SELECT nama_pelanggan FROM ms_pelanggan GROUP BY nama_pelanggan ASC;

SELECT nama_pelanggan FROM ms_pelanggan ORDER BY SUBSTRING_INDEX(nama_pelanggan, '. ', -1) ASC;

SELECT nama_pelanggan FROM ms_pelanggan 
WHERE LENGTH(nama_pelanggan)
IN (SELECT MAX(LENGTH(nama_pelanggan)) FROM ms_pelanggan)
ORDER BY LENGTH(nama_pelanggan) DESC;

SELECT nama_pelanggan FROM ms_pelanggan
WHERE LENGTH(nama_pelanggan)
IN ((SELECT MAX(LENGTH(nama_pelanggan)) FROM ms_pelanggan), 
    (SELECT MIN(LENGTH(nama_pelanggan)) FROM ms_pelanggan))
ORDER BY LENGTH(nama_pelanggan) DESC;

SELECT ms_produk.kode_produk, ms_produk.nama_produk, SUM(tr_penjualan_detail.qty) AS total_qty
FROM ms_produk
INNER JOIN tr_penjualan_detail
ON ms_produk.kode_produk = tr_penjualan_detail.kode_produk
GROUP BY ms_produk.kode_produk, ms_produk.nama_produk
HAVING SUM(tr_penjualan_detail.qty) > 10 ;

SELECT ms_pelanggan.kode_pelanggan, ms_pelanggan.nama_pelanggan, SUM(tr_penjualan_detail.qty * tr_penjualan_detail.harga_satuan) AS total_harga
FROM ms_pelanggan
JOIN tr_penjualan 
ON ms_pelanggan.kode_pelanggan = tr_penjualan.kode_pelanggan
JOIN tr_penjualan_detail 
ON tr_penjualan_detail.kode_transaksi = tr_penjualan.kode_transaksi
GROUP BY ms_pelanggan.kode_pelanggan, ms_pelanggan.nama_pelanggan
ORDER BY total_harga DESC
LIMIT 1;

SELECT kode_pelanggan, nama_pelanggan, alamat
FROM ms_pelanggan
WHERE kode_pelanggan 
NOT IN (SELECT kode_pelanggan FROM tr_penjualan);

SELECT tr_penjualan.kode_transaksi, tr_penjualan.kode_pelanggan, ms_pelanggan.nama_pelanggan, tr_penjualan.tanggal_transaksi, COUNT(tr_penjualan_detail.qty) AS jumlah_detail
FROM tr_penjualan
INNER JOIN ms_pelanggan
ON tr_penjualan.kode_pelanggan = ms_pelanggan.kode_pelanggan
INNER JOIN tr_penjualan_detail
ON tr_penjualan.kode_transaksi = tr_penjualan_detail.kode_transaksi
GROUP BY tr_penjualan.kode_transaksi, tr_penjualan.kode_pelanggan, ms_pelanggan.nama_pelanggan,
tr_penjualan.tanggal_transaksi
HAVING jumlah_detail > 1;
