# Lược đồ quan hệ
## Đoạn đầu
### Xác định công việc:
    - Bảng bao gồm: Chi nhánh, Thực đơn (sự liên kết giữa chi nhánh và món ăn), Món ăn, Khách hàng, Thẻ khách hàng.
    - Ràng buộc:
        - Bảng chi nhánh: Thời gian mở cửa và thời gian đóng cửa phải thuộc giờ trong 1 ngày, thời gian đóng cửa sau thời gian mở cửa.
        - Khách hàng: Số cccd phải có 12 số, Giới tính phải là nam hoặc nữ.
        - Bảng thẻ khách hàng: loại thẻ phải là thành viên hoặc silver hoặc gold.
    - Khóa chính:
        - Bảng chi nhánh: Tên chi nhánh, khu vực.
        - Bảng thực đơn: Tên chi nhánh, khu vực, mã món.
        - Bảng món ăn: mã món.
        - Bảng khách hàng: Số cccd.
        - Bảng thẻ khách hàng: Mã thẻ
    - Khóa ngoại
        - Bảng thực đơn: 
            - TênCN, Khu vực (Thực đơn) --> TênCN, Khu vực (Chi nhánh)
            - Mã món (Thực đơn) --> Mã món (Món ăn)
        - Bảng thẻ khách hàng: Số cccd (Thẻ khách hàng) --> Số cccd (Khách hàng)