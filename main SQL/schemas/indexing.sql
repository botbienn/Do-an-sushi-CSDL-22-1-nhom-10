
CREATE NONCLUSTERED INDEX idx_phieudat_MaCN_NgayDat on phieu_dat(MaCN, NgayDat)
CREATE NONCLUSTERED INDEX idx_phieudat_CCCD on phieu_dat(CCCD)
CREATE NONCLUSTERED INDEX idx_the_CCCD on the(CCCD)

CREATE NONCLUSTERED INDEX idx_phieudat_loaiphieu_MaCN on phieu_dat(LoaiPhieu, MaCN)
CREATE NONCLUSTERED INDEX idx_phieudat_loaiphieu on phieu_dat(LoaiPhieu)
CREATE NONCLUSTERED INDEX idx_mon_an_chi_nhanh_giaoHang on mon_an_chi_nhanh(GiaoHang)


-- DROP INDEX idx_mon_an_CN_MaCN ON mon_an_chi_nhanh
-- DROP INDEX idx_phieu_dat_maPhieu ON phieu_dat
-- DROP INDEX idx_giao_hang_maPhieu ON giao_hang
-- DROP INDEX idx_dat_online_maPhieu ON dat_ban_online
-- DROP INDEX idx_chi_nhanh_MaCN ON chi_nhanh
