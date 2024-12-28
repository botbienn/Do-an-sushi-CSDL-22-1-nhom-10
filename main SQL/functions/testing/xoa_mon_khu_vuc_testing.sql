select * 
from ma_mon_phieu_dat mmpd 
where mmpd.MaPhieu = '000001'

insert into ma_mon_phieu_dat (MaPhieu, MaMon, SoLuong, DatTruoc) values 
(N'000001', N'MM0060', 1, 0)

select *
from mon_an_khu_vuc kv
where kv.MaKhuVuc = 1 

insert into mon_an_khu_vuc (MaKhuVuc, MaMon) values 
(1, N'MM0001') 


exec xoa_mon_an_khu_vuc @MaMon = 'MM0001', @MaKV = 1

select mcn.MaCN, mcn.MaMon 
from mon_an_chi_nhanh mcn
JOIN chi_nhanh cn ON mcn.MaCN = cn.MaCN
where cn.MaKhuVuc = 1 