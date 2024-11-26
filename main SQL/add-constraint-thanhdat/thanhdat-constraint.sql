USE SushiStore_management
GO
-- 1
ALTER TABLE dat_ban_online
ADD CONSTRAINT Check_SoLuongKhach CHECK (SoLuongKhach > 0);
GO
-- 2
ALTER TABLE ma_mon_phieu_dat
ADD CONSTRAINT Check_SoLuong CHECK (SoLuong > 0);
GO
-- 3
CREATE TRIGGER trg_CheckNhanVienLapPhieu
ON "order"
FOR INSERT, UPDATE
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM inserted i
		JOIN chi_nhanh cn ON cn.MaCN = i.MaCN
		JOIN nhan_vien nv ON nv.MaNV = i.NhanVienLap AND nv.ChiNhanh = cn.MaCN
		JOIN lich_su_lam_viec lslv ON nv.MaNV = lslv.MaNV AND lslv.ChiNhanh = cn.MaCN
		WHERE (GETDATE() >= lslv.NgayBatDau AND (GETDATE() <= lslv.NgayKetThuc OR lslv.NgayKetThuc IS NULL))
    )
    BEGIN
        RAISERROR ('Nhân viên phải là nhân viên của chi nhánh và đang làm việc tại chi nhánh vào thời điểm lập phiếu!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END
GO
-- 4
/*CREATE TRIGGER trg_CheckChiNhanhGiaoHang
ON giao_hang
FOR INSERT, UPDATE
 AS
BEGIN
	IF NOT EXISTS (
        SELECT 1
        FROM inserted i
		JOIN chi_nhanh cn on cn.MaCN = i.MaCN
		JOIN nhan_vien nv ON nv.MaNV = i.NhanVienLap AND nv.MaCN = cn.MaCN
		JOIN lich_su_lam_viec lslv on nv.MaNV = lslv.MaNV AND lslv.MaCN = cn.MaCN
		WHERE (i.NgayDat BETWEEN lslv.NgayBatDat AND lslv.NgayKetThuc)
    )
    BEGIN
        RAISERROR ('Nhân viên phải là nhân viên của chi nhánh và đang làm việc tại chi nhánh vào thời điểm lập phiếu!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO*/

--5
CREATE TRIGGER trg_CheckThoiGianDatBan
ON dat_ban_online
FOR INSERT, UPDATE
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM inserted i
		JOIN "order" o ON o.MaPhieu = i.MaPhieu
		JOIN chi_nhanh cn ON o.MaCN = cn.MaCN
		WHERE (i.GioDen BETWEEN cn.GioMo AND cn.GioDong)
    )
	BEGIN
		RAISERROR ('Giờ đến không nằm trong khung giờ hoạt động của chi nhánh!',16,1);
        ROLLBACK TRANSACTION;
	END
END