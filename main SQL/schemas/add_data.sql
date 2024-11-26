INSERT INTO mon_an(MaMon, TenMon, Gia, Loai) VALUES
(MM001, Goi ngo sen tom thit, 120000, Mon khai vi)
(MM002, Sup cua, 150000, Mon khai vi)
(MM003, Cha gio, 70000, Mon khai vi)
(MM004, Lau thai, 250000, Mon chinh)
(MM005, Lau thai, 250000, Mon chinh)

INSERT INTO order_tai_cho(MaPhieu, SoBan) VALUES
(MP001, 1)
(MP002, 2)

INSERT INTO giao_hang(MaPhieu, ThoiDiemOnline, ThoiGianOnline) VALUES
(MP005, 09:34:00, 00:05:00)

INSERT INTO lich_su_lam_viec(MaNV, ChiNhanh, NgayBatDau, NgayKetThuc) VALUES
(NV001, 1, 03/20/2023, 10/01/2024)
(NV002, 2, 01/01/2021, 10/01/2023)
(NV003, 3, 03/01/2022, 01/01/2024)
(NV004, 4, 11/20/2020, 10/01/2022)
(NV005, 5, 10/01/2021, 08/30/2023)

INSERT INTO khach_hang(CCCD , HoTen , SDT , Email , Phai ) VALUES
(111111000000.0, Nguyễn Văn A, 1111111111, danh@gmail.com, Nam)
(111111000000.0, Nguyễn Văn B, 1111111112, danh2@gmail.com, Nam)
(111111000000.0, Nguyễn Văn C, 1111111113, danh3@gmail.com, Nam)
(111111000000.0, Nguyễn Văn D, 1111111114, danh4@gmail.com, Nam)

INSERT INTO mon_an_khu_vuc(MaKhuVuc, MaMon) VALUES
(1, MA001)
(1, MA002)
(2, MA001)
(2, MA002)
(2, MA003)

INSERT INTO bo_phan(TenBoPhan, MucLuong) VALUES
(Le tan, 8000000)
(Bep, 10000000)
(Phuc vu, 7000000)
(Ve sinh, 5000000)
(Quan ly, 15000000)

INSERT INTO order(MaPhieu, NgayDat, MaCN, NhanVienLap, CCCD) VALUES
(MP001, 2024-04-20, 1, NV1, 123456789123)
(MP002, 2024-04-21, 1, NV1, 123456789124)
(MP003, 2024-04-22, 2, NV1, 123456789125)
(MP004, 2024-04-23, 2, NV1, 123456789126)
(MP005, 2024-04-24, 1, NV2, 123456789127)

INSERT INTO khu_vuc(TenKhuVuc) VALUES
(Khu vuc 1)
(Khu vuc 2)
(Khu vuc 3)
(Khu vuc 4)
(Khu vuc 5)

INSERT INTO giam_gia(MaChuongTrinh , LoaiThe , UuDaiChietKhau , GiamGia , TangSP ) VALUES
(nan, GOLD, 50, 100, 1)
(nan, GOLD, 50, 100, 1)
(nan, SIVLER, 20, 40, 1)
(nan, SIVLER, 20, 40, 1)

INSERT INTO dien_thoai_nhan_vien(MaNV, DienThoai) VALUES
(NV001, 355390893)
(NV002, 802212872)
(NV003, 325131893)
(NV004, 912021753)
(NV005, 832702306)

INSERT INTO dat_ban_online(MaPhieu, KhuVuc, SoLuongKhach, GioDen, GhiChu) VALUES
(MP003, 3, 7, 15:00:00, Co the den tre)
(MP004, 1, 8, 08:45:00, Co the den tre)

INSERT INTO chuong_trinh(MaChuongTrinh , NgayBD , NgayKT ) VALUES
(MA001, 1/1/1999, 1/1/2000)
(MA002, 2/1/1999, 2/1/2000)
(MA003, 3/1/1999, 3/1/2000)
(MA004, 4/1/1999, 4/1/2000)

INSERT INTO nhan_vien(MaNV, HoTen, SoNha, Duong, Quan, ThanhPho, NgaySinh, Phai, BoPhan, ChiNhanh) VALUES
(NV001, Nguyen Van F, 123, Duong G, Quan 1, TP.HCM, 1990-01-01, Nam, BP005, CN001)
(NV002, Le Thi H, 456, Duong H, Quan 2, TP.HCM, 1992-05-05, Nu, BP003, CN002)
(NV003, Pham Van I, 789, Duong I, Quan 3, TP.HCM, 1994-09-09, Nam, BP002, CN003)
(NV004, Tran Thi J, 101, Duong J, Quan 4, TP.HCM, 1996-12-12, Nu, BP004, CN004)
(NV005, Ngo Van K, 202, Duong K, Quan 5, TP.HCM, 1988-08-08, Nam, BP001, CN005)

INSERT INTO tham_gia_chuong_trinh(MaPhieu , MaChuongTrinh ) VALUES

INSERT INTO chi_nhanh(TenCN, DiaChi, GioMo, GioDong, SDT, GiaoHang, XeMay, XeHoi, NVQuanLy, MaKhuVuc) VALUES
(Chi nhanh 1, 123 Duong A, Quan 1, TP.HCM, 8:00:00, 22:00:00, 281234567, 1, 1, 0, NV001, KV001)
(Chi nhanh 2, 456 Duong B, Quan 2, TP.HCM, 9:00:00, 23:00:00, 282234567, 1, 1, 1, NV002, KV002)
(Chi nhanh 3, 789 Duong C, Quan 3, TP.HCM, 7:30:00, 21:30:00, 283234567, 1, 0, 0, NV003, KV003)
(Chi nhanh 4, 101 Duong D, Quan 4, TP.HCM, 8:00:00, 22:00:00, 284234567, 1, 1, 1, NV004, KV004)
(Chi nhanh 5, 202 Duong E, Quan 5, TP.HCM, 8:30:00, 22:30:00, 285234567, 1, 1, 0, NV005, KV005)

