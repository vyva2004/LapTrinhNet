create database QLTTAN
use QLTTAN
go
--table coso
CREATE TABLE CoSo 
(
    MaCoSo VARCHAR(10) PRIMARY KEY,
    TenCoSo NVARCHAR(100),
    DiaChi NVARCHAR(200),
    SoDienThoai VARCHAR(10),
    Email VARCHAR(100)
)
go
---table nhan vien
CREATE TABLE NhanVien 
(
    MaNhanVien VARCHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(100),
    ChucVu NVARCHAR(50),
    SoDienThoai VARCHAR(10),
    Email VARCHAR(100),
	GhiChu NVARCHAR(250),
    MaCoSo VARCHAR(10),
    FOREIGN KEY (MaCoSo) REFERENCES CoSo(MaCoSo)
)
go
---table hoc vien
CREATE TABLE HocVien 
(
    MaHocVien VARCHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    SoDienThoai VARCHAR(10),
    Email VARCHAR(100),
    TrangThai NVARCHAR(250),
    MaCoSo VARCHAR(10),	
    FOREIGN KEY (MaCoSo) REFERENCES CoSo(MaCoSo),
)
go
----table khoa hoc
CREATE TABLE KhoaHoc 
(
    MaKhoaHoc VARCHAR(10) PRIMARY KEY,
    TenKhoaHoc NVARCHAR(100),
    MoTa NVARCHAR(250),
    HocPhi DECIMAL(15,2),
    ThoiGian NVARCHAR(50)
)
go
----- table lophoc
CREATE TABLE LopHoc 
(
    MaLopHoc VARCHAR(10) PRIMARY KEY,
    TenLopHoc NVARCHAR(100),
    MaKhoaHoc VARCHAR(10),
    MaCoSo VARCHAR(10),
    MaGiaoVien VARCHAR(10),
    NgayBatDau DATE,
    NgayKetThuc DATE,
    CaHoc NVARCHAR(50),
    FOREIGN KEY (MaKhoaHoc) REFERENCES KhoaHoc(MaKhoaHoc),
    FOREIGN KEY (MaCoSo) REFERENCES CoSo(MaCoSo),
    FOREIGN KEY (MaGiaoVien) REFERENCES NhanVien(MaNhanVien)
)
go
--- table dang ky
CREATE TABLE DangKyHoc 
(
    MaDangKy VARCHAR(10) PRIMARY KEY,
    MaHocVien VARCHAR(10),
    MaLopHoc VARCHAR(10),
    NgayDangKy DATE,
    TrangThai NVARCHAR(50),
    FOREIGN KEY (MaHocVien) REFERENCES HocVien(MaHocVien),
    FOREIGN KEY (MaLopHoc) REFERENCES LopHoc(MaLopHoc)
)
go
----du lieu bang co so
INSERT INTO CoSo (MaCoSo, TenCoSo, DiaChi, SoDienThoai, Email) VALUES
('CS01', N'Cơ sở Hà Nội', N'123 Đường Láng, Hà Nội', '0987654321', 'hanoi@englishcenter.com'),
('CS02', N'Cơ sở TP.HCM', N'45 Nguyễn Huệ, TP.HCM', '0912345678', 'hcm@englishcenter.com'),
('CS03', N'Cơ sở Đà Nẵng', N'67 Lê Lợi, Đà Nẵng', '0935123456', 'danang@englishcenter.com'),
('CS04', N'Cơ sở Hải Phòng', N'89 Trần Phú, Hải Phòng', '0978123456', 'haiphong@englishcenter.com');
go
select * from CoSo
----du lieu bang nhan vien
INSERT INTO NhanVien (MaNhanVien, HoTen, ChucVu, SoDienThoai, Email,GhiChu, MaCoSo) VALUES
-- Cơ sở CS01
('NV001', N'Nguyễn Văn An', N'Quản lý', '0901234567', 'an.nv@gmail.com',N'đang ổn', 'CS01'),
('NV002', N'Trần Thị Bình', N'Kế toán', '0912345678', 'binh.tt@gmail.com',N'đang ổn', 'CS01'),
('NV003', N'Lê Văn Cường', N'Kế toán', '0923456789', 'cuong.lv@gmail.com',N'đang ổn', 'CS01'),
('NV004', N'Phạm Văn Dũng', N'Giáo viên', '0934567890', 'dung.pv@gmail.com',N'đang ổn', 'CS01'),
('NV005', N'Hoàng Thị Em', N'Giáo viên', '0945678901', 'em.ht@gmail.com',N'đang ổn', 'CS01'),
('NV006', N'Vũ Văn Hòa', N'Giáo viên', '0956789012', 'hoa.vv@gmail.com',N'đang ổn', 'CS01'),
('NV007', N'Đặng Thị Giang', N'Giáo viên', '0967890123', 'giang.dt@gmail.com',N'đang ổn', 'CS01'),
('NV008', N'Ngô Văn Hạnh', N'Giáo viên', '0978901234', 'hanh.nv@gmail.com',N'đang ổn', 'CS01'),
('NV009', N'Bùi Thị Hùng', N'Giáo viên', '0989012345', 'hung.bt@gmail.com',N'đang ổn', 'CS01'),
('NV010', N'Đỗ Văn Kim', N'Giáo viên', '0990123456', 'kim.dv@gmail.com',N'đang ổn', 'CS01'),
('NV011', N'Nguyễn Thị Long', N'Giáo viên', '0902345678', 'long.nt@gmail.com',N'đang ổn', 'CS01'),
('NV012', N'Trần Văn Mai', N'Giáo viên', '0913456789', 'mai.tv@gmail.com',N'đang ổn', 'CS01'),
('NV013', N'Lê Thị Nam', N'Giáo viên', '0924567890', 'nam.lt@gmail.com',N'đang ổn', 'CS01'),
-- Cơ sở CS02
('NV026', N'Vũ Văn Cẩm', N'Quản lý', '0958901234', 'cam.vv@gmail.com',N'đang ổn', 'CS02'),
('NV027', N'Đặng Thị Dung', N'Kế toán', '0969012345', 'dung.dt@gmail.com',N'đang ổn', 'CS02'),
('NV028', N'Ngô Văn Em', N'Kế toán', '0970123456', 'em.nv@gmail.com',N'đang ổn', 'CS02'),
('NV029', N'Bùi Thị Hòa', N'Giáo viên', '0981234567', 'hoa.bt@gmail.com',N'đang ổn', 'CS02'),
('NV030', N'Đỗ Văn Giang', N'Giáo viên', '0992345678', 'giang.dv@gmail.com',N'đang ổn', 'CS02'),
('NV031', N'Nguyễn Thị Hạnh', N'Giáo viên', '0904567890', 'hanh.nt@gmail.com',N'đang ổn', 'CS02'),
('NV032', N'Trần Văn Hùng', N'Giáo viên', '0915678901', 'hung.tv@gmail.com',N'đang ổn', 'CS02'),
('NV033', N'Lê Thị Kim', N'Giáo viên', '0926789012', 'kim.lt@gmail.com',N'đang ổn', 'CS02'),
('NV034', N'Phạm Văn Long', N'Giáo viên', '0937890123', 'long.pv@gmail.com',N'đang ổn', 'CS02'),
('NV035', N'Hoàng Thị Mai', N'Giáo viên', '0948901234', 'mai.ht@gmail.com',N'đang ổn', 'CS02'),
('NV036', N'Vũ Văn Nam', N'Giáo viên', '0959012345', 'nam.vv@gmail.com',N'đang ổn', 'CS02'),
('NV037', N'Đặng Thị Oanh', N'Giáo viên', '0960123456', 'oanh.dt@gmail.com',N'đang ổn', 'CS02'),
('NV038', N'Ngô Văn Phúc', N'Giáo viên', '0971234567', 'phuc.nv@gmail.com',N'đang ổn', 'CS02'),
-- Cơ sở CS03:
('NV051', N'Nguyễn Thị Giang', N'Quản lý', '0906789012', 'giang.nt@gmail.com',N'đang ổn', 'CS03'),
('NV052', N'Trần Văn Hạnh', N'Kế toán', '0917890123', 'hanh.tv@gmail.com',N'đang ổn', 'CS03'),
('NV053', N'Lê Thị Hùng', N'Kế toán', '0928901234', 'hung.lt@gmail.com',N'đang ổn', 'CS03'),
('NV054', N'Phạm Văn Kim', N'Giáo viên', '0939012345', 'kim.pv@gmail.com',N'đang ổn', 'CS03'),
('NV055', N'Hoàng Thị Long', N'Giáo viên', '0940123456', 'long.ht@gmail.com',N'đang ổn', 'CS03'),
('NV056', N'Vũ Văn Mai', N'Giáo viên', '0951234567', 'mai.vv@gmail.com',N'đang ổn', 'CS03'),
('NV057', N'Đặng Thị Nam', N'Giáo viên', '0962345678', 'nam.dt@gmail.com',N'đang ổn', 'CS03'),
('NV058', N'Ngô Văn Oanh', N'Giáo viên', '0973456789', 'oanh.nv@gmail.com',N'đang ổn', 'CS03'),
('NV059', N'Bùi Thị Phúc', N'Giáo viên', '0984567890', 'phuc.bt@gmail.com',N'đang ổn', 'CS03'),
('NV060', N'Đỗ Văn Quỳnh', N'Giáo viên', '0995678901', 'quynh.dv@gmail.com',N'đang ổn', 'CS03'),
('NV061', N'Nguyễn Thị Sơn', N'Giáo viên', '0906789012', 'son.nt@gmail.com',N'đang ổn', 'CS03'),
('NV062', N'Trần Văn Thảo', N'Giáo viên', '0917890123', 'thao.tv@gmail.com',N'đang ổn', 'CS03'),
('NV063', N'Lê Thị Tâm', N'Giáo viên', '0928901234', 'tam.lt@gmail.com',N'đang ổn', 'CS03'),
-- Cơ sở CS04
('NV076', N'Vũ Văn Long', N'Quản lý', '0952345678', 'long.vv@gmail.com',N'đang ổn', 'CS04'),
('NV077', N'Đặng Thị Mai', N'Kế toán', '0963456789', 'mai.dt@gmail.com',N'đang ổn', 'CS04'),
('NV078', N'Ngô Văn Nam', N'Kế toán', '0974567890', 'nam.nv@gmail.com',N'đang ổn', 'CS04'),
('NV079', N'Bùi Thị Oanh', N'Giáo viên', '0985678901', 'oanh.bt@gmail.com',N'đang ổn', 'CS04'),
('NV080', N'Đỗ Văn Phúc', N'Giáo viên', '0996789012', 'phuc.dv@gmail.com',N'đang ổn', 'CS04'),
('NV081', N'Nguyễn Thị Quỳnh', N'Giáo viên', '0907890123', 'quynh.nt@gmail.com',N'đang ổn', 'CS04'),
('NV082', N'Trần Văn Sơn', N'Giáo viên', '0918901234', 'son.tv@gmail.com',N'đang ổn', 'CS04'),
('NV083', N'Lê Thị Thảo', N'Giáo viên', '0929012345', 'thao.lt@gmail.com',N'đang ổn', 'CS04'),
('NV084', N'Phạm Văn Tâm', N'Giáo viên', '0930123456', 'tam.pv@gmail.com',N'đang ổn', 'CS04'),
('NV085', N'Hoàng Thị Uyên', N'Giáo viên', '0941234567', 'uyen.ht@gmail.com',N'đang ổn', 'CS04'),
('NV086', N'Vũ Văn Vinh', N'Giáo viên', '0952345678', 'vinh.vv@gmail.com',N'đang ổn', 'CS04'),
('NV087', N'Đặng Thị Xuân', N'Giáo viên', '0963456789', 'xuan.dt@gmail.com',N'đang ổn', 'CS04'),
('NV088', N'Ngô Văn Ý', N'Giáo viên', '0974567890', 'y.nv@gmail.com',N'đang ổn', 'CS04');
go
----du lieu bang hoc vien
INSERT INTO HocVien (MaHocVien, HoTen, NgaySinh, SoDienThoai, Email, TrangThai, MaCoSo) VALUES
--- hoc vien co so 1
('HV001', N'Nguyễn Thị Lan', '2000-05-15', '0901234561', 'lan.nt@gmail.com', N'Đã đóng học phí', 'CS01'),
('HV002', N'Trần Văn Hùng', '1999-08-20', '0912345672', 'hung.tv@gmail.com', N'Chưa đóng học phí', 'CS01'),
('HV003', N'Lê Thị Mai', '2001-03-10', '0923456783', 'mai.lt@gmail.com', N'Đã đóng học phí', 'CS01'),
('HV004', N'Phạm Văn Nam', '2000-12-25', '0934567894', 'nam.pv@gmail.com', N'Chưa đóng học phí', 'CS01'),
('HV005', N'Hoàng Thị Ngọc', '1998-07-30', '0945678905', 'ngoc.ht@gmail.com', N'Đã đóng học phí', 'CS01'),
('HV006', N'Vũ Văn Phong', '2002-01-15', '0956789016', 'phong.vv@gmail.com', N'Chưa đóng học phí', 'CS01'),
('HV007', N'Đặng Thị Quỳnh', '1999-11-05', '0967890127', 'quynh.dt@gmail.com', N'Đã đóng học phí', 'CS01'),
('HV008', N'Ngô Văn Sơn', '2001-09-22', '0978901238', 'son.nv@gmail.com', N'Chưa đóng học phí', 'CS01'),
('HV009', N'Bùi Thị Thảo', '2000-04-18', '0989012349', 'thao.bt@gmail.com', N'Đã đóng học phí', 'CS01'),
('HV010', N'Đỗ Văn Tâm', '1997-06-12', '0990123450', 'tam.dv@gmail.com', N'Chưa đóng học phí', 'CS01'),
---hoc vien co so 2
('HV011', N'Nguyễn Văn Bình', '2000-07-12', '0901234511', 'binh.nv@gmail.com', N'Đã đóng học phí', 'CS02'),
('HV012', N'Trần Thị Cúc', '1999-09-25', '0912345622', 'cuc.tt@gmail.com', N'Chưa đóng học phí', 'CS02'),
('HV013', N'Lê Văn Dũng', '2001-02-18', '0923456733', 'dung.lv@gmail.com', N'Đã đóng học phí', 'CS02'),
('HV014', N'Phạm Thị Hiền', '2000-11-30', '0934567844', 'hien.pt@gmail.com', N'Chưa đóng học phí', 'CS02'),
('HV015', N'Hoàng Văn Khánh', '1998-04-05', '0945678955', 'khanh.hv@gmail.com', N'Đã đóng học phí', 'CS02'),
('HV016', N'Vũ Thị Linh', '2002-06-20', '0956789066', 'linh.vt@gmail.com', N'Chưa đóng học phí', 'CS02'),
('HV017', N'Đặng Văn Minh', '1999-12-15', '0967890177', 'minh.dv@gmail.com', N'Đã đóng học phí', 'CS02'),
('HV018', N'Ngô Thị Ngọc', '2001-08-10', '0978901288', 'ngoc.nt@gmail.com', N'Chưa đóng học phí', 'CS02'),
('HV019', N'Bùi Văn Phát', '2000-03-22', '0989012399', 'phat.bv@gmail.com', N'Đã đóng học phí', 'CS02'),
('HV020', N'Đỗ Thị Quyên', '1997-10-08', '0990123400', 'quyen.dt@gmail.com', N'Chưa đóng học phí', 'CS02'),
----hoc vien co so 3
('HV021', N'Nguyễn Thị Anh', '2000-01-14', '0901234521', 'anh.nt@gmail.com', N'Chưa đóng học phí', 'CS03'),
('HV022', N'Trần Văn Bảo', '1999-05-28', '0912345632', 'bao.tv@gmail.com', N'Đã đóng học phí', 'CS03'),
('HV023', N'Lê Thị Châu', '2001-07-09', '0923456743', 'chau.lt@gmail.com', N'Chưa đóng học phí', 'CS03'),
('HV024', N'Phạm Văn Duy', '2000-10-16', '0934567854', 'duy.pv@gmail.com', N'Đã đóng học phí', 'CS03'),
('HV025', N'Hoàng Thị Giang', '1998-03-23', '0945678965', 'giang.ht@gmail.com', N'Chưa đóng học phí', 'CS03'),
('HV026', N'Vũ Văn Hào', '2002-09-11', '0956789076', 'hao.vv@gmail.com', N'Đã đóng học phí', 'CS03'),
('HV027', N'Đặng Thị Kim', '1999-06-04', '0967890187', 'kim.dt@gmail.com', N'Chưa đóng học phí', 'CS03'),
('HV028', N'Ngô Văn Long', '2001-12-27', '0978901298', 'long.nv@gmail.com', N'Đã đóng học phí', 'CS03'),
('HV029', N'Bùi Thị Mai', '2000-08-19', '0989012309', 'mai.bt@gmail.com', N'Chưa đóng học phí', 'CS03'),
('HV030', N'Đỗ Văn Nam', '1997-11-02', '0990123410', 'nam.dv@gmail.com', N'Đã đóng học phí', 'CS03'),
---hoc vien co so 4
('HV031', N'Nguyễn Văn Phong', '2010-02-15', '0901234531', 'phong.nv@gmail.com', N'Đã đóng học phí', 'CS04'),
('HV032', N'Trần Thị Quỳnh', '2011-04-20', '0912345642', 'quynh.tt@gmail.com', N'Chưa đóng học phí', 'CS04'),
('HV033', N'Lê Văn Sơn', '2009-06-25', '0923456753', 'son.lv@gmail.com', N'Đã đóng học phí', 'CS04'),
('HV034', N'Phạm Thị Thảo', '2010-09-10', '0934567864', 'thao.pt@gmail.com', N'Chưa đóng học phí', 'CS04'),
('HV035', N'Hoàng Văn Tâm', '2011-01-05', '0945678975', 'tam.hv@gmail.com', N'Đã đóng học phí', 'CS04'),
('HV036', N'Vũ Thị Uyên', '2009-03-18', '0956789086', 'uyen.vt@gmail.com', N'Chưa đóng học phí', 'CS04'),
('HV037', N'Đặng Văn Vinh', '2010-07-22', '0967890197', 'vinh.dv@gmail.com', N'Đã đóng học phí', 'CS04'),
('HV038', N'Ngô Thị Xuân', '2011-10-15', '0978901208', 'xuan.nt@gmail.com', N'Chưa đóng học phí', 'CS04'),
('HV039', N'Bùi Văn Ý', '2009-12-30', '0989012319', 'y.bv@gmail.com', N'Đã đóng học phí', 'CS04'),
('HV040', N'Đỗ Thị Ánh', '2010-05-08', '0990123420', 'anh.dt@gmail.com', N'Chưa đóng học phí', 'CS04');
go
---du lieu bang khoa hoc
INSERT INTO KhoaHoc (MaKhoaHoc, TenKhoaHoc, MoTa, HocPhi, ThoiGian) VALUES
('KH01', N'Tiếng Anh Giao Tiếp Cơ Bản', 'Khóa học giao tiếp cơ bản', 5000000.00, N'3 tháng'),
('KH02', N'Tiếng Anh IELTS 6.0', 'Chuẩn bị cho kỳ thi IELTS', 8000000.00, N'4 tháng'),
('KH03', N'Tiếng Anh TOEIC 700', 'Luyện thi TOEIC', 6000000.00, N'3 tháng'),
('KH04', N'Tiếng Anh Trẻ Em', 'Dành cho học sinh tiểu học', 4000000.00, N'2 tháng'),
('KH05', N'Tiếng Anh Thương Mại', 'Kỹ năng tiếng Anh trong kinh doanh', 7000000.00, N'3 tháng'),
('KH06', N'Tiếng Anh Giao Tiếp Nâng Cao', 'Nâng cao kỹ năng giao tiếp', 6000000.00, N'3 tháng'),
('KH07', N'Tiếng Anh Du Lịch', 'Tiếng Anh cho ngành du lịch', 5500000.00, N'2 tháng'),
('KH08', N'Tiếng Anh Phát Âm', 'Cải thiện phát âm chuẩn', 4500000.00, N'2 tháng'),
('KH09', N'Tiếng Anh Văn Phòng', 'Tiếng Anh cho công việc văn phòng', 6500000.00, N'3 tháng'),
('KH10', N'Tiếng Anh IELTS 7.0', 'Luyện thi IELTS nâng cao', 9000000.00, N'4 tháng');
go
-----du lieu bang lop hoc
INSERT INTO LopHoc (MaLopHoc, TenLopHoc, MaKhoaHoc, MaCoSo, MaGiaoVien, NgayBatDau, NgayKetThuc, CaHoc) VALUES
('LH01', N'Lớp Giao Tiếp Cơ Bản 01', 'KH01', 'CS01', 'NV002', '2025-04-01', '2025-06-30', N'Tối 19:00-21:00'),
('LH02', N'Lớp IELTS 6.0 01', 'KH02', 'CS02', 'NV003', '2025-04-05', '2025-08-05', N'Chiều 14:00-16:00'),
('LH03', N'Lớp TOEIC 700 01', 'KH03', 'CS03', 'NV005', '2025-04-10', '2025-07-10', N'Sáng 09:00-11:00'),
('LH04', N'Lớp Trẻ Em 01', 'KH04', 'CS04', 'NV007', '2025-04-15', '2025-06-15', N'Chiều 15:00-17:00'),
('LH05', N'Lớp Thương Mại 01', 'KH05', 'CS01', 'NV009', '2025-04-20', '2025-07-20', N'Tối 18:30-20:30'),
('LH06', N'Lớp Giao Tiếp Nâng Cao 01', 'KH06', 'CS02', 'NV010', '2025-04-25', '2025-07-25', N'Tối 19:00-21:00'),
('LH07', N'Lớp Du Lịch 01', 'KH07', 'CS03', 'NV005', '2025-05-01', '2025-07-01', N'Sáng 08:00-10:00'),
('LH08', N'Lớp Phát Âm 01', 'KH08', 'CS04', 'NV007', '2025-05-05', '2025-07-05', N'Chiều 14:00-16:00'),
('LH09', N'Lớp Văn Phòng 01', 'KH09', 'CS01', 'NV002', '2025-05-10', '2025-08-10', N'Tối 19:00-21:00'),
('LH10', N'Lớp IELTS 7.0 01', 'KH10', 'CS02', 'NV003', '2025-05-15', '2025-09-15', N'Sáng 09:00-11:00');
go
---du lieu bang 
INSERT INTO DangKyHoc (MaDangKy, MaHocVien, MaLopHoc, NgayDangKy, TrangThai) VALUES
('DK001', 'HV001', 'LH01', '2025-03-15', N'Đã xác nhận'),
('DK002', 'HV002', 'LH01', '2025-03-16', N'Đã xác nhận'),
('DK003', 'HV003', 'LH02', '2025-03-17', N'Chờ duyệt'),
('DK004', 'HV004', 'LH02', '2025-03-18', N'Đã xác nhận'),
('DK005', 'HV005', 'LH03', '2025-03-19', N'Đã xác nhận'),
('DK006', 'HV006', 'LH03', '2025-03-20', N'Chờ duyệt'),
('DK007', 'HV007', 'LH04', '2025-03-21', N'Đã xác nhận'),
('DK008', 'HV008', 'LH04', '2025-03-22', N'Đã xác nhận'),
('DK009', 'HV009', 'LH05', '2025-03-23', N'Đã xác nhận'),
('DK010', 'HV010', 'LH06', '2025-03-24', N'Chờ duyệt');
go
select * from CoSo
select * from NhanVien
select * from HocVien
select * from KhoaHoc
select * from LopHoc
select * from DangKyHoc
