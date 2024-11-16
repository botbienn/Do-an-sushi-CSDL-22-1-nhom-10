create database SushiStore_management
go

use SushiStore_management
go

-- bảng mon_an_khu_vuc
create table mon_an_khu_vuc (
    ma_khu_vuc char(5),
    ma_mon char(5),
    primary key (ma_khu_vuc, ma_mon)
);

-- bảng order
create table "order" (
    ma_phieu char(5) primary key,
    ngay_dat date not null,
    ma_cn char(5) not null,
    nv_lap char(5) not null,
    cccd varchar(12) not null,
	constraint chk_ngay_dat check (ngay_dat >= getdate())
);

-- bảng order_tai_cho
create table order_tai_cho (
    ma_phieu char(5) primary key,
    so_ban int not null
);
alter table order_tai_cho add constraint fk_order_tai_cho_order foreign key (ma_phieu) references "order" (ma_phieu);

-- bảng dat_ban_online
create table dat_ban_online (
    ma_phieu char(5) primary key,
    khu_vuc char(5) not null,
    so_luong_khach int not null,
    gio_den time not null,
    ghi_chu text,
	constraint chk_gio_den check (gio_den between '00:00:00' and '23:59:59')
);
alter table dat_ban_online add constraint fk_dat_ban_online_order foreign key (ma_phieu) references "order" (ma_phieu);
