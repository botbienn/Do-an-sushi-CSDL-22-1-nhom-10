CREATE OR ALTER PROCEDURE alter_nhan_vien 
    @MaNV        CHAR(5),
    @HoTen       NVARCHAR(50),
    @SoNha       NVARCHAR(50),
    @Duong       NVARCHAR(50),
    @Quan        NVARCHAR(50),
    @ThanhPho    NVARCHAR(50),
    @NgaySinh    DATE, 
    @Phai        NVARCHAR(3),
    @BoPhan      INT ,
    @ChiNhanh    INT ,
    @Luong       INT ,  
    @DangLamViec BIT
AS
BEGIN
    UPDATE nhan_vien
    SET
    HoTen       = @HoTen      ,
    SoNha       = @SoNha      ,
    Duong       = @Duong      ,
    Quan        = @Quan       ,
    ThanhPho    = @ThanhPho   ,
    NgaySinh    = @NgaySinh   ,
    Phai        = @Phai       ,
    BoPhan      = @BoPhan     ,
    ChiNhanh    = @ChiNhanh   ,
    Luong       = @Luong      ,
    DangLamViec = @DangLamViec
    WHERE
    MaNV        = @MaNV
END
go

