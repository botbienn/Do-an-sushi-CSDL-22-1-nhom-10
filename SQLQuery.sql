
-- 1. cài đặt bảng
-- KhachHang
create table khach_hang(
	CCCD varchar(12) not null, 
	HoTen nvarchar(100),
	SDT varchar(10),
	Email nvarchar(100),
	Phai nvarchar(3)

	primary key(CCCD)
)

-- the
create table the(
	MaThe varchar(10) not null,
	CCCD varchar(12),
	NgayLap datetime,
	LoaiThe varchar(10),
	TieuDung float,
	NhanVienLap varchar(10),
	CapNhat nvarchar(100),

	primary key(MaThe)
)

-- chuong trinh
create table chuong_trinh(
	MaChuongTrinh varchar(10) not null,
	NgayBD datetime,
	NgayKT datetime,

	primary key(MaChuongTrinh)
)

-- giam gia
create table giam_gia(
	MaChuongTrinh varchar(10) not null,
	LoaiThe varchar(10),
	UuDaiChietKhau float,
	GiamGia float,
	TangSP varchar(10),

	primary key(MaChuongTrinh, LoaiThe)
)

-- tham gia chuong trinh
create table tham_gia_chuong_trinh(
	MaPhieu varchar(10),
	MaChuongTrinh varchar(10)

	primary key(MaPhieu, MaChuongTrinh)
)


-- 2. cai dat khoa ngoai
---- the
--alter table the
--add constraint FK_the_khachHang
--foreign key (CCCD)
--references khach_hang(CCCD)

--alter table the
--add constraint FK_the_nhanVien
--foreign key (NhanVienLap)
--references nhan_vien(MaNhanVien)

-- giam gia
alter table giam_gia
add constraint FK_giamGia_chuongTrinh
foreign key (MaChuongTrinh)
references chuong_trinh(MaChuongTrinh)

-- tham gia chuong trinh
alter table tham_gia_chuong_trinh
add constraint FK_thamGiaChuongTrinh_chuongTrinh
foreign key (MaChuongTrinh)
references chuong_trinh(MaChuongTrinh)

--alter table tham_gia_chuong_trinh
--add constraint FK_thamGiaChuongTrinh_hoaDon
--foreign key (MaPhieu)
--references hoa_don(MaPhieu)