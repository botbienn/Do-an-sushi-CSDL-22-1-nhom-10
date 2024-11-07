- Khách hàng mua trực tiếp sẽ tạo **phiếu đặt món**
- Thông tin **phiếu đặt** gồm:
	- Mã phiếu (Duy nhất)
	- Ngày lập
	- Nhân viên lập
	- Mã món ăn, số lượng của món
	
- Thông tin bổ sung vào **phiếu đặt** tùy vào trường hợp bao gồm: 
	- Nếu khách hàng đặt đồ ăn tại quán:
		- Số bàn
	- Nếu	khách hàng đặt bàn online: 
		- Khu vực
		- Mã chi nhánh
		- Số lượng khách (phải lớn hơn 0)
		- Ghi chú
		- Khách có thể đặt trước 1 số món kèm số lượng tương ứng để nhà hàng chuẩn bị sẵn nhằm tiết kiệm thời gian chờ đợi. (dùng cho mã món ăn, số lượng) 
	- Nếu khách hàng yêu cầu giao hàng đến nhà của khách: 
		- Thời điểm truy cập 
		- Khoảng thời gian khách hàng truy cập
		
- Nếu yêu cầu thêm món, nhân viên sẽ *bổ sung thêm* thông tin vào phiếu đặt món đã tạo

---

- Khi thanh toán, xuất *hoá đơn thanh toán*

- *hoá đơn* bao gồm:
	- Mã phiếu (Duy nhất)
	- tổng tiền
	- số tiền được giảm nếu có sử dụng thẻ thành viên 
	- tổng tiền tiêu dùng (sau khi đã giảm) trên hoá đơn, hệ thống sẽ tích luỹ cộng dồn điểm vào thẻ khách hàng
	- 1 điểm tương ứng 100.000 VNĐ
	
- Mỗi *hóa đơn* sẽ chứa thông tin *đánh giá* của khách hàng bao gồm:
	- điểm phục vụ
	- điểm vị trí chi nhánh
	- điểm chất lượng món ăn
	- điểm giá cả
	- điểm về không gian nhà hàng,
	- bình luận

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
- Cần ghi nhận *lịch sử làm việc* tại mỗi chi nhánh của mỗi nhân viên: *ngày bắt đầu* làm, *ngày kết thúc* làm.

---

- *Hệ thống* (Bộ phận) có các bộ phận:
	- bếp, lễ tân, phục vụ bàn, thu ngân, quản lý...
	- Mỗi bộ phận sẽ có mã bộ phận riêng (Duy nhất)
	- Mỗi nhân viên làm việc tại 1 bộ phận của chi nhánh, mỗi bộ phận có nhiều nhân viên.
	- Nhân viên thuộc cùng bộ phận thì có mức lương như nhau.

---

- Mỗi *chi nhánh* có *1 nhân viên quản lý* chi nhánh.
- Công ty có thể *điều động nhân viên* qua làm một chi nhánh khác.
