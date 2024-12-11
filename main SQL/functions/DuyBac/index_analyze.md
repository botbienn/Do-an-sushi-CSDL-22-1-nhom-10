# Query


### TV1: Xoá nhân viên 
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

### TV6: Thêm món an vào hệ thống 
Bảng: mon_an
- Loại TV: Thêm, INSERT
- Câu truy vấn: 
```sql
    INSERT INTO mon_an (TenMon, Gia, Loai)
    VALUES
    (@TenMon, @Gia, @Loai)
```
Khối lượng: 
Tần xuất: 

### TV7: Thêm món an vào chi nhánh 
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

### TV8: Thêm món an vào khu vực 
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

