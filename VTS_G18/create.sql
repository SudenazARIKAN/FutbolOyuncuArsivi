CREATE DATABASE FutbolOyuncuArsivi;
GO

USE FutbolOyuncuArsivi;
GO

CREATE TABLE KULLANICI(
KULLANICI_ID INT PRIMARY KEY IDENTITY(1,1),
TCKIMLIKNO VARCHAR(11) UNIQUE CHECK(TCKIMLIKNO LIKE '[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
AD VARCHAR(50) NOT NULL,
SOYAD VARCHAR(50) NOT NULL,
KULLANICI_SIFRESI VARCHAR(255) NOT NULL,
CINSIYET BIT NOT NULL ,
DOGUM_TARIHI DATE NOT NULL,
EPOSTA  VARCHAR(100)
	CONSTRAINT unqEPOSTA UNIQUE
    CONSTRAINT notNullEPOSTA NOT NULL
	CONSTRAINT chkEPOSTA CHECK(EPOSTA LIKE '%@%.com' ) ,
TELEFON VARCHAR(11) NOT NULL,
YAS AS DATEDIFF(YEAR,DOGUM_TARIHI,GETDATE())
);
GO

CREATE TABLE TAKIM (
TAKIM_ID INT PRIMARY KEY IDENTITY(1,1),
AD VARCHAR(100) NOT NULL,
KURULUS_TARIHI DATE,
ACIKLAMA TEXT
);
GO


CREATE TABLE POZISYON (
POZISYON_ID INT PRIMARY KEY IDENTITY (1,1),
AD VARCHAR(50) NOT NULL
);
GO


CREATE TABLE PERSONEL (
PERSONEL_ID INT PRIMARY KEY IDENTITY(1,1) ,
TCKIMLIKNO VARCHAR(11) NOT NULL UNIQUE CHECK(TCKIMLIKNO LIKE '[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
AD VARCHAR(50) NOT NULL,
SOYAD VARCHAR(50) NOT NULL,
EPOSTA VARCHAR(100),
TELEFON VARCHAR(11),
CINSIYET BIT NOT NULL,
TAKIM_ID INT FOREIGN KEY REFERENCES TAKIM(TAKIM_ID),
POZISYON_ID INT FOREIGN KEY REFERENCES POZISYON(POZISYON_ID)

 );
GO

CREATE TABLE SOZLESME(
SOZLESME_ID INT PRIMARY KEY IDENTITY(1,1),
BASLANGIC_TARIHI DATE,
BITIS_TARIHI DATE,
AYLIK_UCRET DECIMAL(10,2),
PERSONEL_ID INT FOREIGN KEY REFERENCES PERSONEL(PERSONEL_ID),
TAKIM_ID INT FOREIGN KEY REFERENCES TAKIM(TAKIM_ID),
POZISYON_ID INT FOREIGN KEY  REFERENCES POZISYON(POZISYON_ID)
);
GO



	CREATE TABLE SAMPIYONA (
    SAMPIYONA_ID INT PRIMARY KEY IDENTITY(1,1),
	AD VARCHAR(50),
	BITIS_TARIHI DATE,
	BASLANGIC_TARIHI DATE,
	TAKIM_ID INT FOREIGN KEY REFERENCES TAKIM(TAKIM_ID)
	);
	GO

	

	

	CREATE TABLE OLAY_TURU (
    OLAY_TURU_ID INT PRIMARY KEY IDENTITY(1,1),
    AD VARCHAR(50)
	);
	GO

	

	CREATE TABLE LISANS_DERECESI(
	LISANS_DERECESI_ID INT PRIMARY KEY IDENTITY(1,1),
	AD VARCHAR(50)

	);
	GO


	CREATE TABLE HAKEM_POZISYONU(
	HAKEM_POZISYON_ID INT PRIMARY KEY IDENTITY(1,1),
	AD VARCHAR(50)
	);
	GO

	CREATE TABLE HAKEM (
	HAKEM_ID INT PRIMARY KEY IDENTITY(1,1),
	AD VARCHAR(50),
	SOYAD VARCHAR(50),
	HAKEM_POZISYON_ID INT FOREIGN KEY REFERENCES HAKEM_POZISYONU(HAKEM_POZISYON_ID),
	LISANS_DERECESI_ID INT FOREIGN KEY REFERENCES LISANS_DERECESI(LISANS_DERECESI_ID) 
	);
	GO

	CREATE TABLE ULKE (
	ULKE_ID INT PRIMARY KEY IDENTITY(1,1),
	AD VARCHAR(50),
	KISA_AD VARCHAR(10)
	);
	GO

	CREATE TABLE IL (
	IL_ID INT PRIMARY KEY IDENTITY(1,1),
	AD VARCHAR (20) NOT NULL UNIQUE,
	ULKE_ID INT FOREIGN KEY REFERENCES ULKE(ULKE_ID)
);
GO

CREATE TABLE ILCE (
	ILCE_ID INT PRIMARY KEY IDENTITY(1,1),
	AD VARCHAR(20) NOT NULL,
	IL_ID INT FOREIGN KEY REFERENCES IL(IL_ID)
);
GO

CREATE TABLE MAHALLE (
	MAHALLE_ID INT PRIMARY KEY IDENTITY(1,1),
	AD VARCHAR(20) NOT NULL,
	ILCE_ID INT FOREIGN KEY REFERENCES ILCE(ILCE_ID)

);
GO

CREATE TABLE CADDE_SOKAK (
	CADDE_SOKAK_ID INT PRIMARY KEY IDENTITY(1,1),
	AD VARCHAR(20) NOT NULL,
	MAHALLE_ID INT FOREIGN KEY REFERENCES  MAHALLE(MAHALLE_ID)
);
GO


	CREATE TABLE ADRES (
	ADRES_ID INT PRIMARY KEY IDENTITY(1,1),
	POSTA_KODU INT NOT NULL,
	ULKE_ID INT FOREIGN KEY REFERENCES  ULKE(ULKE_ID),
	IL_ID INT FOREIGN KEY REFERENCES  IL(IL_ID),
	ILCE_ID INT FOREIGN KEY REFERENCES  ILCE(ILCE_ID),
	MAHALLE_ID INT FOREIGN KEY REFERENCES  MAHALLE(MAHALLE_ID),
	CADDE_SOKAK_ID INT FOREIGN KEY REFERENCES  CADDE_SOKAK(CADDE_SOKAK_ID)
	);
	GO
	
	CREATE TABLE STADYUM (
    STADYUM_ID INT PRIMARY KEY IDENTITY(1,1),
	AD VARCHAR(100),
	ADRES_ID INT UNIQUE FOREIGN KEY REFERENCES ADRES(ADRES_ID),
	KAPASITE INT,
	TAKIM_ID INT FOREIGN KEY REFERENCES TAKIM(TAKIM_ID) 

	);
	GO

	CREATE TABLE MAC(
	MAC_ID INT PRIMARY KEY IDENTITY(1,1),
	TARIH DATE,
	SAAT TIME,
	HAFTA INT,
	EVSAHIBIGOL INT,
	EVSAHIBIPUAN INT,
	MISAFIRPUAN INT,
	EV_SAHIBI_TAKIM_ID INT FOREIGN KEY REFERENCES TAKIM(TAKIM_ID),
    MISAFIR_TAKIM_ID INT FOREIGN KEY REFERENCES TAKIM(TAKIM_ID),
    STADYUM_ID INT FOREIGN KEY REFERENCES STADYUM(STADYUM_ID),
	SAMPIYONA_ID INT FOREIGN KEY REFERENCES SAMPIYONA(SAMPIYONA_ID)
	);
	GO

	CREATE TABLE MAC_OLAYI (
    MAC_OLAYI_ID INT PRIMARY KEY IDENTITY(1,1),
    DAKIKA INT,
	PERSONEL_ID INT FOREIGN KEY REFERENCES PERSONEL(PERSONEL_ID),
    MAC_ID INT FOREIGN KEY REFERENCES MAC(MAC_ID),
	OLAY_TURU_ID INT FOREIGN KEY REFERENCES OLAY_TURU(OLAY_TURU_ID),
	BIRINCIL_OYUNCU_ID INT FOREIGN KEY REFERENCES PERSONEL(PERSONEL_ID),
  	IKINCIL_OYUNCU_ID INT NULL FOREIGN KEY REFERENCES PERSONEL(PERSONEL_ID) 
	);
	GO

	CREATE TABLE SAMPIYONA_KATILIR_TAKIM(
	PUAN INT,
	MAGLUBIYET INT,
	BERABERLIK INT,
	ATILAN_GOL INT,
	GALIBIYET INT,
	YENILEN_GOL INT,
	AVERAJ AS (ATILAN_GOL - YENILEN_GOL) ,
	TAKIM_ID INT FOREIGN KEY REFERENCES TAKIM(TAKIM_ID),
	SAMPIYONA_ID INT FOREIGN KEY REFERENCES SAMPIYONA(SAMPIYONA_ID)
	);
	GO

	CREATE TABLE KULLANICI_TAKIMI_TAKIPEDER(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	TAKIM_ID INT FOREIGN KEY REFERENCES TAKIM(TAKIM_ID),
	KULLANICI_ID INT FOREIGN KEY REFERENCES KULLANICI(KULLANICI_ID)
	);
	GO

	CREATE TABLE KULLANICI_PERSONELI_TAKIPEDER(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	KULLANICI_ID INT FOREIGN KEY REFERENCES KULLANICI(KULLANICI_ID),
	PERSONEL_ID INT FOREIGN KEY REFERENCES PERSONEL(PERSONEL_ID)
	);
	GO

	CREATE TABLE KULLANICI_MACI_TAKIPEDER(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	KULLANICI_ID INT FOREIGN KEY REFERENCES KULLANICI(KULLANICI_ID),
	MAC_ID INT FOREIGN KEY REFERENCES MAC(MAC_ID)
	);
	GO

	CREATE TABLE HAKEM_MACI_YONETIR(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	HAKEM_ID INT FOREIGN KEY REFERENCES HAKEM(HAKEM_ID),
	MAC_ID INT FOREIGN KEY REFERENCES MAC(MAC_ID)
	);
	GO

	CREATE TABLE TAKIM_MACI_OYNAR(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	TAKIM_ID INT FOREIGN KEY REFERENCES TAKIM(TAKIM_ID),
	MAC_ID INT FOREIGN KEY REFERENCES MAC(MAC_ID)
	);
	GO
