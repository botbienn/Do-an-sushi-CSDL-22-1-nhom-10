-- thêm đặt món
drop procedure sp_themPhieuDat 
go
create procedure sp_themPhieuDat 
	@MaPhieu     CHAR(5),
    @NgayDat     DATE,
    @MaCN        INT,
    @NhanVienLap CHAR(5),
    @CCCD        CHAR(12),
    @LoaiPhieu   INT
as
begin 
	begin transaction		
		begin try
			insert into phieu_dat(MaPhieu, NgayDat, MaCN, NhanVienLap, CCCD, LoaiPhieu)
			values (@MaPhieu, @NgayDat, @MaCN, @NhanVienLap, @CCCD, @LoaiPhieu)
			commit;
		end try

		begin catch
			-- rollback
			rollback;
			print('Có lỗi xãy ra khi thêm phiếu đặt: ' + error_message());
		end catch
end;
-- test
-- EXEC sp_ThemPhieuDat 
--    @MaPhieu = 'P001', 
--    @NgayDat = '2024-12-10', 
--    @MaCN = 1, 
--    @NhanVienLap = 'NV001', 
--    @CCCD = '123456789012', 
--    @LoaiPhieu = 1;

-- select *
-- from phieu_dat