
<?php
include 'database.php';
include 'fikstur.php';
?>
<!DOCTYPE html>
<html>
<head>
    <title>TFF Başkanı Sayfası</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="kulüpbaskani.css">

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
                <option value="TumDönemler">Tüm Dönemler</option>
                <option value="2021/2022">2021/2022</option>
                <option value="2022/2023">2022/2023</option>
                <option value="2023/2024">2023/2024</option>
            </select>
            <input type="submit" value="Göster">
        </form>
        
        <?php
        if (isset($_POST["donem"])) {
            $donem = $_POST["donem"];
            if ($donem != "TumDönemler") {
                echo '<div class="info-text">' . $donem . " dönemine ait karşılaşmaları ve puan durumlarını aşağıdaki tablodan bulabilirsiniz!" . '</div>';
                    fiksturOlustur($conn, $donem);
            }
            fiksturleriGoster($conn, $donem);
            puanDurumunuGoster($conn, $donem);

        }
        ?>
        <br></br>
        <h2>Takım Ekle</h2>
        <form action="takim_ekle.php" method="post" class="team-form">
            <div class="form-group">
                <label for="takim_adi">Takım Adı:</label>
                <input type="text" name="takim_adi" required>
            </div>
            <div class="form-group">
                <label for="kulup_baskani">Kulüp Başkanı Adı:</label>
                <input type="text" name="kulup_baskani" required>
            </div>
            <div class="form-group">
                <label for="kulup_degeri">Kulüp Değeri:</label>
                <input type="text" name="kulup_degeri" required>
            </div>
            <div class="form-group">
                <input type="submit" value="Takım Ekle" class="submit-button">
            </div>
        </form>
        <h2>Takım Sil</h2>
        <form action="takim_sil.php" method="post" class="team-form">
            <div class="form-group">
                <label for="takim_id">Silinecek Takım ID:</label>
                <input type="text" name="takim_id" required>
            </div>
            <input type="submit" value="Takımı Sil" class="submit-button">
        </form>
    </div>
</body>
</html>
