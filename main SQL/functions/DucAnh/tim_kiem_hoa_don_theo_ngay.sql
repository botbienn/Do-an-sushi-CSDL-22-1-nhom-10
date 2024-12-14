--Tìm kiếm hóa đơn theo ngày
CREATE OR ALTER PROCEDURE TimKiemHoaDonTheoNgay
    @StartDate DATE,     
    @EndDate DATE          
AS
BEGIN
    BEGIN TRY
        SELECT 
            hd.MaPhieu AS MaHoaDon,
            hd.TongTien,
            hd.GiamGia,
            hd.ThanhTien,
            hd.DiemTichLuy,
            pd.NgayDat,
            pd.MaCN AS MaChiNhanh,
            pd.LoaiPhieu,
            pd.CCCD AS MaKhachHang
        FROM 
            hoa_don hd
        INNER JOIN 
            phieu_dat pd ON hd.MaPhieu = pd.MaPhieu
        WHERE 
            pd.NgayDat BETWEEN @StartDate AND @EndDate
        ORDER BY 
            pd.NgayDat DESC;

        PRINT 'Tim kiem hoa don theo ngay thanh cong.';
    END TRY
    BEGIN CATCH
        PRINT 'Da xay ra loi: ' + ERROR_MESSAGE();
    END CATCH
END;
GO


