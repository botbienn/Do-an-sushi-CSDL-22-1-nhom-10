CREATE OR ALTER PROCEDURE alter_mon_an
    @MaMon   CHAR(5),
    @TenMon  NVARCHAR(50),
    @Gia     INT,
    @Loai    NVARCHAR(50)
AS
BEGIN
    UPDATE mon_an 
    SET TenMon = @TenMon, 
        Gia = @Gia, 
        Loai = @Loai
    WHERE MaMon = @MaMon
END;
go 


CREATE OR ALTER PROCEDURE alter_mon_an_chi_nhanh
    @MaCN     INT, 
    @MaMon    CHAR(5),
    @GiaoHang BIT
AS
BEGIN
    UPDATE mon_an_chi_nhanh 
    SET MaMon = @MaMon,
        GiaoHang = @GiaoHang
    WHERE MaCN = @MaCN
END;
go 

CREATE OR ALTER PROCEDURE alter_mon_an_khu_vuc
    @MaMon    CHAR(5),
    @MaKV     INT  
AS
BEGIN
    UPDATE mon_an_khu_vuc 
    SET MaMon = @MaMon
    WHERE MaKhuVuc = @MaKV
END;
go 


