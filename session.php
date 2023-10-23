<?php
session_start();

// Kullanıcı oturumunda oturum kimliği (ID) ile ilgili bilgileri alın
if (isset($_SESSION['kullanici_id'])) {
    $kullaniciID = $_SESSION['kullanici_id'];
} else {
    // Kullanıcı oturumu yoksa veya oturumdan kullanıcı kimliği alınamazsa, bir giriş sayfasına yönlendirin
    header("Location: login.html");
    exit;
}
?>
