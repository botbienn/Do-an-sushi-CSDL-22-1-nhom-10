CREATE OR ALTER PROCEDURE tim_mon_an_ma_mon 
    @ma_mon CHAR(5)
AS
BEGIN
    SELECT * from mon_an mm
    WHERE mm.MaMon = @ma_mon
END;
go

CREATE OR ALTER PROCEDURE tim_mon_an_ten_mon
    @input_str NVARCHAR(50)
AS
BEGIN
    SELECT * from mon_an mm 
    WHERE (mm.TenMon) like N'%' + @input_str + N'%'
END;
go

