--thống kê doanh thu theo món ăn của từng chi nhánh
GO
CREATE OR ALTER PROCEDURE ThongKeDoanhThuMonAn
AS
BEGIN
    SELECT 
        cn.MaCN AS MaChiNhanh,
        cn.TenCN AS TenChiNhanh,
        ma.MaMon AS MaMon,
        ma.TenMon AS TenMon,
        SUM(mmpd.SoLuong) AS SoLuong,
        SUM(mmpd.SoLuong * ma.Gia) AS DoanhThu
    FROM 
        chi_nhanh cn
    JOIN 
        phieu_dat pd ON cn.MaCN = pd.MaCN
    JOIN 
        ma_mon_phieu_dat mmpd ON pd.MaPhieu = mmpd.MaPhieu
    JOIN 
        mon_an ma ON mmpd.MaMon = ma.MaMon
    GROUP BY 
        cn.MaCN, cn.TenCN, ma.MaMon, ma.TenMon
    ORDER BY 
        cn.MaCN, ma.MaMon;
END;
GO

