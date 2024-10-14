# Giai đoạn 1:
## Đoạn đầu
- Hệ thống nhà hàng có nhiều chi nhánh, thông tin chi nhánh gồm 
    - Tên chi nhánh, 
    - Địa chỉ, 
    - Thời gian mở cửa, 
    - Thời gian đóng cửa, 
    - Số điện thoại chi nhánh, 
    - Nơi gửi xe.
---
- Mỗi thực đơn phụ thuộc vào khu vực, nhưng mỗi chi nhánh trong khu vực sẽ ghi nhận có hoặc không món ăn trong thực đơn. Thực đơn có nhiều mục, mỗi mục có nhiều loại thức ăn.
---
- Thông tin thức ăn gồm:
    - Mã món, 
    - Tên món, 
    - Giá tiền hiện tại.
---
- Khách hàng có thể đăng kí thẻ nếu cung cấp thông tin:
    - Họ tên,
    - Số điện thoại,
    - Email, 
    - Số cccd, 
    - Giới tính.
---
- Thẻ khách hàng có thông tin gồm:
    - Mã thẻ cụ thể, 
    - Ngày lập, 
    - Nhân viên lập.
- Thẻ có 3 loại: thẻ thành viên, thẻ silver và thẻ gold. Khi mới tạo thì ở loại thẻ thành viên.
- Khách hàng muốn nâng cấp thẻ cần các điều kiện sau:
    1. Thẻ silver
        - Điều kiện ĐẠT hạng thẻ SILVER: có tổng giá trị tiêu dùng tích lũy từ 10.000.000 VNĐ (100 điểm).
        - Điều kiện GIỮ hạng thẻ SILVER: có tổng giá trị tiêu dùng tích lũy từ 5.000.000 VNĐ (50 điểm) trong vòng 01 năm kể từ ngày đạt thẻ SILVER.
        - Điều kiện N NG hạng thẻ GOLD: có tổng giá trị tiêu dùng tích lũy từ 10.000.000 VNĐ (100 điểm) trong vòng 01 năm kể từ ngày đạt thẻ SILVER.
        - Nếu trong vòng 01 năm kể từ ngày đạt thẻ SILVER có tổng giá trị tiêu dùng tích lũy dưới 5.000.000 VNĐ (50 điểm): thẻ sẽ trở lại mức ban đầu là Membership
    2. Thẻ GOLD
        - Điều kiện ĐẠT hạng thẻ GOLD: có tổng giá trị tiêu dùng tích lũy từ 10.000.000 VNĐ (100 điểm) trong vòng 01 năm kể từ ngày đạt thẻ SILVER.
        - Điều kiện GIỮ hạng thẻ GOLD: có tổng giá trị tiêu dùng tích lũy từ 10.000.000 VNĐ (100 điểm) trong vòng 01 năm kể từ ngày đạt thẻ GOLD.
        - Nếu trong vòng 01 năm kể từ ngày đạt thẻ GOLD có tổng giá trị tiêu dùng tích lũy dưới 10.000.000 VNĐ (100 điểm): thẻ sẽ xuống hạng SILVER.
- Nếu mất thẻ có thể yêu cầu đóng thẻ và làm lại thẻ mới.
