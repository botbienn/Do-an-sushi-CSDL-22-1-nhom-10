create database SushiStore_management
go

use SushiStore_management
go

-- bảng mon_an_khu_vuc
create table mon_an_khu_vuc (
    MaKhuVuc char(5),
    MaMon char(5),
    primary key (MaKhuVuc, MaMon)
);
alter table mon_an_khu_vuc add constraint fk_monankv_kv foreign key (MaKhuVuc) references khu_vuc (MaKhuVuc);
alter table mon_an_khu_vuc add constraint fk_monankv_ma foreign key (MaMon) references mon_an (MaMon);
-- bảng order
create table "order" (
    MaPhieu char(5) primary key,
    NgayDat date not null,
    MaCN char(5) not null,
    NhanVienLap char(5) not null,
    CCCD char(12) not null,
	constraint chk_ngay_dat check (NgayDat >= getdate())
);
alter table "order" add constraint fk_order_nv foreign key (NhanVienLap) references nhan_vien (MaNV);
alter table "order" add constraint fk_order_cn foreign key (MaCN) references chi_nhanh (MaCN);
alter table "order" add constraint fk_order_kh foreign key (CCCD) references khach_hang (CCCD);
-- bảng order_tai_cho
create table order_tai_cho (
    MaPhieu char(5) primary key,
    SoBan int not null
);
alter table order_tai_cho add constraint fk_order_tai_cho_order foreign key (MaPhieu) references "order" (MaPhieu);

-- bảng dat_ban_online
create table dat_ban_online (
    MaPhieu char(5) primary key,
    KhuVuc char(5) not null,
    SoLuongKhach int not null,
    GioDen time not null,
    GhiChu nvarchar(100),
	constraint chk_gio_den check (GioDen between '00:00:00' and '23:59:59')
);
alter table dat_ban_online add constraint fk_dat_ban_online_order foreign key (MaPhieu) references "order" (MaPhieu);
alter table dat_ban_online add constraint fk_dat_ban_online_kv foreign key (KhuVuc) references khu_vuc (MaKhuVuc);