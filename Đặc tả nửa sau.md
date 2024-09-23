- Khách hàng mua trực tiếp sẽ tạo *phiếu đặt món*
- Thông tin *phiếu đặt* gồm:
	- mã phiếu (Duy nhất)
		- ngày lập
	- nhân viên lập
	- số bàn
	- Mã món ăn, số lượng của món
- Nếu yêu cầu thêm món, nhân viên sẽ *bổ sung thêm* thông tin vào phiếu đặt món đã tạo

---

- Khi thanh toán, xuất *hoá đơn thanh toán*
- *hoá đơn* bao gồm:
	- Mã phiếu (Duy nhất)
	- tổng tiền
	- số tiền được giảm nếu có sử dụng thẻ thành viên 
	- tổng tiền tiêu dùng (sau khi đã giảm) trên hoá đơn, hệ thống sẽ tích luỹ cộng dồn điểm vào thẻ khách hàng
	- 1 điểm tương ứng 100.000 VNĐ

---

- *đánh giá* của khách hàng có các thông tin bao gồm: 
	- điểm phục vụ
	- điểm vị trí chi nhánh
	- điểm chất lượng món ăn
	- điểm giá cả
	- điểm về không gian nhà hàng,
	- bình luận
	- ...
- Khi mua trực tuyến hệ thống ghi nhận thêm *thời điểm truy cập, thời gian truy cập* 

---

- Khách hàng có thể *đặt bàn* qua *số điện thoại* chi nhánh hoặc qua *website*, yêu cầu các thông tin sau:
	- khu vực
	- (mã ?) nhà hàng
	- số lượng khách (lớn hơn 0)
	- ngày đặt 
	- giờ đến (trong giờ làm việc)
	- một số ghi chú khác
	- Mã món ăn, số lượng món (Không bắt buộc)
	
- Khách có thể đặt trước 1 số món kèm số lượng tương ứng để nhà hàng chuẩn bị sẵn nhằm tiết kiệm thời gian chờ đợi. (dùng cho mã món ăn, số lượng)

---

- *Nhân viên* chi nhánh sẽ kiểm tra thường xuyên các *đơn hàng trực tuyến*, gọi điện xác nhận với khách hàng về *ngày giờ*, *số lượng*, cũng như xác nhận lại *danh sách đặt món* và *bổ sung thêm món* nếu khách có yêu cầu
- Ngoài ra, hệ thống còn có dịch vụ *giao hàng tận nơi* ở một số chi nhánh, tuy nhiên, một số món ngoại lệ không hỗ trợ giao vì không đảm bảo giữ được chất lượng.

---

- *Nhân viên*
	- Thông tin nhân viên gồm: 
		- mã nhân viên (Duy nhất)
		- họ tên (không để trống)
		- ngày sinh
		- giới tính
		- lương (số thực)
		- ngày vào làm 
		- ngày nghỉ việc (ngày nghỉ việc phải sau ngày vào làm)
		- bộ phận phụ trách (không để trống)
		- chi nhánh đang làm việc (không để trống)
		- địa chỉ gồm:
			- số điện thoại
			- số nhà, đường, phường, quận, thành phố.
			
---

- *Hệ thống* có các bộ phận:
	- bếp, lễ tân, phục vụ bàn, thu ngân, quản lý...
	- Mỗi bộ phận sẽ có mã bộ phận riêng (Duy nhất)
	- Mỗi nhân viên làm việc tại 1 bộ phận của chi nhánh, mỗi bộ phận có nhiều nhân viên.
	- Nhân viên thuộc cùng bộ phận thì có mức lương như nhau.

---

- Mỗi *chi nhánh* có *1 nhân viên quản lý* chi nhánh.
- Công ty có thể *điều động nhân viên* qua làm một chi nhánh khác.
- Cần ghi nhận *lịch sử làm việc* tại mỗi chi nhánh của mỗi nhân viên: *ngày bắt đầu* làm, *ngày kết thúc* làm.
