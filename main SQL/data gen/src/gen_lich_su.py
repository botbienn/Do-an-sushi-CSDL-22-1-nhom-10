import pandas as pd

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
    "ChiNhanh": [str(i // (NV_COUNT // CN_COUNT) + 1) for i in range(NV_COUNT)],
    "NgayBatDau": [START_DATE for _ in range(NV_COUNT)],
    "NgayKetThuc": [END_DATE for _ in range(NV_COUNT)],
}

result_df = pd.DataFrame(data)
print(result_df.head())

result_df.to_csv(
    f"{OUTPUT_FILE_PATH}/lich_su_lam_viec.csv", encoding="utf-8", sep=",", index=False
)

# print(data["MaNV"])
