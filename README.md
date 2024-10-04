# Báo cáo đồ án SuShi
<<<<<<< second-half-1st-modified
=======
# Mức quan niệm
## Nữa đoạn sau
### Xác định công việc
    I. Trình bày đặt tả cho hệ thống Quản Lý Sushi

    II. Vẽ mô hình ER 
    1. Xác định thực thể và các thuộc tính  
        - Thực thể chính gồm:
            + Phiếu đặt món ăn(<u>Mã phiếu</u>, <u>ngày lập</u>, Nhân viên lập, số bàn, mã món, số lượng)
            + Phiếu đặt bàn(<u>Mã phiếu</u>, khu vực, mã nhà hàng, số lượng khách, ngày đặt, giờ đến, ghi chú, mã món, số lượng)
            + Hoá đơn(<u>Mã hoá đơn</u>, tổng tiền, số tiền được giảm, tổng tiền sau giảm, điểm tích luỷ)
            + Menu(<u>Mã món</u>, tình trạng, tên chi nhánh)
            + Chi nhánh(<u>Tên chi nhánh</u>, địa chỉ, giờ mở cửa, giờ đóng cửa, số điện thoại, bãi đậu xe)
            + Đánh giá(<u>Mã đánh giá</u>, <u>tên chi nhánh</u>, điểm phục vụ, điểm vị trí chi nhánh, điểm chất lượng món ăn, điểm đánh giá, điểm không gian nhà hàng, bình luận)
            + Bộ phận(<u>Mã bộ phận</u>, <u>tên chi nhánh</u>, mức lương)
            + Nhân viên(<u>Mã nhân viên</u>, họ tên, ngày sinh, giới tính, lương, ngày vào làm, ngày nghỉ việc, bộ phận phụ trách, chi nhánh đang làm việc)
            + Địa chỉ nhân viên(<u>Mã nhân viên</u>, số nhà, đường, quận, thành phố)
            + Điện thoại nhân viên(<u>Mã nhân viên</u>, số điện thoại)

    2. Xác định khoá chính, khoá ngoại 
        - Khoá chính:
            + Bảng phiếu đặt món ăn: Mã phiếu, ngày lập
            + Bảng Phiếu đặt bàn: Mã phiếu
            + Bảng Hoá đơn: Mã hoá đơn
            + Bảng Menu: Mã món
            + Bảng Chi nhánh: Tên chi nhánh
            + Bảng Đánh giá: Mã đánh giá, tên chi nhánh
            + Bảng Bộ phận: Mã bộ phận, tên chi nhánh
            + Bảng Địa chỉ nhân viên: Mã nhân viên
            + Bảng Điện thoại nhân viên: Mã nhân viên
        - Khoá ngoại:
            + Bảng Phiếu đặt món ăn:
                - Mã món(Phiếu đặt món ăn) --> Mã món(Menu) 
            + Bảng Phiếu đặt bàn:
                - Mã món(Phiếu đặt bàn) --> Mã món(Menu) 
            + Bảng Menu:
                - Tên chi nhánh(Menu) --> Tên chi nhánh(Chi Nhánh)

    3. Xác định liên kết, mối quan hệ giữa các tập thực thể của cơ sở dữ liệu
        - Phiếu đặt món ăn <thuộc> Hoá đơn
        - Phiếu đặt bàn <đặt> Menu
        - Phiếu đặt món ăn <đặt> Menu
        - Menu <thuộc> Chi nhánh
        - Đánh giá <về> Chi nhánh
        - Chi nhánh <có> Bộ phận
        - Nhân viên <thuộc> Bộ phận
        - Nhân viên <quản lý> Chi nhánh
        - Nhân viên <có> Địa chỉ nhân viên
        - Nhân viên <có> Điện thoại nhân viên
>>>>>>> second-half-1st-iteration