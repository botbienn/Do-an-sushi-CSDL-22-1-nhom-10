
-- 1. cài đặt bảng
-- KhachHang
create table khach_hang(
	CCCD char(12) not null, 
	HoTen nvarchar(100) not null,
	SDT char(10) not null,
	Email varchar(100) not null,
	Phai nvarchar(3)

	primary key(CCCD)
)

-- the
create table the(
	MaThe char(5) not null,
	CCCD char(12) not null,
	NgayLap datetime not null,
	LoaiThe varchar(10) not null,
	TieuDung float(24),
	NhanVienLap char(5) not null,
	CapNhat datetime,

	primary key(MaThe)
)

-- chuong trinh
create table chuong_trinh(
	MaChuongTrinh char(5) not null,
	NgayBD datetime not null,
	NgayKT datetime not null,

	primary key(MaChuongTrinh)
)

-- giam gia
create table giam_gia(
	MaChuongTrinh char(5) not null,
	LoaiThe varchar(10) not null,
	UuDaiChietKhau float(24),
	GiamGia float(24),
	TangSP char(5),

	primary key(MaChuongTrinh, LoaiThe)
)

-- tham gia chuong trinh
create table tham_gia_chuong_trinh(
	MaPhieu char(5) not null,
	MaChuongTrinh char(5) not null

	primary key(MaPhieu, MaChuongTrinh)
)


-- 2. cai dat khoa ngoai
---- the
--alter table the
--add constraint FK_the_khachHang_CCCD
--foreign key (CCCD)
--references khach_hang(CCCD)

--alter table the
--add constraint FK_the_nhanVien_NhanVienLap
--foreign key (NhanVienLap)
--references nhan_vien(MaNhanVien)

-- giam gia
alter table giam_gia
add constraint FK_giamGia_chuongTrinh_MaChuongTrinh
foreign key (MaChuongTrinh)
references chuong_trinh(MaChuongTrinh)

-- tham gia chuong trinh
alter table tham_gia_chuong_trinh
add constraint FK_thamGiaChuongTrinh_chuongTrinh_MaChuongTrinh
foreign key (MaChuongTrinh)
references chuong_trinh(MaChuongTrinh)

--alter table tham_gia_chuong_trinh
--add constraint FK_thamGiaChuongTrinh_hoaDon_MaPhieu
--foreign key (MaPhieu)
--references hoa_don(MaPhieu)