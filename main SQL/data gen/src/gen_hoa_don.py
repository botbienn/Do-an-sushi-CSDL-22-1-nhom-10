import pandas as pd
import random
from datetime import datetime, timedelta
import os

DATA_PATH = os.path.join(os.path.dirname(__file__), "../data_final")
OUTPUT_FILE_PATH = os.path.join(os.path.dirname(__file__), "../../schemas/hoa_don_exec.sql")

output_file = open(OUTPUT_FILE_PATH, "w+")

phieuDat_df = pd.read_csv(DATA_PATH + "/phieu_dat.csv", sep=',', encoding='utf-8',dtype=object)

MaPhieu_list = phieuDat_df["MaPhieu"].to_list()

"""
    MaPhieu CHAR(6) NOT NULL,
    MaChuongTrinh INT NOT NULL,
"""

def get_PD(): 
    PD = MaPhieu_list[random.randint(0,len(MaPhieu_list) - 1)]
    MaPhieu_list.remove(PD)
    return PD 

HD_COUNT = 30000

rand_MP_list = [get_PD() for _ in range(HD_COUNT)]

for i, MP in enumerate(rand_MP_list):
    output_file.writelines(f"EXEC calc_hoa_don @MaPhieu = \'{MP}\'\n")
    if i % 1000 == 999:
        output_file.writelines("GO\n")



