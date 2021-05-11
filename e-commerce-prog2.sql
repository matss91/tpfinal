-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 11, 2020 at 09:08 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-commerce-prog2`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Celulares'),
(2, 'Computadoras'),
(3, 'Tablets'),
(4, 'Smartwatchs');

-- --------------------------------------------------------

--
-- Table structure for table `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `texto_comentario` varchar(255) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comentarios`
--

INSERT INTO `comentarios` (`id`, `texto_comentario`, `calificacion`, `usuario_id`, `producto_id`, `createdAt`, `updatedAt`) VALUES
(2, 'Rapida, liviana y de buena calidad.\r\nPerfecta para mis proyectos de diseño', 5, 1, 21, '2020-11-01 20:38:15', '2020-11-01 20:38:15'),
(3, 'Muy buena, pero siento que pague mucho la marca...', 4, 8, 21, '2020-11-01 21:05:17', '2020-11-01 21:05:17'),
(4, 'Los stickers animados son lo mejor que le paso a este telefono', 5, 1, 2, '2020-11-04 18:08:53', '2020-11-04 18:08:53'),
(5, 'La camara es esssssspectacular', 5, 1, 6, '2020-11-05 13:23:50', '2020-11-05 13:23:50');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `nombre` varchar(85) NOT NULL,
  `marca` varchar(85) NOT NULL,
  `precio` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT '1',
  `categoria_id` int(11) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `nombre`, `marca`, `precio`, `usuario_id`, `categoria_id`, `img_url`, `createdAt`, `updatedAt`) VALUES
(1, 'iPhone 8', 'Apple', 600, 8, 1, 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/refurb-iphone8plus-spacegray?wid=1400&hei=1400&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1564083513793', '2020-10-27 19:18:42', '2020-12-09 21:33:35'),
(2, 'iPhone X', 'Apple', 650, 1, 1, 'https://assets.swappie.com/iPhone-X-64GB-Silver-1-1-1-1.png', '2020-10-27 19:18:42', '2020-11-05 12:09:38'),
(3, 'iPhone XR', 'Apple', 700, 1, 1, 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/refurb-iphone-xr-black-gallery-2020?wid=1144&hei=1144&fmt=jpeg&qlt=80&op_usm=0.5,0.5&.v=1578943274486', '2020-10-27 19:18:42', '2020-11-05 12:09:41'),
(4, 'iPhone XS', 'Apple', 850, 1, 1, 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/refurb-iphone-xs-spacegray?wid=2000&hei=2000&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1579299537066', '2020-10-27 19:18:42', '2020-11-05 12:09:44'),
(5, 'iPhone 11', 'Apple', 1000, 2, 1, 'https://falabella.scene7.com/is/image/FalabellaAR/5157516_1?wid=1500&hei=1500&qlt=70', '2020-10-27 19:18:42', '2020-11-05 12:09:50'),
(6, 'iPhone 11 Pro', 'Apple', 1200, 1, 1, 'https://zetaelectronica.com.ar/wp-content/uploads/2019/10/iphone-11-pro-max-512gb-lte-4g-black-6gb-ram_10036877_3_1568288128.jpg', '2020-10-27 19:18:42', '2020-11-05 14:38:00'),
(7, 'iPhone SE', 'Apple', 700, 4, 1, 'https://zetaelectronica.com.ar/wp-content/uploads/2020/04/iphone-se-2020-dual-sim-esim-64gb-lte-4g-negru-3gb-ram_10066840_2_1587136117.jpg', '2020-10-27 19:18:42', '2020-11-05 12:09:34'),
(8, 'Galaxy Note 20', 'Samsung', 0, 1, 1, 'https://s.fenicio.app/f/haviuy/productos/87-1_1920-1200_1600292355_4bd.jpg', '2020-10-27 19:18:42', '2020-11-05 12:09:27'),
(9, 'Galaxy S20', 'Samsung', 900, 1, 1, 'https://equiposlibres.pe/wp-content/uploads/2020/03/samsung-galaxy-s20-gris-1.jpg', '2020-10-27 19:18:42', '2020-11-05 12:09:22'),
(10, 'Galaxy Z Fold 2', 'Samsung', 2000, 2, 1, 'https://elcomercio.pe/resizer/WutD6-W3TgR3AEK1R14r9hUobOQ=/1200x1200/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/WMSB7KY5DBG2JBNEGDVE5F5MGA.jpg', '2020-10-27 19:18:42', '2020-11-05 12:09:18'),
(11, 'Galaxy Note 20 Ultra', 'Samsung', 1300, 4, 1, 'https://cdn2.smart-gsm.com//2020/07/Samsung-Galaxy-Note-20-Ultra-1-1.jpg', '2020-10-27 19:18:42', '2020-11-05 12:09:11'),
(12, 'Galaxy Z Flip', 'Samsung', 1300, 3, 1, 'https://pisces.bbystatic.com/image2/BestBuy_MX/images/products/1000/1000228588_bd.jpg', '2020-10-27 19:18:42', '2020-11-05 12:09:08'),
(13, 'Mi 10', 'Xiaomi', 700, 8, 1, 'https://doto.vteximg.com.br/arquivos/ids/158133-1200-1200/xiaomi-mi-10-version-global', '2020-10-27 19:18:42', '2020-12-09 21:33:44'),
(14, 'Mi Note', 'Xiaomi', 800, 2, 1, 'https://www.ventasrosario.com.ar/wp-content/uploads/2020/07/Global-Version-Xiaomi-Mi-Note-10-Lite-6-47-6GB-128GB-Black-903812-.jpg', '2020-10-27 19:18:42', '2020-11-05 12:08:44'),
(15, 'Redmi 9C NFC', 'Xiaomi', 500, 1, 1, 'https://unite4buy.com/media/images/2020/08/11/redmi-9c-3_6L2S8vJ.jpg', '2020-10-27 19:18:42', '2020-11-05 12:08:44'),
(16, 'Redmi 9 Note', 'Xiaomi', 650, 8, 1, 'https://geant.vteximg.com.br/arquivos/ids/252479-1000-1000/530408.jpg?v=637284234410400000', '2020-10-27 19:18:42', '2020-12-09 21:33:29'),
(17, 'Razr', 'Motorola', 1400, 3, 1, 'https://infosertecblog.files.wordpress.com/2020/09/razr-5g-6.jpg', '2020-10-27 19:18:42', '2020-11-05 12:08:44'),
(18, 'Moto One', 'Motorola', 450, 4, 1, 'https://d2pg6pehp4f12r.cloudfront.net/wp-content/uploads/2019/10/Moto-One-Action.jpg', '2020-10-27 19:18:42', '2020-11-05 12:08:44'),
(19, 'Edge', 'Motorola', 700, 3, 1, 'https://cdn.grupoelcorteingles.es/SGFM/dctm/MEDIA03/202005/21/00157063600506009_1__1200x1200.jpg', '2020-10-27 19:18:42', '2020-11-05 12:08:44'),
(20, 'One Zoom', 'Motorola', 450, 4, 1, 'https://compras.tigo.com.co/arquivos/ids/157385-1000-1000/723755134515--10-.jpg?v=637051225443100000', '2020-10-27 19:18:42', '2020-11-05 12:08:44'),
(21, 'MacBook Air', 'Apple', 1300, 2, 2, 'https://http2.mlstatic.com/macbook-air-133-apple-mqd42lea-D_NQ_NP_637630-MLA25913976351_082017-F.jpg', '2020-10-27 19:18:42', '2020-11-05 12:08:44'),
(22, 'MacBook Pro 13', 'Apple', 1700, 1, 2, 'https://http2.mlstatic.com/apple-macbook-pro-13-mr9v2ea-i5-8gb-512gb-sellado-2018-D_NQ_NP_930120-MLA28176940032_092018-F.jpg', '2020-10-27 19:18:42', '2020-11-05 12:08:44'),
(23, 'MacBook Pro 16', 'Apple', 2800, 1, 2, 'https://images.jumpseller.com/store/themacbook-store/6686009/macbook_pro_4.jpg?1598295272', '2020-10-27 19:18:42', '2020-11-05 12:08:44'),
(24, 'iMac 27', 'Apple', 2900, 1, 2, 'https://www.macstoreonline.com.mx/img/sku/COMAPP1022_FZ.jpg', '2020-10-27 19:18:42', '2020-11-05 12:08:44'),
(25, 'ThinkPad P15s', 'Lenovo', 1800, 1, 2, 'https://www.directdial.com/dd2/img/item/A-1500x1500/6069768.jpg', '2020-10-27 19:18:42', '2020-11-05 12:08:44'),
(26, 'ThinkPad P73', 'Lenovo', 7600, 2, 2, 'https://i.ebayimg.com/images/g/fScAAOSw98NdcMNW/s-l1600.jpg', '2020-10-27 19:18:42', '2020-11-05 12:08:44'),
(27, 'ThinkPad P53', 'Lenovo', 6500, 4, 2, 'https://www.techinn.com/f/13734/137344960/lenovo-thinkpad-p53-15.6-i7-9750h-16gb-512g', '2020-10-27 19:18:42', '2020-11-05 12:08:44'),
(28, 'ALIENWARE AREA-51M R2', 'Dell', 5500, 2, 2, 'https://www.dateks.lv/images/pic/1200/1200/161/770.jpg', '2020-10-27 19:18:42', '2020-11-05 12:08:44'),
(29, 'ALIENWARE M17', 'Dell', 4500, 3, 2, 'https://s.alicdn.com/@sc01/kf/Ub71c37d3954d40d79d5e708bbc492f28Y.jpg', '2020-10-27 19:18:42', '2020-11-05 12:08:44'),
(30, 'G7 17', 'Dell', 2500, 3, 2, 'https://i.ebayimg.com/images/g/5iEAAOSwy21dwU8H/s-l1600.jpg', '2020-10-27 19:18:42', '2020-11-05 12:08:44'),
(31, 'G5 17', 'Dell', 1500, 4, 2, 'https://www.notebookcheck.net/fileadmin/Notebooks/News/_nc3/20180403_Dell_G3_17.jpg', '2020-10-27 19:18:42', '2020-11-05 12:06:11'),
(32, 'XPS 17', 'Dell', 2900, 8, 2, 'https://www.profesionalreview.com/wp-content/uploads/2020/05/Dell-XPS-17-saldr%C3%A1-en-verano-con-un-precio-de-1499-dolares.jpg', '2020-10-27 19:18:42', '2020-12-09 21:33:23'),
(33, 'iPad Mini', 'Apple', 400, 2, 3, 'https://i.pinimg.com/originals/a5/a9/88/a5a9881d4b3323fbebc5645ec1a4c349.jpg', '2020-10-27 19:18:42', '2020-11-05 12:06:11'),
(34, 'iPad', 'Apple', 450, 8, 3, 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/refurb-ipad-pro-11-wifi-spacegray-2019?wid=1150&hei=1150&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1581985486323', '2020-10-27 19:18:42', '2020-12-09 21:33:40'),
(35, 'iPad Air', 'Apple', 750, 8, 3, 'https://www.bhphotovideo.com/images/images2500x2500/apple_muuq2ll_a_10_5_ipad_air_early_1468045.jpg', '2020-10-27 19:18:42', '2020-12-09 21:33:26'),
(36, 'iPad Pro', 'Apple', 1000, 8, 3, 'https://media.ldlc.com/r1600/ld/products/00/05/63/65/LD0005636562_2.jpg', '2020-10-27 19:18:42', '2020-12-09 21:33:19'),
(37, 'Galaxy Tab S7+', 'Samsung', 1050, 5, 3, 'https://soundmachine.com.mt/wp-content/uploads/2020/08/01_Tab-S7_black_1a1-scaled.jpg', '2020-10-27 19:18:42', '2020-11-05 12:06:11'),
(38, 'Galaxy Tab S4', 'Samsung', 750, 4, 3, 'https://m.media-amazon.com/images/I/71uL23KpGbL.jpg', '2020-10-27 19:18:42', '2020-11-05 12:06:11'),
(39, 'Galaxy Tab S6', 'Samsung', 790, 2, 3, 'https://www.yaphone.com/3069-thickbox_default/tablet-samsung-galaxy-tab-s6-t860n.jpg', '2020-10-27 19:18:42', '2020-11-05 12:06:11'),
(40, 'Galaxy Tab S7', 'Samsung', 850, 3, 3, 'https://soundmachine.com.mt/wp-content/uploads/2020/08/01_Tab-S7_black_1a1-scaled.jpg', '2020-10-27 19:18:42', '2020-11-05 12:06:11'),
(41, 'Galaxy View 2', 'Samsung', 750, 3, 3, 'https://425877-1336944-raikfcquaxqncofqfm.stackpathdns.com/pub/media/catalog/product/cache/a1d6eef6c74f0dc23a2b42b2a746a314/s/a/samsung_galaxy_view_2_1.jpg', '2020-10-27 19:18:42', '2020-11-05 12:06:11'),
(42, 'Surface Pro 7', 'Microsoft', 1200, 4, 3, 'https://resources.claroshop.com/medios-plazavip/s2/10243/1564996/5f079d76eec78-dcd73136-5d45-49a0-aafa-d73d7deb0da3-1600x1600.jpg', '2020-10-27 19:18:42', '2020-11-05 12:06:11'),
(43, 'Apple Watch Series 6', 'Apple', 400, 1, 4, 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MTPL2_VW_34FR+watch-44-alum-spacegray-cell-6s_VW_34FR_WF_CO?wid=1400&hei=1400&trim=1,0&fmt=p-jpg&qlt=80&op_usm=0.5,0.5&.v=1566419577479,1599519901000', '2020-10-27 19:18:42', '2020-11-05 12:06:11'),
(44, 'Apple Watch SE', 'Apple', 290, 5, 4, 'https://www.apple.com/newsroom/images/product/watch/lifestyle/Apple_announces-watch-se_09152020.jpg.news_app_ed.jpg', '2020-10-27 19:18:42', '2020-11-05 12:06:11'),
(45, 'Apple Watch Nike', 'Apple', 450, 1, 4, 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/40-alum-spacegray-sport-anthracite-black-nike5s-cell?wid=2000&hei=2000&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1567112473457', '2020-10-27 19:18:42', '2020-11-05 12:06:11'),
(46, 'Apple Watch Hermes', 'Apple', 1500, 1, 4, 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MTQA2_AV1?wid=1144&hei=1144&fmt=jpeg&qlt=80&op_usm=0.5,0.5&.v=1583880547840', '2020-10-27 19:18:42', '2020-11-05 12:06:11'),
(47, 'Galaxy Watch 3', 'Samsung', 600, 2, 4, 'https://static.bhphoto.com/images/images2500x2500/1596630034_1577760.jpg', '2020-10-27 19:18:42', '2020-11-05 12:06:11'),
(48, 'Galaxy Watch Active 2', 'Samsung', 400, 3, 4, 'https://www.techinn.com/f/13735/137356286/samsung-galaxy-watch-active2-under-armour-e', '2020-10-27 19:18:42', '2020-11-05 12:06:11'),
(49, 'Galaxy Watch', 'Samsung', 270, 3, 4, 'https://i.ebayimg.com/images/g/d8QAAOSwcMhbjvuH/s-l1600.jpg', '2020-10-27 19:18:42', '2020-11-05 12:06:11'),
(50, 'Sense', 'Fitbit', 350, 4, 4, 'https://43nnuk1fz4a72826eo14gwfb-wpengine.netdna-ssl.com/wp-content/uploads/2020/08/Fitbit_Sense_Render_3QTR_Core_Lunar_White_Soft_Gold_Clock_Default_Shadow-1024x1024.jpeg', '2020-10-27 19:18:42', '2020-11-05 12:06:11'),
(51, 'Versa 3', 'Fitbit', 250, 1, 4, 'https://www.zoomtecnologico.com/wp-content/uploads/2020/08/versa3.jpg', '2020-10-27 19:18:42', '2020-11-05 12:06:11'),
(52, 'Versa 2', 'Fitbit', 180, 1, 4, 'https://m.media-amazon.com/images/I/71jmv1NY2PL.jpg', '2020-10-27 19:18:42', '2020-11-05 12:06:11');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `createdAt`, `updatedAt`, `password`) VALUES
(1, 'mati', 'mati@mail.com', '2020-10-29 05:11:07', '2020-10-29 05:11:07', '$2a$10$d6m6Lb3JkOO7.yodHXy1Lul6TlX/9ZP4IueqvBobts0FPTwzJccYe'),
(2, 'joey', 'joey@friends.com', '2020-10-29 14:58:31', '2020-10-29 14:58:31', '$2a$10$ltepFSOVEjIzV/HsZKR9QOI5WmMG15IQzTJeV4pptgscaq19b0CIm'),
(3, 'chandler', 'chandler@friends.com', '2020-10-29 14:59:01', '2020-10-29 14:59:01', '$2a$10$tIooSzK9dO4R9cGx7EMOyerrKMfPmvX4MYcw5t54GlLIul3wgGpFS'),
(4, 'monica', 'monica@friends.com', '2020-10-29 14:59:31', '2020-10-29 14:59:31', '$2a$10$K7C8sY1F22vVUkaQZyhek..vvUcPo.2yyCCksG6dilkXGo9TbpwOi'),
(5, 'rachel', 'rachel@friends.com', '2020-10-29 14:59:50', '2020-10-29 14:59:50', '$2a$10$toNl3UWvMhoQgNJb78igqeXr7DuzNzgh0JGypWPS5KkH3W.rDKl..'),
(6, 'ross', 'ross@friends.com', '2020-10-29 15:00:08', '2020-10-29 15:00:08', '$2a$10$nv31IQoQQYJkN6DiMuYFQ.lsEjC6YM9CMGuKfmAPkwJOQ8bo9Mii.'),
(7, 'pheobe', 'pheobe@friends.com', '2020-10-29 15:00:24', '2020-10-29 15:00:24', '$2a$10$gZjKBGTW/Uk.4hbxXM7wRO2hCnL2c7Og5ximGIDin/Z6l8lpVxQzG'),
(8, 'butcher', 'butcher@theBoys.com', '2020-10-29 15:05:50', '2020-10-29 15:05:50', '$2a$10$tGGI4Ff5/UZheit1gws/Su6tAMWv4lkBI.uz2Mh7s0jfYjSNYm3jy'),
(9, 'frenchie', 'frenchie@theBoys.comm', '2020-10-29 15:06:04', '2020-10-29 15:06:04', '$2a$10$1ZR8bOytWrR7sj1y5/VbNeK6YJYHPQDBecD2cZVsjZ2xVrTNi0gYC'),
(10, 'ale', 'ale@mail.com', '2020-10-29 16:02:22', '2020-10-29 16:02:22', '$2a$10$YPw5jhZFiMNvWP0bBQPo9OS2kapCOheAfg8ZGwaSx19.b9wbHQxkO');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
