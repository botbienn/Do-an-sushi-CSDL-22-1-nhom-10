--Giờ đóng cửa phải lớn hơn giờ mở cửa của chi nhánh

ALTER TABLE chi_nhanh
ADD CONSTRAINT CK_GioMo_GioDong CHECK (GioMo < GioDong);
GO

--Ngày sinh của nhân viên phải là ngày hợp lệ và trước ngày hiện tại
ALTER TABLE nhan_vien
ADD CONSTRAINT CK_NgaySinh CHECK (
    NgaySinh <= DATEADD(YEAR, -18, GETDATE()) -- Ngày sinh ít nhất 18 năm trước ngày hiện tại
);
GO

-- Ngày kết thúc làm việc tại chi nhánh cũ phải trước ngày bắt đầu làm việc tại chi nhánh mới.

CREATE TRIGGER trg_CheckEndDateBeforeStartDate
ON lich_su_lam_viec
FOR INSERT, UPDATE
AS
BEGIN
    -- Kiểm tra xem khi nhân viên chuyển chi nhánh, ngày kết thúc tại chi nhánh cũ phải trước ngày bắt đầu tại chi nhánh mới
    IF EXISTS (
        SELECT 1
        FROM lich_su_lam_viec lsv1
        JOIN inserted i ON lsv1.MaNV = i.MaNV
        WHERE lsv1.MaNV = i.MaNV
        AND lsv1.ChiNhanh <> i.ChiNhanh
        AND lsv1.NgayKetThuc > i.NgayBatDau
    )
    BEGIN
        -- Nếu ngày kết thúc tại chi nhánh cũ không trước ngày bắt đầu tại chi nhánh mới
        RAISERROR ('End date at the old branch must be before start date at the new branch.', 16, 1);
        ROLLBACK TRANSACTION; -- Hoàn tác giao dịch
    END
END
GO
-- Cùng 1 thời điểm thì 1 nhân viên chỉ được làm việc tại 1 chi nhánh. ( Không có khoảng thời gian chồng chéo cho cùng 1 nhân viên trong bảng Lịch sử làm việc)

CREATE TRIGGER trg_CheckOverlap_WorkTime
ON lich_su_lam_viec
FOR INSERT, UPDATE
AS
BEGIN
    -- Kiểm tra không có chồng chéo thời gian làm việc cho cùng 1 nhân viên tại các chi nhánh
    IF EXISTS (
        SELECT 1
        FROM lich_su_lam_viec lsv1
        JOIN inserted i ON lsv1.MaNV = i.MaNV
        WHERE (
            (lsv1.MaNV = i.MaNV) 
            AND (
                (i.NgayBatDau BETWEEN lsv1.NgayBatDau AND lsv1.NgayKetThuc)
                OR (i.NgayKetThuc BETWEEN lsv1.NgayBatDau AND lsv1.NgayKetThuc)
                OR (lsv1.NgayBatDau BETWEEN i.NgayBatDau AND i.NgayKetThuc)
                OR (lsv1.NgayKetThuc BETWEEN i.NgayBatDau AND i.NgayKetThuc)
            )
        )
    )
    BEGIN
        -- Nếu có thời gian chồng chéo, đưa ra thông báo lỗi
        RAISERROR ('The employee cannot work at multiple branches during the same time period.', 16, 1);
        ROLLBACK TRANSACTION; -- Hoàn tác giao dịch
    END
END
GO

--Nhân viên quản lý phải thuộc bộ phận quản lý
CREATE TRIGGER trg_Check_Employee_Manager_Department
ON chi_nhanh
FOR INSERT, UPDATE
AS
BEGIN
    -- Kiểm tra xem nhân viên quản lý có thuộc bộ phận quản lý không
    DECLARE @NVQuanLy CHAR(5);
    DECLARE @MaBoPhan NVARCHAR(5);

    -- Lấy mã nhân viên quản lý và mã bộ phận từ bảng inserted (dành cho các thao tác INSERT và UPDATE)
    SELECT @NVQuanLy = NVQuanLy FROM inserted;

    -- Lấy mã bộ phận của nhân viên quản lý
    SELECT @MaBoPhan = BoPhan FROM nhan_vien WHERE MaNV = @NVQuanLy;

    -- Kiểm tra nếu bộ phận của nhân viên quản lý không phải bộ phận "quản lý" (Giả sử mã bộ phận quản lý là 'BP01')
    IF @MaBoPhan <> 'BP01'
    BEGIN
        -- Nếu không thuộc bộ phận quản lý, thông báo lỗi và hoàn tác giao dịch
        RAISERROR ('The manager must belong to the management department.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
--Nhân viên quản lý phải đang làm việc tại chi nhánh đó trong thời gian hiện tại.
CREATE TRIGGER trg_Check_Manager_Working_Current
ON chi_nhanh
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @NVQuanLy CHAR(5);
    DECLARE @MaCN CHAR(5);
    DECLARE @NgayHienTai DATE;

    -- Lấy mã nhân viên quản lý và mã chi nhánh từ bảng inserted (dành cho các thao tác INSERT và UPDATE)
    SELECT @NVQuanLy = NVQuanLy, @MaCN = MaCN FROM inserted;
    
    -- Lấy ngày hiện tại
    SET @NgayHienTai = CONVERT(DATE, GETDATE());

    -- Kiểm tra xem nhân viên quản lý có đang làm việc tại chi nhánh đó trong ngày hiện tại không
    IF NOT EXISTS (
        SELECT 1
        FROM lich_su_lam_viec
        WHERE MaNV = @NVQuanLy
        AND ChiNhanh = @MaCN
        AND @NgayHienTai BETWEEN NgayBatDau AND NgayKetThuc
    )
    BEGIN
        -- Nếu nhân viên quản lý không đang làm việc tại chi nhánh trong thời gian hiện tại, đưa ra thông báo lỗi
        RAISERROR ('The manager must be working at the branch during the current time.', 16, 1);
        ROLLBACK TRANSACTION; -- Hoàn tác giao dịch
    END
END;
GO