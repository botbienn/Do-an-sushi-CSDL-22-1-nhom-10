--Thêm thẻ khách hàng
CREATE OR ALTER PROCEDURE ThemTheKhachHang
    @MaThe CHAR(5),          
    @CCCD CHAR(12),             
    @NgayLap DATETIME,          
    @LoaiThe VARCHAR(10),       
    @TieuDung FLOAT(24) = 0,    
    @NhanVienLap CHAR(5) = NULL,
    @CapNhat DATETIME = NULL   
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM khach_hang WHERE CCCD = @CCCD)
        BEGIN
            PRINT 'Khách hàng không tồn tại. Không thể thêm thẻ.';
            RETURN;
        END

        IF EXISTS (SELECT 1 FROM the WHERE MaThe = @MaThe)
        BEGIN
            PRINT 'Ma the da ton tai. Vui long su dung ma the khac.';
            RETURN;
        END

        INSERT INTO the (MaThe, CCCD, NgayLap, LoaiThe, TieuDung, NhanVienLap, CapNhat)
        VALUES (
            @MaThe,               
            @CCCD,                
            @NgayLap,             
            @LoaiThe,             
            @TieuDung,            
            @NhanVienLap,        
            ISNULL(@CapNhat, GETDATE()) 
        );

        PRINT 'The khach hang da duoc them thanh cong.';
    END TRY
    BEGIN CATCH
        PRINT 'Da xay ra loi: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

--EXEC ThemTheKhachHang 
--	@MaThe = 'MT016', 
--	@CCCD = '98765432112', 
--	@NgayLap = '2024-12-14 10:00:00',
--	@LoaiThe = 'Gold', 
--	@TieuDung = 500000, 
--	@NhanVienLap = 'NV001', 
--	@CapNhat = '2024-12-14 12:00:00';

--------------------------------------------------------------------------------------------------
--Xóa thẻ khách hàng
CREATE OR ALTER PROCEDURE XoaTheKhachHang
    @MaThe CHAR(5) 
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM the WHERE MaThe = @MaThe)
        BEGIN
            PRINT 'The khong ton tai. Khong the xoa the.';
            RETURN;
        END

        DELETE FROM the
        WHERE MaThe = @MaThe;

        PRINT 'The khach hang da duoc xoa thanh cong.';
    END TRY
    BEGIN CATCH
        PRINT 'Da xay ra loi: ' + ERROR_MESSAGE();
    END CATCH
END;
GO
--EXEC XoaTheKhachHang @MaThe = 'MT016';

--------------------------------------------------------------------------------------------------
--Cập nhật thẻ khách hàng
CREATE OR ALTER PROCEDURE CapNhatTheKhachHang
    @MaThe CHAR(5),            
    @CCCD CHAR(12) = NULL,     
    @LoaiThe VARCHAR(10) = NULL, 
    @TieuDung FLOAT(24) = NULL,
    @NhanVienLap CHAR(5) = NULL, 
    @CapNhat DATETIME = NULL    
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM the WHERE MaThe = @MaThe)
        BEGIN
            PRINT 'The khong ton tai. Khong the cap nhat.';
            RETURN;
        END

        -- Kiểm tra xem khách hàng có tồn tại nếu cập nhật CCCD
        IF @CCCD IS NOT NULL AND NOT EXISTS (SELECT 1 FROM khach_hang WHERE CCCD = @CCCD)
        BEGIN
            PRINT 'Khach hang khong ton tai. Khong the cap nhat CCCD.';
            RETURN;
        END

        -- Cập nhật thông tin thẻ
        UPDATE the
        SET 
            CCCD = ISNULL(@CCCD, CCCD),              
            LoaiThe = ISNULL(@LoaiThe, LoaiThe),     
            TieuDung = ISNULL(@TieuDung, TieuDung), 
            NhanVienLap = ISNULL(@NhanVienLap, NhanVienLap), 
            CapNhat = ISNULL(@CapNhat, GETDATE())   
        WHERE 
            MaThe = @MaThe;

        PRINT 'Thong tin the khach hang da duoc cap nhat thanh cong.';
    END TRY
    BEGIN CATCH
        PRINT 'Da xay ra loi: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

--EXEC CapNhatTheKhachHang 
--    @MaThe = 'MT016', 
--    @CCCD = '123456789012', 
--    @LoaiThe = 'Gold', 
--    @TieuDung = 1000000, 
--    @NhanVienLap = 'NV002'




