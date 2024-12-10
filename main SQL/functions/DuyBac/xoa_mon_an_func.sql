CREATE OR ALTER PROCEDURE xoa_mon_an
    @MaMon   CHAR(5)
AS
BEGIN
    DELETE FROM mon_an 
    WHERE MaMon = @MaMon
END;
go 


CREATE OR ALTER PROCEDURE xoa_mon_an_chi_nhanh
    @MaCN     INT, 
    @MaMon    CHAR(5)
AS
BEGIN
    DELETE FROM mon_an_chi_nhanh 
    WHERE MaCN = @MaCN AND
            MaMon = @MaMon
END;
go 

CREATE OR ALTER PROCEDURE xoa_mon_an_khu_vuc
    @MaMon    CHAR(5),
    @MaKV     INT  
AS
BEGIN
    DELETE FROM mon_an_khu_vuc 
    WHERE MaKhuVuc = @MaKV AND
            MaMon = @MaMon
END;
go 


