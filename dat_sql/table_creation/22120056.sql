create database SushiStore_management
go

use SushiStore_management
go

-- bảng mon_an_khu_vuc
create table mon_an_khu_vuc (
    MaKhuVuc char(5),
    MaMon char(5),
    primary key (MaKhuVuc, MaMon)
	CONSTRAINT FK_mon_an_khu_vuc_khu_vuc_MaKhuVuc FOREIGN KEY (MaKhuVuc) REFERENCES khu_vuc (MaKhuVuc),
	CONSTRAINT FK_mon_an_khu_vuc_mon_an_MaMon FOREIGN KEY (MaMon) REFERENCES mon_an (MaMon),
);
-- bảng order
create table "order" (
    MaPhieu char(5) primary key,
    NgayDat date not null,
    MaCN char(5) not null,
    NhanVienLap char(5) not null,
    CCCD char(12) not null,
	constraint CK_NgayDat check (NgayDat >= getdate()),
	CONSTRAINT FK_order_nhan_vien_NhanVienLap FOREIGN KEY (NhanVienLap) REFERENCES nhan_vien (MaNV),
	CONSTRAINT FK_order_chi_nhanh_MaCN FOREIGN KEY (MaCN) REFERENCES chi_nhanh (MaCN),
	CONSTRAINT FK_order_khach_hang_NhanVienLap FOREIGN KEY (CCCD) REFERENCES khach_hang (CCCD),
);
-- bảng order_tai_cho
create table order_tai_cho (
    MaPhieu char(5) primary key,
    SoBan int not null,
	CONSTRAINT FK_order_tai_cho_order_MaPhieu FOREIGN KEY (MaPhieu) REFERENCES "order" (MaPhieu),
);

-- bảng dat_ban_online
create table dat_ban_online (
    MaPhieu char(5) primary key,
    KhuVuc char(5) not null,
    SoLuongKhach int not null,
    GioDen time not null,
    GhiChu nvarchar(100),
	CONSTRAINT CK_SoLuongKhach CHECK (SoLuongKhach > 0),
	constraint CK_GioDen check (GioDen between '00:00:00' and '23:59:59'),
	CONSTRAINT FK_dat_ban_online_order_MaPhieu FOREIGN KEY (MaPhieu) REFERENCES "order" (MaPhieu),
	CONSTRAINT FK_dat_ban_online_khu_vuc_KhuVucp FOREIGN KEY (KhuVuc) REFERENCES khu_vuc (MaKhuVuc),
);