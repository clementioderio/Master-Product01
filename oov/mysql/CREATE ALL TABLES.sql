CREATE TABLE WEEK(
	ID_Week bigint PRIMARY KEY AUTO_INCREMENT,
	No_Week int
);

CREATE TABLE KEGIATAN(
	ID_Kegiatan bigint PRIMARY KEY AUTO_INCREMENT,
	Nama_Kegiatan varchar(255)
);

CREATE TABLE PEKERJAAN(
	ID_Pekerjaan bigint PRIMARY KEY AUTO_INCREMENT,
	Nama_Pekerjaan varchar(255)
);

CREATE TABLE LOKASI(
	ID_Lokasi bigint PRIMARY KEY AUTO_INCREMENT,
	Nama_Lokasi varchar(255)
);

CREATE TABLE KONTRAK_SPK(
	ID_KontrakSPK bigint PRIMARY KEY AUTO_INCREMENT,
	No_KontrakSPK varchar(255)
);

CREATE TABLE ITEM(
	ID_Item bigint PRIMARY KEY AUTO_INCREMENT,
	Nama_Item varchar(255)
);

CREATE TABLE KATEGORI(
	ID_Kategori bigint PRIMARY KEY AUTO_INCREMENT,
	Nama_Kategori varchar(255)
);

CREATE TABLE SATUAN(
	ID_Satuan bigint PRIMARY KEY AUTO_INCREMENT,
	Nama_Satuan varchar(255)
);

CREATE TABLE KONTRAKTOR(
	ID_Kontraktor bigint PRIMARY KEY AUTO_INCREMENT,
	Nama_Kontraktor varchar(255),
	Alamat_Kontraktor varchar(500),
	Kontak_Kontraktor varchar(255),
	Website_Kontraktor varchar(255),
	Email_Kontraktor varchar(255)
);

CREATE TABLE USER_KONTRAKTOR(
	ID_UserKontraktor bigint PRIMARY KEY AUTO_INCREMENT,
	FirstName_UserKontraktor varchar(255),
	LastName_UserKontraktor varchar(255),
	NoHP_UserKontraktor varchar(255),
	Email_UserKontraktor varchar(255)
);

CREATE TABLE INSTITUSI_PROJECT(
	ID_InstitusiProject bigint PRIMARY KEY AUTO_INCREMENT,
	Nama_InstitusiProject varchar(255),
	Alamat_InstitusiProject varchar(500),
	Kontak_InstitusiProject varchar(255),
	Website_InstitusiProject varchar(255),
	Email_InstitusiProject varchar(255)
);

CREATE TABLE USER_PROJECT(
	ID_UserProject bigint PRIMARY KEY AUTO_INCREMENT,
	Nama_UserProject varchar(255),
	Alamat_UserProject varchar(500),
	Kontak_UserProject varchar(255),
	Website_UserProject varchar(255),
	Email_UserProject varchar(255)
);

------------------------------------------------------------

CREATE TABLE LINK_KATEGORI(
    ID_LinkKategori bigint PRIMARY KEY AUTO_INCREMENT,
    No_LinkKategori int,
    Volume_LinkKategori decimal(18,2),
    Bobot_LinkKategori decimal(18,2),
    HargaSatuan_LinkKategori decimal(18,2),
	ID_Item bigint,
	ID_Kategori bigint,
	ID_Satuan bigint,
    FOREIGN KEY (ID_Item) REFERENCES ITEM(ID_Item),
    FOREIGN KEY (ID_Kategori) REFERENCES KATEGORI(ID_Kategori),
    FOREIGN KEY (ID_Satuan) REFERENCES SATUAN(ID_Satuan)
);

CREATE TABLE LINK_USER_KONTRAKTOR(
    ID_LinkUserKontraktor bigint PRIMARY KEY AUTO_INCREMENT,
    NIP_LinkUserKontraktor varchar(255),
    Position_LinkUserKontraktor varchar(255),
	ID_Kontraktor bigint,
	ID_UserKontraktor bigint,
    FOREIGN KEY (ID_Kontraktor) REFERENCES KONTRAKTOR(ID_Kontraktor),
    FOREIGN KEY (ID_UserKontraktor) REFERENCES USER_KONTRAKTOR(ID_UserKontraktor)
);

CREATE TABLE PROJECT(
    ID_Project bigint PRIMARY KEY AUTO_INCREMENT,
    Nama_Project varchar(255),
	ID_Kegiatan bigint,
	ID_Pekerjaan bigint,
	ID_Lokasi bigint,
	ID_KontrakSPK bigint,
	ID_LinkUserKontraktor bigint,
    FOREIGN KEY (ID_Kegiatan) REFERENCES KEGIATAN(ID_Kegiatan),
    FOREIGN KEY (ID_Pekerjaan) REFERENCES PEKERJAAN(ID_Pekerjaan),
    FOREIGN KEY (ID_Lokasi) REFERENCES LOKASI(ID_Lokasi),
    FOREIGN KEY (ID_KontrakSPK) REFERENCES KONTRAK_SPK(ID_KontrakSPK),
    FOREIGN KEY (ID_LinkUserKontraktor) REFERENCES LINK_USER_KONTRAKTOR(ID_LinkUserKontraktor)
);

CREATE TABLE RAB(
    ID_RAB bigint PRIMARY KEY AUTO_INCREMENT,
    Nama_RAB varchar(255),
	ID_Project bigint,
	ID_LinkKategori bigint,
    FOREIGN KEY (ID_Project) REFERENCES PROJECT(ID_Project),
    FOREIGN KEY (ID_LinkKategori) REFERENCES LinkKategori(ID_LinkKategori)
);

CREATE TABLE LINK_USER_PROJECT(
    ID_LinkUserProject bigint PRIMARY KEY AUTO_INCREMENT,
    NIP_LinkUserProject varchar(255),
    Position_LinkUserProject varchar(255),
	ID_Project bigint,
	ID_UserProject bigint,
	ID_InstitusiProject bigint,
    FOREIGN KEY (ID_Project) REFERENCES PROJECT(ID_Project),
    FOREIGN KEY (ID_UserProject) REFERENCES USER_PROJECT(ID_UserProject),
    FOREIGN KEY (ID_InstitusiProject) REFERENCES INSTITUSI_PROJECT(ID_InstitusiProject)
);

CREATE TABLE LAPORAN_MINGGUAN(
    ID_LaporanMingguan bigint PRIMARY KEY AUTO_INCREMENT,
    Nama_LaporanMingguan varchar(255),
    Volume_LinkWeek varchar(255),
    Bobot_LinkWeek varchar(255),
    Prestasi_LinkWeek varchar(255),
	ID_RAB bigint,
	ID_LinkKategori bigint,
	ID_Week bigint,
    FOREIGN KEY (ID_RAB) REFERENCES RAB(ID_RAB),
    FOREIGN KEY (ID_LinkKategori) REFERENCES LINK_KATEGORI(ID_LinkKategori),
    FOREIGN KEY (ID_Week) REFERENCES WEEK(ID_Week)
);