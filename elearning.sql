-- Create the database
CREATE DATABASE IF NOT EXISTS elearning;
USE elearning;

-- Create the tables
CREATE TABLE User (
    id_user INT PRIMARY KEY NOT NULL,
    username VARCHAR (255) NOT NULL,
    password VARCHAR (255) NOT NULL
);

CREATE TABLE Kelas (
    id_kelas INT PRIMARY KEY NOT NULL,
    nama_kelas VARCHAR(255),
    id_user INT,
    FOREIGN KEY (id_user) REFERENCES User(id_user)
);

CREATE TABLE ModePembelajaran (
    id_mode_pembelajaran INT PRIMARY KEY,
    nama_mode_pembelajaran VARCHAR(255),
    id_kelas INT,
    FOREIGN KEY (id_kelas) REFERENCES Kelas(id_kelas)
);

CREATE TABLE MataPelajaran (
    id_mata_pelajaran INT PRIMARY KEY,
    nama_mata_pelajaran VARCHAR(255),
    id_mode_pembelajaran INT,
    FOREIGN KEY (id_mode_pembelajaran) REFERENCES ModePembelajaran(id_mode_pembelajaran)
);

CREATE TABLE Bab (
    id_bab INT PRIMARY KEY,
    nama_bab VARCHAR(255),
    id_mata_pelajaran INT,
    thumbnail_bab MEDIUMBLOB DEFAULT NULL,
    label_gratis INT,
    progress_bar INT DEFAULT 0,
    FOREIGN KEY (id_mata_pelajaran) REFERENCES MataPelajaran(id_mata_pelajaran)
);

CREATE TABLE SubBab (
    id_sub_bab INT PRIMARY KEY,
    nama_sub_bab VARCHAR(255),
    id_bab INT,
    Gratis BOOLEAN,
    Progress INT DEFAULT 0,
    thumbnail_sub_bab MEDIUMBLOB DEFAULT NULL,
    FOREIGN KEY (id_bab) REFERENCES Bab(id_bab)
);

CREATE TABLE Material (
    id_material INT PRIMARY KEY,
    nama_material VARCHAR(255),
    tipe_material VARCHAR(50), -- Assuming Video, End Quiz, Single Quiz, Summary
    thumbnail_material MEDIUMBLOB DEFAULT NULL,
    XPReward INT,
    GoldReward INT,
    id_sub_bab INT,
    is_completed BOOLEAN,
    FOREIGN KEY (id_sub_bab) REFERENCES SubBab(id_sub_bab)
);

CREATE TABLE UserProgress (
    id_progression INT PRIMARY KEY,
    id_user INT,
    id_bab INT,
    id_sub_bab INT,
    progress INT DEFAULT 0,
    FOREIGN KEY (id_user) REFERENCES User(id_user),
    FOREIGN KEY (id_bab) REFERENCES Bab(id_bab),
    FOREIGN KEY (id_sub_bab) REFERENCES SubBab(id_sub_bab)
);

INSERT INTO User (id_user, username, password) values 
(1, "user1", "user123"), (2, "user2", "user234"), (3, "user3", "user345");

insert  into Kelas(id_kelas, nama_kelas) values 
(1,"Kelas 1"), (2, "Kelas 2"), (3, "Kelas 3"), (4,"Kelas 4"), (5, "Kelas 5"), (6,"Kelas 6"), (7,"Kelas 7"), (8,"Kelas 8"), (9, "Kelas 9"), (10, "Kelas 10"), (11, "Kelas 11"), (12, "Kelas 12"), (13, "Kelas 10 SMK"), (14, "Kelas 11 SMK"), (15,"Kelas 12 SMK"), (16,"UTBK & Ujian Mandiri"), (17,"Pelatihan Guru");

insert  into ModePembelajaran(id_mode_pembelajaran, nama_mode_pembelajaran) values 
(1,"Pembelajaran Tematik"), (2, "Pembelajaran Menurut Topik"), (3,"Kurikulum Merdeka");

insert  into MataPelajaran(id_mata_pelajaran, nama_mata_pelajaran) values 
(1, "Matematika"), (2, "Bahasa Indonesia"), (3, "IPA Terpadu"), (4, "Pendidikan Karakter"), (5, "Ruang Ngaji");

insert  into Bab(id_bab, nama_bab) values 
(1, "Bilangan 0-10"), (2, "Bilangan 11-20"), (3, "Bilangan 21-30"),  (4, "Bilangan 31-40"), (5, "Bilangan 41-50"), (6, "Aplikasi Bilangan 0-10"), (7, "Aplikasi Bilangan 11-20"), (8, "Aplikasi Bilangan 21-30"), (9, "Aplikasi Bilangan 31-40"), (10, "Aplikasi Bilangan 41-50");

insert  into SubBab(id_sub_bab, nama_sub_bab) values
(1, "Mengenal Bilangan 1-10 (1)"), (2, "Mengenal Bilangan 1-10 (2)"), (3, "Bermain Dengan Bilangan 1-10"), (4, "Lebih Besar? Lebih Kecil? 1-10");

insert into Material(id_material, nama_material, tipe_material) value
(1, "Video Mengenal Bilangan 1-10 (1)", "Video"), (2, "Video Mengenal Bilangan 1-10 (2)", "Video"), (3, "Video Bermain Dengan Bilangan 1-10", "Video"), (4, "Prinsip Dasar Intruksi Matematika", "Video");

