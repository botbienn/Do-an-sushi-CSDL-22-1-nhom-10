# QUẢN LÝ HỆ THỐNG CỬA HÀNG SUSHI

## Mục tiêu: 
Nhằm giúp sinh viên biết quan sát, hiểu cách vận hành 1 quy trình từ hệ thống thực tế, từ đó thu thập dữ liệu tự thiết kế, cài đặt mô phỏng quy trình quan sát được bằng cách vận dụng kiến thức được cung cấp từ lý thuyết.  

## Mô tả gợi ý:

Hệ thống nhà hàng SuShiX gồm 15 chi nhánh trải rộng ở một số thành phố (Hồ Chí Minh, Hà Nội, Đà Nẵng...), với sự tin yêu của khách hàng, trong tương lai có khả năng phát triển và mở rộng trên toàn quốc. Mỗi chi nhánh có tên chi nhánh, địa chỉ, thờ gian mở cửa, đóng cửa, số điện thoại chi nhánh, cần ghi nhận mỗi chi nhánh có bãi đỗ xe máy, xe hơi hay không. Thực đơn món ăn tuỳ theo khu vực, tuy nhiên, mỗi chi nhánh thuộc khu vực có thể ghi nhận có/không đang phục vụ món. Thực đơn được chia thành nhiều mục, mỗi mục gồm nhiều món cụ thể như: Khai vị (gồm các món như: trứng hấp, súp miso, súp chay, trứng cá hồi...); Sashimi combo (gồm các set combo về cá sống như: sashimi tổng hợp, sashimi cá hồi đặc biệt...); Nigiri (là các loại cơm cuộn như: cá ngừ (2 miếng), cá hồi (2 miếng), lườn cá hồi nướng sốt (2 miếng)...); Và nhiều mục khác như: tempura, udon, hotpot, lunch set, các món nước....Mỗi món có mã món, tên món, giá hiện tại. Khách hàng có thể đăng ký thẻ thành viên miễn phí bằng cách cung cấp các thông tin như: họ tên, số điện thoại, email, số cccd, giới tính. Nhân viên chi nhánh sẽ lập thẻ cho khách hàng với 1 mã số thẻ cụ thể, ngày lập, nhân viên lập. Đăng ký thẻ giúp khách hàng được hưởng ưu đãi chiết khấu, giảm giá, tặng sản phẩm tùy theo chương trình.Thẻ khách hàng gồm 3 loại: thẻ thành viên, thẻ silver và thẻ gold, khi mới đăng kí khách hàng sẽ thuộc loại thẻ thành viên. Khách hàng muốn được nâng cấp lên loại thẻ silver và thẻ gold cần phải đạt tiêu chuẩn như sau:

1. **Thẻ SILVER**
	1. Điều kiện ĐẠT hạng thẻ SILVER: có tổng giá trị tiêu dùng tích lũy từ 10.000.000 VNĐ (100 điểm).
	2. Điều kiện GIỮ hạng thẻ SILVER: có tổng giá trị tiêu dùng tích lũy từ 5.000.000 VNĐ (50 điểm) trong vòng 01 năm kể từ ngày đạt thẻ SILVER.
	3. Điều kiện NÂNG hạng thẻ GOLD: có tổng giá trị tiêu dùng tích lũy từ 10.000.000 VNĐ (100 điểm) trong vòng 01 năm kể từ ngày đạt thẻ SILVER.
	4. Nếu trong vòng 01 năm kể từ ngày đạt thẻ SILVER có tổng giá trị tiêu dùng tích lũy dưới 5.000.000 VNĐ (50 điểm): thẻ sẽ trở lại mức ban đầu là Membership
2. **Thẻ GOLD**
	1. Điều kiện ĐẠT hạng thẻ GOLD: có tổng giá trị tiêu dùng tích lũy từ 10.000.000 VNĐ (100 điểm) trong vòng 01 năm kể từ ngày đạt thẻ SILVER.
	2. Điều kiện GIỮ hạng thẻ GOLD: có tổng giá trị tiêu dùng tích lũy từ 10.000.000 VNĐ (100 điểm) trong vòng 01 năm kể từ ngày đạt thẻ GOLD.
	3. Nếu trong vòng 01 năm kể từ ngày đạt thẻ GOLD có tổng giá trị tiêu dùng tích lũy dưới 10.000.000 VNĐ (100 điểm): thẻ sẽ xuống hạng SILVER

Nếu khách hàng làm mất thẻ, có thể liên hệ để đóng thẻ cũ và cấp thẻ mới. 

------------------------------------------------------------------------

Đối với khách mua hàng trực tiếp tại cửa hàng, nhân viên sẽ hỗ trợ đặt món cho khách hàng, nhân viên sẽ chọn bàn, tạo phiếu đặt món. Thông tin phiếu đặt gồm mã phiếu, ngày lập, nhân viên lập, lập cho bàn nào. Sau đó, chọn các món ăn theo yêu cầu của khách hàng và số lượng cho mỗi món. Nếu khách có yêu cầu thêm món, nhân viên sẽ bổ sung thêm thông tin vào phiếu đặt món đã tạo. Khi khách hàng cần thanh toán, nhân viên sẽ xuất hoá đơn thanh toán cho khách hàng. Lưu ý, cần hiển thị rõ trên hoá đơn tổng tiền, số tiền được giảm nếu có sử dụng thẻ thành viên. Dựa vào tổng tiền tiêu dùng (sau khi đã giảm) trên hoá đơn, hệ thống sẽ tích luỹ cộng dồn điểm vào thẻ khách hàng: 1 điểm tương ứng 100.000 VNĐ. Sau khi thanh toán hoá đơn, nhân viên sẽ nhờ khách hàng hỗ trợ đánh giá dịch vụ (điểm phục vụ, điểm vị trí chi nhánh, điểm chất lượng món ăn, điểm giá cả, điểm về không gian nhà hàng, hoặc để lại bình luận...). Đối với khách mua hàng trực tuyến, hệ thống ghi nhận thêm thời điểm truy cập, thời gian truy cập nhằm cải thiện trải nghiệm của khách hàng. Khách hàng có thể đặt bàn qua số điện thoại chi nhánh hoặc qua website: lựa chọn khu vực, lựa chọn nhà hàng, số lượng khách, ngày đặt, giờ đến, một số ghi chú khác. Khách có thể đặt trước 1 số món kèm số lượng tương ứng để nhà hàng chuẩn bị sẵn nhằm tiết kiệm thời gian chờ đợi. Nhân viên chi nhánh sẽ kiểm tra thường xuyên các đơn hàng trực tuyến, gọi điện xác nhận với khách hàng về ngày giờ, số lượng, cũng như xác nhận lại danh sách đặt món và bổ sung thêm món nếu khách có yêu cầu. Ngoài ra, hệ thống còn có dịch vụ giao hàng tận nơi ở một số chi nhánh, tuy nhiên, một số món ngoại lệ không hỗ trợ giao vì không đảm bảo giữ được chất lượng.

Hệ thống gồm nhiều nhân viên: thông tin nhân viên gồm mã nhân viên, họ tên, ngày sinh, giới tính, lương, ngày vào làm, ngày nghỉ việc, bộ phận phụ trách, chi nhánh đang làm việc, địa chỉ gồm số điện thoại, số nhà, đường, phường, quận, thành phố. Hệ thống có các bộ phận: bếp, lễ tân, phục vụ bàn, thu ngân, quản lý...Mỗi nhân viên làm việc tại 1 bộ phận của chi nhánh, mỗi bộ phận có nhiều nhân viên. Nhân viên thuộc cùng bộ phận thì có mức lương như nhau. Mỗi chi nhánh có 1 nhân viên quản lý chi nhánh. Công ty có thể điều động nhân viên qua làm một chi nhánh khác, cần ghi nhận lịch sử làm việc tại mỗi chi nhánh của mỗi nhân viên: ngày bắt đầu làm, ngày kết thúc làm.

Một số gợi ý yêu cầu thống kê dữ liệu như sau:
1. **Cấp chi nhánh**
	1. Xem doanh thu mỗi ngày/mỗi tháng/ mỗi quý / mỗi năm 
	2. Xem danh sách nhân viên, điểm phục vụ của mỗi nhân viên cuối mỗi ngày/tháng/quý/năm
	3. Tìm kiếm thông tin nhân viên, xem danh sách nhân viên theo chi nhánh
	4. Thêm/xoá/cập nhật phiếu đặt món; tìm kiếm hoá đơn theo khách hàng, theo ngày
	5. Thêm/xoá/cập nhật thông tin thẻ khách hàng
	6. ....
2.  **Cấp công ty**
	1. Xem thống kê doanh thu từng chi nhánh mỗi ngày/tháng/quý/năm
	2. Thống kê doanh thu theo từng món, món chạy nhất, món bán chậm nhất trong 1 khoảng thời gian cụ thể theo chi nhánh, khu vực
	3. Chuyển nhân sự của các chi nhánh.
	4. Cập nhật lương nhân viên, thêm/xoá/cập nhật thông tin nhân viên
	5. ....
## Yêu cầu
1. Giai đoạn 1: sinh viên tự mô tả chi tiết quy trình, dữ liệu, ràng buộc liên quan, danh sách chức năng cần xây dựng kèm tần suất giao dịch tương ứng (thông tin tần suất sinh viên tự quan sát, phân tích và đề xuất dựa theo kiến thức trên lớp lý thuyết), có thể bổ sung thêm các chức năng, ràng buộc chức năng. Thiết kế dữ liệu mức quan niệm và logic.
2. Giai đoạn 2: bảng thiết kế cơ sở dữ liệu mức vật lý theo đề xuất của nhóm, các đề xuất về cải thiện hiệu quả truy vấn dựa trên thiết kế đề xuất, source code của project mô phỏng một số chức năng (tìm kiếm, thêm/xoá/sửa, thống kê) có tần suất cao và thấp sao cho bao gồm được các kịch bản minh hoạ hiệu quả của các giải pháp cải thiện hiệu suất, source script tạo csdl, query, index, partition.... Có sử dụng. Tạo, thực thi các chỉ mục, chụp hình và giải thích kết quả, so sánh giữa có/không có áp dụng giải pháp nâng cao hiệu suất.
3. Sinh viên tự phát sinh dữ liệu (kiểm tra dữ liệu khoá ngoại) đủ lớn để kiểm chứng các đề xuất chỉ mục (~100,000 dòng/bảng) cho 1 số bảng cần minh hoạ. Sinh viên tự chọn Công cụ phát sinh hoặc tự code. o Nhóm cần sử dụng 1 công cụ quản lý phân công và theo dõi tiến độ nhóm.
4. Tham khảo: https://www.guru99.com/test-data-generation-tools.html
## **Lưu ý**:
Báo cáo cần ghi rõ thông tin cá nhân, thông tin nhóm, đánh giá cá nhân và nhóm, báo cáo là tài liệu tổng kết từ giai đoạn phân tích, thiết kế, cài đặt, đánh giá kết quả giải pháp của nhóm.

## Yêu cầu chức năng bắt buộc 
1. Chức năng cơ bản: đăng nhập, đăng xuất, tìm kiếm món ăn
2. Phân hệ nhân viên: thêm món, cập nhật trạng thái món ăn, đặt món, thống kê (doanh thu, khách hàng, món ăn) theo gợi ý thống kê ở trên
3. Phân hệ khách hàng: đặt bàn, đặt món

##  Thang điểm
1. Mức quan niệm: 20% (đặc tả, thiết kế ER, báo cáo)
2. Mức logic: 15% (chuyển lược đồ quan hệ, xác định ràng buộc, dạng chuẩn, chuẩn hoá lược đồ, báo cáo)
3. Mức vật lý: 45% (script cơ sở dữ liệu, stored, function, trigger, phân tích tần suất, chỉ mục, partition, báo cáo...)
4. Sinh viên mô tả 5 đến 8 kịch bản sử dụng có liên quan nhau trong hệ thống, xác định tần suất các truy vấn liên quan. Áp dụng kiến thức lý thuyết về phân tích dữ liệu mức vật lý để xác định các giải pháp phù hợp.
5. Cài đặt ứng dụng: 20% (web/winform, báo cáo)
6. Cài đặt tối thiểu quy trình nêu trên.
7. Tất cả thành viên đều tham gia vào các giai đoạn (quan niệm, logic, vật lý, cài đặt).