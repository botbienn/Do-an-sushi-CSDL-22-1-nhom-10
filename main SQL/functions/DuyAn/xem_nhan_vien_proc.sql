-- viết truy vấn xem danh sách nhân viên theo 1 chi nhánh
go
CREATE PROC DanhSachNhanVienTheoChiNhanh
    @MaCN INT
AS
BEGIN
    SELECT * FROM nhan_vien WHERE ChiNhanh = @MaCN
END
--exec DanhSachNhanVienTheoChiNhanh 2

------------------------------------------------------------------------------------

-- Viết truy vấn xem danh sách nhân viên tất cả chi nhánh
go
CREATE PROC DanhSachNhanVienCuaTatCaChiNhanh
AS
BEGIN
    SELECT * FROM nhan_vien
END
--exec DanhSachNhanVienCuaTatCaChiNhanh

------------------------------------------------------------------------------------

--Viết truy vấn xem danh sách nhân viên theo chi nhánh với danh sách chi nhánh được truyền theo dạng chuỗi với số lượng chưa biết trước
go
CREATE PROC DanhSachNhanVienTheoChiNhanhChuoi
    @MaCN NVARCHAR(100)
AS
BEGIN
    WITH DSChiNhanh AS
    (
        SELECT value as MaChiNhanh FROM STRING_SPLIT(@MaCN, ',')
    )
    SELECT * FROM nhan_vien WHERE ChiNhanh IN (SELECT MaChiNhanh FROM DSChiNhanh)
END
--exec DanhSachNhanVienTheoChiNhanhChuoi '1,2'