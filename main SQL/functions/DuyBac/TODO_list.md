TODO: 
- write test cases for: 
    - them mon_an
    - them dat_ban_online 
    - alter mon an 
    - xoa mon an 
    - xoa nhan vien 
    - dat mon
    - them ma mon phieu dat 
- finished your indexing analyzation 
- foreign key anormalies: 

    - nhan_vien:
        - dien_thoai_nhan_vien
        - lich_su_lam_viec
        - chi_nhanh (quan ly) 
        - the (nhan vien lap)
        - phieu dat (nhan vien lap)
            
    **absolutely does not delete this shit!!!** 
    **if you don't want to include this food anywhere**
    **just delete it from Mon_an_chi_nhanh or Mon_an_khu_vuc**
    **delete all instance of it and it will go away**
    **but not cascading into phieu_dat (orders) and hoa_don (bill)**
    - [x] mon_an: 
        - Mon_an_chi_nhanh
        - Mon_an_khu_vuc 
        - ma_mon_phieu_dat

    - [ ] don't delete ma_mon_phieu_dat, it will effect hoa_don
    **when you update these 2 table, you have to update child table**
    **probably better to add to the trigger function to check for integrity**

    - Mon_an_chi_nhanh: 
        - ma_mon_phieu_dat (procedure) ?

    - Mon_an_khu_vuc: 
        - Mon_an_chi_nhanh (procedure)
        - ma_mon_phieu_dat (procedure cascading)
    
