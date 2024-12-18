import pandas as pd
from random import randint

def random_with_N_digits(n):
    range_start = 10**(n-1)
    range_end = (10**n)-1
    return randint(range_start, range_end)

DATA_PATH = "../data_final/"
OUTPUT_FILE_PATH = "../data_final"
NV_COUNT = 300
CN_COUNT = 15
START_DATE = "03/01/2023"
END_DATE = "05/01/2024"

# get list of employee id
# 1 history record per employee

data = {
    "MaNV": ["0" * (6 - len(str(x))) + str(x) for x in range(1, NV_COUNT + 1)],
    "DienThoai": [f'093{random_with_N_digits(8)}' for _ in range (NV_COUNT)]
}

result_df = pd.DataFrame(data)
print(result_df.head())

result_df.to_csv(
    f"{OUTPUT_FILE_PATH}/dien_thoai_nhan_vien.csv", encoding="utf-8", sep=",", index=False
)
