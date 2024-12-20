CREATE OR ALTER PROCEDURE them_ma_mon_phieu_dat
    @MaPhieu CHAR(6),
    @MaMon   CHAR(6),
    @SoLuong INT,
    @DatTruoc BIT
AS 
BEGIN
    IF EXISTS(
    SELECT 1 FROM
    ma_mon_phieu_dat mmpd
    WHERE mmpd.MaPhieu = @MaPhieu AND
            mmpd.MaMon = @MaMon
    ) 
    BEGIN
        UPDATE ma_mon_phieu_dat
        SET SoLuong = SoLuong + @SoLuong
        WHERE MaPhieu = @MaPhieu AND
                MaMon = @MaMon
    END;
    ELSE 
    BEGIN
        INSERT INTO ma_mon_phieu_dat
        (MaPhieu, MaMon, SoLuong, DatTruoc)
        VALUES 
        (@MaPhieu, @MaMon, @SoLuong, @DatTruoc)
    END
END;
go
