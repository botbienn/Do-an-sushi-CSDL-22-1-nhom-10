-- 4. Chuyển nhân sự

CREATE OR ALTER PROCEDURE ChuyenNhanSu
@MaNV CHAR(5),
@MaChiNhanhMoi INT,
@MaBoPhanMoi INT = NULL
AS
BEGIN
        UPDATE nhan_vien
        SET ChiNhanh = @MaChiNhanhMoi
        WHERE MaNV = @MaNV;

        IF @MaBoPhanMoi IS NOT NULL
        BEGIN
            UPDATE nhan_vien
            SET BoPhan = @MaBoPhanMoi
            WHERE MaNV = @MaNV;
        END;

		UPDATE lich_su_lam_viec
        SET NgayKetThuc = getdate()
        WHERE MaNV = @MaNV and NgayKetThuc = null;

		INSERT INTO lich_su_lam_viec (MaNV, ChiNhanh, NgayBatDau, NgayKetThuc)
        VALUES (@MaNV, @MaChiNhanhMoi, getdate(), null);

END;
GO