ALTER DATABASE SushiStore_management
ADD FILEGROUP The_Gold;

ALTER DATABASE SushiStore_management
ADD FILEGROUP The_Silver;

ALTER DATABASE SushiStore_management
ADD FILEGROUP The_Member;

ALTER DATABASE SushiStore_management
ADD FILE (
NAME = The_Gold,
FILENAME = 'D:\dbdata\The_Gold.ndf',

SIZE = 10 MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 1024 KB
) TO FILEGROUP The_Gold;

ALTER DATABASE SushiStore_management
ADD FILE (
NAME = The_Silver,
FILENAME = 'D:\dbdata\The_Silver.ndf',

SIZE = 10 MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 1024 KB
) TO FILEGROUP The_Silver;

ALTER DATABASE SushiStore_management
ADD FILE (
NAME = The_Member,
FILENAME = 'D:\dbdata\The_Member.ndf',

SIZE = 10 MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 1024 KB
) TO FILEGROUP The_Member;

drop partition scheme LoaiThe_scheme
drop partition function LoaiThe_func

CREATE PARTITION FUNCTION LoaiThe_func (VARCHAR(10))
AS RANGE LEFT FOR VALUES ('Gold', 'member');


	
CREATE  PARTITION SCHEME LoaiThe_Scheme
AS PARTITION LoaiThe_func
TO ([The_Gold], [The_Member], [The_Silver]);

SELECT name as [File Group Name]
FROM sys.filegroups
WHERE type = 'FG'
GO

SELECT name as [DB FileName],physical_name as
[DB File Path]
FROM sys.database_files
where type_desc = 'ROWS'
GO

create table the_parted (
	MaThe       CHAR(6) NOT NULL,
    CCCD        CHAR(12) NOT NULL,
    NgayLap     DATETIME NOT NULL,
    LoaiThe     VARCHAR(10) NOT NULL,
    TieuDung    FLOAT(24) DEFAULT(0),
    NhanVienLap CHAR(6) NULL,
    CapNhat     DATETIME,

    CONSTRAINT PK_the_parted_MaThe PRIMARY KEY NONCLUSTERED (MaThe),
    CONSTRAINT FK_the_parted_khachHang_CCCD FOREIGN KEY (CCCD) REFERENCES khach_hang(CCCD),

    CONSTRAINT FK_the_parted_nhanVien_NhanVienLap 
    FOREIGN KEY (NhanVienLap) REFERENCES nhan_vien(MaNV)
    ON DELETE SET NULL,
)

create clustered index idx_the_parted_LoaiThe on the_parted(LoaiThe)
ON [LoaiThe_scheme]([LoaiThe])



insert into the_parted (MaThe, CCCD, NgayLap, LoaiThe, TieuDung, NhanVienLap, CapNhat)
select MaThe, CCCD, NgayLap, LoaiThe, TieuDung, NhanVienLap, CapNhat 
from the;

drop table the

EXEC sp_rename 'the_parted', 'the';

--SELECT *
--FROM the_parted
--WHERE $PARTITION.LoaiThe_func(LoaiThe) = 3
--SELECT *
--FROM the
--Where LoaiThe = 'member'