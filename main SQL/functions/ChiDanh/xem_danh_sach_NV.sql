
-- Xem danh sách nhân viên theo chi nhánh (nhiều chi nhánh hoặc tất cả chi nhánh) 
-- xem danh sách nhân viên của 1 chi nhánh cụ thể
go
create procedure sp_GetEmployeeByBranch 
	@MaChiNhanh int
as 
begin
	select nv.MaNV, nv.HoTen, nv.SoNha, nv.Duong, nv.Quan, nv.ThanhPho, nv.NgaySinh, nv.Phai, nv.BoPhan, nv.ChiNhanh, nv.Luong
	from nhan_vien nv join chi_nhanh cn 
	on nv.ChiNhanh = cn.MaCN
	where cn.MaCN = @MaChiNhanh
end;

-- test:
-- exec sp_GetEmployeeByBranch @MaChiNhanh = 1;


go

-- xem danh sách nhân viên theo nhiều chi nhánh
select *
from nhan_vien nv join chi_nhanh cn
on nv.ChiNhanh = cn.MaCN
