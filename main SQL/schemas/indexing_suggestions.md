
# ma_mon_chi_nhanh, ma_mon_khu_vuc
-> index maCN, maKV

# Bảng khách hàng  
- Thêm xoá sửa thẻ, 
- đặt món đặt bàn  

# query for order ? 
- order(MaPhieu NgayDat MaCN NhanVienLap CCCD)
- select * from order o where o.maphieu = maphieu 

-> **index maphieu**


# update food status ? 
insert ma_mon_chi_nhanh
update ma_mon_chi_nhanh  
**set mamon -> index mamon,**

# add / remove food in order 

# add food to order 

<BS>

- CREATE NONCLUSTERED INDEX macn_chi_nhanh_idx ON chi_nhanh(MaCN)
- CREATE NONCLUSTERED INDEX cccd_the_idx ON the(CCCD)
- CREATE NONCLUSTERED INDEX maphieu_phieu_giao_hang_idx ON giao_hang(MaPhieu); 
- CREATE NONCLUSTERED INDEX maphieu_phieu_dat_online_idx ON dat_ban_online(MaPhieu); 
- CREATE NONCLUSTERED INDEX maphieu_phieu_dat_idx ON PhieuDat(MaPhieu); 
- CREATE NONCLUSTERED INDEX maphieu_phieu_dat_tai_cho_idx ON order_tai_cho(MaPhieu); 
