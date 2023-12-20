SELECT Kelas.NamaKelas, ModePembelajaran.NamaMode
FROM Kelas
INNER JOIN ModePembelajaran ON Kelas.KelasID = ModePembelajaran.KelasID;


SELECT MataPelajaran.NamaMataPelajaran
FROM MataPelajaran
INNER JOIN ModePembelajaran ON MataPelajaran.ModeID = ModePembelajaran.ModeID
WHERE ModePembelajaran.NamaMode = 'NamaModeTerpilih';

SELECT Bab.NamaBab, Bab.LabelGratis , COUNT(SubBab.SubBabID) AS JumlahSubBab
FROM Bab
LEFT JOIN SubBab ON Bab.BabID = SubBab.BabID
GROUP BY Bab.BabID;

SELECT SubBab.NamaSubBab, SubBab.Gratis, SubBab.Progress
FROM SubBab
WHERE SubBab.BabID = 'BabIDTerpilih';

ALTER TABLE Material 
ADD COLUMN Completed BOOLEAN;

SELECT Material.NamaMaterial, Material.Completed
FROM Material
INNER JOIN SubBab ON Material.SubBabID = SubBab.SubBabID
WHERE SubBab.SubBabID = 'SubBabIDTerpilih';