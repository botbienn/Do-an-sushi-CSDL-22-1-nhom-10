-- 3. Món bán chạy nhất (theo chi nhánh, khu vực, hoặc chi nhánh trong khoảng thời gian)
-- a. Theo chi nhánh

SELECT 
    ma.TenMon,
    pd.MaCN,
    SUM(mmpd.SoLuong) AS SoLuong
FROM 
    phieu_dat pd
JOIN 
    ma_mon_phieu_dat mmpd ON pd.MaPhieu = mmpd.MaPhieu
JOIN 
    mon_an ma ON mmpd.MaMon = ma.MaMon
GROUP BY 
    ma.TenMon, pd.MaCN
HAVING 
    SUM(mmpd.SoLuong) <= all (
		SELECT SUM(mmpd2.SoLuong)
		 FROM phieu_dat pd2
		 JOIN ma_mon_phieu_dat mmpd2 ON pd2.MaPhieu = mmpd2.MaPhieu
		 WHERE pd2.MaCN = pd.MaCN
		 GROUP BY mmpd2.MaMon
	 );
GO
-- b. Theo khu vuc

SELECT 
	ma.MaMon,
    ma.TenMon,
    kv.TenKhuVuc,
	kv.MaKhuVuc,
    SUM(mmpd.SoLuong) AS SoLuong
FROM 
    phieu_dat pd
JOIN 
    ma_mon_phieu_dat mmpd ON pd.MaPhieu = mmpd.MaPhieu
JOIN 
    mon_an ma ON mmpd.MaMon = ma.MaMon
JOIN 
    chi_nhanh cn ON pd.MaCN = cn.MaCN
JOIN 
    khu_vuc kv ON cn.MaKhuVuc = kv.MaKhuVuc
GROUP BY 
    ma.MaMon, ma.TenMon, kv.TenKhuVuc, kv.MaKhuVuc
HAVING 
    SUM(mmpd.SoLuong) <= all (
		SELECT SUM(mmpd2.SoLuong)
		 FROM 
             phieu_dat pd2
         JOIN 
             ma_mon_phieu_dat mmpd2 ON pd2.MaPhieu = mmpd2.MaPhieu
         JOIN 
             chi_nhanh cn2 ON pd2.MaCN = cn2.MaCN
         JOIN 
             khu_vuc kv2 ON cn2.MaKhuVuc = kv2.MaKhuVuc
		 WHERE kv.MaKhuVuc = kv2.MaKhuVuc
		 GROUP BY mmpd2.MaMon
	 );
GO
-- c. Theo chi nhanh trong mot khoang tg cụ thể
DECLARE @StartDate DATE = '2024-01-01';
DECLARE @EndDate DATE = '2024-12-31';
SELECT 
    ma.MaMon,
	ma.TenMon,
    pd.MaCN,
    SUM(mmpd.SoLuong) AS SoLuong
FROM 
    phieu_dat pd
JOIN 
    ma_mon_phieu_dat mmpd ON pd.MaPhieu = mmpd.MaPhieu
JOIN 
    mon_an ma ON mmpd.MaMon = ma.MaMon
WHERE 
    pd.NgayDat BETWEEN @StartDate AND @EndDate
GROUP BY 
    ma.TenMon, pd.MaCN, ma.MaMon
HAVING 
    SUM(mmpd.SoLuong) <= all (
		SELECT SUM(mmpd2.SoLuong)
		 FROM phieu_dat pd2
		 JOIN ma_mon_phieu_dat mmpd2 ON pd2.MaPhieu = mmpd2.MaPhieu
		 WHERE pd2.MaCN = pd.MaCN and pd2.NgayDat BETWEEN @StartDate AND @EndDate
		 GROUP BY mmpd2.MaMon
	 );
GO