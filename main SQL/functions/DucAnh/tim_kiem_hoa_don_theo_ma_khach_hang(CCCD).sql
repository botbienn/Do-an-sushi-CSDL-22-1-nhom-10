--Tìm kiếm hóa đơn theo mã khách hàng (CCCD)

CREATE OR ALTER PROCEDURE TimKiemHoaDonTheoMaKhachHang
    @CCCD CHAR(12)
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM khach_hang WHERE CCCD = @CCCD)
        BEGIN
            PRINT 'Khach hang khong ton tai. Khong the tim hoa don.';
            RETURN;
        END

        SELECT 
            hd.MaPhieu AS MaHoaDon,
            hd.TongTien,
            hd.GiamGia,
            hd.ThanhTien,
            hd.DiemTichLuy,
            pd.NgayDat,
            pd.MaCN AS MaChiNhanh,
            pd.LoaiPhieu
        FROM 
            hoa_don hd
        INNER JOIN 
            phieu_dat pd ON hd.MaPhieu = pd.MaPhieu
        WHERE 
            pd.CCCD = @CCCD
        ORDER BY 
            pd.NgayDat DESC;

        PRINT 'Tim kiem hoa don thanh cong.';
    END TRY
    BEGIN CATCH
        PRINT 'Da xay ra loi: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

