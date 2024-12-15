CREATE OR ALTER PROCEDURE CapNhatPhieuDat
    @MaPhieu CHAR(5),          
    @NgayDat DATE = NULL,     
    @MaCN INT = NULL,           
    @NhanVienLap CHAR(5) = NULL, 
    @CCCD CHAR(12) = NULL,       
    @LoaiPhieu INT = NULL        
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM phieu_dat WHERE MaPhieu = @MaPhieu)
        BEGIN
            PRINT 'Phieu dat khong ton tai. Khong the cap nhat.';
            RETURN;
        END

        IF @MaCN IS NOT NULL AND NOT EXISTS (SELECT 1 FROM chi_nhanh WHERE MaCN = @MaCN)
        BEGIN
            PRINT 'Chi nhanh khong ton tai. Khong the cap nhat MaCN.';
            RETURN;
        END

        IF @NhanVienLap IS NOT NULL AND NOT EXISTS (SELECT 1 FROM nhan_vien WHERE MaNV = @NhanVienLap)
        BEGIN
            PRINT 'Nhan vien lap khong ton tai. Khong the cap nhat.';
            RETURN;
        END

        IF @CCCD IS NOT NULL AND NOT EXISTS (SELECT 1 FROM khach_hang WHERE CCCD = @CCCD)
        BEGIN
            PRINT 'Khach hang khong ton tai. Khong the cap nhat.';
            RETURN;
        END

        UPDATE phieu_dat
        SET 
            NgayDat = ISNULL(@NgayDat, NgayDat),        
            MaCN = ISNULL(@MaCN, MaCN),                
            NhanVienLap = ISNULL(@NhanVienLap, NhanVienLap), 
            CCCD = ISNULL(@CCCD, CCCD),                
            LoaiPhieu = ISNULL(@LoaiPhieu, LoaiPhieu) 
        WHERE 
            MaPhieu = @MaPhieu;

        PRINT 'Thong tin phieu dat da duoc cap nhat thanh cong.';
    END TRY
    BEGIN CATCH
        PRINT 'Da xay ra loi: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

--EXEC CapNhatPhieuDat 
--    @MaPhieu = 'MP001', 
--    @NgayDat = '2024-12-15',
--    @MaCN = 2, 
--    @NhanVienLap = 'NV003'

