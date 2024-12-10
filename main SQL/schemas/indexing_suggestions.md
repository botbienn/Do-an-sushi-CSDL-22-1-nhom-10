
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

CREATE OR ALTER TRIGGER check_mon_dat_truoc
   JOIN dat_ban_online dbol on dbol.MaPhieu = new.MaPhieu
   WHERE new.DatTruoc = 1

CREATE OR ALTER TRIGGER trg_Check_Manager_Working_Current
     JOIN PhieuDat o ON new.MaPhieu = o.MaPhieu
     JOIN chi_nhanh cn ON o.MaCN = cn.MaCN 
     JOIN mon_an_chi_nhanh mcn ON new.MaMon = mcn.MaMon

CREATE OR ALTER TRIGGER ma_mon_phieu_dat_check_giao_hang
   JOIN dat_ban_online dbol on dbol.MaPhieu = new.MaPhieu

    PhieuDat o ON new.MaPhieu = o.MaPhieu JOIN 
    mon_an_chi_nhanh mcn ON mcn.MaCN = o.MaCN
    WHERE mcn.MaMon = new.MaMon AND
    mcn.GiaoHang = 0 AND o.LoaiPhieu = 3)

    
CREATE OR ALTER TRIGGER mon_an_chi_nhanh_trigger
                chi_nhanh cn ON new.MaCN = cn.MaCN LEFT JOIN
                mon_an_khu_vuc mkv ON mkv.MaKhuVuc = cn.MaKhuVuc AND
                                        new.MaMon = mkv.MaMon
                GROUP BY new.MaMon, new.MaCN))

CREATE OR ALTER TRIGGER order_trigger
    chi_nhanh cn ON new.MaCN = cn.MaCN LEFT JOIN
    nhan_vien nv ON new.NhanVienLap = nv.MaNV AND
                    nv.ChiNhanh != new.MaCN


CREATE OR ALTER TRIGGER dat_ban_online_trigger 
    PhieuDat o ON new.MaPhieu = o.MaPhieu JOIN
    chi_nhanh cn ON o.MaCN = cn.MaCN  
    WHERE new.GioDen < cn.GioMo OR 
            new.GioDen > cn.GioDong


CREATE OR ALTER TRIGGER Trg_CapNhatLoaiThe
    WHERE LoaiThe = 'Silver'

CREATE OR ALTER TRIGGER trg_CheckOverlap_WorkTime
    JOIN inserted i ON lsv1.MaNV = i.MaNV
    WHERE (
        (lsv1.MaNV = i.MaNV) 
        AND lsv1.ChiNhanh != i.ChiNhanh
        AND (
            (i.NgayBatDau BETWEEN lsv1.NgayBatDau AND lsv1.NgayKetThuc)
            OR (i.NgayKetThuc BETWEEN lsv1.NgayBatDau AND lsv1.NgayKetThuc)
            OR (lsv1.NgayBatDau BETWEEN i.NgayBatDau AND i.NgayKetThuc)
            OR (lsv1.NgayKetThuc BETWEEN i.NgayBatDau AND i.NgayKetThuc)


CREATE OR ALTER TRIGGER trg_Check_Employee_Manager_Department
nhan_vien nv ON new.NVQuanLy = nv.MaNV AND 
                nv.BoPhan != 5

CREATE OR ALTER TRIGGER trg_Check_Manager_Working_Current
    FROM inserted new JOIN 
    nhan_vien nv ON new.NVQuanLy = nv.MaNV)

    from inserted new
    join nhan_vien nv on new.nvquanly = nv.manv and new.macn != nv.chinhanh
