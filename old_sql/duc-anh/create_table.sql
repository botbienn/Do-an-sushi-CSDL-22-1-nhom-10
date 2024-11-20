go
create table lich_su_lam_viec (
	MaNV char(5),
	ChiNhanh char(5),
	NgayBatDau date,
	NgayKetThuc date not null,
	primary key(MaNV, ChiNhanh, NgayBatDau),
	CONSTRAINT CK_NgayBatDau_NgayKetThuc CHECK (NgayBatDau < NgayKetThuc),
	CONSTRAINT FK_lich_su_lam_viec_nhan_vien_MaNV FOREIGN KEY (MaNV) REFERENCES nhan_vien (MaNV),
	CONSTRAINT FK_lich_su_lam_viec_chi_nhanh_MaCN FOREIGN KEY (ChiNhanh) REFERENCES chi_nhanh (MaCN),
);
go
create table dien_thoai_nhan_vien (
	MaNV char(5),
	DienThoai nvarchar(11),
	primary key (MaNV, DienThoai),
	CONSTRAINT FK_dien_thoai_nhan_vien_nhan_vien_MaNV FOREIGN KEY (MaNV) REFERENCES nhan_vien (MaNV),
);
go
create table mon_an (
	MaMon char(5) primary key,
	TenMon nvarchar(50) not null,
	Gia int not null,
	Loai nvarchar(50) not null,
	CONSTRAINT CK_Gia CHECK (Gia > 0),
);
go
create table mon_an_chi_nhanh (
	MaCN char(5),
	MaKhuVuc char(5),
	MaMon char(5),
	GiaoHang bit not null,
	primary key (MaCN, MaKhuVuc, MaMon),
	CONSTRAINT FK_mon_an_chi_nhanh_chi_nhanh_MaCN FOREIGN KEY (MaCN) REFERENCES chi_nhanh (MaCN),
	CONSTRAINT FK_mon_an_chi_nhanh_mon_an_khu_vuc_MaKhuVuc_MaMon FOREIGN KEY (MaKhuVuc, MaMon) REFERENCES mon_an_khu_vuc (MaKhuVuc, MaMon),
);


go

