-- 5. Thêm thông tin nhân viên

CREATE OR ALTER PROCEDURE ThemNhanVien
	@MaNV CHAR(5),
    @TenNV NVARCHAR(50),
	@SoNha NVARCHAR(50),
	@Duong NVARCHAR(50),
	@Quan NVARCHAR(50),
	@ThanhPho NVARCHAR(50),
    @NgaySinh DATE,
    @GioiTinh NVARCHAR(3),
	@MaBoPhan INT,
    @MaChiNhanh INT
AS
BEGIN
    INSERT INTO nhan_vien (MaNV, HoTen, SoNha, Duong, Quan, ThanhPho, NgaySinh, Phai, BoPhan, ChiNhanh)
    VALUES (@MaNV, @TenNV,@SoNha, @Duong, @Quan, @ThanhPho, @NgaySinh, @GioiTinh, @MaBoPhan, @MaChiNhanh);

	INSERT INTO lich_su_lam_viec (MaNV, ChiNhanh, NgayBatDau, NgayKetThuc)
        VALUES (@MaNV, @MaChiNhanh, getdate(), null);
END;
GO