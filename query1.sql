SELECT 
    s.Nim,
    s.Nama,
    MAX(k.NilaiAngka) AS 'Nilai tertinggi',
    MIN(k.NilaiAngka) AS 'Nilai terendah',
    AVG(k.NilaiAngka) AS 'Nilai rata-rata',
    COUNT(k.KodeMk) AS 'Jumlah mata kuliah',
    MAX(CASE WHEN k.NilaiAngka = max_nilai.max_val THEN k.NamaMk END) AS 'Mata kuliah dengan nilai tertinggi'
FROM 
    (SELECT Nim, Nama FROM student_table) s
JOIN 
    (SELECT Nim, KodeMk, NamaMk, NilaiAngka FROM course_table) k ON s.Nim = k.Nim
JOIN 
    (SELECT Nim, MAX(NilaiAngka) AS max_val FROM course_table GROUP BY Nim) max_nilai ON k.Nim = max_nilai.Nim AND k.NilaiAngka = max_nilai.max_val
GROUP BY 
    s.Nim, s.Nama;
