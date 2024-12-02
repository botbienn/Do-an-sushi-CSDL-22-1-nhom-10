-- 1. Phái của khách hàng phải là “Nam” hoặc “Nữ’
ALTER TABLE khach_hang 
ADD CONSTRAINT Check_Phai CHECK (khach_hang.Phai in (N'Nam', N'Nữ'));

-- 2. Điểm tích lũy trong hóa đơn phải bằng thành tiền (tổng tiền sau giảm) / 100000 
GO
CREATE TRIGGER trgUpdateDiemTichLuy
ON hoa_don
AFTER INSERT, UPDATE
AS IF UPDATE(DiemTichLuy) OR UPDATE (ThanhTien)
BEGIN
		UPDATE hoa_don
		SET DiemTichLuy = floor(i.ThanhTien/100000)	
		FROM hoa_don hd join inserted i
		ON hd.MaPhieu = i.MaPhieu
		WHERE hd.DiemTichLuy != floor(i.ThanhTien/100000)	-- cập nhật
END


-- 3. Ngày kết thúc chương trình phải sau ngày bắt đầu.
GO
ALTER TABLE chuong_trinh
ADD CONSTRAINT CK_NgayKT_NgayBD CHECK (NgayKT > NgayBD)


-- 4 Số tiền GiamGia phải lớn hơn 0.
GO
ALTER TABLE giam_gia
ADD CONSTRAINT CK_giamGia CHECK (GiamGia > 0)


-- 5. Tiêu dùng tích lũy trên thẻ khách hàng phải luôn được cập nhật 
-- từ điểm tích lũy trên hóa đơn (bằng tổng hóa đơn của khách hàng)
GO
CREATE TRIGGER Trg_CapNhatTieuDung
ON hoa_don
AFTER INSERT, UPDATE
AS
BEGIN
	-- Cập nhật TieuDung trong bảng 'the' dựa trên DiemTichLuy từ hoa_don
	UPDATE t
	SET TieuDung = TieuDung + sub.TotalDiem
	FROM the t
	join (
		-- Tính tổng DiemTichLuy từ các bản ghi mới hoặc cập nhật trong 'hoa_don'
		SELECT kh.CCCD, SUM(i.DiemTichLuy) AS TotalDiem
		FROM inserted i
		join "order" o ON i.MaPhieu = o.MaPhieu
		join khach_hang kh ON o.CCCD = kh.CCCD
		GROUP BY kh.CCCD
	) sub ON t.CCCD = sub.CCCD
END;


-- 6. loại thẻ phải được điều chỉnh dựa trên tiêu dùng tích lũy này theo các tiêu chí định trước và loại thẻ sẽ ảnh hưởng tới mức ưu đãi, giảm giá cho hóa đơn. 
	-- silver (10 triệu không tính ngày giới hạn) , ngày hôm nay - ngày cập nhật >= 1 năm -> tiêu dùng phải >= 5 triệu -> sau đó đặt tiêu dùng về 0
	-- gold ( phải có silver) trong vòng 1 năm phải 10 triệu 
GO
CREATE TRIGGER Trg_CapNhatLoaiThe
ON the
AFTER UPDATE, INSERT
AS
BEGIN
    -- Điều kiện xuống hạng Membership nếu tiêu dùng < 50 trong 1 năm
    UPDATE the
    SET LoaiThe = 'Membership',
        NgayLap = GETDATE(),
        CapNhat = GETDATE()
    WHERE LoaiThe = 'Silver'
      AND DATEDIFF(YEAR, NgayLap, GETDATE()) > 1 -- Quá 1 năm
      AND TieuDung < 50; -- Tích lũy dưới 50

    -- Điều kiện đạt hạng Silver
    UPDATE the
    SET LoaiThe = 'Silver',
        TieuDung = 0,
        NgayLap = GETDATE(),
        CapNhat = GETDATE()
    WHERE (LoaiThe IS NULL OR LoaiThe = 'Membership') -- Thẻ chưa đạt hạng
      AND TieuDung >= 100; -- Tích lũy từ 100

    -- Giữ hạng Silver nếu tiêu dùng >= 500 trong 1 năm
    UPDATE the
    SET LoaiThe = 'Silver',
        CapNhat = GETDATE()
    WHERE LoaiThe = 'Silver'
      AND DATEDIFF(YEAR, NgayLap, GETDATE()) <= 1 -- Trong 1 năm
      AND TieuDung >= 50; -- Tích lũy từ 500

    -- Nâng hạng từ Silver lên Gold nếu tiêu dùng >= 1000 trong 1 năm
    UPDATE the
    SET LoaiThe = 'Gold',
        TieuDung = 0,
        NgayLap = GETDATE(),
        CapNhat = GETDATE()
    WHERE LoaiThe = 'Silver'
      -- AND DATEDIFF(YEAR, NgayLap, GETDATE()) <= 1 -- Trong 1 năm
      AND TieuDung >= 100; -- Tích lũy từ 1000

    -- Giữ hạng Gold nếu tiêu dùng >= 1000 trong 1 năm
    UPDATE the
    SET LoaiThe = 'Gold',
        CapNhat = GETDATE()
    WHERE LoaiThe = 'Gold'
      AND DATEDIFF(YEAR, NgayLap, GETDATE()) <= 1 -- Trong 1 năm
      AND TieuDung >= 100; -- Tích lũy từ 1000

    -- Xuống hạng từ Gold xuống Silver nếu tiêu dùng < 1000 trong 1 năm
    UPDATE the
    SET LoaiThe = 'Silver',
        NgayLap = GETDATE(),
        CapNhat = GETDATE()
    WHERE LoaiThe = 'Gold'
      AND DATEDIFF(YEAR, NgayLap, GETDATE()) > 1 -- Trong 1 năm
      AND TieuDung < 100; -- Tích lũy dưới 1000
END;
