
--- viết truy vấn xem daonh thu theo ngày của 1 chi nhánh
GO
CREATE OR ALTER PROCEDURE xem_doanh_thu_chi_nhanh
    @MaCN INT,      -- Mã chi nhánh
    @Ngay DATE      -- Ngày cần xem doanh thu
AS
BEGIN
    -- Khai báo con trỏ để duyệt qua các phiếu đặt
    DECLARE @MaPhieu CHAR(5);

    DECLARE phieu_cursor CURSOR FOR
    SELECT MaPhieu
    FROM phieu_dat
    WHERE MaCN = @MaCN AND NgayDat = @Ngay;

    OPEN phieu_cursor;
    FETCH NEXT FROM phieu_cursor INTO @MaPhieu;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Gọi thủ tục calc_hoa_don để cập nhật bảng hoa_don với MaPhieu hiện tại
        EXEC calc_hoa_don @MaPhieu;

        FETCH NEXT FROM phieu_cursor INTO @MaPhieu;
    END;

    CLOSE phieu_cursor;
    DEALLOCATE phieu_cursor;

    -- Tính tổng doanh thu sau khi cập nhật bảng hoa_don
    SELECT SUM(hd.ThanhTien) AS DoanhThu
    FROM hoa_don hd
    JOIN phieu_dat pd ON hd.MaPhieu = pd.MaPhieu
    WHERE pd.MaCN = @MaCN AND pd.NgayDat = @Ngay;
END;
GO
--Test
--EXEC xem_doanh_thu_chi_nhanh 1, '2024-03-05'

--------------------------------------------------------------------------------------------------

--Viết truy vấn xem doanh thu theo tháng của 1 chi nhánh 
GO
CREATE OR ALTER PROCEDURE xem_doanh_thu_chi_nhanh_thang
    @MaCN INT,      -- Mã chi nhánh
    @Thang INT,     -- Tháng cần xem doanh thu
    @Nam INT        -- Năm cần xem doanh thu
AS
BEGIN
    -- Khai báo con trỏ để duyệt qua các phiếu đặt
    DECLARE @MaPhieu CHAR(5);

    DECLARE phieu_cursor CURSOR FOR
    SELECT MaPhieu
    FROM phieu_dat
    WHERE MaCN = @MaCN AND MONTH(NgayDat) = @Thang AND YEAR(NgayDat) = @Nam;

    OPEN phieu_cursor;
    FETCH NEXT FROM phieu_cursor INTO @MaPhieu;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Gọi thủ tục calc_hoa_don để cập nhật bảng hoa_don với MaPhieu hiện tại
        EXEC calc_hoa_don @MaPhieu;

        FETCH NEXT FROM phieu_cursor INTO @MaPhieu;
    END;

    CLOSE phieu_cursor;
    DEALLOCATE phieu_cursor;

    -- Tính tổng doanh thu sau khi cập nhật bảng hoa_don
    SELECT SUM(hd.ThanhTien) AS DoanhThu
    FROM hoa_don hd
    JOIN phieu_dat pd ON hd.MaPhieu = pd.MaPhieu
    WHERE pd.MaCN = @MaCN AND MONTH(pd.NgayDat) = @Thang AND YEAR(pd.NgayDat) = @Nam;
END;
GO
--Test
--EXEC xem_doanh_thu_chi_nhanh_thang 1, 3, 2024

--------------------------------------------------------------------------------------------------

--Viết truy vấn xem doanh thu theo quý của 1 chi nhánh
GO
CREATE OR ALTER PROCEDURE xem_doanh_thu_chi_nhanh_quy
    @MaCN INT,      -- Mã chi nhánh
    @Quy INT,       -- Quý cần xem doanh thu
    @Nam INT        -- Năm cần xem doanh thu
AS
BEGIN
    -- Khai báo con trỏ để duyệt qua các phiếu đặt
    DECLARE @MaPhieu CHAR(5);

    DECLARE phieu_cursor CURSOR FOR
    SELECT MaPhieu
    FROM phieu_dat
    WHERE MaCN = @MaCN AND DATEPART(QUARTER, NgayDat) = @Quy AND YEAR(NgayDat) = @Nam;

    OPEN phieu_cursor;
    FETCH NEXT FROM phieu_cursor INTO @MaPhieu;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Gọi thủ tục calc_hoa_don để cập nhật bảng hoa_don với MaPhieu hiện tại
        EXEC calc_hoa_don @MaPhieu;

        FETCH NEXT FROM phieu_cursor INTO @MaPhieu;
    END;

    CLOSE phieu_cursor;
    DEALLOCATE phieu_cursor;

    -- Tính tổng doanh thu sau khi cập nhật bảng hoa_don
    SELECT SUM(hd.ThanhTien) AS DoanhThu
    FROM hoa_don hd
    JOIN phieu_dat pd ON hd.MaPhieu = pd.MaPhieu
    WHERE pd.MaCN = @MaCN AND DATEPART(QUARTER, pd.NgayDat) = @Quy AND YEAR(pd.NgayDat) = @Nam;
END;
GO
--Test
--EXEC xem_doanh_thu_chi_nhanh_quy 1, 1, 2024

--------------------------------------------------------------------------------------------------

--Viết truy vấn xem doanh thu theo năm của 1 chi nhánh
GO
CREATE OR ALTER PROCEDURE xem_doanh_thu_chi_nhanh_nam
    @MaCN INT,      -- Mã chi nhánh
    @Nam INT        -- Năm cần xem doanh thu
AS
BEGIN
    -- Khai báo con trỏ để duyệt qua các phiếu đặt
    DECLARE @MaPhieu CHAR(5);

    DECLARE phieu_cursor CURSOR FOR
    SELECT MaPhieu
    FROM phieu_dat
    WHERE MaCN = @MaCN AND YEAR(NgayDat) = @Nam;

    OPEN phieu_cursor;
    FETCH NEXT FROM phieu_cursor INTO @MaPhieu;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Gọi thủ tục calc_hoa_don để cập nhật bảng hoa_don với MaPhieu hiện tại
        EXEC calc_hoa_don @MaPhieu;

        FETCH NEXT FROM phieu_cursor INTO @MaPhieu;
    END;

    CLOSE phieu_cursor;
    DEALLOCATE phieu_cursor;

    -- Tính tổng doanh thu sau khi cập nhật bảng hoa_don
    SELECT SUM(hd.ThanhTien) AS DoanhThu
    FROM hoa_don hd
    JOIN phieu_dat pd ON hd.MaPhieu = pd.MaPhieu
    WHERE pd.MaCN = @MaCN AND YEAR(pd.NgayDat) = @Nam;
END;
GO
--Test
--exec xem_doanh_thu_chi_nhanh_nam 1, 2024

--------------------------------------------------------------------------------------------------

-- Viết truy vấn xem doanh thu theo ngày của nhiều chi nhánh
GO
CREATE OR ALTER PROCEDURE xem_doanh_thu_nhieu_chi_nhanh_ngay
    @MaCN NVARCHAR(100), -- Danh sách mã chi nhánh, phân tách bằng dấu phẩy
    @Ngay DATE           -- Ngày cần xem doanh thu
AS
BEGIN
    -- Tách danh sách mã chi nhánh thành các giá trị riêng lẻ
    WITH DSChiNhanh AS
    (
        SELECT value AS MaChiNhanh FROM STRING_SPLIT(@MaCN, ',')
    )
    SELECT MaChiNhanh INTO #TempChiNhanh FROM DSChiNhanh;

    -- Khai báo con trỏ để duyệt qua các phiếu đặt
    DECLARE @MaPhieu CHAR(5);

    DECLARE phieu_cursor CURSOR FOR
    SELECT pd.MaPhieu
    FROM phieu_dat pd
    JOIN #TempChiNhanh cn ON pd.MaCN = cn.MaChiNhanh
    WHERE pd.NgayDat = @Ngay;

    OPEN phieu_cursor;
    FETCH NEXT FROM phieu_cursor INTO @MaPhieu;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Gọi thủ tục calc_hoa_don để cập nhật bảng hoa_don với MaPhieu hiện tại
        EXEC calc_hoa_don @MaPhieu;

        FETCH NEXT FROM phieu_cursor INTO @MaPhieu;
    END;

    CLOSE phieu_cursor;
    DEALLOCATE phieu_cursor;

    -- Tính tổng doanh thu
    SELECT pd.MaCN, SUM(hd.ThanhTien) AS DoanhThu
    FROM hoa_don hd
    JOIN phieu_dat pd ON hd.MaPhieu = pd.MaPhieu
    JOIN #TempChiNhanh cn ON pd.MaCN = cn.MaChiNhanh
    WHERE pd.NgayDat = @Ngay
    GROUP BY pd.MaCN;

    -- Xóa bảng tạm
    DROP TABLE #TempChiNhanh;
END;
GO
--Test
--exec xem_doanh_thu_nhieu_chi_nhanh_ngay '1,2', '2024-04-18'

--------------------------------------------------------------------------------------------------

-- Viết truy vấn xem doanh thu theo tháng của nhiều chi nhánh
GO
CREATE OR ALTER PROCEDURE xem_doanh_thu_nhieu_chi_nhanh_thang
    @MaCN NVARCHAR(100), -- Danh sách mã chi nhánh, phân tách bằng dấu phẩy
    @Thang INT,          -- Tháng cần xem doanh thu
    @Nam INT             -- Năm cần xem doanh thu
AS
BEGIN
    -- Tách danh sách mã chi nhánh thành các giá trị riêng lẻ và chuyển sang kiểu INT
    WITH DSChiNhanh AS
    (
        SELECT CAST(value AS INT) AS MaChiNhanh
        FROM STRING_SPLIT(@MaCN, ',')
    )
    -- Lưu kết quả từ CTE vào bảng tạm
    SELECT MaChiNhanh INTO #TempChiNhanh FROM DSChiNhanh;

    -- Khai báo biến để lưu mã phiếu trong quá trình duyệt con trỏ
    DECLARE @MaPhieu CHAR(5);

    -- Khai báo con trỏ để duyệt qua danh sách phiếu đặt thuộc các chi nhánh trong tháng và năm đã chỉ định
    DECLARE phieu_cursor CURSOR FOR
    SELECT pd.MaPhieu
    FROM phieu_dat pd
    JOIN #TempChiNhanh cn ON pd.MaCN = cn.MaChiNhanh
    WHERE MONTH(pd.NgayDat) = @Thang AND YEAR(pd.NgayDat) = @Nam;

    -- Mở con trỏ và lấy giá trị đầu tiên
    OPEN phieu_cursor;
    FETCH NEXT FROM phieu_cursor INTO @MaPhieu;

    -- Duyệt qua từng giá trị trong con trỏ
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Gọi thủ tục calc_hoa_don để cập nhật bảng hoa_don cho MaPhieu hiện tại
        EXEC calc_hoa_don @MaPhieu;

        -- Lấy giá trị tiếp theo từ con trỏ
        FETCH NEXT FROM phieu_cursor INTO @MaPhieu;
    END;

    -- Đóng và giải phóng con trỏ
    CLOSE phieu_cursor;
    DEALLOCATE phieu_cursor;

    -- Tính tổng doanh thu sau khi cập nhật bảng hoa_don
    SELECT pd.MaCN, SUM(hd.ThanhTien) AS DoanhThu
    FROM hoa_don hd
    JOIN phieu_dat pd ON hd.MaPhieu = pd.MaPhieu
    JOIN #TempChiNhanh cn ON pd.MaCN = cn.MaChiNhanh
    WHERE MONTH(pd.NgayDat) = @Thang AND YEAR(pd.NgayDat) = @Nam
    GROUP BY pd.MaCN;

    -- Xóa bảng tạm sau khi sử dụng
    DROP TABLE #TempChiNhanh;
END;
GO
--Test
--exec xem_doanh_thu_nhieu_chi_nhanh_thang '1,5', 3, 2024

--------------------------------------------------------------------------------------------------

-- Viết truy vấn xem doanh thu theo quý của nhiều chi nhánh
go
CREATE OR ALTER PROCEDURE xem_doanh_thu_nhieu_chi_nhanh_quy
    @MaCN NVARCHAR(100), -- Danh sách mã chi nhánh, phân tách bằng dấu phẩy
    @Quy INT,            -- Số quý
    @Nam INT             -- Năm
AS
BEGIN
    -- Tách danh sách mã chi nhánh thành các giá trị riêng lẻ và lưu vào bảng tạm
    WITH DSChiNhanh AS
    (
        SELECT CAST(value AS INT) AS MaChiNhanh
        FROM STRING_SPLIT(@MaCN, ',')
    )
    SELECT MaChiNhanh INTO #TempChiNhanh FROM DSChiNhanh; -- Lưu kết quả vào bảng tạm

    -- Khai báo con trỏ để duyệt qua các phiếu đặt theo các chi nhánh
    DECLARE @MaPhieu CHAR(5);

    DECLARE phieu_cursor CURSOR FOR
    SELECT pd.MaPhieu
    FROM phieu_dat pd
    JOIN #TempChiNhanh cn ON pd.MaCN = cn.MaChiNhanh
    WHERE DATEPART(QUARTER, pd.NgayDat) = @Quy AND YEAR(pd.NgayDat) = @Nam;

    OPEN phieu_cursor;
    FETCH NEXT FROM phieu_cursor INTO @MaPhieu;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Gọi thủ tục calc_hoa_don để cập nhật bảng hoa_don với MaPhieu hiện tại
        EXEC calc_hoa_don @MaPhieu;

        FETCH NEXT FROM phieu_cursor INTO @MaPhieu;
    END;

    CLOSE phieu_cursor;
    DEALLOCATE phieu_cursor;

    -- Tính tổng doanh thu sau khi cập nhật bảng hoa_don
    SELECT pd.MaCN, SUM(hd.ThanhTien) AS DoanhThu
    FROM hoa_don hd
    JOIN phieu_dat pd ON hd.MaPhieu = pd.MaPhieu
    JOIN #TempChiNhanh cn ON pd.MaCN = cn.MaChiNhanh
    WHERE DATEPART(QUARTER, pd.NgayDat) = @Quy AND YEAR(pd.NgayDat) = @Nam
    GROUP BY pd.MaCN;

    -- Dọn dẹp bảng tạm
    DROP TABLE #TempChiNhanh;
END;
GO
--Test
--exec xem_doanh_thu_nhieu_chi_nhanh_quy '2,6', 2, 2024

--------------------------------------------------------------------------------------------------

-- Viết truy vấn xem doanh thu theo năm của nhiều chi nhánh
GO
CREATE OR ALTER PROCEDURE xem_doanh_thu_nhieu_chi_nhanh_nam
    @MaCN NVARCHAR(100), -- Danh sách mã chi nhánh, phân tách bằng dấu phẩy
    @Nam INT             -- Năm cần xem doanh thu
AS
BEGIN
    -- Tách danh sách mã chi nhánh thành các giá trị riêng lẻ và lưu vào bảng tạm
    WITH DSChiNhanh AS
    (
        SELECT CAST(value AS INT) AS MaChiNhanh
        FROM STRING_SPLIT(@MaCN, ',')
    )
    SELECT MaChiNhanh INTO #TempChiNhanh FROM DSChiNhanh; -- Lưu kết quả vào bảng tạm

    -- Khai báo con trỏ để duyệt qua các phiếu đặt theo các chi nhánh
    DECLARE @MaPhieu CHAR(5);

    DECLARE phieu_cursor CURSOR FOR
    SELECT pd.MaPhieu
    FROM phieu_dat pd
    JOIN #TempChiNhanh cn ON pd.MaCN = cn.MaChiNhanh
    WHERE YEAR(pd.NgayDat) = @Nam;

    OPEN phieu_cursor;
    FETCH NEXT FROM phieu_cursor INTO @MaPhieu;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Gọi thủ tục calc_hoa_don để cập nhật bảng hoa_don với MaPhieu hiện tại
        EXEC calc_hoa_don @MaPhieu;

        FETCH NEXT FROM phieu_cursor INTO @MaPhieu;
    END;

    CLOSE phieu_cursor;
    DEALLOCATE phieu_cursor;

    -- Tính tổng doanh thu sau khi cập nhật bảng hoa_don
    SELECT pd.MaCN, SUM(hd.ThanhTien) AS DoanhThu
    FROM hoa_don hd
    JOIN phieu_dat pd ON hd.MaPhieu = pd.MaPhieu
    JOIN #TempChiNhanh cn ON pd.MaCN = cn.MaChiNhanh
    WHERE YEAR(pd.NgayDat) = @Nam
    GROUP BY pd.MaCN;

    -- Dọn dẹp bảng tạm
    DROP TABLE #TempChiNhanh;
END;
GO
--Test
--exec xem_doanh_thu_nhieu_chi_nhanh_nam '1,2,3', 2024

    