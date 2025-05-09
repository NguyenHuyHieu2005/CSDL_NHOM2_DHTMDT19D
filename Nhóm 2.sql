-- Tạo database
CREATE DATABASE  QLDV;
GO

-- Sử dụng database vừa tạo
USE QLDV;
GO

-- Tạo bảng đơn vị
CREATE TABLE DONVI (
    MADV CHAR(10) PRIMARY KEY,
    TENDV NVARCHAR(100),
    SDT VARCHAR(15),
    DIACHI NVARCHAR(200));

-- Tạo bảng dự án
CREATE TABLE DUAN (
    MADA CHAR(10) PRIMARY KEY,
    TENDA NVARCHAR(100));

-- Tạo bảng khách hàng
CREATE TABLE KHACHHANG (
    MAKH CHAR(10) PRIMARY KEY,
    TENKH NVARCHAR(100),
    DIACHI NVARCHAR(200),
    SDT VARCHAR(15)
);

-- Tạo bảng hàng hóa
CREATE TABLE HANGHOA (
    MAHANG CHAR(10) PRIMARY KEY,
    TENHANG NVARCHAR(100),
    SLKHO INT
);

-- Tạo bảng nhân viên
CREATE TABLE NHANVIEN (
    MANV CHAR(10) PRIMARY KEY,
    TENNV NVARCHAR(100),
    GIOITINH NVARCHAR(10),
    DIACHI NVARCHAR(200),
    SDT VARCHAR(15),
    MADV CHAR(10),
    MADA CHAR(10),
    FOREIGN KEY (MADV) REFERENCES DONVI(MADV),
    FOREIGN KEY (MADA) REFERENCES DUAN(MADA));
 -- bảng hóa đơn 
CREATE TABLE HOA_DON (
    MADH CHAR(10) PRIMARY KEY,
    NGAYDAT DATE,
    TONGSL INT,
    TONGTIEN DECIMAL(18, 2),
    MANV CHAR(10),
    MAKH CHAR(10),
    FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV),
    FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH));
-- bảng chi tiết hóa đơn 
CREATE TABLE CHI_TIET_HOA_DON (
    MACTHD CHAR(10) PRIMARY KEY,
    DONGIA DECIMAL(18, 2),
    THANHTIEN DECIMAL(18, 2),
    MAHANG CHAR(10),
    MADH CHAR(10),
    FOREIGN KEY (MAHANG) REFERENCES HANGHOA(MAHANG),
    FOREIGN KEY (MADH) REFERENCES HOA_DON(MADH)
);

-- chèn dữ liệu
USE QLDV
-- chèn bảng đơn vị 
INSERT INTO DONVI VALUES
('DV01', N'Phòng Kế Toán', '0281234567', N'123 Lê Lợi, Q.1'),
('DV02', N'Phòng Nhân Sự', '0282233445', N'45 Trần Hưng Đạo, Q.5'),
('DV03', N'Phòng Kỹ Thuật', '0289988776', N'78 Nguyễn Trãi, Q.10'),
('DV04', N'Phòng IT', '0286677889', N'90 Trường Chinh, Q.Tân Bình'),
('DV05', N'Phòng Marketing', '0283344556', N'32 Cộng Hòa, Q.Tân Bình'),
('DV06', N'Phòng Kinh Doanh', '0285566778', N'15 Nguyễn Văn Linh, Q.7');
-- chèn bảng dự án 
INSERT INTO DUAN VALUES
('DA01', N'Dự án Xây dựng A'),
('DA02', N'Dự án Công nghệ B'),
('DA03', N'Dự án Marketing C'),
('DA04', N'Dự án HR D'),
('DA05', N'Dự án Nội thất E'),
('DA06', N'Dự án Xuất khẩu F');
-- chèn bảng khách hàng 
INSERT INTO KHACHHANG VALUES
('KH01', N'Công ty ABC', N'100 Nguyễn Huệ, Q.1', '0912345678'),
('KH02', N'Công ty XYZ', N'200 Hai Bà Trưng, Q.3', '0923456789'),
('KH03', N'Cửa hàng Minh Tâm', N'15 Lê Văn Sỹ, Q.Phú Nhuận', '0934567890'),
('KH04', N'Công ty Phúc Long', N'300 Lê Văn Việt, Q.9', '0945678901'),
('KH05', N'Nhà sách Hoa Hồng', N'22 Trần Hưng Đạo, Q.5', '0956789012'),
('KH06', N'Siêu thị Thành Công', N'77 CMT8, Q.3', '0967890123');
-- chèn bảng hàng hóa 
INSERT INTO HANGHOA VALUES
('HH01', N'Máy in HP', 20),
('HH02', N'Máy chiếu Epson', 15),
('HH03', N'Laptop Dell', 10),
('HH04', N'Màn hình LG', 30),
('HH05', N'Chuột Logitech', 50),
('HH06', N'Bàn phím DareU', 40);
-- chèn bảng nhân viên 
INSERT INTO NHANVIEN VALUES
('NV01', N'Lê Minh Tuấn', N'Nam', N'12 Lý Thường Kiệt', '0901234567', 'DV01', 'DA01'),
('NV02', N'Nguyễn Thị Hoa', N'Nữ', N'45 CMT8', '0902233445', 'DV01', 'DA02'),
('NV03', N'Trần Văn Nam', N'Nam', N'89 Nguyễn Văn Cừ', '0903344556', 'DV02', 'DA03'),
('NV04', N'Phạm Thị Lan', N'Nữ', N'23 Võ Văn Tần', '0904455667', 'DV03', 'DA04'),
('NV05', N'Đỗ Mạnh Hùng', N'Nam', N'67 Điện Biên Phủ', '0905566778', 'DV03', 'DA05'),
('NV06', N'Lý Mỹ Linh', N'Nữ', N'99 Trần Não', '0906677889', 'DV04', 'DA06');
-- chèn bảng thêm hóa đơn để xây dựng câu hỏi truy vấn  
INSERT INTO HOA_DON VALUES
('HD01', '2025-05-01', 3, 15500000, 'NV01', 'KH01'),
('HD02', '2025-05-02', 2, 9800000, 'NV02', 'KH02'),
('HD03', '2025-05-03', 4, 22000000, 'NV03', 'KH03'),
('HD04', '2025-05-04', 1, 5500000, 'NV04', 'KH04'),
('HD05', '2025-05-05', 2, 7500000, 'NV05', 'KH05'),
('HD06', '2025-05-06', 3, 12200000, 'NV06', 'KH06');
-- chèn bảng chi tiết hóa đơn để xây dựng câu hỏi truy vấn 
INSERT INTO CHI_TIET_HOA_DON VALUES
('CT01', 5000000, 10000000, 'HH01', 'HD01'),
('CT02', 5500000, 5500000, 'HH02', 'HD01'),
('CT03', 4900000, 9800000, 'HH03', 'HD02'),
('CT04', 5500000, 5500000, 'HH04', 'HD04'),
('CT05', 3750000, 7500000, 'HH05', 'HD05'),
('CT06', 6100000, 12200000, 'HH06', 'HD06');

-- 4. Tự suy nghĩ ra 12 câu (2 truy vấn kết nối nhiều bảng, 2 update, 2 delete, 2 group by, 2 sub query, 2 câu bất kì) 
--2 câu truy vấn kết nối nhiều bảng
-- Câu 1 Liệt kê thông tin tên đơn vị, tên nhân viên, tên dự án mà nhân viên đang làm việc.
SELECT DV.TENDV, NV.TENNV, DA.TENDA
FROM DONVI DV
JOIN NHANVIEN NV ON DV.MADV = NV.MADV
JOIN DUAN DA ON NV.MADA = DA.MADA;
--Câu 2 : Liệt kê thông tin: mã hóa đơn, ngày đặt, tên nhân viên lập hóa đơn, tên đơn vị, tên khách hàng
SELECT HD.MADH, HD.NGAYDAT, NV.TENNV, DV.TENDV, KH.TENKH
FROM HOA_DON HD
JOIN NHANVIEN NV ON HD.MANV = NV.MANV
JOIN DONVI DV ON NV.MADV = DV.MADV
JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH;
-- 4.2. 2 câu update
--Câu 1: Cập nhật số lượng tồn kho SLKHO của mặt hàng có mã là 'HH01' lên thành 25.
UPDATE HANG_HOA
SET SLKHO = 25 
WHERE MAHANG = 'HH01';
-- Câu 2: Điều chỉnh địa chỉ DIACHI của khách hàng có mã 'KH03' thành '15 Lê Văn Sỹ, Quận 3, TP.HCM'.
UPDATE KHACH_HANG
SET DIACHI = N'15 Lê Văn Sỹ, Quận 3, TP.HCM'
WHERE MAKH = 'KH03';
--4.3. 2 câu delete
--Câu 1. Xóa các hàng hóa có SLTon <30
DELETE FROM HANGHOA
WHERE SLTON < 30;
-- Câu 2. Xóa chi tiết hóa đơn với mã chi tiết hóa đơn là  :	CT04
DELETE FROM [dbo].[CHI_TIET_HOA_DON]
WHERE [MACTHD]  = 'CT04';
-- 4.4. 2 câu sub query
-- Câu 1: Truy vấn lấy thông tin các hóa đơn và chi tiết về hàng hóa, kèm theo tên khách hàng và tổng tiền mỗi hóa đơn:
SELECT  h.MADH,h.NGAYDAT,  h.TONGSL, h.TONGTIEN, kh.TENKH,  c.MAHANG, hh.TENHANG,c.DONGIA, c.THANHTIEN
FROM  HOA_DON h
JOIN CHI_TIET_HOA_DON c ON h.MADH = c.MADH
JOIN  HANGHOA hh ON c.MAHANG = hh.MAHANG
JOIN KHACHHANG kh ON h.MAKH = kh.MAKH
WHERE h.TONGTIEN = (SELECT MAX(TONGTIEN) FROM HOA_DON WHERE NGAYDAT = h.NGAYDAT)
ORDER BY  h.TONGTIEN DESC
--Câu 2: Tìm tên khách hàng đã mua hàng có đơn hàng chứa mặt hàng có đơn giá cao nhất.
SELECT DISTINCT KH.TENKH
FROM KHACHHANG KH
JOIN HOA_DON HD ON KH.MAKH = HD.MAKH
JOIN CHI_TIET_HOA_DON CT ON HD.MADH = CT.MADH
WHERE CT.DONGIA = (
    SELECT MAX(DONGIA)
    FROM CHI_TIET_HOA_DON);
--4.5. 2 câu group by
--Câu 1. Liệt kê tổng số lượng hàng tồn kho (SLKHO) theo từng loại hàng hóa (TENHANG).
SELECT TENHANG, SUM(SLKHO) AS TONG_SO_LUONG_KHO
FROM HANGHOA
GROUP BY TENHANG;
--Câu 2. Tính tổng tiền (THANHTIEN) mỗi khách hàng đã chi tiêu, dựa trên mã khách hàng (MAKH).
SELECT KH.MAKH, KH.TENKH, SUM(CTHD.THANHTIEN) AS TONG_CHI_TIEU
FROM KHACHHANG KH
JOIN HOA_DON HD ON KH.MAKH = HD.MAKH
JOIN CHI_TIET_HOA_DON CTHD ON HD.MADH = CTHD.MADH
GROUP BY KH.MAKH, KH.TENKH;
--4.6. 2 Câu bất kì
--Câu 1. Liệt kê danh sách các đơn hàng (Mã đơn, Ngày đặt, Tên khách hàng, Tên nhân viên lập đơn, Tổng tiền), sắp xếp theo ngày đặt giảm dần.
SELECT HD.MADH, HD.NGAYDAT, KH.TENKH,NV.TENNV,  HD.TONGTIEN
FROM HOA_DON HD
JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH
JOIN NHANVIEN NV ON HD.MANV = NV.MANV
ORDER BY HD.NGAYDAT DESC;
--Câu 2. Liệt kê mã hóa đơn (MADH), ngày đặt hàng (NGAYDAT), tên khách hàng (TENKH) và tên nhân viên (TENNV) của tất cả các hóa đơn.
SELECT HD.MADH, HD.NGAYDAT, KH.TENKH, NV.TENNV
FROM HOA_DON HD
JOIN KHACH_HANG KH ON HD.MAKH = KH.MAKH
JOIN NHAN_VIEN NV ON HD.MANV = NV.MANV;
-- Câu 1. Liệt kê danh sách các đơn hàng (Mã đơn, Ngày đặt, Tên khách hàng, Tên nhân viên lập đơn, Tổng tiền), sắp xếp theo ngày đặt giảm dần.
SELECT HD.MADH, HD.NGAYDAT, KH.TENKH,NV.TENNV,  HD.TONGTIEN
FROM HOA_DON HD
JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH
JOIN NHANVIEN NV ON HD.MANV = NV.MANV
ORDER BY HD.NGAYDAT DESC;
-- Câu 2. Liệt kê mã hóa đơn (MADH), ngày đặt hàng (NGAYDAT), tên khách hàng (TENKH) và tên nhân viên (TENNV) của tất cả các hóa đơn.
SELECT HD.MADH, HD.NGAYDAT, KH.TENKH, NV.TENNV
FROM HOA_DON HD
JOIN KHACH_HANG KH ON HD.MAKH = KH.MAKH
--PHẦN C: BÀI TẬP TRUY VẤN CÁ NHÂN
-- 1. Nguyễn Huy Hiệu - 23705461
 --Bài 1. Liệt kê tất cả các đơn vị có nhân viên đã lập hóa đơn cho khách hàng có địa chỉ ở TP.HCM, kèm theo tổng tiền của từng đơn vị trong các hóa đơn đó.
SELECT DV.TENDV,SUM(HD.TONGTIEN) AS TONGTIEN_DONVI
FROM  HOA_DON HD
JOIN NHANVIEN NV ON HD.MANV = NV.MANV
JOIN DONVI DV ON NV.MADV = DV.MADV
JOIN  KHACHHANG KH ON HD.MAKH = KH.MAKH
WHERE KH.DIACHI LIKE N'%TP.HCM%'
GROUP BY DV.TENDV;
--Bài 2. Liệt kê tất cả các hóa đơn có tổng thành tiền trong chi tiết hóa đơn khác với trường TONGTIEN trong bảng HOA_DON (đối chiếu).
SELECT HD.MADH, HD.TONGTIEN AS TONGTIEN_HOADON, SUM(CTHD.THANHTIEN) AS TONGTIEN_CHITIET
FROM HOA_DON HD
LEFT JOIN CHI_TIET_HOA_DON CTHD ON HD.MADH = CTHD.MADH
GROUP BY HD.MADH, HD.TONGTIEN
HAVING ISNULL(SUM(CTHD.THANHTIEN), 0) <> HD.TONGTIEN;
--Bài 3. Tăng thêm 10% tổng tiền (TONGTIEN) cho tất cả hóa đơn được lập bởi nhân viên thuộc dự án có mã 'DA01' 
UPDATE HD
SET HD.TONGTIEN = HD.TONGTIEN * 1.1
FROM HOA_DON HD
JOIN NHANVIEN NV ON HD.MANV = NV.MANV
WHERE NV.MADA = 'DA01';
--Bài 4. Cập nhật địa chỉ cho những khách hàng đã từng mua hàng có đơn giá > 500000 trong chi tiết hóa đơn 
UPDATE KH
SET DIACHI = N'Khách VIP'
FROM KHACHHANG KH
WHERE MAKH IN (
    SELECT DISTINCT HD.MAKH
    FROM HOA_DON HD
    JOIN CHI_TIET_HOA_DON CTHD ON HD.MADH = CTHD.MADH
    WHERE CTHD.DONGIA > 500000);
--Bài 5. Liệt kê các nhân viên đã xử lý từ 1 hóa đơn trở lên, kèm tổng số lượng hàng họ đã xử lý, sắp xếp theo tổng số lượng giảm dần dùng GROUP BY.
SELECT NV.TENNV, COUNT(HD.MADH) AS SOHOADON, SUM(HD.TONGSL) AS TONG_SOLUONG
FROM NHANVIEN NV
JOIN HOA_DON HD ON NV.MANV = HD.MANV
GROUP BY NV.TENNV
HAVING COUNT(HD.MADH) >= 1
ORDER BY TONG_SOLUONG DESC;
 --2. Huỳnh Như Ngọc - 23721021
--Bài 1. Liệt kê thông tin hóa đơn bao gồm: mã hóa đơn, ngày đặt, tên nhân viên lập hóa đơn, tên khách hàng và tổng tiền.
SELECT  HD.MADH,HD.NGAYDAT,NV.TENNV,KH.TENKH,HD.TONGTIEN
FROM HOA_DON HD
JOIN NHANVIEN NV ON HD.MANV = NV.MANV
JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH;
--Bài 2. Liệt kê tên khách hàng, tên hàng hóa, số lượng và thành tiền từ chi tiết hóa đơn
SELECT KH.TENKH,HH.TENHANG,HD.TONGSL,CTHD.THANHTIEN
FROM CHI_TIET_HOA_DON CTHD
JOIN HOA_DON HD ON CTHD.MADH = HD.MADH
JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH
JOIN HANGHOA HH ON CTHD.MAHANG = HH.MAHANG; 
--Bài 3. Cập nhật địa chỉ của khách hàng có mã 'KH03'
UPDATE KHACHHANG
SET DIACHI = N'25 Nguyễn Văn Cừ, Q.5'
WHERE MAKH = 'KH03';
-- Bài 4. Tăng số lượng hàng trong kho của hàng hóa 'HH01' thêm 5 đơn vị
UPDATE HANGHOA
SET SLKHO = SLKHO + 5
WHERE MAHANG = 'HH01';
--Bài 5. Liệt kê tên hàng hóa có tổng tiền lớn hơn mức trung bình các hóa đơn
SELECT TENHANG
FROM HANGHOA
WHERE MAHANG IN (
    SELECT MAHANG
    FROM CHI_TIET_HOA_DON
    WHERE THANHTIEN > (
        SELECT AVG(TONGTIEN)
        FROM HOA_DON ));
--3. Nguyễn Thị Kiều Trang - 23706501
--Bài 1. Liệt kê mã đơn hàng, tên khách hàng, tổng tiền của các đơn hàng có tổng tiền lớn hơn tổng tiền trung bình của tất cả đơn hàng.
SELECT HD.MADH, KH.TENKH, HD.TONGTIEN
FROM HOA_DON HD
JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH
WHERE HD.TONGTIEN > (
    SELECT AVG(TONGTIEN)
    FROM HOA_DON);
--Bài 2. Liệt kê tên nhân viên, tổng số đơn hàng họ đã lập và tổng tiền họ đã xử lý, chỉ hiển thị những người lập trên 2 hóa đơn.
SELECT NV.TENNV, COUNT(HD.MADH) AS TONG_HOADON, SUM(HD.TONGTIEN) AS TONG_TIEN
FROM NHANVIEN NV
JOIN HOA_DON HD ON NV.MANV = HD.MANV
GROUP BY NV.TENNV
HAVING COUNT(HD.MADH) > 2;
--Bài 3. Tăng 5% tổng tiền cho tất cả hóa đơn được lập bởi nhân viên thuộc đơn vị có tên chứa từ 'Kinh doanh'.
UPDATE HD
SET TONGTIEN = TONGTIEN * 1.05
FROM HOA_DON HD
JOIN NHANVIEN NV ON HD.MANV = NV.MANV
JOIN DONVI DV ON NV.MADV = DV.MADV
WHERE DV.TENDV LIKE N'%Kinh doanh%';
--Bài 4. Liệt kê tên các khách hàng đã từng mua ít nhất 2 đơn hàng có tổng tiền mỗi đơn đều trên 10 triệu.
SELECT KH.TENKH
FROM KHACHHANG KH
JOIN HOA_DON HD ON KH.MAKH = HD.MAKH
WHERE HD.TONGTIEN > 10000000
GROUP BY KH.MAKH, KH.TENKH
HAVING COUNT(HD.MADH) >= 2;
--Bài 5. Xóa các hàng hóa không xuất hiện trong bất kỳ chi tiết hóa đơn nào.
DELETE FROM HANGHOA
WHERE MAHANG NOT IN (
    SELECT DISTINCT MAHANG
    FROM CHI_TIET_HOA_DON);
--4. Mai Thị Diễm My - 23733891
--Bài 1 Câu lệnh UPDATE. Tăng 15% tổng tiền cho các hóa đơn của khách hàng có địa chỉ chứa 'Nguyễn' và được lập bởi nhân viên thuộc đơn vị 'DV03'
UPDATE HD
SET TONGTIEN = TONGTIEN * 1.15
FROM HOA_DON HD
JOIN NHANVIEN NV ON HD.MANV = NV.MANV
JOIN DONVI DV ON NV.MADV = DV.MADV
JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH
WHERE DV.MADV = 'DV03' AND KH.DIACHI LIKE N'%Nguyễn%';
--Bài 2 Câu lệnh GROUP BY. Liệt kê tên đơn vị, số lượng nhân viên và tổng số hóa đơn mà đơn vị đó đã lập, chỉ hiển thị các đơn vị có từ 2 nhân viên trở lên
SELECT DV.TENDV, COUNT(DISTINCT NV.MANV) AS SO_NHANVIEN, COUNT(HD.MADH) AS SO_HOADON
FROM DONVI DV
JOIN NHANVIEN NV ON DV.MADV = NV.MADV
LEFT JOIN HOA_DON HD ON NV.MANV = HD.MANV
GROUP BY DV.TENDV
HAVING COUNT(DISTINCT NV.MANV) >= 2;
 --Bài 3 Câu lệnh GROUP BY.  Liệt kê tên hàng hóa, tổng số lượng bán ra và tổng thành tiền, chỉ hiển thị các mặt hàng có tổng thành tiền trên 10 triệu
SELECT HH.TENHANG,SUM(CTHD.THANHTIEN / CTHD.DONGIA) AS TONG_SOLUONG, SUM(CTHD.THANHTIEN) AS TONG_THANHTIEN
FROM HANGHOA HH
JOIN CHI_TIET_HOA_DON CTHD ON HH.MAHANG = CTHD.MAHANG
GROUP BY HH.TENHANG
HAVING SUM(CTHD.THANHTIEN) > 10000000;
-- Bài 4 Câu lệnh DELETE nâng cao: Xóa các khách hàng chưa từng mua hàng và có địa chỉ không chứa 'Q.1'
DELETE FROM KHACHHANG
WHERE MAKH NOT IN (
SELECT DISTINCT MAKH FROM HOA_DON
) AND DIACHI NOT LIKE N'%Q.1%';
-- Bài 5 Câu lệnh JOIN.  Liệt kê tên nhân viên, tên đơn vị, tên dự án và số lượng hóa đơn mà nhân viên đó đã lập
SELECT NV.TENNV, DV.TENDV, DA.TENDA, COUNT(HD.MADH) AS SO_HOADON
FROM NHANVIEN NV
JOIN DONVI DV ON NV.MADV = DV.MADV
JOIN DUAN DA ON NV.MADA = DA.MADA
LEFT JOIN HOA_DON HD ON NV.MANV = HD.MANV
GROUP BY NV.TENNV, DV.TENDV, DA.TENDA;
--5. Ngô Thị Lan Anh - 23713821
--Bài 1 Liệt kê tên các khách hàng và tổng tiền họ đã chi tiêu, chỉ tính các đơn hàng có từ 2 mặt hàng trở lên, sắp xếp theo tổng tiền giảm dần.
SELECT KH.TENKH, SUM(HD.TONGTIEN) AS TONG_CHI_TIEU
FROM KHACHHANG KH
JOIN HOA_DON HD ON KH.MAKH = HD.MAKH
WHERE HD.MADH IN (
        SELECT MADH
        FROM CHI_TIET_HOA_DON
        GROUP BY MADH
        HAVING COUNT(MAHANG) >= 2
    )
GROUP BY
    KH.TENKH
ORDER BY
    TONG_CHI_TIEU DESC;
--Bài 2 : Tăng 8% tổng tiền của các hóa đơn được lập bởi nhân viên có tên bắt đầu bằng chữ 'T' và thuộc dự án có mã 'DA02'.
UPDATE HD
SET TONGTIEN = TONGTIEN * 1.08
FROM HOA_DON HD
JOIN NHANVIEN NV ON HD.MANV = NV.MANV
WHERE NV.MADA = 'DA02' AND NV.TENNV LIKE N'T%';
--Bài 3 Xóa các khách hàng chưa từng mua hàng và có họ tên không chứa chữ 'Anh' trong tên.
DELETE FROM KHACHHANG
WHERE MAKH NOT IN (
    SELECT DISTINCT MAKH 
FROM HOA_DON
) AND TENKH NOT LIKE N'%Anh%';
--Bài 4. Liệt kê tên nhân viên, tên đơn vị và tổng tiền họ đã xử lý, chỉ hiển thị các trường hợp tổng tiền trên 20 triệu.
SELECT NV.TENNV, DV.TENDV, SUM(HD.TONGTIEN) AS TONG_TIEN
FROM NHANVIEN NV
JOIN DONVI DV ON NV.MADV = DV.MADV
JOIN HOA_DON HD ON NV.MANV = HD.MANV
GROUP BY NV.TENNV, DV.TENDV
HAVING SUM(HD.TONGTIEN) > 20000000;
--Bài 5. Liệt kê tên hàng hóa có tổng số lượng bán ra lớn hơn mức bán trung bình của tất cả các hàng hóa.
SELECT HH.TENHANG
FROM HANGHOA HH
JOIN CHI_TIET_HOA_DON CTHD ON HH.MAHANG = CTHD.MAHANG
GROUP BY HH.TENHANG
HAVING SUM(CTHD.THANHTIEN / CTHD.DONGIA) >
       (SELECT AVG(SLBAN.TONG_SOLUONG)
        FROM (
            SELECT SUM(CT.THANHTIEN / CT.DONGIA) AS TONG_SOLUONG
            FROM CHI_TIET_HOA_DON CT
            GROUP BY CT.MAHANG
        ) SLBAN);







