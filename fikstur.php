<?php
include 'takimlar.php';
include 'database.php';
include 'session.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<script>
    // Sıralama durumunu takip eden bir değişken tanımlandı
    let isSorted = false;

    // Tabloyu sıralamak için kullanılan işlev
    function sortTable() {
        var table, rows, switching, i, x, y, shouldSwitch;

        // Tabloyu al
        table = document.getElementsByTagName("table")[0];

        // Sıralama işlemi için bir döngü başlat
        switching = true;
        while (switching) {
            switching = false;

            // Tablo satırlarını al
            rows = table.rows;

            // Satırları karşılaştırmak için bir döngü başlat
            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;

                // Karşılaştırılacak iki hücreyi seç (Ev Sahibi Takım sütunu)
                x = rows[i].getElementsByTagName("TD")[0];
                y = rows[i + 1].getElementsByTagName("TD")[0];

                // Sıralama durumuna bağlı olarak karşılaştırma yap
                if (!isSorted) {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                } else {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                }
            }

            // Satırları yer değiştirmek gerekiyorsa, yer değiştir
            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
            }
        }

        // Sıralama durumunu tersine çevir
        isSorted = !isSorted;
    }
</script>

</body>
</html>
<?php
function fiksturleriGosterKulüp($conn, $donem, $kullaniciID) {
    $sql = "SELECT FiksturID, EvSahibiTakimID, DeplasmanTakimID, Tarih, Saat, KazanmaOlasiligi, Skor FROM Fikstur 
            WHERE Tarih >= ? AND Tarih <= ? 
            AND (EvSahibiTakimID IN (SELECT TakimID FROM Takimlar WHERE KulupBaskaniID = ?) 
            OR DeplasmanTakimID IN (SELECT TakimID FROM Takimlar WHERE KulupBaskaniID = ?))";

    $sql .= " ORDER BY Tarih";

    $stmt = $conn->prepare($sql);

    $baslangicTarihi = $donem == "2021/2022" ? "2021-08-01" : ($donem == "2022/2023" ? "2022-08-01" : "2023-08-01");
    $bitisTarihi = $donem == "2021/2022" ? "2022-05-31" : ($donem == "2022/2023" ? "2023-05-31" : "2024-05-31");

    $stmt->bind_param("ssii", $baslangicTarihi, $bitisTarihi, $kullaniciID, $kullaniciID);
    $stmt->execute();
    $result = $stmt->get_result();

    echo "<h2>Fikstürler</h2>";
    echo "<table border='1'>";
    echo "<tr><th>Ev Sahibi Takim</th><th>Deplasman Takim</th><th>Tarih</th><th>Saat</th><th>Kazanma Olasılığı</th><th>Skor</th></tr>";
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $kazanmaOlasiligiA = $row["KazanmaOlasiligi"] * 100;
            $kazanmaOlasiligiB = (1 - $row["KazanmaOlasiligi"]) * 100;
            $kazanmaOlasiligiMetni = number_format($kazanmaOlasiligiA, 2) . "% - " . number_format($kazanmaOlasiligiB, 2) . "%";

            $skor = $row["Skor"] ?: "- : -"; // Skor bilgisi boşsa "- : -" olarak görüntüle
            echo "<tr><td>" . getTakimAdi($conn, $row["EvSahibiTakimID"]) . "</td><td>" . getTakimAdi($conn, $row["DeplasmanTakimID"]) . "</td><td>" . $row["Tarih"] . "</td><td>" . $row["Saat"] . "</td><td>" . $kazanmaOlasiligiMetni . "</td><td>" . $skor . "</td></tr>";
        }
    }
    echo "</table>";
}
function puanDurumunuGoster($conn, $donem) {
    $takimlar = array(); 

    $sql = "SELECT FiksturID, EvSahibiTakimID, DeplasmanTakimID, Skor FROM Fikstur";
    if ($donem != "TumDönemler") {
        $baslangicTarihi = $donem == "2021/2022" ? "2021-08-01" : ($donem == "2022/2023" ? "2022-08-01" : "2023-08-01");
        $bitisTarihi = $donem == "2021/2022" ? "2022-05-31" : ($donem == "2022/2023" ? "2023-05-31" : "2024-05-31");
        $sql .= " WHERE Tarih BETWEEN '$baslangicTarihi' AND '$bitisTarihi'";
    }

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $evSahibiTakimID = $row["EvSahibiTakimID"];
            $deplasmanTakimID = $row["DeplasmanTakimID"];
            $skor = $row["Skor"];

            if (!isset($takimlar[$evSahibiTakimID])) {
                $takimlar[$evSahibiTakimID] = 0;
            }
            if (!isset($takimlar[$deplasmanTakimID])) {
                $takimlar[$deplasmanTakimID] = 0;
            }

            if ($skor != null) {
                $skorArray = explode(":", $skor);
                $evSahibiSkor = intval($skorArray[0]);
                $deplasmanSkor = intval($skorArray[1]);

                if ($evSahibiSkor > $deplasmanSkor) {
                    $takimlar[$evSahibiTakimID] += 3; 
                } elseif ($evSahibiSkor == $deplasmanSkor) {
                    $takimlar[$evSahibiTakimID] += 1; 
                    $takimlar[$deplasmanTakimID] += 1;
                } else {
                    $takimlar[$deplasmanTakimID] += 3; 
                }
            }
        }
    }

    arsort($takimlar);

    echo "<h2>Puan Durumu</h2>";
    echo "<table border='1'>";
    echo "<tr><th>Takım</th><th>Puan</th></tr>";
    foreach ($takimlar as $takimID => $puan) {
        $takimAdi = getTakimAdi($conn, $takimID);
        echo "<tr><td>$takimAdi</td><td>$puan</td></tr>";
    }
    echo "</table>";
}
function fiksturOlustur($conn, $donem) {
    // Daha önce fikstür oluşturulup oluşturulmadığını kontrol et
    $checkQuery = "SELECT FiksturOlusturuldu FROM FiksturDurumu WHERE Donem = ?";
    $stmt = $conn->prepare($checkQuery);
    $stmt->bind_param("s", $donem);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if ($row['FiksturOlusturuldu']) {
            // Fikstür zaten oluşturulmuşsa işlemi sonlandır
            return;
        }
    }
    $takimlar = array();
    $result = $conn->query("SELECT TakimID FROM Takimlar");
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $takimlar[] = $row["TakimID"];
        }
    }
    
    if ($donem == "2021/2022") {
        $baslangicTarihi = "2021-08-01";
        $bitisTarihi = "2022-05-31";
    }
    else if ($donem == "2022/2023") {
        $baslangicTarihi = "2022-05-01";
        $bitisTarihi = "2023-08-31";
    } elseif ($donem == "2023/2024") {
        $baslangicTarihi = "2023-08-01";
        $bitisTarihi = "2024-05-31";
    }

    print "<p>" . count($takimlar) . " takım için fikstür oluşturuldu.</p>";

    // "Cylic" algoritmayı kullanarak fikstürleri oluşturdum.
    $toplamHafta = count($takimlar) - 1;
    $haftaBasinaMac = count($takimlar) / 2;

    // İlk yarıyı veritabanına kaydetme işlemi..
    for ($round = 0; $round < $toplamHafta; $round++) {
        for ($match = 0; $match < $haftaBasinaMac; $match++) {
            // Ev sahibi ve deplasman takımlarını belirlemek için cyclic algoritma kullanılıyor.
            $home = ($round + $match) % ($toplamHafta);
            $away = ($toplamHafta - $match + $round) % ($toplamHafta);
            // Son takım aynı yerde sabit kalırken diğerlerini onun etrafında döndürdüm.
            if ($match == 0) {
                $away = $toplamHafta;
            }
            
            // Rastgele bir tarih ve saat seçilir.
            $tarih = rand(strtotime($baslangicTarihi), strtotime($bitisTarihi));
            $tarih = date("Y-m-d", $tarih);
            $saatDakika = rand(0, 3) * 15;
            $saat = date("H:i", rand(strtotime("16:00:00"), strtotime("23:00:00")) + $saatDakika * 60);

            // Kazanma olasılığı rastgele bir değere atanır.
            $kazanmaOlasiligi = rand(1, 100) / 100;
            
            // SQL sorgusu oluşturulur ve veritabanına eklenir.
            $stmt = $conn->prepare("INSERT INTO Fikstur (EvSahibiTakimID, DeplasmanTakimID, Tarih, Saat, KazanmaOlasiligi, Donem, Hafta, Yari) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            $yari = 1; // 1. Yarı için değeri burada ayarladım
            $hafta = $round + 1;
            $stmt->bind_param("iisssdii", $takimlar[$home], $takimlar[$away], $tarih, $saat, $kazanmaOlasiligi, $donem, $hafta, $yari);
            $stmt->execute();
        }
    }

    // İkinci yarıyı veritabanına kaydetme işlemi..
    for ($round = 0; $round < $toplamHafta; $round++) {
        for ($match = 0; $match < $haftaBasinaMac; $match++) {
            // Ev sahibi ve deplasman takımlarını belirlemek için cyclic algoritma kullanılıyor.
            $home = ($round + $match) % ($toplamHafta);
            $away = ($toplamHafta - $match + $round) % ($toplamHafta);
            if ($match == 0) {
                $away = $toplamHafta;
            }
            
            // Rastgele bir tarih ve saat seçilir.
            $tarih = rand(strtotime($baslangicTarihi), strtotime($bitisTarihi));
            $tarih = date("Y-m-d", $tarih);
            $saatDakika = rand(0, 3) * 15;
            $saat = date("H:i", rand(strtotime("16:00:00"), strtotime("23:00:00")) + $saatDakika * 60);
            
            // Kazanma olasılığı rastgele bir değere atanır.
            $kazanmaOlasiligi = rand(1, 100) / 100;
            $hafta = $toplamHafta + $round + 1;
            
            // SQL sorgusu oluşturulur ve veritabanına eklenir.
            $stmt = $conn->prepare("INSERT INTO Fikstur (EvSahibiTakimID, DeplasmanTakimID, Tarih, Saat, KazanmaOlasiligi, Donem, Hafta, Yari) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            $yari = 2; // 2. Yarı için değeri burada ayarlandı
            $stmt->bind_param("iisssdii", $takimlar[$away], $takimlar[$home], $tarih, $saat, $kazanmaOlasiligi, $donem, $hafta, $yari);
            $stmt->execute();
        }
    }

    // Fikstür oluşturulduğunu kaydet
    $updateQuery = "INSERT INTO FiksturDurumu (Donem, FiksturOlusturuldu) VALUES (?, ?) ON DUPLICATE KEY UPDATE FiksturOlusturuldu = VALUES(FiksturOlusturuldu)";
    $stmt = $conn->prepare($updateQuery);
    $status = 1; // 1, yani fikstür oluşturuldu
    $stmt->bind_param("si", $donem, $status);
    $stmt->execute();
}  

    function fiksturleriGoster($conn, $donem) {
    $sql = "SELECT FiksturID, EvSahibiTakimID, DeplasmanTakimID, Tarih, Saat, KazanmaOlasiligi, Skor, Hafta FROM Fikstur";
    if ($donem != "TumDönemler") {
        $baslangicTarihi = $donem == "2021/2022" ? "2021-08-01" : ($donem == "2022/2023" ? "2022-08-01" : "2023-08-01");
        $bitisTarihi = $donem == "2021/2022" ? "2022-05-31" : ($donem == "2022/2023" ? "2023-05-31" : "2024-05-31");
        $sql .= " WHERE Tarih BETWEEN '$baslangicTarihi' AND '$bitisTarihi'";
    }

    $sql .= " ORDER BY Tarih";

    $result = $conn->query($sql);

    echo "<table border='1'>";
    echo "<tr><th><a href='#' onclick='sortTable()'>Ev Sahibi Takim</a></th><th><a href='#' onclick='sortTable()'>Deplasman Takim</a></th><th>Tarih</th><th>Saat</th><th>Kazanma Olasılığı</th><th>Skor</th><th>Hafta</th></tr>";
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $evSahibiTakim = getTakimAdi($conn, $row["EvSahibiTakimID"]);
            $deplasmanTakim = getTakimAdi($conn, $row["DeplasmanTakimID"]);
            $kazanmaOlasiligiA = $row["KazanmaOlasiligi"] * 100; // A takımının kazanma olasılığı
            $kazanmaOlasiligiB = (1 - $row["KazanmaOlasiligi"]) * 100; // B takımının kazanma olasılığı

            $kazanmaOlasiligiMetni = number_format($kazanmaOlasiligiA, 2) . "% - " . number_format($kazanmaOlasiligiB, 2) . "%";

             $hafta = $row["Hafta"]; // Hafta sütunu
            
            $skor = $row["Skor"];
            if (empty($skor)) {
                $now = date("Y-m-d H:i");
                $matchDateTime = $row["Tarih"] . " " . $row["Saat"];
                if ($matchDateTime > $now) {
                    $skor = "- : -";
                } else {
                    $randomAScore = rand(0, 6);
                    $randomBScore = rand(0, 6);
                    $skor = "$randomAScore : $randomBScore";

                    // Skoru güncelle
                    $updateScoreQuery = "UPDATE Fikstur SET Skor = ? WHERE FiksturID = ?";
                    $stmt = $conn->prepare($updateScoreQuery);
                    $stmt->bind_param("si", $skor, $row["FiksturID"]);
                    $stmt->execute();
                }
            }

            echo "<tr><td>$evSahibiTakim</td><td>$deplasmanTakim</td><td>{$row["Tarih"]}</td><td>{$row["Saat"]}</td><td>$kazanmaOlasiligiMetni</td><td>$skor</td><td>$hafta</td></tr>";
        }
    }
    echo "</table>";
}

function getTakimAdi($conn, $takimID) {
    $result = $conn->query("SELECT TakimAdi FROM Takimlar WHERE TakimID = $takimID");
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        return $row["TakimAdi"];
    }
    return "";
}
?>