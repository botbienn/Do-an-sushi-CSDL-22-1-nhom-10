DECLARE @StartDate DATE = '2024-01-01';
DECLARE @EndDate DATE = '2024-12-31';

SELECT 
    cn.TenCN AS ChiNhanh,
    ma.TenMon AS MonAn,
    SUM(mmpd.SoLuong) AS SoLuong,
    SUM(ma.Gia * mmpd.SoLuong) AS DoanhThu
FROM 
    phieu_dat pd
JOIN 
    ma_mon_phieu_dat mmpd ON pd.MaPhieu = mmpd.MaPhieu
JOIN 
    mon_an ma ON mmpd.MaMon = ma.MaMon
JOIN 
    chi_nhanh cn ON pd.MaCN = cn.MaCN
WHERE 
    pd.NgayDat BETWEEN @StartDate AND @EndDate
GROUP BY 
    cn.TenCN, ma.TenMon
ORDER BY 
    cn.TenCN, DoanhThu DESC;