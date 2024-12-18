import pandas as pd

DATA_PATH = "../data_final/"
OUTPUT_FILE_PATH = "../data_final"
M_COUNT = 220
KV_COUNT = 3
START_DATE = "03/01/2023"
END_DATE = "05/01/2024"

# get list of employee id
# 1 history record per employee
MaCN_list = []
for i in range(1,16):
    MaCN_list.extend([i for _ in range(M_COUNT)])

MaMon_list = []
for i in range(1,16): 
    MaMon_list.extend(["MM"+ "0"*(3-len(str(x))) + str(x) for x in range(1, M_COUNT+1)])

data = {
    "MaCN": MaCN_list,
    "MaMon": MaMon_list,
    "GiaoHang": [1 for _ in range(M_COUNT*15)]
}
# print(data["MaKhuVuc"])

# print(len(data["MaCN"]))
# print(len(data["MaMon"]))
# print(len(data["GiaoHang"]))
#
result_df = pd.DataFrame(data)
print(result_df.head())

result_df.to_csv(
    f"{OUTPUT_FILE_PATH}/mon_an_chi_nhanh.csv", encoding="utf-8", sep=",", index=False
)

