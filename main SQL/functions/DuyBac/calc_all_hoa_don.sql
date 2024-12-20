CREATE OR ALTER PROCEDURE calc_all_hoa_don
AS
BEGIN
    DECLARE @cur CURSOR;
    DECLARE @IMaPhieu CHAR(5);
    

    SET @cur = CURSOR FOR
    SELECT DISTINCT pd.MaPhieu
    FROM phieu_dat pd

    OPEN @cur

    FETCH NEXT FROM @cur INTO @IMaPhieu

    WHILE @@FETCH_STATUS = 0
    BEGIN
        EXEC calc_hoa_don @MaPhieu = @IMaPhieu
        FETCH NEXT FROM @cur INTO @IMaPhieu
    END
    CLOSE @cur
    DEALLOCATE @cur
END
go


