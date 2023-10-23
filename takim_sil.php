<?php
include 'database.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $takim_id = $_POST['takim_id'];
    
    $delete_fixtures_query = "DELETE FROM Fikstur WHERE EvSahibiTakimID = $takim_id OR DeplasmanTakimID = $takim_id";

    if ($conn->query($delete_fixtures_query)) {
        $delete_team_query = "DELETE FROM Takimlar WHERE TakimID = $takim_id";
        
        if ($conn->query($delete_team_query)) {
            echo "$takim_id ID'li takım başarıyla silindi!";
            header("refresh:2;url=tffbaskani_sayfasi.php");
        } else {
            echo "Takım silinirken bir hata oluştu: " . $conn->error;
        }
    } else {
        echo "Fikstürler silinirken bir hata oluştu: " . $conn->error;
    }
}

$conn->close();
?>
