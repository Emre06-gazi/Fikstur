<?php
include 'database.php';
include 'fikstur.php';

// ComboBox'ın seçili öğesi değiştirildiğinde çalışacak işlev
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $selectedSeason = $_POST['donem'];
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Kulüp Başkanı Sayfası</title>
    <link rel="stylesheet" type="text/css" href="kulüpbaskani.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <header>
        <div class="logout-button">
            <form action="login.html">
                <button type="submit" class="logout-button"><i class="fas fa-arrow-left"></i>Çıkış Yap</button>
            </form>
        </div>
        <h1>TFF Başkanı Sayfası</h1>
    </header>
    <div class="container">
        <form method="post">
            <select name="donem">
                <option value="2021/2022">2021/2022</option>
                <option value="2022/2023">2022/2023</option>
                <option value="2023/2024">2023/2024</option>
            </select>
            <input type="submit" value="Göster">
        </form>

        <?php
        if (isset($selectedSeason)) {
            if ($selectedSeason != "TumDönemler") {
                echo '<div class="info-text">' . $selectedSeason . " dönemine ait karşılaşmaları ve puan durumlarını aşağıdaki tablodan bulabilirsiniz!" . '</div>';
                fiksturleriGosterKulüp($conn, $selectedSeason, $_SESSION['kullanici_id']);
                puanDurumunuGoster($conn, $selectedSeason);
            }
        }
        ?>
    </div>
</body>
</html>



