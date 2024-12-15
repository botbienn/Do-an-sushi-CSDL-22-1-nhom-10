# Query


### TV1: Xoá nhân viên (không đáng kể)
Bảng: nhan_vien
Loại TV: xoá 
    - Câu truy vấn: 
``` sql
DELETE FROM nhan_vien 
WHERE MaNV = @MaNV
```
Khối lượng: 100000
Tần xuất: 1-2 lần 1 năm 

### TV2: xoá món ăn trong toàn thực đơn (nhớ thêm constraint trên toàn db)
Bảng: mon_an
Loại TV: xoá 
    - Câu truy vấn: 
```sql
DELETE FROM mon_an 
WHERE MaMon = @MaMon
```

Khối lượng bảng: ~200
Tần xuất: 10 - 15 lần / 3 tháng (1 quý)

### TV3: xoá món ăn của 1 chi nhánh đang phục vụ 
Bảng: mon_an_chi_nhanh
Loại TV: xoá 
    - Câu truy vấn: 
```sql
DELETE FROM mon_an_chi_nhanh 
WHERE MaCN = @MaCN AND
        MaMon = @MaMon
```

- khối lượng: ~100 
- Tần xuất: 10 - 15 lần / 3 tháng (1 quý)

### TV4: xoá một món ăn tại một khu vực (nhơ thêm constraint cascade vào bảng liên quan)
Bảng: mon_an_khu_vuc
Loại TV: xoá 
    - Câu truy vấn: 
``` sql
DELETE FROM mon_an_khu_vuc 
WHERE MaKhuVuc = @MaKV AND
        MaMon = @MaMon
```
- khối lượng: 150
- Tần xuất: 10 - 15 lần / 3 tháng (1 quý)

### TV5: Tìm món ăn theo mã món, tên món 
Bảng: món ăn
Loại TV: đọc (read) 
```sql
SELECT * from mon_an mm
WHERE mm.MaMon = @ma_mon
-- hoặc
SELECT * from mon_an mm 
WHERE (mm.TenMon) like N'%' + @input_str + N'%'
```
- khối lượng: 200
- Tần xuất: 4000 lần / giờ

### TV6: Thêm món an vào hệ thống (không đáng kể)
Bảng: mon_an
- Loại TV: Thêm, INSERT
- Câu truy vấn: 
```sql
    INSERT INTO mon_an (TenMon, Gia, Loai)
    VALUES
    (@TenMon, @Gia, @Loai)
```
Khối lượng: 200
Tần xuất: 1-2 l

### TV7: Thêm món an vào chi nhánh (không đáng kể)
Bảng: mon_an_chi_nhanh
- Loại TV: Thêm, INSERT
- Câu truy vấn: 
```sql
    INSERT INTO mon_an_chi_nhanh (MaCN, MaMon, GiaoHang)
    VALUES
    (@MaCN, @MaMon, @GiaoHang)
```
Khối lượng: 
Tần xuất: 

### TV8: Thêm món an vào khu vực (không đáng kể)
Bảng: mon_an_khu_vuc
- Loại TV: Thêm, INSERT
- Câu truy vấn: 
```sql
    INSERT INTO mon_an_khu_vuc (MaMon, MaKhuVuc)
    VALUES
    (@MaMon, @MaKV)
```

Khối lượng: 
Tần xuất: 

### TV9:Thống kê doanh thu theo món ăn (từng chi nhánh trong 1 khoảng thời gian) 

Bảng: chi_nhanh, mon_an, ma_mon_phieu_dat, phieu_dat

Câu truy vấn 
```sql
SELECT cn.TenCN AS ChiNhanh,
        ma.TenMon AS MonAn,
        SUM(mmpd.SoLuong) AS SoLuong,
        SUM(ma.Gia * mmpd.SoLuong) AS DoanhThu
FROM phieu_dat pd
JOIN ma_mon_phieu_dat mmpd ON pd.MaPhieu = mmpd.MaPhieu
JOIN mon_an ma ON mmpd.MaMon = ma.MaMon
JOIN chi_nhanh cn ON pd.MaCN = cn.MaCN
WHERE pd.NgayDat BETWEEN @StartDate AND @EndDate
```
Khối lượng: 
Tần xuất: 
### TV10: Món bán chậm nhất theo chi nhánh

Bảng: phieu_dat, ma_mon_phieu_dat, mon_an

Câu truy vấn: 
```sql
SELECT ma.TenMon,
        pd.MaCN,
        SUM(mmpd.SoLuong) AS SoLuong
FROM phieu_dat pd
JOIN ma_mon_phieu_dat mmpd ON pd.MaPhieu = mmpd.MaPhieu
JOIN mon_an ma ON mmpd.MaMon = ma.MaMon
GROUP BY ma.TenMon, pd.MaCN
HAVING SUM(mmpd.SoLuong) >= all (
		SELECT SUM(mmpd2.SoLuong)
		 FROM phieu_dat pd2
		 JOIN ma_mon_phieu_dat mmpd2 ON pd2.MaPhieu = mmpd2.MaPhieu
		 WHERE pd2.MaCN = pd.MaCN
		 GROUP BY mmpd2.MaMon
	 );
```
khối lượng: 
tần xuất: 

### TV11: Món bán chậm nhất theo khu vực
Bảng: phieu_dat, ma_mon_phieu_dat, mon_an, chi_nhanh, khu_vuc

Câu truy vấn: 
```sql
SELECT ma.MaMon,
        ma.TenMon,
        kv.TenKhuVuc,
        kv.MaKhuVuc,
        SUM(mmpd.SoLuong) AS SoLuong
FROM phieu_dat pd
JOIN ma_mon_phieu_dat mmpd ON pd.MaPhieu = mmpd.MaPhieu
JOIN mon_an ma ON mmpd.MaMon = ma.MaMon
JOIN chi_nhanh cn ON pd.MaCN = cn.MaCN
JOIN khu_vuc kv ON cn.MaKhuVuc = kv.MaKhuVuc
GROUP BY ma.MaMon, ma.TenMon, kv.TenKhuVuc, kv.MaKhuVuc
HAVING SUM(mmpd.SoLuong) >= all (
		SELECT SUM(mmpd2.SoLuong)
		 FROM 
             phieu_dat pd2
         JOIN 
             ma_mon_phieu_dat mmpd2 ON pd2.MaPhieu = mmpd2.MaPhieu
         JOIN 
             chi_nhanh cn2 ON pd2.MaCN = cn2.MaCN
         JOIN 
             khu_vuc kv2 ON cn2.MaKhuVuc = kv2.MaKhuVuc
		 WHERE kv.MaKhuVuc = kv2.MaKhuVuc
		 GROUP BY mmpd2.MaMon
	 );

```

khối lượng: 
tần xuất: 

### Món ăn chậm nhất theo chi nhánh trong 1 khoảng thời gian 
