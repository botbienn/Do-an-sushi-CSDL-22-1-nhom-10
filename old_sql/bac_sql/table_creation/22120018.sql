CREATE TABLE
    giao_hang (
        MaPhieu CHAR(5) PRIMARY KEY,
        ThoiDiemOnline TIME NOT NULL,
        ThoiGianOnline TIME NOT NULL,
        CONSTRAINT FK_giao_hang_order_MaPhieu FOREIGN KEY (MaPhieu) REFERENCES order (MaPhieu),
        CONSTRAINT CK_ThoiGianOnline CHECK (ThoiGianOnline > 0)
    ) GO
CREATE TABLE
    ma_mon_phieu_dat (
        MaPhieu CHAR(5) PRIMARY KEY,
        MaMon CHAR(5) PRIMARY KEY,
        SoLuong INT NOT NULL,
        DatTruoc BIT NOT NULL DEFAULT (0),
        CONSTRAINT FK_ma_mon_phieu_dat_order_MaPhieu FOREIGN KEY (MaPhieu) REFERENCES order (MaPhieu),
        CONSTRAINT FK_ma_mon_phieu_dat_mon_an_MaMon FOREIGN KEY (MaMon) REFERENCES mon_an (MaMon),
        CONSTRAINT CK_SoLuong CHECK (SoLuong >= 0)
    ) GO
CREATE TABLE
    hoa_don (
        MaPhieu CHAR(5) PRIMARY KEY,
        TongTien INT NOT NULL,
        GiamGia FLOAT (24) NOT NULL,
        ThanhTien INT NOT NULL,
        DiemTichLuy INT NOT NULL,
        CONSTRAINT FK_hoa_don_order_MaPhieu FOREIGN KEY (MaPhieu) REFERENCES order (MaPhieu),
        CONSTRAINT CK_GiamGia CHECK (GiamGia >= 0),
        CONSTRAINT CK_TongTien_ThanhTien CHECK (ThanhTien <= TongTien)
    ) GO
CREATE TABLE
    danh_gia (
        MaPhieu CHAR(5) PRIMARY KEY,
        DiemPhucVu INT NOT NULL,
        DiemViTri INT NOT NULL,
        DiemChatLuong INT NOT NULL,
        DiemGiaCa INT NOT NULL,
        DiemKhongGian INT NOT NULL,
        BinhLuan NVARCHAR (100),
        CONSTRAINT FK_danh_gia_order_MaPhieu FOREIGN KEY (MaPhieu) REFERENCES order (MaPhieu),
        CONSTRAINT CK_DiemPhucVu CHECK (
            DiemPhucVu >= 0
            AND DiemPhucVu <= 10
        ),
        CONSTRAINT CK_DiemViTri CHECK (
            DiemViTri >= 0
            AND DiemViTri <= 10
        ),
        CONSTRAINT CK_DiemChatLuong CHECK (
            DiemChatLuong >= 0
            AND DiemChatLuong <= 10
        ),
        CONSTRAINT CK_DiemGiaCa CHECK (
            DiemGiaCa >= 0
            AND DiemGiaCa <= 10
        ),
        CONSTRAINT CK_DiemKhongGian CHECK (
            DiemKhongGian >= 0
            AND DiemKhongGian <= 10
        )
    )