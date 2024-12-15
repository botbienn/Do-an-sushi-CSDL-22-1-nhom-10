-- tìm kiếm nhân viên theo MaNV hoặc TenNV
drop proc searchNhanVien

go
create procedure searchNhanVien
	@maNV char(5) = null, @hoten nvarchar(50) = null
as
begin
	select *
	from nhan_vien nv join bo_phan bp 
	on nv.BoPhan = bp.MaBoPhan 
	where ( @maNV is null or nv.MaNV like '%' + @maNV + '%' ) and (nv.HoTen like '%' + @hoten + '%' or @hoten is null)
	order by nv.ChiNhanh ASC
end;