**d.**

![](Aspose.Words.b2894b40-e347-45ea-baa8-72ff7671b85c.001.png)

Đại học Quốc gia Thành phố Hồ Chí Minh![Logo

Description automatically generated](Aspose.Words.b2894b40-e347-45ea-baa8-72ff7671b85c.002.png)

**Trường Đại học Khoa học Tự nhiên**

**🙟🕮🙝**

**Cơ Sở Dữ Liệu Nâng Cao**

**Đồ Án - Quản Lý Hệ Thống Cửa Hàng SUSHI**
**


`	        `Mã đồ án:       2425.ADB.01

`	`Nhóm thực hiện:   	10	

`	`Lớp học phần:		22\_1

`	`Giáo viên hướng dẫn:	Cô Tiết Gia Hồng

`		`Cô Hồ Thị Hoàng Vy

`		`Cô Vũ Thị Mỹ Hằng

Thành phố Hồ Chí Minh – 2024



|**BÁO CÁO ĐỒ ÁN**               |**CƠ SỞ DỮ LIỆU NÂNG CAO**|
| :- | :-: |

<a name="_heading=h.2et92p0"></a>**THÔNG TIN NHÓM**

|**STT**|<a name="_heading=h.tyjcwt"></a>**MSSV**|**Họ tên**|**Công việc**|**% Hoàn thành**|
| :-: | :-: | :-: | :-: | :-: |
|1||Bùi Duy An|||
|2||Nguyễn Đức Anh|||
|3||Vũ Duy Bắc|||
|4||Nguyễn Chí Danh|||
|5||Nguỵ Thành Đạt|||
<a name="_heading=h.bejrywq2conj"></a>**

<a name="_heading=h.sdbs1iuoe3i6"></a>**MỤC LỤC**


|**BÁO CÁO ĐỒ ÁN**            |**CƠ SỞ DỮ LIỆU NÂNG CAO**|
| :- | :-: |

<a name="_heading=h.3dy6vkm"></a>**BÁO CÁO THIẾT KẾ MỨC QUAN NIỆM**
1. # <a name="_heading=h.21sudgjnum38"></a>**Đặc tả hệ thống Quản Lý Cửa Hàng SUSHI**

- Hệ thống nhà hàng có nhiều chi nhánh, thông tin chi nhánh gồm
  - Tên chi nhánh,
  - Địa chỉ,
  - Thời gian mở cửa,
  - Thời gian đóng cửa,
  - Số điện thoại chi nhánh,
  - Nơi gửi xe.

- Mỗi thực đơn phụ thuộc vào khu vực, nhưng mỗi chi nhánh trong khu vực sẽ ghi nhận có hoặc không món ăn trong thực đơn. Thực đơn có nhiều mục, mỗi mục có nhiều loại thức ăn.

- Thông tin thức ăn gồm:
  - Mã món,
  - Tên món,
  - Giá tiền hiện tại.

- Khách hàng có thể đăng kí thẻ nếu cung cấp thông tin:
  - Họ tên,
  - Số điện thoại,
  - Email,
  - Số cccd,
  - Giới tính.

- Thẻ khách hàng có thông tin gồm:
  - Mã thẻ cụ thể,
  - Ngày lập,
  - Nhân viên lập.
- Thẻ có 3 loại: thẻ thành viên, thẻ silver và thẻ gold. Khi mới tạo thì ở loại thẻ thành viên.
- Khách hàng muốn nâng cấp thẻ cần các điều kiện sau:

`           `i. Thẻ silver

- Điều kiện ĐẠT hạng thẻ SILVER: có tổng giá trị tiêu dùng tích lũy từ 10.000.000 VNĐ (100 điểm).
- Điều kiện GIỮ hạng thẻ SILVER: có tổng giá trị tiêu dùng tích lũy từ 5.000.000 VNĐ (50 điểm) trong vòng 01 năm kể từ ngày đạt thẻ SILVER.
- Điều kiện N NG hạng thẻ GOLD: có tổng giá trị tiêu dùng tích lũy từ 10.000.000 VNĐ (100 điểm) trong vòng 01 năm kể từ ngày đạt thẻ SILVER.
- Nếu trong vòng 01 năm kể từ ngày đạt thẻ SILVER có tổng giá trị tiêu dùng tích lũy dưới 5.000.000 VNĐ (50 điểm): thẻ sẽ trở lại mức ban đầu là Membership

`            `ii. Thẻ GOLD

- Điều kiện ĐẠT hạng thẻ GOLD: có tổng giá trị tiêu dùng tích lũy từ 10.000.000 VNĐ (100 điểm) trong vòng 01 năm kể từ ngày đạt thẻ SILVER.
- Điều kiện GIỮ hạng thẻ GOLD: có tổng giá trị tiêu dùng tích lũy từ 10.000.000 VNĐ (100 điểm) trong vòng 01 năm kể từ ngày đạt thẻ GOLD.
- Nếu trong vòng 01 năm kể từ ngày đạt thẻ GOLD có tổng giá trị tiêu dùng tích lũy dưới 10.000.000 VNĐ (100 điểm): thẻ sẽ xuống hạng SILVER.
- Nếu mất thẻ có thể yêu cầu đóng thẻ và làm lại thẻ mới.

- Khách hàng mua trực tiếp sẽ tạo *phiếu đặt món (NÀY LÀ NỮA SAU: CHƯA SỬA)*
- Thông tin *phiếu đặt* gồm:
  - mã phiếu (Duy nhất)
    - ngày lập
  - nhân viên lập
  - số bàn
  - Mã món ăn, số lượng của món
- Nếu yêu cầu thêm món, nhân viên sẽ *bổ sung thêm* thông tin vào phiếu đặt món đã tạo

- Khi thanh toán, xuất *hoá đơn thanh toán*
- *hoá đơn* bao gồm:
  - Mã phiếu (Duy nhất)
  - tổng tiền
  - số tiền được giảm nếu có sử dụng thẻ thành viên
  - tổng tiền tiêu dùng (sau khi đã giảm) trên hoá đơn, hệ thống sẽ tích luỹ cộng dồn điểm vào thẻ khách hàng
  - 1 điểm tương ứng 100.000 VNĐ

- *đánh giá* của khách hàng có các thông tin bao gồm:
  - điểm phục vụ
  - điểm vị trí chi nhánh
  - điểm chất lượng món ăn
  - điểm giá cả
  - điểm về không gian nhà hàng,
  - bình luận
  - ...
- Khi mua trực tuyến hệ thống ghi nhận thêm *thời điểm truy cập, thời gian truy cập*

- Khách hàng có thể *đặt bàn* qua *số điện thoại* chi nhánh hoặc qua *website*, yêu cầu các thông tin sau:
  - khu vực
  - (mã ?) nhà hàng
  - số lượng khách (lớn hơn 0)
  - ngày đặt
  - giờ đến (trong giờ làm việc)
  - một số ghi chú khác
  - Mã món ăn, số lượng món (Không bắt buộc)
- Khách có thể đặt trước 1 số món kèm số lượng tương ứng để nhà hàng chuẩn bị sẵn nhằm tiết kiệm thời gian chờ đợi. (dùng cho mã món ăn, số lượng)

- *Nhân viên* chi nhánh sẽ kiểm tra thường xuyên các *đơn hàng trực tuyến*, gọi điện xác nhận với khách hàng về *ngày giờ*, *số lượng*, cũng như xác nhận lại *danh sách đặt món* và *bổ sung thêm món* nếu khách có yêu cầu
- Ngoài ra, hệ thống còn có dịch vụ *giao hàng tận nơi* ở một số chi nhánh, tuy nhiên, một số món ngoại lệ không hỗ trợ giao vì không đảm bảo giữ được chất lượng.

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

- *Hệ thống* có các bộ phận:
  - bếp, lễ tân, phục vụ bàn, thu ngân, quản lý...
  - Mỗi bộ phận sẽ có mã bộ phận riêng (Duy nhất)
  - Mỗi nhân viên làm việc tại 1 bộ phận của chi nhánh, mỗi bộ phận có nhiều nhân viên.
  - Nhân viên thuộc cùng bộ phận thì có mức lương như nhau.

- Mỗi *chi nhánh* có *1 nhân viên quản lý* chi nhánh.
- Công ty có thể *điều động nhân viên* qua làm một chi nhánh khác.
- Cần ghi nhận *lịch sử làm việc* tại mỗi chi nhánh của mỗi nhân viên: *ngày bắt đầu* làm, *ngày kết thúc* làm.





1. **Các chức năng dành cho khách hàng** 

- *Đăng ký thẻ:* khách hàng có thể thực hiện đăng ký “thẻ thành viên” để được hưởng các ưu đãi chiết khấu, giảm giá, tặng sản phầm tuỳ chương trình

- *Đóng thẻ:* khi khách hàng làm mất thẻ có thể liên hệ để đóng thẻ

- *Nâng cấp thẻ:* khách hàng có thể theo dỏi tiến độ thẻ của mình để nâng cấp lên thẻ Silver hoặc Gold

- *Đăng ký tài khoản:* khách hàng có thể thực hiện đăng ký tài khoản trên hệ thống hay website để có thể đặt bàn và đặt món ăn

- *Đặt bàn online:* khách hàng có thể đăng nhập vào hệ thống và chọn đặt bàn, đặt món trước nếu như món ăn và bàn ở nhà hàng đều còn

- *Xem đơn đặt:* khách hàng có thể xem lại đơn đặt để có thể dễ dàng huỷ hoặc chỉnh sửa nếu muốn

- *Huỷ hoặc chỉnh sửa đặt bàn online:* nếu khách hàng muốn thay đổi hoặc huỷ thì có thể huỷ, chỉnh sửa thông tin đặt bàn, số lượng khách, thời gian đến,…

- *Theo dỏi trạng thái đơn đặt hàng:* đối với khách hàng đặt món ăn online, khách có thể theo dỏi trạng thái đơn hàng(chuẩn bị giao, đang giao, đã giao)






1. **Các chức năng cho hệ thống quản lý**

- **Chức năng cho quản lý cấp chi nhánh**

- *Xem doanh thu mỗi ngày/ mỗi tháng/ mỗi quý/ mỗi năm:* quản lý chi nhánh có thể xem báo cáo doanh thu của chi nhánh theo từng ngày, tháng, quý hoặc năm để đánh giá hiệu quả kinh doanh

- *Xem danh sách nhân viên, điểm phục vụ của mỗi nhân viên:* quản lý chi nhánh có thể theo dõi danh sách nhân viên làm việc trong chi nhánh và điểm đánh giá phục vụ của họ theo thời gian (hàng ngày, tháng, quý, năm)

- *Tìm kiếm thông tin nhân viên, xem danh sách nhân viên theo chi nhánh:* cho phép quản lý chi nhánh tìm kiếm và tra cứu thông tin của từng nhân viên theo các tiêu chí như tên, mã nhân viên, bộ phận

- *Thêm/xoá/cập nhật phiếu đặt món:* quản lý chi nhánh có quyền thao tác với các phiếu đặt món, bao gồm thêm mới, xóa hoặc chỉnh sửa phiếu đặt món khi cần

- *Tìm kiếm hóa đơn theo khách hàng hoặc theo ngày:* quản lý chi nhánh có thể tìm kiếm và tra cứu hóa đơn dựa trên thông tin khách hàng hoặc khoảng thời gian cụ thể

- *Thêm/xoá/cập nhật thông tin thẻ khách hàng:* quản lý chi nhánh có thể cập nhật thông tin thẻ thành viên, cấp thẻ mới hoặc xóa thẻ nếu có yêu cầu từ khách hàng

- *Theo dõi đánh giá dịch vụ từ khách hàng:* Quản lý có thể xem các đánh giá từ khách hàng về chi nhánh của mình (đánh giá về món ăn, dịch vụ, không gian...), từ đó điều chỉnh và cải thiện chất lượng dịch vụ


- **Chức năng cho quản lý cấp công ty**

- *Xem thống kê doanh thu từng chi nhánh mỗi ngày/tháng/quý/năm:* quản lý công ty có thể xem báo cáo doanh thu của từng chi nhánh

- *Thông kê doanh thu theo món ăn:* công ty có thể phân tích doanh thu theo từng món ăn, từ đó có thể xác định được món nào là bán chạy nhất và chậm nhất rồi đưa ra giải pháp phù hợp

- *Chuyển nhân sự giữa các chi nhánh:* cho phép quản lý có thể điều động và chuyển nhân sự giữa các chi nhánh với nhau để có thể hỗ trợ nhau khi thiếu hụt nhân sự

- *Cập nhật lương nhân viên:* công ty có thể cập nhật mức lương cho từng nhân viên, có thể tang hoặc giảm lương

- *Thêm/xoá/cập nhật thông tin nhân viên:* công ty có thể thêm, xoá, cập nhật thông tin của nhân viên khi cần thiết

- *Xem báo cáo lợi nhuận toàn hệ thống:* công ty có thể xem tổng hợp các báo cáo về lợi nhuận của toàn hệ thống nhà hàng để có thể đánh giá hiệu suất hoạt động chung của nhà hàng theo thời gian (ví dụ: theo từng năm)

- *Thêm/xoá/sửa thông tin chi nhánh:* công ty có thể them hoặc xoá hoặc sửa thông tin từng chi nhánh bao gồm thời gian mở cửa, thời gian đóng cửa,…


- **Chức năng cho nhân viên**

- *Quản lý phiếu đặt món:* nhân viên có thể thêm, cập nhật, xoá phiếu đặt món cho khách hàng, có thể bổ sung thêm món vào phiếu đặt đang chờ.

- *Xuất hoá đơn thanh toán:* nhân viên thu ngân có thể xuất hoá đơn cho khách hàng, trên hoá đơn hiển thị tổng tiền, tiềm giảm nếu khách dùng thẻ thành viên và điểm tích luỹ.

- *Xác nhận đặt online:* đối với những khách hàng đặt bàn online, nhân viên sẽ kiểm tra và xác nhận thông tin đặt bàn, liên hệ với khách để xác nhận giờ đến và các yêu cầu khác.

- *Quản lý thông tin khách hàng:* nhân viên có thể tra cứu, hay cập nhật các thông tin của khách hàng như: điểm tích luỹ, thẻ thành viên,…

- *Quản lý thẻ thành viên:* nhân viên có thể đăng ký, cấp thẻ mới, đóng thẻ nếu khách làm mất, nâng cấp hạng thẻ nếu khách đủ các tiêu chi công ty đề ra.


- **Chức năng cho Đầu bếp**

- *Quản lý thực đơn:* đầu bếp có thể cập nhật lại thực đơn, có thể loại bỏ món khi món không còn được phục vụ nữa hoặc trường hợp không đủ nhiên liệu để nấu

- *Theo dỏi danh sách món:* đầu bếp có thể theo dỏi danh sách món đã đặt, như món nào đặt trước, món nào đặt sau để có thể phân chia và chuẩn bị món đó trước cho khách tại chi nhánh và cả online


- **Chức năng cho nhân viên giao hàng:**

- *Xem đơn giao hàng:* nhân viên giao hàng có thể xem và quản lý danh sách các đơn hàng cần giao, bao gồm: thông tin của khách hàng, địa chỉ, số điện thoại, món ăn cần giao,…

- *Xác nhận trạng thái giao hàng:* nhân viên có thể cập nhật đơn hàng(chưa giao, chuẩn bị giao, giao hàng thành công, giao hàng thất bại)


1. # <a name="_heading=h.3xu1tardv64z"></a>**Xác định các Business Rule**

|**STT**|**Nội dung Business Rule**|
| :-: | :-: |
|<h2><a name="_heading=h.ru3cyd4ar012"></a>**Chức năng dành cho khách hàng**</h2>||
|1|Khách hàng được đăng ký 1 thẻ thành viên duy nhất dựa trên số điện thoại hoặc số CCCD|
|2|Khi đăng ký thẻ thành viên, thông tin phải đầy đủ và phải hợp lệ (tên, số điện thoại, email, CCCD)|
|3|Thẻ thành viên sẽ luôn được tích điểm tại mọi chi nhánh |
|4|Thẻ thành viên được đóng khi khách hàng thông báo cho chi nhánh nhà hàng và cung cấp đúng thông tin để xác nhận như: họ tên, số điện thoại, email, số CCCD |
|5|Khi đóng thẻ, điểm tích luỹ của khách sẽ được bảo lưu trên hệ thống và có thể chuyển sang thẻ mới nếu khách có nhu cầu|
|6|<p>Khách hàng chỉ được nâng cấp thẻ khi đạt đủ chỉ tiêu theo quy định:</p><p>- Silver: Tích từ 10 triệu VNĐ (100 điểm) trở lên</p><p>- Gold: Tích từ 10 triệu VNĐ (100 điểm) trở lên trong 1 năm kể từ đạt thẻ Silver</p>|
|7|<p>Khách hàng được giữ hạng thẻ khi:</p><p>- Silver: Tích từ 5 triệu VNĐ (50 điểm) trở lên trong vòng 1 năm kể từ đạt thẻ Silver</p><p>- Silver: Tích từ 10 triệu VNĐ (100 điểm) trở lên trong vòng 1 năm kể từ đạt thẻ Gold</p><p>&emsp;</p>|
|8|<p>Khách hàng bị hạ hạng của thẻ khi:</p><p>- Silver: Tổng tích luỹ tiêu dùng dưới 5 triệu (50 điểm) trong 01 năm, thẻ sẽ hạ về membership</p><p>- Gold: Tổng tích luỹ tiêu dùng dưới 10 triệu (100 điểm) trong 01 năm, thẻ sẽ hạ về thẻ Silver</p>|
|9|Khách hàng phải cung cấp số điện thoại, email hợp lệ để đăng ký tài khoản trên hệ thống hoặc website|
|10|` `Một tài khoản chỉ liên kết với **một thẻ thành viên** duy nhất  |
|11|Khách hàng chỉ có thể đặt bàn nếu còn bàn trống và trong khung giờ mở cửa của chi nhánh.|
|12|Món ăn chỉ được đặt nếu món đó còn phục vụ tại chi nhánh và còn đủ nguyên liệu|
|13|Khách hàng có thể huỷ hoặc tuỳ chỉnh đơn đặt trước khi nhân viên xác nhận đơn hoặc trước 30 phút sau khi đặt hàng|
|14|Khách hàng có thể theo dõi trạng thái đơn đặt món từ lúc đặt (chưa xác nhận, đã xác nhận, chuẩn bị giao, đang giao, đã giao)|
|<h2><a name="_heading=h.n6p7vsce0b3d"></a>**Chức năng dành cho Hệ thống quản lý cấp chi nhánh**</h2>||
|1|Quản lý chi nhánh chỉ có thể xem báo cáo doanh thu của chi nhánh mình, không xem được các chi nhánh khác|
|2|Chỉ quản lý chi nhánh có quyền xem danh sách nhân viên của chi nhánh mình và điểm phục vụ cá nhân dựa trên đánh giá khách hàng|
|3|Quản lý có thể tìm kiếm thông tin nhân viên theo tên, mã nhân viên hoặc bộ phận làm việc trong chi nhánh của mình quản lý|
|4|Quản lý chỉ có quyền sửa hoặc xóa phiếu đặt món chưa thanh toán hoặc trong trường hợp khách yêu cầu|
|5|Phiếu đã thanh toán thì không thể sửa đổi|
|6|Chỉ được phép tìm kiếm hoá đơn trong phạm vi chi nhánh quản lý |
|7|Thẻ khách hàng chỉ được cập nhật khi có sự đồng ý hoặc yêu cầu từ khách hàng, không được tuỳ ý chỉnh sửa mà chưa có sự đồng ý của khách hàng|
|8|Quản lý có thể xem đánh giá của khách hàng nhưng không được chỉnh sửa hoặc xoá đánh giá|
|<h2><a name="_heading=h.8nzhnkb5435"></a>**Chức năng dành cho Hệ thống quản lý cấp Công ty**</h2>||
|1|Quản lý có thể xem báo cáo doanh thu của các chi nhánh nhưng không có khả năng chỉnh sửa dữ liệu|
|2|Doanh thu món ăn được cập nhật thường xuyên, cho phép lọc theo chi nhánh, khu vực|
|3|Chỉ được chuyển nhân sự khi chi nhánh mới có nhu cầu và có sự đồng ý của công ty|
|4|Quản lý không được phép hạ mức lương nhân viên khi không có lý do hợp lệ|
|5|Thông tin nhân viên chỉ được chỉnh sửa khi có lý do hợp lệ (thay đổi chức vụ, thay đổi lương, nghỉ việc, thăng chức,…)|
|6|Quản lý công ty có thể cập nhật thông tin chi nhánh về thời gian mở cửa, địa chỉ, thông tin liên hệ|
|7|Quản lý cấp công ty có quyền xem báo cáo lợi nhuận tổng hợp theo từng năm, tháng, quý, ngày và từng chi nhánh của tổng hệ thống|
|<h2><a name="_heading=h.d4otp764onvd"></a>**Chức năng dành cho nhân viên**</h2>||
|1|Nhân viên chỉ có thể sửa phiếu đặt món trước khi khách hàng thanh toán, sau đó phiếu không thể chỉnh sửa|
|2|Chỉ thu ngân mới có quyền xuất hóa đơn thanh toán, và hóa đơn phải ghi rõ các khoản giảm giá và điểm tích lũy cho thẻ thành viên|
|3|Nhân viên phải liên hệ với khách hàng để xác nhận đơn hàng và giờ đến trước khi hệ thống tự động khóa khả năng chỉnh sửa đơn|
|4|Chỉ nhân viên thu ngân hoặc nhân viên phụ trách thành viên có quyền chỉnh sửa thông tin cá nhân của khách hàng và thẻ thành viên|
|5|Chỉ được nâng cấp thẻ khi khách hàng đáp ứng đủ tiêu chí tích lũy điểm|
|<h2><a name="_heading=h.osmn77kip8oh"></a>**Chức năng dành cho đầu bếp**</h2>||
|1|Đầu bếp chỉ có thể cập nhật thực đơn khi có sự đồng ý từ quản lý chi nhánh hoặc công ty|
|2|Đầu bếp phải chuẩn bị món theo thứ tự đặt hàng và thông tin thời gian ưu tiên (món đặt trước phải được phục vụ trước)|
|<h2><a name="_heading=h.gohcinmgh8wi"></a>**Chức năng dành cho nhân viên giao hàng**</h2>||
|1|Nhân viên chỉ xem được các đơn hàng được phân công cho mình, không được xem các đơn khác|
|2|Nhân viên phải cập nhật trạng thái đơn hàng sau mỗi lần giao hàng, bao gồm trạng thái: chuẩn bị giao, đang giao, giao hàng thành công, giao hàng thất bại|

1. # <a name="_heading=h.vzl7wju41b2v"></a>**Lược đồ thực thể kết hợp**
![A diagram of a computer

Description automatically generated](Aspose.Words.b2894b40-e347-45ea-baa8-72ff7671b85c.003.png)

***Lược đồ ER theo ký hiệu Crow’s Foot***

Link lược đồ: cần bổ sung(cô có yêu cầu)

1. # <a name="_heading=h.bmjrlyc5fh43"></a>**Các tập thực thể chính**

|**STT**|**Tập thực thể**|**Mô tả**|
| :-: | :-: | :-: |
|1|Khách hàng|Các tài khoản khách hàng đăng kí online của hệ thống|
|2|Thẻ|Thẻ thành viên của khách hàng|
|3|Hoá đơn|Mỗi hoá đơn cho mỗi khoản thanh toán của khách hàng|
|4|Order||
|5|Mã món – phiếu đặt||
|6|Order tại chỗ||
|7|Giao hàng||
|8|Đặt bàn online||
|9|Món đặt trước||
|10|Món ăn||
|11|Chi nhánh||
|12|Thực đơn||
|13|Nhân viên||
|14|Điện thoại – Nhân viên||
|15|Đánh giá||
|16|Bộ phận||
***Bảng thông tin các tập thực thể chính***

**Thuộc tính của các tập thực thể chính:** 

|**Khách hàng**||
| :-: | :- |
|**Thuộc tính**|**Mô tả**|
|**Số CCCD**|Mã số định danh duy nhất của khách hàng|
|Họ tên|Họ và tên của khách hàng|
|SDT|Số điện thoại của khách hàng|
|Email|Địa chỉ email của khách hàng |
|Giới tính|Giới tính của khách hàng|

|**Thẻ**||
| :-: | :- |
|**Thuộc tính**|**Mô tả**|
|**Mã thẻ**|Mã số định danh duy nhất của thẻ |
|Ngày lập|Ngày lập của thẻ đó (dd/mm/yy)|
|Loại thẻ|Loại thẻ gồm(thẻ thành viên, silver, gold)|
|Tiêu dùng tích luỹ|Điểm tích luỹ trên thẻ|
|Trạng thái|Trạng thái của thẻ|

|**Hoá đơn**||
| :-: | :- |
|**Thuộc tính**|**Mô tả**|
|**Mã hoá đơn**|Mã số định danh duy nhất của hoá đơn|
|Tổng tiền|Tổng tiền ban đầu |
|Số tiền được giảm|Số tiền khách được giảm|
|Tổng tiền sau giảm|Số tiền cần thanh toán sau khi được giảm|
|Điểm tích luỷ|Điểm tích luỹ được cộng sau khi khách thanh toán hoá đơn|

|**Order**||
| :-: | :- |
|**Thuộc tính**|**Mô tả**|
|**Mã phiếu**|Mã số định danh của order trong hệ thống|
|**Ngày đặt**|Mã số định danh của order trong hệ thống|

|**Mã món – Phiếu đặt**||
| :-: | :- |
|**Thuộc tính**|**Mô tả**|
|Số lượng|Số lượng món được đặt|

|**Order tại chỗ**||
| :-: | :- |
|**Thuộc tính**|**Mô tả**|
|Số bàn|Số bàn khách hàng muốn order|

|**Giao hàng**||
| :-: | :- |
|**Thuộc tính**|**Mô tả**|
|Thời điểm online|Thời điểm nhân viên giao hàng online|
|Khoảng thời gian online|Khoảng thời gian nhân viên giao hàng online trên hệ thống|

|**Đặt bàn online**||
| :-: | :- |
|**Thuộc tính**|**Mô tả**|
|Khu vực|Khu vực hay chi nhánh mà khách muốn đặt|
|Mã chi nhánh|<p>Mã chi nhánh để xác định khách đặt chính xác ở đâu trong khu vực </p><p></p>|
|Số lượng khách|<p>Số lượng khách đến</p><p></p>|
|Giờ đến|<p>Giờ khách đến</p><p></p>|
|Ghi chú|Những bổ sung them của khách hàng khi đặt|

|**Món đặt trước**||
| :-: | :- |
|**Thuộc tính**|**Mô tả**|

|**Món ăn**||
| :-: | :- |
|**Thuộc tính**|**Mô tả**|
|**Mã món**|Mã món định danh của từng món ăn|
|Tình trạng|Tên của loại răng|
|Giá|Giá của từng loại món ăn|
|Tên món|Tên món ăn|

|**Chi nhánh**||
| :-: | :- |
|**Thuộc tính**|**Mô tả**|
|**Tên chi nhánh**|Tên chi nhánh và mỗi chi nhánh chỉ có 1 tên|
|Địa chỉ|Địa chỉ của mỗi chi nhánh|
|Giờ mở cửa|Giờ chi nhánh mở cửa|
|Giờ đóng cửa|Giờ chi nhánh đóng cửa|
|Số điện thoại|Số điện thoại liên hệ của chi nhánh đó|
|Giao hàng|Ghi nhận có giao hàng không|
|Bãi xe máy|Mỗi chi nhánh có bãi xe máy|
|Bãi xe hơi|Mỗi chi nhánh có bãi xe hơi|

|**Thực đơn**||
| :-: | :- |
|**Thuộc tính**|**Mô tả**|
|**Khu vực**|Thực đơn của khu vực nào đó|

|**Nhân viên**||
| :-: | :- |
|**Thuộc tính**|**Mô tả**|
|**Mã nhân viên**|Mã định danh của nhân viên|
|Họ tên|Họ và tên của nhân viên(not null)|
|Số nhà|Số nhà của nhân viên đang sống|
|Đường|Đường nhân viên sống|
|Quận|Quận nhân viên sống|
|Thành phố|Thành phố mà nhân viên sống|
|Ngày sinh(…)|Ngày sinh của nhân viên (dd/mm/yy)|
|Giới tính|Giới tính của nhân viên (Nam/Nữ/Khác)|
|Lương|Lương của nhân viên|
|Ngày vào làm|Ngày nhân viên vào làm việc|
|Ngày nghỉ việc|Ngày nhân viên nghỉ việc (phải sau ngày vào làm)|

|**Điện thoại – Nhân viên**||
| :-: | :- |
|**Thuộc tính**|**Mô tả**|
|**Mã nhân viên**|Mã định danh của nhân viên|
|Số điện thoại|Số điện thoại của nhân viên|

|**Bộ phận**||
| :-: | :- |
|**Thuộc tính**|**Mô tả**|
|**Mã bộ phận**|Mã định danh của bộ phận|
|Mức lương|Mức lương của bộ phận đó|






|**Đại học Khoa học Tự nhiên | Khoa Công nghệ Thông tin | Nhóm 10**|7**|
| :- | :-: |
**

