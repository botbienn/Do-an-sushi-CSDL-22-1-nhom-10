
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

# triggers 

- CREATE OR ALTER TRIGGER check_mon_dat_truoc
    - dat_ban_online(MaPhieu)

- CREATE OR ALTER TRIGGER trg_Check_Manager_Working_Current
    - PhieuDat(MaPhieu)
    - ChiNhanh(MaCN)
    - mon_an_chi_nhanh(MaMon)

- CREATE OR ALTER TRIGGER ma_mon_phieu_dat_check_giao_hang
    - dat_ban_online(MaPhieu)
    - PhieuDat(MaPhieu)
    - PhieuDat(MaCN)
    - PhieuDat(LoaiPhieu)
    - mon_an_chi_nhanh(MaMon)
    - mon_an_chi_nhanh(MaCN)
    - mon_an_chi_nhanh(GiaoHang) // nah 
    
- CREATE OR ALTER TRIGGER mon_an_chi_nhanh_trigger
    - ChiNhanh(MaCN)
    - ChiNhanh(MaKhuVuc)
    - mon_an_khu_vuc(MaKhuVuc)
    - mon_an_khu_vuc(MaMon)

- CREATE OR ALTER TRIGGER order_trigger
    - ChiNhanh(MaKhuVuc)
    - nhan_vien(MaNV)
    - nhan_vien(ChiNhanh)

- CREATE OR ALTER TRIGGER dat_ban_online_trigger 
    - PhieuDat(MaPhieu)
    - chi_nhanh(MaCN)
    - ChiNhanh(GioMo)
    - chi_nhanh(GioDong)

- CREATE OR ALTER TRIGGER Trg_CapNhatLoaiThe
    - the(LoaiThe)

- CREATE OR ALTER TRIGGER trg_CheckOverlap_WorkTime
    - lich_su_lam_viec(MaNV)
    - lich_su_lam_viec(ChiNhanh)
    - lich_su_lam_viec(NgayBatDau)
    - lich_su_lam_viec(NgayKetThuc)

- CREATE OR ALTER TRIGGER trg_Check_Employee_Manager_Department
    - nhan_vien(MaNV)
    - nhan_vien(BoPhan)

- CREATE OR ALTER TRIGGER trg_Check_Manager_Working_Current
    - nhan_vien(MaNV)
    - nhan_vien(ChiNhanh)
