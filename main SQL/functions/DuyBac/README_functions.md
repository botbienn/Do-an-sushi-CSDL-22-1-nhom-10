# Thay đổi một số tính chất về bảng và xoá bảng 
- Thêm trạng thái đang hoạt động/ sử dụng/ làm việc đối với một số đối tượng như sau:
    - Nhân viên: thuộc tính đang làm việc cho biết một nhân viên có đang làm việc cho công ty hay không 
    - Chi nhánh: thuôc tính đang hoạt động cho biết chi nhánh có còn đang hoạt động hay không
    -

# Một số vấn đề về khoá ngoại 
- Đối với việc xoá nhân viên: 
    - Không được phép xoá, chỉ sửa trạng thái thành không làm việc 
    - Nếu xoá thì: 
        - Các phiếu đặt hàng cho nhân viên lập thành null 
        - Các số điện thoại của nhân viên xoá 
        - Nếu nhân viên bị xoá là một nhân viên quản lý thì phải thay bằng một nhân viên tổng có mã nhân viên là 001 thay thế tạm thời 
    - nếu nhân viên quay lại, tạo một dòng nhân viên mới như một người mới 
- Đối với chi nhánh, có thể sửa lại trạng thái thành đang hoạt động 
    - không nên xoá đố tượng này 

