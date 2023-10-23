<?php
session_start(); 

include 'database.php';

$username = $_POST['username'];
$password = $_POST['password'];

$query = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
$result = $conn->query($query);

if ($result->num_rows == 1) {
    $user = $result->fetch_assoc();
    $user_id = $user['id'];
    $user_role = $user['role'];

    // Kullanıcı oturumu başlat
    $_SESSION['kullanici_id'] = $user_id;
    $_SESSION['kullanici_rol'] = $user_role;

    if ($user_role == 'admin') {
        header("Location: tffbaskani_sayfasi.php");
    } else {
        header("Location: kulüpbaskani_sayfasi.php");
    }
} else {
    echo "Kullanıcı adı veya şifre hatalı!";
}

$conn->close();
?>
