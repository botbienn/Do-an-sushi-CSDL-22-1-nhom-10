CREATE OR ALTER PROCEDURE xoa_nhan_vien_v01
    @MaNV CHAR(5) 
AS
BEGIN
    DELETE FROM nhan_vien 
    WHERE MaNV = @MaNV
END
go

CREATE OR ALTER PROCEDURE xoa_nhan_vien_v02
    @MaNV CHAR(5) 
AS
BEGIN
    UPDATE nhan_vien
    SET DangLamViec = 0 
    WHERE MaNV = @MaNV
END
go

