CREATE OR ALTER PROCEDURE XoaPhieuDat
    @MaPhieu CHAR(5) 
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM phieu_dat WHERE MaPhieu = @MaPhieu)
        BEGIN
            PRINT 'Phieu dat khong ton tai. Khong the xoa.';
            RETURN;
        END

		DELETE FROM giao_hang WHERE MaPhieu = @MaPhieu; 
        DELETE FROM tham_gia_chuong_trinh WHERE MaPhieu = @MaPhieu;
        DELETE FROM ma_mon_phieu_dat WHERE MaPhieu = @MaPhieu;
        DELETE FROM danh_gia WHERE MaPhieu = @MaPhieu;
        DELETE FROM hoa_don WHERE MaPhieu = @MaPhieu;

        DELETE FROM phieu_dat WHERE MaPhieu = @MaPhieu;

        PRINT 'Phieu dat da duoc xoa thanh cong.';
    END TRY
    BEGIN CATCH
        PRINT 'Da xay ra loi: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

--EXEC XoaPhieuDat @MaPhieu = 'MP020';

