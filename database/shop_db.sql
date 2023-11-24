-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2023 at 07:08 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(22, 1, 3, 'Retrograde Hi Creme Spinach', 668000, 1, 'RHigh1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(1, 1, 'arya', 'arya@gmail.com', '083892501980', 'arya');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `size` varchar(255) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `size`, `total_price`, `placed_on`, `payment_status`) VALUES
(11, 1, 'arya', '0838925019', 'arya@gmail.com', 'cash on delivery', 'jl. arya no 17, jakarta, dki jakarta, indonesia - 12125', 'Gazelle Low Black White (408000 x 1) - ', '38', 408000, '2023-11-23', 'completed'),
(12, 1, 'arya', '0839250198', 'arya@gmail.com', 'cash on delivery', 'jl. arya no 17, jakarta, dki jakarta, Malaysia - 12124', 'Retrograde Slip On Blue/Green (458000 x 1) - ', '38', 458000, '2023-11-23', 'completed'),
(13, 1, 'al', '0831442312', 'al@gmail.com', 'cash on delivery', 'jl. fatmawati, korole, sumedang, Indonesia - 61235', 'Gazelle Low Black White (408000 x 1) - ', '38', 408000, '2023-11-23', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `image_01`, `image_02`, `image_03`) VALUES
(1, 'Compass Linen Low Dusk', 'Edisi terbatas Compass®️ Seasonal 2022. Desain ini terinspirasi dari hamparan laut luas, karang-karang penopang, dan pasir putih yang terbentang. Kami hadirkan Compass®️ Retrograde edisi Linen.', 668000, 'linen1.png', 'linen2.png', 'linen3.png'),
(2, 'Gazelle Low Black White', 'The original silhouette of Compass that started it all in 1998. Re-designed to combine classic vintage with modern details, the Gazelle Low is your ideal every day footwear. Its low-cut design embodies an easy-going effortless style that is versatile for all ocassion and look.', 408000, 'Glow1.png', 'Glow2.png', 'Glow3.png'),
(3, 'Retrograde Hi Creme Spinach', 'Compass®️ Seasonal limited edition 2023.\r\n\r\nCompass®️ presents the Retrograde Creme Edition collection with 70s-inspired colors.\r\n\r\nWith a classic Creme upper, each shoe features four fun, striking colour accents : Cherry (maroon), Grape (purple), Pumpkin (orange), and Spinach (green).', 668000, 'RHigh1.jpg', 'RHigh2.jpg', 'RHigh3.jpg'),
(4, 'Proto Lite Baby Blue', 'Compass®️ Seasonal 2022 : Limited Edition.\r\n\r\nFollowing the footsteps of the PROTO 1 article, Compass®️ RESEARCH & DESTROY presents a basic variation of its popular predecessor titled PROTO LITE. Signature R&D elements are simplified for a more casual wear, while the four bold colours and metallic detail, add a punchy statement to your every look.', 578000, 'proto1.jpg', 'proto2.jpg', 'proto3.jpg'),
(5, 'Velocity Lilac', 'Compass®️ Seasonal 2023 - Limited Edition.\r\n\r\nIntroducting The Velocity® Pastel : a unique collection that features a combination of materials in an all-out monochromatic look.\r\n\r\nFrom the houndstooth-patterned lining, the glittery rubber outsole to the shoelaces with reflective threads;  the Velocity® Pastel is a statement item for the stylish and suave individual.', 1258000, 'velo1.png', 'velo2.png', 'velo3.png'),
(6, 'Retrograde Slip On Blue/Green', 'The Compass Retrograde Slip-On collection is for people who love the simple, practical lifestyle. Just slip-it-on and go! It is inspired by the silhouette of boat shoes worn by sailors.', 458000, 'RSlip1.jpeg', 'RSlip2.jpg', 'RSlip3.jpg'),
(7, 'Gazelle Low Sage Gum', 'The original silhouette of Compass that started it all in 1998. Combining its vintage roots with modern details, the Gazelle Low is classic with an attitude. \r\n\r\nOur new seasonal colours, Sage Gum, highlights the natural green of nature.', 408000, 'Glows1.png', 'Glows2.png', 'Glows3.png'),
(8, 'Proto Lite Beige', 'Compass®️ Seasonal 2022 : Limited Edition.\r\n\r\nFollowing the footsteps of the PROTO 1 article, Compass®️ RESEARCH & DESTROY presents a basic variation of its popular predecessor titled PROTO LITE. Signature R&D elements are simplified for a more casual wear, while the four bold colours and metallic detail, add a punchy statement to your every look.', 578000, 'Protob1.jpg', 'Protob2.jpg', 'Protob3.jpg'),
(9, 'Gazelle Hi Lumut', 'The original silhouette of Compass that started it all in 1998. Combining its vintage roots with modern details, the Gazelle Hi is classic with an attitude. \r\n\r\nOur new seasonal color, Moss, highlights the natural green of nature.', 438000, 'GHighl1.png', 'GHighl2.png', 'GHighl3.png'),
(10, 'Velocity Blue/Yellow', 'Compass® Retrograde VELOCITY is a fusion of vintage style and modern technology, offering the best of both worlds. The name VELOCITY represents the speed and direction of movement, which encapsulates the philosophy that Compass® aims to inspire in everyone - to keep pushing forward and achieve their maximum potential.', 798000, 'Veloby1.png', 'Veloby2.png', 'Veloby3.png'),
(11, 'Retrograde Low White Blue', 'The Retrograde range celebrates the heritage of Compass®️ by drawing inspiration from the archives of its forerunner brand, Gazelle®️. Every detail of the Retrograde tells a story and is designed to evoke a sense of pride when worn.', 538000, 'Rlowwb1.jpg', 'Rlowwb2.jpg', 'Rlowwb3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'arya', 'arya@gmail.com', '2ad6f04015710f5c25c8c20e2d6c597eb13f3989');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
