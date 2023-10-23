<?php
include 'database.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $takim_adi = $_POST['takim_adi'];
    $kulup_baskani = $_POST['kulup_baskani'];
    $kulup_degeri = $_POST['kulup_degeri'];

    $user_query = "INSERT INTO Users (username, password, role) VALUES ('$kulup_baskani', '123', 'kulüpbaskani')";
    
    $user_result = $conn->query($user_query);

    if ($user_result) {
        $last_id = $conn->insert_id;

        $takim_query = "INSERT INTO Takimlar (TakimAdi, KulupBaskaniID, takimDeğeri) VALUES ('$takim_adi', '$last_id', '$kulup_degeri')";

        $takim_result = $conn->query($takim_query);

        if ($takim_result) {
            echo "Takım ve kulüp başkanı başarıyla eklendi.";
            header("refresh:2;url=tffbaskani_sayfasi.php");
            $sql = "DELETE FROM fikstur";
            $sql1 = "DELETE FROM fiksturdurumu";
            $sql = $conn->query($sql);
            $sql1 = $conn->query($sql1);
        } else {
            echo "Takım eklenirken bir hata oluştu: " . $conn->error;
        }
    } else {
        echo "Kulüp başkanı eklenirken bir hata oluştu: " . $conn->error;
    }
}
$conn->close();
?>
