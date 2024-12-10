CREATE OR ALTER PROCEDURE them_mon_an
    @MaMon   CHAR(5),
    @TenMon  NVARCHAR(50),
    @Gia     INT,
    @Loai    NVARCHAR(50)
AS
BEGIN
    INSERT INTO mon_an (TenMon, Gia, Loai)
    VALUES
    (@TenMon, @Gia, @Loai)
END;
go 


CREATE OR ALTER PROCEDURE them_mon_an_chi_nhanh
    @MaCN     INT, 
    @MaMon    CHAR(5),
    @GiaoHang BIT
AS
BEGIN
    INSERT INTO mon_an_chi_nhanh (MaCN, MaMon, GiaoHang)
    VALUES
    (@MaCN, @MaMon, @GiaoHang)
END;
go 

CREATE OR ALTER PROCEDURE them_mon_an_khu_vuc
    @MaMon    CHAR(5),
    @MaKV     INT  
AS
BEGIN
    INSERT INTO mon_an_khu_vuc (MaMon, MaKhuVuc)
    VALUES
    (@MaMon, @MaKV)
END;
go 


