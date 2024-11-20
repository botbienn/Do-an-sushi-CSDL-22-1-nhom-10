create table khu_vuc
(
    MaKhuVuc char(5) primary key,
    TenKhuVuc nvarchar(50) not null
);

create table bo_phan
(
    MaBoPhan char(5) primary key,
    TenBoPhan nvarchar(50) not null,
    MucLuong float not null check (MucLuong > 0)
);

create table nhan_vien(
    MaNV char(5) primary key,
    HoTen nvarchar(50) not null,
    SoNha nvarchar(3) not null,
    Duong nvarchar(50) not null,
    Quan nvarchar(50) not null,
    ThanhPho nvarchar(50) not null,
    NgaySinh date not null check (datediff(year, NgaySinh, getdate()) >= 15),
    Phai nvarchar(3) not null check (Phai in ('Nam', 'Nu')),
    BoPhan char(5) not null,
    ChiNhanh char(5) not null,
);
alter table nhan_vien add constraint fk_nhanvien_bophan foreign key(BoPhan) references bo_phan(MaBoPhan);

create table chi_nhanh(
    MaCN Char(5) primary key,
    TenCN nvarchar(50) not null,
    DiaChi nvarchar(100) not null,
    GioMo time not null,
    GioDong time not null,
    SDT nvarchar(15) not null,
    GiaoHang bit not null,
    XeMay bit not null,
    XeHoi bit not null,
    NVQuanLy char(5) not null,
    MaKhuVuc char(5) not null,
);

alter table chi_nhanh add constraint fk_chinhanh_khuvuc foreign key(MaKhuVuc) references khu_vuc(MaKhuVuc);
alter table chi_nhanh add constraint fk_chinhanh_nhanvien foreign key(NVQuanLy) references nhan_vien(MaNV);


alter table  nhan_vien add constraint fk_nhanvien_chinhanh foreign key(ChiNhanh) references chi_nhanh(MaCN);