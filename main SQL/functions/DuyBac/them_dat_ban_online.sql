CREATE OR ALTER PROCEDURE them_dat_ban_online
    @MaPhieu      CHAR(5),
    @NgayDat      DATE,
    @MaCN         INT,
    @NhanVienLap  CHAR(5),
    @CCCD         CHAR(12),
    @KhuVuc       INT,
    @SoLuongKhach INT,
    @GioDen       TIME,
    @GhiChu       NVARCHAR(100)
AS 
BEGIN
    INSERT INTO phieu_dat (MaPhieu, NgayDat, MaCN, NhanVienLap, CCCD, LoaiPhieu)
    VALUES
    (@MaPhieu, @NgayDat, @MaCN, @NhanVienLap, @CCCD, 2)

    INSERT INTO dat_ban_online (MaPhieu, KhuVuc, SoLuongKhach, GioDen, GhiChu)
    VALUES
    (@MaPhieu, @KhuVuc, @SoLuongKhach, @GioDen, @GhiChu)
END
go

