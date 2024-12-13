CREATE OR ALTER PROCEDURE xoa_nhan_vien
    @MaNV CHAR(5) 
AS
BEGIN
    UPDATE nhan_vien
    SET DangLamViec = 0 
    WHERE MaNV = @MaNV
END
go

