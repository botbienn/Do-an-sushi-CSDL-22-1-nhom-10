import pandas as pd
from faker import Faker
import random
import os
import unidecode

# Khởi tạo Faker với tiếng Việt
fake = Faker('vi_VN')

# Số lượng dòng dữ liệu
num_rows = 50000

# Danh sách giá trị cho cột Phai
gender_choices = ["Nam", "Nữ"]

# Danh sách domain email
email_domains = ["gmail.com", "yahoo.com", "outlook.com", "hotmail.com", "live.com", "icloud.com", "aol.com", "protonmail.com"]

# Đọc danh sách họ và tên từ file
with open('firstname.txt', 'r', encoding='utf-8') as f:
    firstnames = [line.strip() for line in f if line.strip()]

with open('lastname.txt', 'r', encoding='utf-8') as f:
    lastnames = [line.strip() for line in f if line.strip()]

# Hàm tạo CCCD (12 ký tự ngẫu nhiên, không trùng lặp)
used_cccds = set()
def generate_cccd():
    while True:
        cccd = ''.join([str(random.randint(0, 9)) for _ in range(12)])
        if cccd not in used_cccds:
            used_cccds.add(cccd)
            return cccd

# Hàm tạo SDT (10 số ngẫu nhiên bắt đầu bằng 0)
def generate_phone_number():
    return '0' + ''.join([str(random.randint(0, 9)) for _ in range(9)])

# Hàm tạo họ tên ngẫu nhiên
def generate_full_name():
    firstname = random.choice(firstnames)
    lastname = random.choice(lastnames)
    return f"{firstname} {lastname}"

# Hàm tạo email với domain ngẫu nhiên (không dấu)
def generate_email(full_name):
    username = unidecode.unidecode(full_name).lower().replace(" ", ".")
    domain = random.choice(email_domains)
    return f"{username}@{domain}"

# Tạo dữ liệu ngẫu nhiên
names = [generate_full_name() for _ in range(num_rows)]
data = {
    "CCCD": [generate_cccd() for _ in range(num_rows)],
    "HoTen": names,
    "SDT": [generate_phone_number() for _ in range(num_rows)],
    "Email": [generate_email(name) for name in names],
    "Phai": [random.choice(gender_choices) for _ in range(num_rows)]
}

# Chuyển thành DataFrame
df = pd.DataFrame(data)

# Tạo thư mục output nếu chưa tồn tại
output_folder = os.path.join(os.path.dirname(__file__), "output")
os.makedirs(output_folder, exist_ok=True)

# Đường dẫn file CSV trong thư mục output
output_file = os.path.join(output_folder, "khach_hang_data.csv")

# Lưu file CSV
df.to_csv(output_file, index=False, encoding='utf-8-sig')

# In đường dẫn file hoàn thành
print(f"Dữ liệu đã được tạo và lưu tại: {os.path.abspath(output_file)}")
