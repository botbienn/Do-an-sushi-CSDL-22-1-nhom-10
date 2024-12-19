import pandas as pd

DATA_PATH = "./data_final/"
OUTPUT_FILE_PATH = "../schemas/add_data_final.sql"
FILE_ORDER = [
    "khach_hang",
    "khu_vuc",
    "bo_phan",
    "chi_nhanh",
    "nhan_vien",
    "lich_su_lam_viec",
    "dien_thoai_nhan_vien",
    "mon_an",
    "mon_an_khu_vuc",
    "mon_an_chi_nhanh",
    "phieu_dat",
    "order_tai_cho",
    "dat_ban_online",
    "giao_hang",
    "ma_mon_phieu_dat",
    "the",
    "chuong_trinh",
    "giam_gia",
    "tham_gia_chuong_trinh",
    "danh_gia",
]


def read_and_convert():
    output_file = open(OUTPUT_FILE_PATH, "w+")

    # Specify the directory you want to scan
    folder_path = "./data_final"
    table_names = []

    # Iterate over all files in the folder
    for filename in FILE_ORDER:
        # Get the full path to the file
        table_names.append(filename)
        df = pd.read_csv(folder_path + "/" + filename + ".csv", encoding="utf-8", dtype=object)

        # special files
        if filename == "order":
            filename = '"order"'

        if filename == "chi_nhanh":
            df.drop("NVQuanLy", axis=1, inplace=True)

        # Get attributes names
        attributes = df.columns.tolist()

        # main file content
        output_file.writelines(
            f"INSERT INTO {filename}({', '.join(attributes)}) VALUES\n"
        )

        for i, row in enumerate(df.iloc):
            clean_row = [x if str(x) != "nan" else "" for x in row.tolist()]

            if (i == len(df.index) - 1) or (i % 1000 == 999):
                output_file.write(f'(N\'{'\', N\''.join(map(str, clean_row))}\')\n')
            else:
                output_file.write(f'(N\'{'\', N\''.join(map(str, clean_row))}\'),\n')

            # Because sql insert statement maximum insert 1000 rows
            if (i % 1000 == 999) and (i != len(df.index) - 1): 
                output_file.writelines("GO\n")
                output_file.writelines(f"INSERT INTO {filename}({', '.join(attributes)}) VALUES\n")


        # alter table because loop foreign key
        if filename == "nhan_vien":
            chi_nhanh_df = pd.read_csv(folder_path + "/chi_nhanh.csv", encoding="utf-8", dtype=object)

            nv_col = chi_nhanh_df["NVQuanLy"].tolist()
            nv_col = [x if str(x) != "nan" else "" for x in nv_col]

            output_arr = [f"WHEN {i + 1} THEN '{val}'" for i, val in enumerate(nv_col)]
            output_str = "\n".join(map(str, output_arr))
            where_str = ",".join(map(str, [i + 1 for i in range(len(nv_col))]))

            output_file.write("\n")
            output_file.writelines("UPDATE chi_nhanh\n")
            output_file.write("SET NVQuanLy = CASE MaCN\n")
            output_file.write(output_str)
            output_file.write("END\n")
            output_file.write(f"WHERE MaCN IN({where_str});")
            output_file.write("\n\n")
            output_file.write(
                "ALTER TABLE chi_nhanh ADD CONSTRAINT FK_chinhanh_nhanvien FOREIGN KEY(NVQuanLy) REFERENCES nhan_vien(MaNV);"
            )
            output_file.write("\n")

        output_file.write("\n")

    output_file.close()


def main():
    read_and_convert()


if __name__ == "__main__":
    main()
