import pandas as pd
import random
from datetime import datetime, timedelta
import os

DATA_PATH = os.path.join(os.path.dirname(__file__), "../data_final")
OUTPUT_FILE_PATH = os.path.join(os.path.dirname(__file__), "../data_final")

phieuDat_df = pd.read_csv(DATA_PATH + "/phieu_dat.csv", sep=',', encoding='utf-8',dtype=object)

MaPhieu_list = phieuDat_df["MaPhieu"].to_list()

monAn_df = pd.read_csv(DATA_PATH + "/mon_an.csv", sep=',', encoding='utf-8',dtype=object)

MaMonList = monAn_df["MaMon"].to_list()

MaPhieu_temp = [elem for item in MaPhieu_list for elem in (item, item, item)]

MaMon_temp = [MaMonList[random.randint(0,len(MaMonList)-1)] for _ in range(len(MaPhieu_temp))]
"""
    MaPhieu  CHAR(6),
    MaMon    CHAR(6),
    SoLuong  INT NOT NULL,
    DatTruoc BIT NOT NULL DEFAULT (0),
"""

result = {
    "MaPhieu": MaPhieu_temp,
    "MaMon": MaMon_temp,
    "SoLuong": [random.randint(1,4) for _ in range(len(MaPhieu_temp))],
    "DatTruoc": [0 for _ in range(len(MaPhieu_temp))],
}

resultdf = pd.DataFrame(result)
print(resultdf.head())

resultdf.to_csv(OUTPUT_FILE_PATH + "/ma_mon_phieu_dat.csv", index=False)

