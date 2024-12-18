import pandas as pd

DATA_PATH = "../data_final/"
OUTPUT_FILE_PATH = "../data_final"
M_COUNT = 220
KV_COUNT = 3
START_DATE = "03/01/2023"
END_DATE = "05/01/2024"

# get list of employee id
# 1 history record per employee
MaKhuVuc_list = []
for i in range(1,4):
    MaKhuVuc_list.extend([i for _ in range(M_COUNT)])

MaMon_list = []
for i in range(1,4): 
    MaMon_list.extend(["MM"+ "0"*(4-len(str(x))) + str(x) for x in range(1, M_COUNT+1)])

data = {
    "MaKhuVuc": MaKhuVuc_list,
    "MaMon": MaMon_list,
}
# print(data["MaKhuVuc"])

result_df = pd.DataFrame(data)
print(result_df.head())

result_df.to_csv(
    f"{OUTPUT_FILE_PATH}/mon_an_khu_vuc.csv", encoding="utf-8", sep=",", index=False
)

