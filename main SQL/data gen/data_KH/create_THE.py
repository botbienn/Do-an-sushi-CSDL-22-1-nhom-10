import pandas as pd
from faker import Faker
import random
import os
from datetime import datetime, timedelta

# Khởi tạo Faker
fake = Faker('vi_VN')

# Định dạng các file đầu vào và thư mục output
base_dir = os.path.join(os.path.dirname(__file__), "output")
khach_hang_file = os.path.join(base_dir, "khach_hang_data.csv")
nhan_vien_file = os.path.join(base_dir, "nhan_vien_data.csv")

# Đọc dữ liệu khách hàng và nhân viên, đảm bảo CCCD và MaNV giữ nguyên chuỗi có số 0 ở đầu
khach_hang_df = pd.read_csv(khach_hang_file, dtype={'CCCD': str})
nhan_vien_df = pd.read_csv(nhan_vien_file, dtype={'MaNV': str})  # MaNV là chuỗi

# Lấy danh sách CCCD và Mã nhân viên
cccd_list = khach_hang_df['CCCD'].tolist()
manv_list = nhan_vien_df['MaNV'].dropna().tolist()

# Số lượng dòng dữ liệu
num_rows = 20000

# Danh sách loại thẻ
loai_the_choices = ["member", "silver", "gold"]

# Hàm tạo mã thẻ (tăng dần từ 00001)
def generate_mathe(index):
    return f"{index:05d}"

# Hàm tạo ngày ngẫu nhiên trong khoảng 2 năm qua
def generate_random_date():
    start_date = datetime.now() - timedelta(days=730)
    random_days = random.randint(0, 730)
    return (start_date + timedelta(days=random_days))

# Tạo dữ liệu ngẫu nhiên
mathe_list = []
cccd_random_list = []
ngaylap_list = []
loaith_list = []
tieudung_list = []
nhanvienlap_list = []
capnhat_list = []

for i in range(num_rows):
    mathe = generate_mathe(i + 1)
    cccd = random.choice(cccd_list)
    ngay_lap = generate_random_date()  # Ngày lập thẻ
    loai_the = random.choice(loai_the_choices)
    tieu_dung = random.randint(50000, 1000000)  # Tiêu dùng là kiểu int
    nhanvien_lap = random.choice(manv_list)
    
    # Ngày cập nhật sau ngày lập thẻ
    cap_nhat = ngay_lap + timedelta(days=random.randint(1, 30))

    # Chuyển định dạng ngày thành chuỗi
    ngay_lap_str = ngay_lap.strftime("%m/%d/%Y")
    cap_nhat_str = cap_nhat.strftime("%m/%d/%Y")

    # Append vào danh sách
    mathe_list.append(mathe)
    cccd_random_list.append(cccd)
    ngaylap_list.append(ngay_lap_str)
    loaith_list.append(loai_the)
    tieudung_list.append(tieu_dung)
    nhanvienlap_list.append(nhanvien_lap)
    capnhat_list.append(cap_nhat_str)

# Chuyển thành DataFrame
data = {
    "MaThe": mathe_list,
    "CCCD": cccd_random_list,
    "NgayLap": ngaylap_list,
    "LoaiThe": loaith_list,
    "TieuDung": tieudung_list,
    "NhanVienLap": nhanvienlap_list,
    "CapNhat": capnhat_list
}

the_df = pd.DataFrame(data)

# Tạo thư mục output nếu chưa tồn tại
os.makedirs(base_dir, exist_ok=True)

# Lưu file CSV trong thư mục output
output_file = os.path.join(base_dir, "the_data.csv")
the_df.to_csv(output_file, index=False, encoding='utf-8-sig')

print(f"Dữ liệu bảng thẻ đã được tạo và lưu tại: {os.path.abspath(output_file)}")

