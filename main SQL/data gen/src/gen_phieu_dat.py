import pandas as pd
import random
from datetime import datetime, timedelta

DATA_PATH = "../data_final/"
OUTPUT_FILE_PATH = "../data_final"
M_COUNT = 220
KV_COUNT = 3
START_DATE = "03/01/2023"
END_DATE = "05/01/2024"

"""
    MaPhieu     CHAR(6) PRIMARY KEY,
    NgayDat     DATE NOT NULL,
    MaCN        INT NOT NULL,
    NhanVienLap CHAR(6) NULL,
    CCCD        CHAR(12) NOT NULL,
    LoaiPhieu   INT NOT NULL,
"""

def generate_birth_date():
    end_date = datetime.now() - timedelta(days=0)
    start_date = datetime.now() - timedelta(days=4*365)
    random_days = random.randint(0, (end_date - start_date).days)
    return (start_date + timedelta(days=random_days)).strftime("%m/%d/%Y")

# get list of employee id
# 1 history record per employee
MaPhieu_list = ["0"*(6 -len(str(i)))+ str(i) for i in range(100000)]

NgayDat_list = [generate_birth_date() for _ in range(100000)]

MaCN_list = []

PARTITION = 100000 // 15

for i in range(1,16):
    MaCN_list.extend([i for _ in range(PARTITION)])

MaCN_list.extend([15 for _ in range(100000 - (15 * PARTITION))])


def gen_NV(chiNhanh): 
    step = 300 // 15 
    i = random.randint(step * (chiNhanh - 1) + 1, step * (chiNhanh))
    return "0"*(6-len(str(i))) + str(i)
NhanVienLap_list = []

for i in range(1,16): 
    NhanVienLap_list.extend([gen_NV(i) for _ in range(PARTITION)])
NhanVienLap_list.extend([gen_NV(15) for _ in range(100000 - (15 * PARTITION))])

cccd_df = pd.read_csv(DATA_PATH + '/khach_hang.csv', dtype=object)
cccd_temp = cccd_df["CCCD"].to_list()
print(len(cccd_df.index))

def gen_KH(): 
    i = random.randint(0,len(cccd_df.index) - 1) 
    return cccd_temp[i]
CCCD_list = [gen_KH() for _ in range(100000)]

LoaiPhieu_list = []
for i in range(1,16): 
    LoaiPhieu_list.extend([1 for _ in range(PARTITION // 3)])
    LoaiPhieu_list.extend([2 for _ in range(PARTITION // 3)])
    LoaiPhieu_list.extend([3 for _ in range(PARTITION - 2 * (PARTITION // 3))])
LoaiPhieu_list.extend([3 for _ in range(100000 - (15 * PARTITION))])


data = {
    "MaPhieu": MaPhieu_list,
    "NgayDat": NgayDat_list,
    "MaCN": MaCN_list,
    "NhanVienLap": NhanVienLap_list,
    "CCCD": CCCD_list,
    "LoaiPhieu": LoaiPhieu_list,
}
# print(len(data["MaPhieu"]))
# print(len(data["NgayDat"]))
# print(len(data["MaCN"]))
# print(len(data["NhanVienLap"]))
# print(len(data["CCCD"]))
# print(len(data["LoaiPhieu"]))
result_df = pd.DataFrame(data)
print(result_df.head())

result_df.to_csv(
    f"{OUTPUT_FILE_PATH}/phieu_dat.csv", encoding="utf-8", sep=",", index=False
)

