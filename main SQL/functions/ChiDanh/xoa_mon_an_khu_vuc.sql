CREATE OR ALTER PROCEDURE xoa_mon_an_khu_vuc
    @MaMon    CHAR(6),
    @MaKV     INT  
AS
BEGIN

    -- xóa các món ăn thuộc chi nhánh có trong khu vực đó
    DELETE FROM mon_an_chi_nhanh
    WHERE MaCN IN (
        SELECT MaCN 
        FROM chi_nhanh
        WHERE MaKhuVuc = @MaKV
    )
    AND MaMon = @MaMon;

    -- xóa món khỏi khu vực
    DELETE FROM mon_an_khu_vuc 
    WHERE MaKhuVuc = @MaKV AND MaMon = @MaMon;

END;