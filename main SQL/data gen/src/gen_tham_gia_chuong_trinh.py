import pandas as pd
import random
from datetime import datetime, timedelta
import os

DATA_PATH = os.path.join(os.path.dirname(__file__), "../data_final")
OUTPUT_FILE_PATH = os.path.join(os.path.dirname(__file__), "../data_final")

phieuDat_df = pd.read_csv(DATA_PATH + "/phieu_dat.csv", sep=',', encoding='utf-8',dtype=object)

MaPhieu_list = phieuDat_df["MaPhieu"].to_list()

MaPhieu_temp = [elem for item in MaPhieu_list for elem in (item, item)]
"""
    MaPhieu CHAR(6) NOT NULL,
    MaChuongTrinh INT NOT NULL,
"""

result = {
    "MaPhieu": MaPhieu_temp,
    "MaChuongTrinh": [random.randint(1,21) for _ in range(len(MaPhieu_temp))]
}

resultdf = pd.DataFrame(result)
print(resultdf.head())

resultdf.to_csv(OUTPUT_FILE_PATH + "/tham_gia_chuong_trinh.csv", index=False)

