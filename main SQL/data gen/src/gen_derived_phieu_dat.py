import pandas as pd
import random
from datetime import datetime, timedelta
import os

DATA_PATH = os.path.join(os.path.dirname(__file__), "../data_final")
OUTPUT_FILE_PATH = os.path.join(os.path.dirname(__file__), "../data_final")
M_COUNT = 220
KV_COUNT = 3
START_DATE = "03/01/2023"
END_DATE = "05/01/2024"

phieuDat_df = pd.read_csv(DATA_PATH + "/phieu_dat.csv", sep=',', encoding='utf-8',dtype=object)

type_list = phieuDat_df["LoaiPhieu"].to_list()
MaPhieu_list = phieuDat_df["MaPhieu"].to_list()

MP_tai_cho = [
    MaPhieu_list[i] for i in range(len(phieuDat_df.index)) if type_list[i] == '1'
]
MP_online = [
    MaPhieu_list[i] for i in range(len(phieuDat_df.index)) if type_list[i] == '2'
]
MP_giao_hang = [
    MaPhieu_list[i] for i in range(len(phieuDat_df.index)) if type_list[i] == '3'
]

print(MP_giao_hang)

tai_cho_map = {
    "MaPhieu": MP_tai_cho,
    "SoBan": [random.randint(1, 51) for _ in range(len(MP_tai_cho))],
}

tai_cho_df = pd.DataFrame(tai_cho_map)
print(tai_cho_df.head())

online_map = {
    "MaPhieu": MP_online,
    "KhuVuc": [random.randint(1, 4) for _ in range(len(MP_online))],
    "SoLuongKhach": [random.randint(2, 11) for _ in range(len(MP_online))],
    "GioDen": [
        f"{random.randint(9,21):02d}:{random.randint(0,60):02d}:00"
        for _ in range(len(MP_online))
    ],
    "GhiChu": ["" for _ in range(len(MP_online))],
}
online_df = pd.DataFrame(online_map)
print(online_df.head())

giao_hang_map = {
    "MaPhieu": MP_giao_hang,
    "ThoiDiemOnline": [
        f"{random.randint(9,21):02d}:{random.randint(0,60):02d}:00"
        for _ in range(len(MP_giao_hang))
    ],
    "ThoiGianOnline": [
        f"{random.randint(0,1):02d}:{random.randint(0,60):02d}:00"
        for _ in range(len(MP_giao_hang))
    ],
}
giao_hang_df = pd.DataFrame(giao_hang_map)
print(giao_hang_df.head())

tai_cho_df.to_csv(OUTPUT_FILE_PATH + '/order_tai_cho.csv', index = False)
online_df.to_csv(OUTPUT_FILE_PATH + '/dat_ban_online.csv', index = False)
giao_hang_df.to_csv(OUTPUT_FILE_PATH + '/giao_hang.csv', index = False)
#
"""
    MaPhieu     CHAR(6) PRIMARY KEY,
    NgayDat     DATE NOT NULL,
    MaCN        INT NOT NULL,
    NhanVienLap CHAR(6) NULL,
    CCCD        CHAR(12) NOT NULL,
    LoaiPhieu   INT NOT NULL,
"""
"""
    MaPhieu char(6) primary key,
    SoBan int not null,
"""


"""
    MaPhieu      CHAR(6) PRIMARY KEY,
    KhuVuc       INT NOT NULL,
    SoLuongKhach INT NOT NULL,
    GioDen       TIME NOT NULL,
    GhiChu       NVARCHAR(100),
"""
"""
    MaPhieu        CHAR(6) PRIMARY KEY,
    ThoiDiemOnline TIME NOT NULL,
    ThoiGianOnline TIME NOT NULL,
"""

# result_df.to_csv(
#     f"{output_file_path}/phieu_dat.csv", encoding="utf-8", sep=",", index=false
# )
