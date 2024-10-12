Đặc tả
Quy trình thiết kế ER:
Dựa vào đặc tả, ta tiến hành xác định các thực thể, mối kết hợp và tiến hành vẽ mô hình ER
1. Xác định các thực thể:
Chi nhánh:
Gồm các thuộc tính: Tên chi nhánh, Địa chỉ, Thời gian mở cửa, Thời gian đóng cửa, Số điện thoại, Bãi xe máy, Bãi xe hơi.
Mục đích: Điều này cần thiết để quản lý thông tin liên quan đến các nhà hàng phân bố theo từng khu vực cụ thể.
Thực đơn: 
Đại diện cho thực đơn với thuộc tính khu vực. Thực thể này liên kết với chi nhánh theo khu vực và có mối quan hệ với món ăn.
Mục đích: Một số chi nhánh trong cùng một khu vực có thể cung cấp các món ăn khác nhau
Món ăn: 
Gồm các thuộc tính: Mã món, Tên món, Giá tiền hiện tại, Loại món.
Mục đích: Để quản lý chi tiết về các món trong menu của từng chi nhánh.
Khách hàng: 
Gồm các thuộc tính: Họ tên, Số điện thoại, Email, Số CCCD, Giới tính.
Mục đích: Mỗi khách hàng cần được quản lý độc lập
Thẻ:
Gồm các thuộc tính: Mã thẻ, Ngày lập, Nhân viên lập, Loại thẻ, Tiêu dùng tích lũy và trạng thái
Mục đích: Để quản lý thẻ thành viên, giúp theo dõi quá trình nâng cấp thẻ và các điều kiện để giữ hoặc hạ hạng thẻ.
2. Xác định mối kết hợp:
Chi nhánh - Thực đơn - Món ăn:Sử dụng mối quan hệ 0/N - 0/N. Mỗi chi nhánh thuộc một khu vực và thực đơn chứa các món ăn. Một chi nhánh có thể có hoặc không có một món ăn từ thực đơn đó.
Khách hàng - Thẻ: Khách hàng có thể sở hữu một hoặc nhiều thẻ vì nếu thẻ đang xài mất thì có thể làm lại thẻ mới.
3. Chuyển đổi thành mô hình ER (Crow’s Foot)
Sau khi xác định các thực thể và mối quan hệ, mô hình ER có thể được tạo ra theo các bước sau:
Thực thể Chi nhánh: Được biểu diễn với các thuộc tính như tên chi nhánh, địa chỉ, thời gian mở và đóng cửa, số điện thoại, bãi xe máy và bãi xe hơi.
Thực thể Món ăn: Chứa các thông tin về món ăn bao gồm mã món, tên món, giá tiền hiện tại và loại món.
Thực thể Thực đơn: Đại diện cho menu với thuộc tính khu vực. Thực thể này liên kết với chi nhánh theo khu vực và có mối quan hệ với món ăn.
Thực thể Khách hàng: Được biểu diễn với các thuộc tính cá nhân như họ tên, số điện thoại, email, số CCCD, và giới tính.
Thực thể Thẻ: Thẻ khách hàng có các thông tin như mã thẻ, ngày lập, nhân viên lập, loại thẻ (thành viên, bạc, vàng), tiêu dùng tích lũy và trạng thái.
Mối quan hệ:
Có (Has): Liên kết giữa thực thể "Chi nhánh" và "Món ăn" thông qua thực thể "Thực đơn".
Sở hữu (Owns): Liên kết giữa "Khách hàng" và "Thẻ", biểu thị mối quan hệ một-nhiều (một khách hàng có thể sở hữu nhiều thẻ).
4. Lý do chọn thiết kế:
Tách biệt thực thể: Việc phân chia các thực thể (Chi nhánh, Thực đơn, Món ăn, Khách hàng, Thẻ) giúp tổ chức dữ liệu theo cách trực quan và dễ quản lý. Mỗi thực thể có thuộc tính riêng và được mô tả rõ ràng.
Mối quan hệ có điều kiện: Quan hệ giữa Chi nhánh và Món ăn thông qua thực thể Thực đơn giúp phản ánh đúng yêu cầu thực tế rằng không phải chi nhánh nào cũng có tất cả các món ăn trong thực đơn.
Loại thẻ và điều kiện nâng cấp: Thực thể "Thẻ" được thiết kế để dễ dàng theo dõi điều kiện nâng cấp thẻ dựa trên tiêu dùng tích lũy và trạng thái của thẻ, giúp quản lý hiệu quả việc khách hàng nâng cấp và giữ hạng thẻ.

5. Đánh giá chất lượng:
Sự rõ ràng và dễ hiểu
Độ chính xác
Tính mở rộng và bảo trì
6. Những cải thiện có thể thực hiện:
Hiện tại với yêu cầu trên thì mô hình ER cơ bản đã đáp ứng được các yêu cầu đã cho. Tuy nhiên, nếu có thêm yêu cầu về các điều kiện khác để mở rộng cơ sở dữ liệu, ta có thể mở rộng bằng cách như thêm thực thể mới, thêm các mối kết hợp mới để lưu trữ chi tiết hơn. Ví dụ:
Chi tiết thông tin về Thẻ: Hiện tại, thuộc tính Loại thẻ có thể lưu trữ thông tin về các loại thẻ (Thành viên, Silver, Gold). Tuy nhiên, nếu có thêm yêu cầu về các điều kiện khác liên quan đến tiêu dùng, hoặc các ưu đãi đặc biệt cho từng loại thẻ, ta có thể mở rộng thêm bảng riêng cho Loại thẻ để lưu trữ chi tiết hơn.
