# FutbolOyuncuArsivi
Futbol Oyuncu Arşivi (VTS_G18)
Proje Açıklaması
Futbol Oyuncu Arşivi (VTS_G18), futbol dünyasındaki oyuncuların, takımların ve maçların verilerini sistematik bir şekilde saklamak, yönetmek ve analiz etmek için tasarlanmış bir veritabanı projesidir. Bu proje, Microsoft SQL Server (MSSQL) üzerinde çalışacak şekilde geliştirilmiştir ve spor verilerinin organizasyonu, takibi ve raporlanması için sağlam bir altyapı sunar. Projenin temel amacı, futbolla ilgili verilerin merkezi bir veritabanında toplanmasını sağlayarak, kullanıcıların oyuncu performanslarını, takım istatistiklerini ve maç sonuçlarını kolayca sorgulayabilmesine olanak tanımaktır.

Proje, özellikle spor kulüpleri, analistler, istatistikçiler veya futbol tutkunları için faydalıdır. Örneğin:
Kulüpler, oyuncuların geçmiş performanslarını analiz edebilir.
Antrenörler, takımların maç sonuçlarına göre strateji geliştirebilir.
Taraftarlar, favori oyuncularının veya takımlarının istatistiklerine erişebilir.

SQL Dosyası Hakkında

Tablolar: Oyuncular, takımlar, maçlar ve diğer ilgili veriler için gerekli tabloların oluşturulması.
Veri Ekleme: Örnek oyuncu, takım ve maç verilerinin eklenmesi.
İlişkiler: Tablolar arasında birincil anahtar (primary key) ve yabancı anahtar (foreign key) ilişkileri.
İndeksler: Performansı artırmak için gerekli indeks tanımları.
Sorgular: Veritabanından bilgi çekmek için örnek T-SQL sorguları.

Kurulum ve Kullanım
Gereksinimler

Microsoft SQL Server 
SQL Server Management Studio (SSMS) veya Azure Data Studio gibi bir istemci.
SQL dosyasını çalıştırabilecek bir kullanıcı hesabı (örneğin, sa veya uygun izinlere sahip bir kullanıcı).

Adımlar


Veritabanı Oluşturun:
SQL Server Management Studio (SSMS) veya Azure Data Studio'yu açın.
Yeni bir veritabanı oluşturun:CREATE DATABASE futbol_arsivi;
GO


Yeni oluşturulan veritabanını seçin:USE futbol_arsivi;
GO


Veritabanını Kullanın:
Veritabanına bağlanarak T-SQL sorguları ile verileri listeleyebilir, güncelleyebilir veya yeni veriler ekleyebilirsiniz.

Tablo Yapısı
SQL dosyasında tanımlı olan ana tablolar:

oyuncular: Oyuncuların adı, soyadı, doğum tarihi, mevki gibi bilgileri içerir.
takımlar: Takımların adı, kuruluş yılı ve diğer bilgileri içerir.
maçlar: Oynanan maçların tarihi, skoru ve ilgili takımları içerir.
ve daha fazlası...

(Detaylı tablo yapısı ve alanlar için create.sql dosyasına bakınız.)
Lisans
Bu proje MIT Lisansı altında lisanslanmıştır. Daha fazla bilgi için LICENSE dosyasına bakınız.
İletişim
Sorularınız veya önerileriniz için SudenazARIKAN , @UmitKaradeniz ve @simalbikem ile iletişime geçebilirsiniz.
