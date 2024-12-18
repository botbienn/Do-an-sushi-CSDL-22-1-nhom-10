# ---
# jupyter:
#   jupytext:
#     text_representation:
#       extension: .py
#       format_name: hydrogen
#       format_version: '1.3'
#       jupytext_version: 1.16.4
#   kernelspec:
#     display_name: base
#     language: python
#     name: python3
# ---

# %%
import pandas as pd 


# %%
def fix_nhan_vien(table, col_name): 
    df = pd.read_csv(f'./datas/{table}.csv', encoding='utf-8')
    col = df[col_name].tolist()
    col = [cell[-1] for cell in col]
    print(col)
    df[col_name] = col
    df.to_csv(f'./datas/{table}_new.csv', encoding='utf-8', index=0)


# %%
fix_nhan_vien('giam_gia', 'MaChuongTrinh')

# %%
fix_nhan_vien('tham_gia_chuong_trinh', 'MaChuongTrinh')
