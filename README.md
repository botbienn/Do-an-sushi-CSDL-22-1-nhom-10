# Do-an-sushi-CSDL-22-1-nhom-10

Đồ án thiết kế cơ sở dữ liệu cho quán ăn Sushi 

## Giới thiệu
Sản phẩm là một cơ sở dữ liệu dựa trên MSSQL (Microsoft SQL server) được sử\
dụng để quản lý quán ăn Sushi lưu lại các thông tin quan trọng như:\

- Thông tin khách hàng 
- Món ăn 
- Phiếu đặt
- Doanh Thu
- Nhân viên và các Chi nhánh liên quan

Đồ án được thực hiện bởi nhóm sinh viên trường HCMUS phục vụ mục đích học tập.\
Bổ sung các kiến thức về thiết kế quan niệm, luận lý cơ sở dữ liệu, phục vụ\
nhu cầu của khách hàng. Ứng dụng các kiến thức về đảm bảo ràng buộc, tối ưu\
hoá các truy vấn bằng các phương pháp thiết kế vật lý như chỉ mục, phân vùng.

## Hướng dẫn sử dụng 
Thứ tự các file được thực thi bao gồm:
```md
Main SQL/
    |
    |_ schemas/
    |   |
    |   |_ (1) CreateTable.sql
    |   |
    |   |_ (4) add_data_final.sql
    |   |
    |   |_ (5) indexing.sql
    |   |
    |   |_ (6) hoa_don_exec.sql
    |   |
    |   |_ (7) partitioning.sql
    |
    |_ functions/
        |
        |_ (2) triggers.sql
        |
        |_ (3) functions.sql

```
