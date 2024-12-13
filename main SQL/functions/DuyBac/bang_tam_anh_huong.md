### Mọi món ăn nằm trong chi nhánh phải nằm trong danh sách món của khu vực mà chi nhánh thuộc về 

|                  | Thêm | xoá | sửa             |
| ---------------- | ---- | --- | --------------- |
| mon_an_chi_nhanh | +    | -   | + (MaMon, MaCN) |
| mon_an_khu_vuc   | -    | +   | + (MaMon, MaKV) |
### Mã món đặt trước (mamon_phieudat) phải có mã phiếu trùng với mã phiếu của order đặt bàn online 

|                  | Thêm | xoá | sửa           |
| ---------------- | ---- | --- | ------------- |
| ma_mon_phieu_dat | +    | -   | + (DatTruoc)  |
| phieu_dat        | -    | -   | + (LoaiPhieu) |

### Các món ăn nằm trong đơn giao hàng phải là các món có thể giao 

|                  | Thêm | xoá | sửa           |
| ---------------- | ---- | --- | ------------- |
| ma_mon_phieu_dat | +    | -   | + (DatTruoc)  |
| ma_mon_chi_nhanh | -    | -   | + (LoaiPhieu) |
### Món ăn được đặt(mamon_phieudat) phải nằm trong danh sách thực đơn của chi nhánh(mamon_chinhanh).

|                  | Thêm | xoá | sửa                |
| ---------------- | ---- | --- | ------------------ |
| ma_mon_phieu_dat | +    | -   | + (MaPhieu, MaMon) |
| ma_mon_chi_nhanh | -    | -   | + (MaCN, MaMon)    |
### Nhân viên lập phiếu phải là nhân viên của chi nhánh và đang làm việc tại chi nhánh trong thời gian lập phiếu

|          | Thêm | xoá | sửa                   |
| -------- | ---- | --- | --------------------- |
| PhieuDat | +    | -   | + (NhanVienLap, MaCN) |
| NhanVien | -    | +   | + (ChiNhanh)          |

### Giờ đến của đặt bàn online phải nằm trong khung giờ hoạt động của chi nhánh

|                | Thêm | xoá | sửa                |
| -------------- | ---- | --- | ------------------ |
| Dat_ban_online | +    | -   | + (GioDen)         |
| Chi_nhanh      | -    | -   | + (GioMo, GioDong) |
### 6. loại thẻ phải được điều chỉnh dựa trên tiêu dùng tích lũy này theo các tiêu chí định trước và loại thẻ sẽ ảnh hưởng tới mức ưu đãi, giảm giá cho hóa đơn.
#### silver (10 triệu không tính ngày giới hạn) , ngày hôm nay - ngày cập nhật >= 1 năm -> tiêu dùng phải >= 5 triệu -> sau đó đặt tiêu dùng về 0
#### gold ( phải có silver) trong vòng 1 năm phải 10 triệu 

|         | Thêm | xoá | sửa  |
| ------- | ---- | --- | ---- |
| the     | +    | -   | + () |
| hoa_don | -    | -   | + () |
### Cùng 1 thời điểm thì 1 nhân viên chỉ được làm việc tại 1 chi nhánh. ( Không có khoảng thời gian chồng chéo cho cùng 1 nhân viên trong bảng Lịch sử làm việc)

|                  | Thêm | xoá | sửa                         |
| ---------------- | ---- | --- | --------------------------- |
| Lich_su_lam_viec | +    | -   | + (Ngaybatdau, ngayketthuc) |
### Nhân viên quản lý phải thuộc bộ phận quản lý

|           | Thêm | xoá | sửa                |
| --------- | ---- | --- | ------------------ |
| nhan_vien | -    | -   | + (BoPhan)         |
| Chi_nhanh | -    | -   | + (NhanVienQuanLy) |
### Nhân viên quản lý phải đang làm việc tại chi nhánh đó trong thời gian hiện tại.

|           | Thêm | xoá | sửa                |
| --------- | ---- | --- | ------------------ |
| nhan_vien | -    | -   | + (BoPhan)         |
| Chi_nhanh | -    | -   | + (NhanVienQuanLy) |

	

