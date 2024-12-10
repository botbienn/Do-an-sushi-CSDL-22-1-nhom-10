CREATE OR ALTER PROCEDURE del_mon_an
    @ma_mon INT
AS
BEGIN
    DELETE FROM mon_an WHERE 
    MaMon = @ma_mon 
END;
go


CREATE OR ALTER PROCEDURE add_mon_an
    @ten_mon NVARCHAR(50),
    @gia INT,
    @loai NVARCHAR(50)
AS 
BEGIN
    INSERT INTO mon_an (TenMon, Gia, Loai) VALUES
    (@ten_mon, @gia, @loai);
END;
go

CREATE OR ALTER PROCEDURE update_mon_an_ten_mon
    @ma_mon INT,
    @ten_mon_moi NVARCHAR(50)
AS
BEGIN
    UPDATE mon_an 
    SET TenMon = @ten_mon_moi
    WHERE MaMon = @ma_mon
END;
go

CREATE OR ALTER PROCEDURE update_mon_an_gia
    @ma_mon INT,
    @gia_moi INT,
AS
BEGIN
    UPDATE mon_an 
    SET gia = @gia_moi
    WHERE MaMon = @ma_mon
END;
go

CREATE OR ALTER PROCEDURE update_mon_an_loai
    @ma_mon INT,
    @loai_moi NVARCHAR(50)
AS
BEGIN
    UPDATE mon_an 
    SET loai = @loai_moi
    WHERE MaMon = @ma_mon
END;
go




