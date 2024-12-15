-- Điểm phục vụ của nhân viên theo ngày, tháng, quý, năm
-- điểm phục vụ của nhân viên theo ngày
go
create procedure getDiemPhucVuByDay 
	@Ngay date
as
begin
	-- có thể select ra ít cột lại
	select distinct nv.MaNV, nv.HoTen, nv.NgaySinh, nv.Phai, nv.BoPhan, nv.ChiNhanh, nv.Luong, dg.DiemPhucVu, pd.NgayDat
	from danh_gia dg join phieu_dat pd
	on dg.MaPhieu = pd.MaPhieu join nhan_vien nv
	on nv.MaNV = pd.NhanVienLap
	where pd.NgayDat = @Ngay;
end;

-- test
-- exec getDiemPhucVuByDay @Ngay = '2024-01-10'


-- điểm phụ vụ của nhân viên theo tháng
go
create procedure getDiemPhucVuByMonth
	@thang int, @nam int
as
begin 
	select distinct nv.MaNV, nv.HoTen, nv.NgaySinh, nv.Phai, nv.BoPhan, nv.ChiNhanh, nv.Luong, dg.DiemPhucVu, pd.NgayDat
	from danh_gia dg join phieu_dat pd 
	on dg.MaPhieu = pd.MaPhieu join nhan_vien nv
	on nv.MaNV = pd.NhanVienLap
	where @nam = YEAR(pd.NgayDat) and @thang = MONTH(pd.NgayDat)
end;

-- test
-- exec getDiemPhucVuByMonth @thang = 5, @nam = 2024;


-- điểm phục vụ của nhân viên theo quý
go
create procedure getDiemPhucVuByQuarter
	@quarter int, @nam int
as
begin
	select distinct nv.MaNV, nv.HoTen, nv.NgaySinh, nv.Phai, nv.BoPhan, nv.ChiNhanh, nv.Luong, dg.DiemPhucVu, pd.NgayDat, @quarter as 'Quarter'
	from danh_gia dg join phieu_dat pd
	on dg.MaPhieu = pd.MaPhieu join nhan_vien nv
	on nv.MaNV = pd.NhanVienLap
	where @nam = YEAR(pd.NgayDat) and (
	(@quarter = 1 and MONTH(pd.NgayDat) between 1 and 3) or
	(@quarter = 2 and MONTH(pd.NgayDat) between 4 and 7) or
	(@quarter = 3 and MONTH(pd.NgayDat) between 8 and 9) or
	(@quarter = 4 and MONTH(pd.NgayDat) between 10 and 12)
	);
end;

-- test
--exec getDiemPhucVuByQuarter @quarter = 2, @nam = 2024;



-- điểm phục vụ của nhân viên theo năm
go
create procedure getDiemPhucVuByYear
	@nam int
as
begin
	select distinct nv.MaNV, nv.HoTen, nv.NgaySinh, nv.Phai, nv.BoPhan, nv.ChiNhanh, nv.Luong, dg.DiemPhucVu, pd.NgayDat
	from danh_gia dg join phieu_dat pd
	on dg.MaPhieu = pd.MaPhieu join nhan_vien nv
	on nv.MaNV = pd.NhanVienLap
	where @nam = YEAR(pd.NgayDat)
end;

-- test
--exec getDiemPhucVuByYear @nam = 2024

