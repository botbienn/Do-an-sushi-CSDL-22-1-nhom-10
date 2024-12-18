import pandas as pd
from faker import Faker
import random
import os
from datetime import datetime, timedelta

# Khởi tạo Faker
fake = Faker('vi_VN')

# Số lượng dòng cần tạo
num_rows = 300

# Danh sách phái và các giá trị khác
gender_choices = ["Nam", "Nữ"]
bo_phan_choices = [1, 2, 3, 4, 5]
chi_nhanh_choices = list(range(1, 16))

# Danh sách thành phố và quận
tinh_thanhpho_quan = {
    "Hà Nội": ["Ba Đình", "Hoàn Kiếm", "Hai Bà Trưng", "Đống Đa", "Tây Hồ", "Cầu Giấy", "Thanh Xuân", "Hoàng Mai", "Long Biên", "Bắc Từ Liêm", "Nam Từ Liêm", "Hà Đông"],
    "Hồ Chí Minh": ["Quận 1", "Quận 2", "Quận 3", "Quận 4", "Quận 5", "Quận 6", "Quận 7", "Quận 8", "Quận 9", "Quận 10", "Quận 11", "Quận 12", "Tân Bình", "Tân Phú", "Bình Tân"],
    "Đà Nẵng": ["Hải Châu", "Thanh Khê", "Sơn Trà", "Ngũ Hành Sơn", "Liên Chiểu", "Cẩm Lệ"]
}

# Đọc danh sách họ và tên từ file
with open('firstname.txt', 'r', encoding='utf-8') as f:
    firstnames = [line.strip() for line in f if line.strip()]

with open('lastname.txt', 'r', encoding='utf-8') as f:
    lastnames = [line.strip() for line in f if line.strip()]

# Đọc danh sách tên đường từ file
with open('street_name.txt', 'r', encoding='utf-8') as f:
    street_names = [line.strip() for line in f if line.strip()]

# Hàm tạo mã nhân viên (5 ký tự tăng dàn)
def generate_manv(index):
    return f"{index:05d}"

# Hàm tạo ngày sinh ngẫu nhiên (tuổi từ 15 đến 60)
def generate_birth_date():
    end_date = datetime.now() - timedelta(days=15*365)
    start_date = datetime.now() - timedelta(days=60*365)
    random_days = random.randint(0, (end_date - start_date).days)
    return (start_date + timedelta(days=random_days)).strftime("%d/%m/%Y")


# Hàm tạo họ tên ngẫu nhiên
def generate_full_name():
    firstname = random.choice(firstnames)
    lastname = random.choice(lastnames)
    return f"{firstname} {lastname}"

# Hàm tạo số nhà ngẫu nhiên
def generate_house_number():
    options = [f"{random.randint(1, 999)}", f"{random.randint(1, 999)}{random.choice(['A', 'B', 'C', 'D'])}"]
    return random.choice(options)

# Hàm tạo địa chỉ ngẫu nhiên
def generate_address():
    city = random.choice(list(tinh_thanhpho_quan.keys()))
    district = random.choice(tinh_thanhpho_quan[city])
    street = random.choice(street_names)
    return generate_house_number(), street, district, city

# Tạo dữ liệu ngẫu nhiên
data = {
    "MaNV": [generate_manv(i + 1) for i in range(num_rows)],
    "HoTen": [generate_full_name() for _ in range(num_rows)],
    "SoNha": [generate_address()[0] for _ in range(num_rows)],
    "Duong": [generate_address()[1] for _ in range(num_rows)],
    "Quan": [generate_address()[2] for _ in range(num_rows)],
    "ThanhPho": [generate_address()[3] for _ in range(num_rows)],
    "NgaySinh": [generate_birth_date() for _ in range(num_rows)],
    "Phai": [random.choice(gender_choices) for _ in range(num_rows)],
    "BoPhan": [random.choice(bo_phan_choices) for _ in range(num_rows)],
    "ChiNhanh": [random.choice(chi_nhanh_choices) for _ in range(num_rows)],
    "Luong": [random.randint(7000000, 30000000) for _ in range(num_rows)],
    "DangLamViec": [random.choice([0, 1]) for _ in range(num_rows)]
}

# Chuyển thành DataFrame
nhan_vien_df = pd.DataFrame(data)

# Tạo thư mục output nếu chưa tồn tại
output_folder = os.path.join(os.path.dirname(__file__), "output")
os.makedirs(output_folder, exist_ok=True)

# Đường dẫn file CSV
output_file = os.path.join(output_folder, "nhan_vien_data.csv")
nhan_vien_df.to_csv(output_file, index=False, encoding='utf-8-sig')

print(f"Dữ liệu bảng nhân viên đã được tạo và lưu tại: {os.path.abspath(output_file)}")
