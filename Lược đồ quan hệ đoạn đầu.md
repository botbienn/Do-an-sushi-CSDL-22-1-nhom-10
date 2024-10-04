# Lược đồ quan hệ
## Đoạn đầu
### Xác định công việc:
    - Bảng bao gồm: Chi nhánh, Thực đơn(Quan hệ giữa thực đơn -(có)- món ăn), Không có sẵn(quan hệ giữa chi nhánh -(không có)- món ăn), Món ăn, Khách hàng, Thẻ khách hàng.
    - Ràng buộc:
        - Bảng chi nhánh: Thời gian mở cửa và thời gian đóng cửa phải thuộc giờ trong 1 ngày, thời gian đóng cửa sau thời gian mở cửa.
        - Khách hàng: Số cccd phải có 12 số, Giới tính phải là nam hoặc nữ.
        - Bảng thẻ khách hàng: loại thẻ phải là thành viên hoặc silver hoặc gold.
    - Khóa chính:
        - Bảng chi nhánh: Tên CN.
        - Bảng thực đơn: Khu vực, mã món.
        - Bảng không có sẵn: Tên CN, mã món.
        - Bảng món ăn: mã món.
        - Bảng khách hàng: Số cccd.
        - Bảng thẻ khách hàng: Mã thẻ, Sốcccd
    - Khóa ngoại
        - Bảng chi nhánh:
            - Khu vực (Chi nhánh) --> Khu vực (Thực đơn)
        - Bảng thực đơn: Mã món (Thực đơn) --> Mã món (Món ăn)
        - Bảng không có sẵn:
            - Tên CN(Không có sẵn) --> Tên CN (Chi nhánh)
            - Mã món (Không có sẵn) --> Mã món (Món ăn)
        - Bảng thẻ khách hàng: Số cccd (Thẻ khách hàng) --> Số cccd (Khách hàng)