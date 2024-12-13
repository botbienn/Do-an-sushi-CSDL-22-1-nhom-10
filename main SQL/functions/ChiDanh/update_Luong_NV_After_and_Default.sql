--set up luong mac dinh cho nhanv ien
--drop trigger trg_setUpLuongNVDefault
create trigger trg_setUpLuongNVDefault
on nhan_vien
after insert
as
begin
	update nv
	set nv.Luong = bp.MucLuong
	from nhan_vien nv join bo_phan bp
	on nv.BoPhan =  bp.MaBoPhan
	join inserted i on i.MaNV = nv.MaNV 
end

-- test
--INSERT INTO nhan_vien(MaNV, HoTen, SoNha, Duong, Quan, ThanhPho, NgaySinh, Phai, BoPhan, ChiNhanh) VALUES
--(N'NV101', N'Nguyen Van 111', N'111 Le Lai', N'Le Lai', N'Quan 111', N'TP HCM', N'1990-05-15', N'Nam', N'1', N'1')


-- update luong nhan vien
go
create or alter procedure proc_updateLuongNhanVien
	@MaNV char(5), @luongMoi int
as
begin
	declare @luongHienTai int, @maBP int;
	
	-- lấy lương hiện tại và mã bộ phận
	select @luongHienTai = nv.Luong, @maBP = nv.BoPhan
	from nhan_vien nv
	where nv.MaNV = @MaNV;

	-- nếu lương mới khác lương hiện tại --> update
	if @luongMoi != @luongHienTai
		begin 
			update nhan_vien 
			set Luong = @luongMoi
			where MaNV = @MaNV
		end

end

-- test
--update nhan_vien
--set Luong = 9100000
--where MaNV = 'NV101'