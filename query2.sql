SELECT 
    c.KodeMk,
    c.NamaMk,
    COUNT(CASE WHEN c.NilaiHuruf IN ('A', 'B') THEN 1 END) AS 'Jumlah mahasiswa yang mendapat nilai A atau B',
    AVG(CASE WHEN s.Umur > 20 AND s.Umur < 22 THEN c.NilaiAngka ELSE NULL END) AS 'Nilai rata-rata pada mahasiswa yang berumur lebih dari 20 dan kurang dari 22'
FROM 
    course_table c
JOIN 
    student_table s ON c.Nim = s.Nim
GROUP BY 
    c.KodeMk, c.NamaMk
HAVING
    COUNT(CASE WHEN c.NilaiHuruf IN ('A', 'B') THEN 1 END) > 0
    OR AVG(CASE WHEN s.Umur > 20 AND s.Umur < 22 THEN c.NilaiAngka ELSE NULL END) IS NOT NULL;
