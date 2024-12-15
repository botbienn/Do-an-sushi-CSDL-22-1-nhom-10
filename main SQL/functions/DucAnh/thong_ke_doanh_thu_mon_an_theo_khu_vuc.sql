-- thống kê doanh thu theo món ăn của từng khu vực
CREATE OR ALTER PROCEDURE ThongKeDoanhThuMonAnTheoKhuVuc
AS
BEGIN
    SELECT 
        kv.MaKhuVuc AS MaKhuVuc,
        kv.TenKhuVuc AS TenKhuVuc,
        ma.MaMon AS MaMon,
        ma.TenMon AS TenMon,
        SUM(mmpd.SoLuong) AS SoLuongBanRa,
        SUM(mmpd.SoLuong * ma.Gia) AS TongDoanhThu
    FROM 
        khu_vuc kv
    JOIN 
        chi_nhanh cn ON kv.MaKhuVuc = cn.MaKhuVuc
    JOIN 
        phieu_dat pd ON cn.MaCN = pd.MaCN
    JOIN 
        ma_mon_phieu_dat mmpd ON pd.MaPhieu = mmpd.MaPhieu
    JOIN 
        mon_an ma ON mmpd.MaMon = ma.MaMon
    GROUP BY 
        kv.MaKhuVuc, kv.TenKhuVuc, ma.MaMon, ma.TenMon
    ORDER BY 
        kv.MaKhuVuc, ma.MaMon;
END;
GO
