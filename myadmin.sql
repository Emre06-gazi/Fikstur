-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 17 Eki 2023, 16:16:09
-- Sunucu sürümü: 10.4.28-MariaDB
-- PHP Sürümü: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `myadmin`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fikstur`
--

CREATE TABLE `fikstur` (
  `FiksturID` int(11) NOT NULL,
  `EvSahibiTakimID` int(11) DEFAULT NULL,
  `DeplasmanTakimID` int(11) DEFAULT NULL,
  `Tarih` date DEFAULT NULL,
  `Saat` time DEFAULT NULL,
  `KazanmaOlasiligi` decimal(5,2) DEFAULT 0.00,
  `Skor` varchar(10) DEFAULT NULL,
  `Donem` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `fikstur`
--

INSERT INTO `fikstur` (`FiksturID`, `EvSahibiTakimID`, `DeplasmanTakimID`, `Tarih`, `Saat`, `KazanmaOlasiligi`, `Skor`, `Donem`) VALUES
(2876, 6, 7, '2021-10-14', '17:17:00', 0.63, '6 : 3', NULL),
(2877, 7, 8, '2022-04-07', '18:24:00', 0.68, '4 : 0', NULL),
(2878, 8, 9, '2022-04-01', '23:13:00', 0.27, '1 : 2', NULL),
(2879, 9, 15, '2022-04-08', '20:32:00', 0.75, '6 : 6', NULL),
(2880, 15, 16, '2022-01-27', '18:59:00', 0.71, '6 : 0', NULL),
(2881, 16, 17, '2021-09-18', '21:28:00', 0.58, '5 : 3', NULL),
(2882, 17, 18, '2022-03-15', '22:40:00', 0.07, '3 : 1', NULL),
(2883, 18, 6, '2022-05-01', '19:47:00', 0.77, '2 : 3', NULL),
(2884, 6, 8, '2021-10-18', '18:05:00', 0.42, '1 : 6', NULL),
(2885, 7, 9, '2022-04-27', '20:25:00', 0.91, '3 : 4', NULL),
(2886, 8, 15, '2022-05-20', '17:24:00', 0.77, '5 : 5', NULL),
(2887, 9, 16, '2021-11-22', '17:45:00', 0.92, '2 : 5', NULL),
(2888, 15, 17, '2021-12-15', '21:17:00', 0.14, '1 : 0', NULL),
(2889, 16, 18, '2022-03-11', '17:09:00', 0.63, '3 : 3', NULL),
(2890, 17, 6, '2021-11-30', '16:29:00', 0.06, '6 : 6', NULL),
(2891, 18, 7, '2021-11-04', '22:41:00', 0.61, '3 : 3', NULL),
(2892, 6, 9, '2022-05-17', '17:44:00', 1.00, '1 : 5', NULL),
(2893, 7, 15, '2021-11-04', '19:02:00', 0.75, '1 : 2', NULL),
(2894, 8, 16, '2021-09-08', '22:39:00', 0.41, '6 : 2', NULL),
(2895, 9, 17, '2022-02-10', '17:14:00', 0.97, '4 : 4', NULL),
(2896, 15, 18, '2021-09-27', '18:54:00', 0.97, '1 : 3', NULL),
(2897, 16, 6, '2021-10-20', '18:00:00', 0.97, '1 : 4', NULL),
(2898, 17, 7, '2022-01-20', '22:38:00', 0.86, '1 : 6', NULL),
(2899, 18, 8, '2021-11-24', '18:48:00', 0.17, '5 : 1', NULL),
(2900, 6, 15, '2022-01-16', '21:59:00', 0.77, '6 : 6', NULL),
(2901, 7, 16, '2021-08-13', '21:54:00', 0.50, '1 : 3', NULL),
(2902, 8, 17, '2022-02-18', '17:33:00', 0.88, '6 : 3', NULL),
(2903, 9, 18, '2022-02-08', '20:26:00', 0.23, '6 : 3', NULL),
(2904, 15, 6, '2021-12-19', '17:35:00', 0.17, '3 : 0', NULL),
(2905, 16, 7, '2022-01-13', '21:54:00', 0.43, '1 : 0', NULL),
(2906, 17, 8, '2021-10-24', '22:04:00', 0.73, '3 : 6', NULL),
(2907, 18, 9, '2022-05-01', '22:14:00', 0.67, '0 : 0', NULL),
(2908, 6, 16, '2022-05-14', '20:33:00', 0.98, '3 : 6', NULL),
(2909, 7, 17, '2022-03-11', '22:48:00', 0.84, '6 : 2', NULL),
(2910, 8, 18, '2022-01-23', '18:47:00', 0.13, '2 : 1', NULL),
(2911, 9, 6, '2021-12-31', '20:01:00', 0.71, '4 : 3', NULL),
(2912, 15, 7, '2022-04-02', '19:46:00', 0.61, '4 : 4', NULL),
(2913, 16, 8, '2021-08-24', '17:52:00', 0.45, '2 : 4', NULL),
(2914, 17, 9, '2021-08-22', '21:02:00', 0.45, '6 : 0', NULL),
(2915, 18, 15, '2021-08-29', '19:06:00', 0.67, '5 : 5', NULL),
(2916, 6, 17, '2022-01-21', '20:08:00', 0.34, '3 : 2', NULL),
(2917, 7, 18, '2021-12-26', '19:56:00', 0.43, '4 : 5', NULL),
(2918, 8, 6, '2022-01-14', '22:13:00', 0.69, '5 : 6', NULL),
(2919, 9, 7, '2021-11-22', '18:31:00', 0.47, '1 : 0', NULL),
(2920, 15, 8, '2021-08-09', '22:55:00', 0.57, '2 : 2', NULL),
(2921, 16, 9, '2021-10-13', '19:56:00', 0.27, '5 : 1', NULL),
(2922, 17, 15, '2022-02-20', '22:47:00', 0.03, '5 : 2', NULL),
(2923, 18, 16, '2022-02-21', '19:57:00', 0.83, '0 : 6', NULL),
(2924, 6, 18, '2022-02-26', '21:54:00', 0.75, '5 : 4', NULL),
(2925, 7, 6, '2021-12-10', '18:15:00', 0.34, '3 : 5', NULL),
(2926, 8, 7, '2022-05-09', '19:39:00', 0.87, '6 : 4', NULL),
(2927, 9, 8, '2021-09-04', '17:52:00', 0.07, '3 : 0', NULL),
(2928, 15, 9, '2022-01-19', '20:35:00', 0.80, '1 : 5', NULL),
(2929, 16, 15, '2022-02-03', '17:20:00', 0.22, '3 : 4', NULL),
(2930, 17, 16, '2022-05-09', '17:03:00', 0.68, '5 : 2', NULL),
(2931, 18, 17, '2022-05-07', '19:58:00', 0.57, '2 : 4', NULL),
(2932, 6, 7, '2022-09-26', '21:45:00', 0.10, '2 : 4', NULL),
(2933, 7, 8, '2023-05-03', '16:57:00', 0.41, '1 : 3', NULL),
(2934, 8, 9, '2022-09-27', '21:44:00', 0.24, '0 : 1', NULL),
(2935, 9, 15, '2023-03-12', '20:31:00', 0.71, '0 : 4', NULL),
(2936, 15, 16, '2023-04-25', '22:40:00', 0.32, '4 : 4', NULL),
(2937, 16, 17, '2022-09-18', '19:16:00', 0.78, '6 : 3', NULL),
(2938, 17, 18, '2022-10-25', '21:02:00', 0.92, '0 : 5', NULL),
(2939, 18, 6, '2023-02-19', '19:13:00', 0.52, '3 : 2', NULL),
(2940, 6, 8, '2023-05-14', '19:23:00', 0.17, '3 : 4', NULL),
(2941, 7, 9, '2022-09-29', '18:57:00', 0.82, '4 : 4', NULL),
(2942, 8, 15, '2023-03-05', '20:09:00', 0.41, '5 : 5', NULL),
(2943, 9, 16, '2022-09-08', '19:19:00', 0.87, '4 : 6', NULL),
(2944, 15, 17, '2022-09-22', '18:19:00', 0.03, '5 : 3', NULL),
(2945, 16, 18, '2023-01-21', '23:10:00', 0.47, '2 : 4', NULL),
(2946, 17, 6, '2022-11-08', '17:39:00', 0.20, '3 : 0', NULL),
(2947, 18, 7, '2022-12-14', '21:58:00', 0.64, '2 : 0', NULL),
(2948, 6, 9, '2022-10-12', '16:22:00', 0.38, '3 : 5', NULL),
(2949, 7, 15, '2022-10-15', '18:32:00', 0.53, '3 : 1', NULL),
(2950, 8, 16, '2023-05-29', '17:00:00', 0.18, '0 : 6', NULL),
(2951, 9, 17, '2023-01-25', '22:04:00', 0.43, '2 : 0', NULL),
(2952, 15, 18, '2023-01-06', '20:22:00', 0.74, '2 : 0', NULL),
(2953, 16, 6, '2022-09-16', '22:01:00', 0.25, '0 : 0', NULL),
(2954, 17, 7, '2023-02-28', '20:17:00', 0.23, '2 : 5', NULL),
(2955, 18, 8, '2022-11-01', '20:21:00', 0.21, '3 : 0', NULL),
(2956, 6, 15, '2022-09-13', '17:07:00', 0.41, '0 : 6', NULL),
(2957, 7, 16, '2023-02-01', '22:38:00', 0.58, '0 : 0', NULL),
(2958, 8, 17, '2023-03-29', '18:42:00', 0.46, '5 : 5', NULL),
(2959, 9, 18, '2023-05-07', '18:26:00', 0.35, '6 : 5', NULL),
(2960, 15, 6, '2022-11-26', '22:18:00', 0.78, '1 : 6', NULL),
(2961, 16, 7, '2023-05-08', '22:51:00', 0.40, '5 : 6', NULL),
(2962, 17, 8, '2023-01-22', '21:54:00', 0.26, '5 : 3', NULL),
(2963, 18, 9, '2022-11-27', '20:08:00', 0.56, '1 : 4', NULL),
(2964, 6, 16, '2023-03-05', '19:42:00', 0.73, '6 : 0', NULL),
(2965, 7, 17, '2023-05-02', '22:01:00', 0.95, '3 : 4', NULL),
(2966, 8, 18, '2023-04-08', '19:33:00', 0.39, '4 : 2', NULL),
(2967, 9, 6, '2023-02-08', '19:54:00', 0.75, '6 : 5', NULL),
(2968, 15, 7, '2022-08-15', '17:39:00', 0.63, '6 : 3', NULL),
(2969, 16, 8, '2022-09-29', '23:24:00', 0.83, '1 : 5', NULL),
(2970, 17, 9, '2022-11-10', '22:51:00', 0.03, '0 : 4', NULL),
(2971, 18, 15, '2022-12-02', '21:20:00', 0.25, '5 : 5', NULL),
(2972, 6, 17, '2023-03-12', '20:06:00', 0.05, '3 : 3', NULL),
(2973, 7, 18, '2023-05-10', '20:59:00', 0.95, '1 : 2', NULL),
(2974, 8, 6, '2022-10-10', '16:33:00', 0.36, '3 : 1', NULL),
(2975, 9, 7, '2023-03-29', '20:20:00', 0.02, '5 : 1', NULL),
(2976, 15, 8, '2022-10-14', '18:40:00', 0.45, '0 : 4', NULL),
(2977, 16, 9, '2022-12-05', '18:08:00', 0.07, '1 : 5', NULL),
(2978, 17, 15, '2022-08-18', '18:10:00', 0.37, '0 : 0', NULL),
(2979, 18, 16, '2023-04-24', '20:24:00', 0.93, '5 : 6', NULL),
(2980, 6, 18, '2023-02-15', '19:19:00', 0.80, '3 : 5', NULL),
(2981, 7, 6, '2022-08-23', '20:34:00', 0.04, '5 : 3', NULL),
(2982, 8, 7, '2022-10-30', '21:28:00', 0.37, '0 : 5', NULL),
(2983, 9, 8, '2023-02-06', '20:42:00', 0.95, '1 : 0', NULL),
(2984, 15, 9, '2022-08-27', '22:12:00', 0.33, '2 : 1', NULL),
(2985, 16, 15, '2022-10-29', '18:42:00', 0.71, '0 : 4', NULL),
(2986, 17, 16, '2022-12-27', '21:24:00', 0.55, '5 : 4', NULL),
(2987, 18, 17, '2023-02-09', '21:36:00', 0.38, '0 : 4', NULL),
(2988, 6, 7, '2023-10-28', '18:41:00', 0.46, NULL, NULL),
(2989, 7, 8, '2023-12-03', '21:06:00', 0.75, NULL, NULL),
(2990, 8, 9, '2024-02-10', '16:20:00', 0.34, NULL, NULL),
(2991, 9, 15, '2024-04-13', '18:56:00', 0.50, NULL, NULL),
(2992, 15, 16, '2023-09-04', '21:36:00', 0.64, '6 : 4', NULL),
(2993, 16, 17, '2024-05-28', '18:07:00', 0.92, NULL, NULL),
(2994, 17, 18, '2024-03-18', '19:06:00', 0.24, NULL, NULL),
(2995, 18, 6, '2024-03-14', '17:39:00', 0.10, NULL, NULL),
(2996, 6, 8, '2023-08-30', '17:36:00', 0.61, '6 : 0', NULL),
(2997, 7, 9, '2023-12-12', '20:02:00', 0.45, NULL, NULL),
(2998, 8, 15, '2023-11-24', '19:45:00', 0.50, NULL, NULL),
(2999, 9, 16, '2024-05-20', '21:21:00', 0.27, NULL, NULL),
(3000, 15, 17, '2024-03-03', '17:52:00', 0.76, NULL, NULL),
(3001, 16, 18, '2024-04-29', '18:22:00', 0.40, NULL, NULL),
(3002, 17, 6, '2023-09-05', '17:36:00', 0.68, '5 : 4', NULL),
(3003, 18, 7, '2023-09-03', '19:08:00', 0.30, '2 : 6', NULL),
(3004, 6, 9, '2023-08-18', '21:08:00', 0.85, '3 : 0', NULL),
(3005, 7, 15, '2024-02-20', '16:55:00', 0.39, NULL, NULL),
(3006, 8, 16, '2023-12-14', '22:38:00', 0.10, NULL, NULL),
(3007, 9, 17, '2023-11-28', '21:01:00', 0.91, NULL, NULL),
(3008, 15, 18, '2023-10-25', '16:35:00', 0.87, NULL, NULL),
(3009, 16, 6, '2023-09-01', '17:01:00', 0.36, '6 : 0', NULL),
(3010, 17, 7, '2023-11-19', '22:08:00', 0.60, NULL, NULL),
(3011, 18, 8, '2023-10-19', '22:55:00', 0.25, NULL, NULL),
(3012, 6, 15, '2024-01-19', '20:00:00', 0.55, NULL, NULL),
(3013, 7, 16, '2023-11-13', '18:30:00', 0.86, NULL, NULL),
(3014, 8, 17, '2023-10-25', '22:06:00', 0.13, NULL, NULL),
(3015, 9, 18, '2023-09-24', '21:25:00', 0.40, '5 : 6', NULL),
(3016, 15, 6, '2024-04-23', '22:54:00', 0.94, NULL, NULL),
(3017, 16, 7, '2023-12-30', '21:38:00', 0.40, NULL, NULL),
(3018, 17, 8, '2024-01-01', '19:17:00', 0.77, NULL, NULL),
(3019, 18, 9, '2023-10-23', '22:20:00', 0.76, NULL, NULL),
(3020, 6, 16, '2023-11-11', '20:08:00', 0.63, NULL, NULL),
(3021, 7, 17, '2023-10-06', '17:08:00', 0.51, '2 : 1', NULL),
(3022, 8, 18, '2024-04-26', '21:18:00', 0.81, NULL, NULL),
(3023, 9, 6, '2023-11-16', '16:36:00', 0.54, NULL, NULL),
(3024, 15, 7, '2023-12-21', '17:59:00', 0.94, NULL, NULL),
(3025, 16, 8, '2023-08-27', '18:51:00', 0.36, '6 : 4', NULL),
(3026, 17, 9, '2024-02-10', '18:54:00', 0.70, NULL, NULL),
(3027, 18, 15, '2023-10-20', '18:28:00', 0.45, NULL, NULL),
(3028, 6, 17, '2024-05-03', '16:27:00', 0.16, NULL, NULL),
(3029, 7, 18, '2023-08-10', '20:36:00', 0.70, '5 : 6', NULL),
(3030, 8, 6, '2024-03-25', '18:30:00', 0.52, NULL, NULL),
(3031, 9, 7, '2024-05-27', '23:24:00', 0.64, NULL, NULL),
(3032, 15, 8, '2024-04-09', '18:28:00', 0.54, NULL, NULL),
(3033, 16, 9, '2023-11-13', '22:51:00', 0.79, NULL, NULL),
(3034, 17, 15, '2024-05-19', '18:29:00', 0.38, NULL, NULL),
(3035, 18, 16, '2024-03-25', '22:22:00', 0.21, NULL, NULL),
(3036, 6, 18, '2024-05-17', '20:01:00', 0.85, NULL, NULL),
(3037, 7, 6, '2024-03-03', '18:54:00', 0.17, NULL, NULL),
(3038, 8, 7, '2023-08-26', '16:16:00', 0.03, '0 : 3', NULL),
(3039, 9, 8, '2024-05-02', '19:25:00', 0.45, NULL, NULL),
(3040, 15, 9, '2023-10-25', '18:55:00', 0.79, NULL, NULL),
(3041, 16, 15, '2024-02-05', '16:36:00', 0.85, NULL, NULL),
(3042, 17, 16, '2024-03-07', '17:51:00', 0.92, NULL, NULL),
(3043, 18, 17, '2024-05-02', '19:19:00', 0.55, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `fiksturdurumu`
--

CREATE TABLE `fiksturdurumu` (
  `Donem` varchar(20) NOT NULL,
  `FiksturOlusturuldu` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `fiksturdurumu`
--

INSERT INTO `fiksturdurumu` (`Donem`, `FiksturOlusturuldu`) VALUES
('2021/2022', 1),
('2022/2023', 1),
('2023/2024', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `puandurumu`
--

CREATE TABLE `puandurumu` (
  `PuanDurumuID` int(11) NOT NULL,
  `TakimID` int(11) DEFAULT NULL,
  `Donem` varchar(10) DEFAULT NULL,
  `OynananMaclar` int(11) DEFAULT NULL,
  `KazanilanMaclar` int(11) DEFAULT NULL,
  `BerabereMaclar` int(11) DEFAULT NULL,
  `Puan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `takimlar`
--

CREATE TABLE `takimlar` (
  `TakimID` int(11) NOT NULL,
  `TakimAdi` varchar(255) NOT NULL,
  `KulupBaskaniID` int(11) DEFAULT NULL,
  `takimDeğeri` float DEFAULT NULL,
  `Puan` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `takimlar`
--

INSERT INTO `takimlar` (`TakimID`, `TakimAdi`, `KulupBaskaniID`, `takimDeğeri`, `Puan`) VALUES
(6, 'Galatasaray', 10, 121, 34),
(7, 'Fenerbahçe ', 11, 1, 29),
(8, 'Gaziantep Spor', 12, 25000, 38),
(9, 'AnkaraGücü', 13, 850000, 46),
(15, 'Beşiktaş', 19, 240000, 47),
(16, 'İstanbul Spor', 20, 260000, 43),
(17, 'Real Madrid', 21, 2500000, 47),
(18, 'Galatasarayasdas', 22, 12312, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','kulupbaskani') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'adminpassword', 'admin'),
(10, 'Dursun Özbek', '123', 'kulupbaskani'),
(11, 'Ali Koç', '123', 'kulupbaskani'),
(12, 'Halil Söyleemz', '123', 'kulupbaskani'),
(13, 'Mahmut Şener', '123', 'kulupbaskani'),
(14, 'Dursun Ali', '123', 'kulupbaskani'),
(15, 'Ahmet Çil', '123', 'kulupbaskani'),
(16, 'Dursun Ali', '123', 'kulupbaskani'),
(17, 'sadas', '123', 'kulupbaskani'),
(18, 'Dursun Özbekasd', '123', 'kulupbaskani'),
(19, 'Ali Yener', '123', 'kulupbaskani'),
(20, 'Halil Yagcı', '123', 'kulupbaskani'),
(21, 'Joseph Mourinho', '123', 'kulupbaskani'),
(22, 'asdsa', '123', 'kulupbaskani');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `fikstur`
--
ALTER TABLE `fikstur`
  ADD PRIMARY KEY (`FiksturID`),
  ADD KEY `EvSahibiTakimID` (`EvSahibiTakimID`),
  ADD KEY `DeplasmanTakimID` (`DeplasmanTakimID`);

--
-- Tablo için indeksler `fiksturdurumu`
--
ALTER TABLE `fiksturdurumu`
  ADD PRIMARY KEY (`Donem`);

--
-- Tablo için indeksler `puandurumu`
--
ALTER TABLE `puandurumu`
  ADD PRIMARY KEY (`PuanDurumuID`),
  ADD KEY `TakimID` (`TakimID`);

--
-- Tablo için indeksler `takimlar`
--
ALTER TABLE `takimlar`
  ADD PRIMARY KEY (`TakimID`),
  ADD KEY `KulupBaskaniID` (`KulupBaskaniID`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `fikstur`
--
ALTER TABLE `fikstur`
  MODIFY `FiksturID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3044;

--
-- Tablo için AUTO_INCREMENT değeri `puandurumu`
--
ALTER TABLE `puandurumu`
  MODIFY `PuanDurumuID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `takimlar`
--
ALTER TABLE `takimlar`
  MODIFY `TakimID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `fikstur`
--
ALTER TABLE `fikstur`
  ADD CONSTRAINT `fikstur_ibfk_1` FOREIGN KEY (`EvSahibiTakimID`) REFERENCES `takimlar` (`TakimID`),
  ADD CONSTRAINT `fikstur_ibfk_2` FOREIGN KEY (`DeplasmanTakimID`) REFERENCES `takimlar` (`TakimID`);

--
-- Tablo kısıtlamaları `puandurumu`
--
ALTER TABLE `puandurumu`
  ADD CONSTRAINT `puandurumu_ibfk_1` FOREIGN KEY (`TakimID`) REFERENCES `takimlar` (`TakimID`);

--
-- Tablo kısıtlamaları `takimlar`
--
ALTER TABLE `takimlar`
  ADD CONSTRAINT `takimlar_ibfk_1` FOREIGN KEY (`KulupBaskaniID`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
