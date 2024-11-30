SELECT * from hoa_don('MP001')


SELECT 1 FROM 
    -- INSERTED new JOIN
    -- "order" o ON new.MaPhieu = o.MaPhieu JOIN 
    "order" o JOIN
    mon_an_chi_nhanh mcn ON mcn.MaCN = o.MaCN
    WHERE mcn.GiaoHang = 0 AND 
            o.LoaiPhieu = 3 AND 
            o.MaPhieu = 'MP005'
