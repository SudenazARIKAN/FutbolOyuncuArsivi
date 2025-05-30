
-- Sorgu 2
SELECT 
    p.AD,
    p.SOYAD,
    (SELECT TOP 1 t.AD 
     FROM SOZLESME s 
     JOIN TAKIM t ON s.TAKIM_ID = t.TAKIM_ID
     WHERE s.PERSONEL_ID = p.PERSONEL_ID
     ORDER BY s.BASLANGIC_TARIHI DESC) AS SON_SOZLESME_TAKIMI,
    (SELECT TOP 1 m.TARIH 
     FROM MAC_OLAYI mo
     JOIN MAC m ON mo.MAC_ID = m.MAC_ID
     WHERE mo.PERSONEL_ID = p.PERSONEL_ID
     ORDER BY m.TARIH DESC) AS SON_MAC_TARIHI
FROM PERSONEL p
WHERE p.PERSONEL_ID IN (
    -- Galatasaray'da (TAKIM_ID = 1) en az 2 kez oynayanlar
    SELECT s1.PERSONEL_ID
    FROM SOZLESME s1
    WHERE s1.TAKIM_ID = 1
    GROUP BY s1.PERSONEL_ID
    HAVING COUNT(*) >= 2
    
    INTERSECT
    
    -- Fenerbah�e'de (TAKIM_ID = 2) en az 3 kez oynayanlar
    SELECT s2.PERSONEL_ID
    FROM SOZLESME s2
    WHERE s2.TAKIM_ID = 2
    GROUP BY s2.PERSONEL_ID
    HAVING COUNT(*) >= 3
)
ORDER BY�p.AD,�p.SOYAD;