--Giá của món ăn phải lớn hơn 0
-- ALTER TABLE mon_an
-- ADD CONSTRAINT Check_Gia CHECK (Gia > 0);
-- GO

--Mỗi số điện thoại chỉ thuộc về 1 nhân viên (unique)
CREATE TRIGGER check_so_dien_thoai_unique
ON dien_thoai_nhan_vien
FOR INSERT, UPDATE
AS
BEGIN
    -- Khai báo biến để chứa số điện thoại mới thêm vào hoặc cập nhật
    DECLARE @DienThoai NVARCHAR(11);
    DECLARE @MaNV CHAR(5);

    -- Lấy số điện thoại và mã nhân viên từ bảng INSERTED (chứa các bản ghi vừa được thêm hoặc cập nhật)
    SELECT @DienThoai = DienThoai, @MaNV = MaNV
    FROM INSERTED;

    -- Kiểm tra xem số điện thoại này đã tồn tại trong bảng nhan_vien hay chưa
    IF EXISTS (SELECT 1 FROM dien_thoai_nhan_vien WHERE DienThoai = @DienThoai AND MaNV <> @MaNV)
    BEGIN
        -- Nếu số điện thoại đã tồn tại cho nhân viên khác, hủy thao tác và thông báo lỗi
        RAISERROR('Số điện thoại này đã được sử dụng bởi nhân viên khác!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
--Món ăn được đặt(mamon_phieudat) phải nằm trong danh sách thực đơn của chi nhánh(mamon_chinhanh).
-- CREATE TRIGGER check_ma_mon_phieu_dat
-- ON ma_mon_phieu_dat
-- AFTER INSERT, UPDATE 
-- AS
-- BEGIN 
--     IF(0 >= ANY (SELECT COUNT(distinct mcn.MaMon) 
-- 				 FROM INSERTED new 
-- 				 JOIN "order" o ON new.MaPhieu = o.MaPhieu
-- 				 JOIN chi_nhanh cn ON o.MaCN = cn.MaCN 
-- 				 JOIN mon_an_chi_nhanh mcn ON new.MaMon = mcn.MaMon
--                  GROUP BY new.MaMon, mcn.MaCN))
--     BEGIN
--         RAISERROR(N'Món ăn được đặt không nằm trong danh sách thực đơn của chi nhánh', 16, 1)
--         ROLLBACK TRANSACTION
--     END
-- END;
-- GO
--Mã món đặt trước (mamon_phieudat) phải có mã phiếu trùng với mã phiếu của order đặt bàn online 
-- CREATE TRIGGER check_mon_dat_truoc
-- ON ma_mon_phieu_dat
-- AFTER INSERT, UPDATE 
-- AS
-- BEGIN 
--     IF NOT EXISTS (SELECT 1
-- 			       FROM INSERTED new
-- 			       JOIN dat_ban_online dbol on dbol.MaPhieu = new.MaPhieu
-- 			       WHERE new.DatTruoc = 1
-- 			       )
--     BEGIN
--         RAISERROR(N'Mã phiếu của món ăn đặt trước không trùng với mã phiếu của order đặt bàn online', 16, 1)
--         ROLLBACK TRANSACTION
--     END
-- END;

--Lương của nhân viên phải bằng lương của bộ phận nhân viên thuộc về 
