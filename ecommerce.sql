-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 13-05-2025 a las 03:45:50
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecommerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `type_attribute` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Activo 2 = Inactivo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `type_attribute`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(14, 'Marca', 1, 1, '2025-04-16 06:59:21', '2025-04-16 06:59:21', NULL),
(15, 'Linea', 1, 1, '2025-04-16 06:59:36', '2025-04-16 06:59:36', NULL),
(16, 'Modelo', 1, 1, '2025-04-16 06:59:45', '2025-04-16 06:59:45', NULL),
(17, 'Es Dual SIM', 1, 1, '2025-04-16 06:59:56', '2025-04-16 06:59:56', NULL),
(18, 'Cantidad de ranuras para tarjeta SIM', 2, 1, '2025-04-16 07:00:14', '2025-04-16 07:00:14', NULL),
(19, 'Cantidad de eSIMs', 2, 1, '2025-04-16 07:00:34', '2025-04-16 07:00:34', NULL),
(20, 'Tamaños de tarjeta SIM compatibles', 1, 1, '2025-04-16 07:00:50', '2025-04-16 07:00:50', NULL),
(21, 'Con eSIM', 1, 1, '2025-04-16 07:00:58', '2025-04-16 07:00:58', NULL),
(22, 'Memoria Interna', 3, 1, '2025-04-16 07:01:21', '2025-04-16 07:01:21', NULL),
(23, 'Memoria RAM', 1, 1, '2025-04-16 07:02:28', '2025-04-16 07:02:28', NULL),
(24, 'Modelo del procesador', 1, 1, '2025-04-16 07:03:26', '2025-04-16 07:03:26', NULL),
(25, 'Velocidad del procesador', 1, 1, '2025-04-16 07:03:36', '2025-04-16 07:03:36', NULL),
(26, 'Tamaño de la pantalla', 1, 1, '2025-04-16 07:03:57', '2025-04-16 07:03:57', NULL),
(27, 'Tipo de resolución de la pantalla', 1, 1, '2025-04-16 07:04:01', '2025-04-16 07:04:01', NULL),
(28, 'Resolución de la pantalla', 1, 1, '2025-04-16 07:04:06', '2025-04-16 07:04:06', NULL),
(29, 'Tecnología de la pantalla', 1, 1, '2025-04-16 07:04:10', '2025-04-16 07:04:10', NULL),
(30, 'Color', 3, 1, '2025-04-16 07:14:45', '2025-04-27 04:44:19', NULL),
(32, 'PruebaSeleccionableMultiple', 4, 1, '2025-05-13 03:24:50', '2025-05-13 03:24:50', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `imagen` varchar(250) DEFAULT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Activo 2 = Inactivo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id`, `name`, `imagen`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 'Thermaltake', NULL, 1, '2025-03-19 08:26:37', '2025-03-19 08:26:37', NULL),
(7, 'Alienware', NULL, 1, '2025-04-06 08:21:37', '2025-04-06 08:21:37', NULL),
(8, 'Apple', NULL, 1, '2025-04-06 08:44:15', '2025-04-06 08:44:15', NULL),
(9, 'Xiaomi', NULL, 1, '2025-04-06 08:44:21', '2025-04-06 08:44:21', NULL),
(10, 'Samsung', NULL, 1, '2025-04-06 08:44:37', '2025-04-06 08:44:37', NULL),
(11, 'Microsoft', NULL, 1, '2025-04-06 08:45:02', '2025-04-06 08:45:02', NULL),
(12, 'Adidas', NULL, 1, '2025-04-06 08:45:32', '2025-04-06 08:45:32', NULL),
(13, 'Nike', NULL, 1, '2025-04-06 08:45:39', '2025-04-06 08:45:39', NULL),
(14, 'Motorola', NULL, 1, '2025-04-06 08:45:44', '2025-04-06 08:45:44', NULL),
(15, 'Balenciaga', NULL, 1, '2025-04-06 08:45:50', '2025-04-06 08:45:50', NULL),
(16, 'Givenchy', NULL, 1, '2025-04-06 08:46:01', '2025-04-06 08:46:01', NULL),
(17, 'Gucci', NULL, 1, '2025-04-06 08:46:09', '2025-04-06 08:46:09', NULL),
(18, 'Lacoste', NULL, 1, '2025-04-06 08:46:16', '2025-04-06 08:46:16', NULL),
(19, 'Levi\'s', NULL, 1, '2025-04-06 08:46:23', '2025-04-14 08:46:28', NULL),
(20, 'LG', NULL, 1, '2025-04-06 08:46:29', '2025-04-06 08:46:29', NULL),
(21, 'Louis Vuitton', NULL, 1, '2025-04-06 08:46:34', '2025-04-06 08:46:34', NULL),
(22, 'Nintendo', NULL, 1, '2025-04-06 08:46:42', '2025-04-06 08:46:42', NULL),
(23, 'Rolex', NULL, 1, '2025-04-06 08:46:49', '2025-04-06 08:46:49', NULL),
(24, 'Sony', NULL, 1, '2025-04-06 08:46:56', '2025-04-06 08:46:56', NULL),
(25, 'Zara', NULL, 1, '2025-04-14 08:46:35', '2025-04-14 08:46:35', NULL),
(26, 'Mango', NULL, 1, '2025-04-14 08:46:41', '2025-04-14 08:46:41', NULL),
(27, 'Dell', NULL, 1, '2025-04-14 08:46:51', '2025-04-14 08:46:51', NULL),
(28, 'Logitech', NULL, 1, '2025-04-14 08:47:01', '2025-04-14 08:47:01', NULL),
(29, 'Oster', NULL, 1, '2025-04-14 08:47:07', '2025-04-14 08:47:07', NULL),
(30, 'Tramontina', NULL, 1, '2025-04-14 08:47:12', '2025-04-14 08:47:12', NULL),
(31, 'Tugó', NULL, 1, '2025-04-14 08:47:16', '2025-04-14 08:47:16', NULL),
(32, 'HomeStyle', NULL, 1, '2025-04-14 08:47:23', '2025-04-14 08:47:23', NULL),
(33, 'Fisher-Price', NULL, 1, '2025-04-14 08:47:30', '2025-04-14 08:47:30', NULL),
(34, 'Amazon Fire Kids', NULL, 1, '2025-04-14 08:47:39', '2025-04-14 08:47:39', NULL),
(35, 'Carter\'s', NULL, 1, '2025-04-14 08:47:42', '2025-04-14 08:47:42', NULL),
(36, 'Adidas Kids', NULL, 1, '2025-04-14 08:47:47', '2025-04-14 08:47:47', NULL),
(37, 'Maybelline', NULL, 1, '2025-04-14 08:47:50', '2025-04-14 08:47:50', NULL),
(38, 'Pantene', NULL, 1, '2025-04-14 08:47:56', '2025-04-14 08:47:56', NULL),
(39, 'Elvive', NULL, 1, '2025-04-14 08:48:05', '2025-04-14 08:48:05', NULL),
(40, 'Hyperx', NULL, 1, '2025-04-14 21:25:44', '2025-04-14 21:25:44', NULL),
(41, 'TP-Link', NULL, 1, '2025-04-14 22:51:03', '2025-04-14 22:51:03', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `type_discount` tinyint(1) DEFAULT NULL,
  `discount` double DEFAULT 0,
  `type_campaing` tinyint(1) UNSIGNED DEFAULT NULL,
  `code_cupon` varchar(250) DEFAULT NULL,
  `code_discount` varchar(50) DEFAULT NULL,
  `product_variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` double NOT NULL DEFAULT 1,
  `price_unit` double NOT NULL,
  `subtotal` double NOT NULL,
  `total` double NOT NULL,
  `currency` varchar(20) NOT NULL DEFAULT 'COP',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted__at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `type_discount`, `discount`, `type_campaing`, `code_cupon`, `code_discount`, `product_variation_id`, `quantity`, `price_unit`, `subtotal`, `total`, `currency`, `created_at`, `updated_at`, `deleted__at`) VALUES
(128, 16, 20, 1, 50, NULL, 'NAVIDAD2025', NULL, NULL, 1, 38700, 19350, 19350, 'COP', '2025-05-08 03:16:13', '2025-05-08 22:27:30', NULL),
(141, 16, 34, 1, 30, 1, NULL, '681a8829300b3', 40, 1, 195000, 136500, 136500, 'COP', '2025-05-08 11:09:21', '2025-05-08 22:27:30', NULL),
(172, 14, 6, 1, 30, 1, NULL, '681a8829300b3', NULL, 1, 1098, 768.6, 768.6, 'USD', '2025-05-10 09:33:37', '2025-05-10 09:33:37', NULL),
(173, 14, 8, NULL, NULL, NULL, NULL, NULL, NULL, 2, 11.57, 11.57, 23.14, 'USD', '2025-05-10 09:33:38', '2025-05-10 09:33:51', NULL),
(174, 14, 24, NULL, NULL, NULL, NULL, NULL, NULL, 2, 14.2, 14.2, 28.4, 'USD', '2025-05-10 09:33:40', '2025-05-10 09:33:53', NULL),
(175, 14, 11, NULL, NULL, NULL, NULL, NULL, NULL, 1, 36.55, 36.55, 36.55, 'USD', '2025-05-10 09:33:41', '2025-05-10 09:33:41', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `icon` text DEFAULT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Activo 2 = Inactivo',
  `imagen` varchar(250) DEFAULT NULL,
  `categorie_second_id` bigint(20) UNSIGNED DEFAULT NULL,
  `categorie_third_id` bigint(20) UNSIGNED DEFAULT NULL,
  `position` double UNSIGNED NOT NULL DEFAULT 1,
  `type_categorie` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Departamento 2 = Categoria 3 = SubCategoria',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `icon`, `state`, `imagen`, `categorie_second_id`, `categorie_third_id`, `position`, `type_categorie`, `created_at`, `updated_at`, `deleted_at`) VALUES
(12, 'Computacion', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-pc-display-horizontal\" viewBox=\"0 0 16 16\">   <path d=\"M1.5 0A1.5 1.5 0 0 0 0 1.5v7A1.5 1.5 0 0 0 1.5 10H6v1H1a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1h-5v-1h4.5A1.5 1.5 0 0 0 16 8.5v-7A1.5 1.5 0 0 0 14.5 0zm0 1h13a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .5-.5M12 12.5a.5.5 0 1 1 1 0 .5.5 0 0 1-1 0m2 0a.5.5 0 1 1 1 0 .5.5 0 0 1-1 0M1.5 12h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1M1 14.25a.25.25 0 0 1 .25-.25h5.5a.25.25 0 1 1 0 .5h-5.5a.25.25 0 0 1-.25-.25\"/> </svg>', 1, 'categories/vaIANU4Y6GxZB20wwjqXjL6qM3O2F4yvrKk4Rbss.png', NULL, NULL, 1, 1, '2025-03-19 08:08:17', '2025-04-14 09:22:03', NULL),
(13, 'Portatiles y Accesorios', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-keyboard-fill\" viewBox=\"0 0 16 16\">   <path d=\"M0 6a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm13 .25v.5c0 .138.112.25.25.25h.5a.25.25 0 0 0 .25-.25v-.5a.25.25 0 0 0-.25-.25h-.5a.25.25 0 0 0-.25.25M2.25 8a.25.25 0 0 0-.25.25v.5c0 .138.112.25.25.25h.5A.25.25 0 0 0 3 8.75v-.5A.25.25 0 0 0 2.75 8zM4 8.25v.5c0 .138.112.25.25.25h.5A.25.25 0 0 0 5 8.75v-.5A.25.25 0 0 0 4.75 8h-.5a.25.25 0 0 0-.25.25M6.25 8a.25.25 0 0 0-.25.25v.5c0 .138.112.25.25.25h.5A.25.25 0 0 0 7 8.75v-.5A.25.25 0 0 0 6.75 8zM8 8.25v.5c0 .138.112.25.25.25h.5A.25.25 0 0 0 9 8.75v-.5A.25.25 0 0 0 8.75 8h-.5a.25.25 0 0 0-.25.25M13.25 8a.25.25 0 0 0-.25.25v.5c0 .138.112.25.25.25h.5a.25.25 0 0 0 .25-.25v-.5a.25.25 0 0 0-.25-.25zm0 2a.25.25 0 0 0-.25.25v.5c0 .138.112.25.25.25h.5a.25.25 0 0 0 .25-.25v-.5a.25.25 0 0 0-.25-.25zm-3-2a.25.25 0 0 0-.25.25v.5c0 .138.112.25.25.25h1.5a.25.25 0 0 0 .25-.25v-.5a.25.25 0 0 0-.25-.25zm.75 2.25v.5c0 .138.112.25.25.25h.5a.25.25 0 0 0 .25-.25v-.5a.25.25 0 0 0-.25-.25h-.5a.25.25 0 0 0-.25.25M11.25 6a.25.25 0 0 0-.25.25v.5c0 .138.112.25.25.25h.5a.25.25 0 0 0 .25-.25v-.5a.25.25 0 0 0-.25-.25zM9 6.25v.5c0 .138.112.25.25.25h.5a.25.25 0 0 0 .25-.25v-.5A.25.25 0 0 0 9.75 6h-.5a.25.25 0 0 0-.25.25M7.25 6a.25.25 0 0 0-.25.25v.5c0 .138.112.25.25.25h.5A.25.25 0 0 0 8 6.75v-.5A.25.25 0 0 0 7.75 6zM5 6.25v.5c0 .138.112.25.25.25h.5A.25.25 0 0 0 6 6.75v-.5A.25.25 0 0 0 5.75 6h-.5a.25.25 0 0 0-.25.25M2.25 6a.25.25 0 0 0-.25.25v.5c0 .138.112.25.25.25h1.5A.25.25 0 0 0 4 6.75v-.5A.25.25 0 0 0 3.75 6zM2 10.25v.5c0 .138.112.25.25.25h.5a.25.25 0 0 0 .25-.25v-.5a.25.25 0 0 0-.25-.25h-.5a.25.25 0 0 0-.25.25M4.25 10a.25.25 0 0 0-.25.25v.5c0 .138.112.25.25.25h5.5a.25.25 0 0 0 .25-.25v-.5a.25.25 0 0 0-.25-.25z\"/> </svg>', 1, 'categories/fzriKE2DqwH3Q9sYOlpBwgclgRLzQfOt7FYTgeWQ.webp', 12, NULL, 1, 2, '2025-03-19 08:10:25', '2025-04-14 09:21:44', NULL),
(14, 'Portatiles', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-laptop-fill\" viewBox=\"0 0 16 16\">   <path d=\"M2.5 2A1.5 1.5 0 0 0 1 3.5V12h14V3.5A1.5 1.5 0 0 0 13.5 2zM0 12.5h16a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 12.5\"/> </svg>', 1, 'categories/w3aKhGb17WZ2nErGxtwxEN7qaQfX3aKYjqrGhxmS.webp', 13, 12, 1, 3, '2025-03-19 08:19:11', '2025-04-14 09:20:43', NULL),
(16, 'PC de Escritorio', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-pc-display\" viewBox=\"0 0 16 16\">   <path d=\"M8 1a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H9a1 1 0 0 1-1-1zm1 13.5a.5.5 0 1 0 1 0 .5.5 0 0 0-1 0m2 0a.5.5 0 1 0 1 0 .5.5 0 0 0-1 0M9.5 1a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1zM9 3.5a.5.5 0 0 0 .5.5h5a.5.5 0 0 0 0-1h-5a.5.5 0 0 0-.5.5M1.5 2A1.5 1.5 0 0 0 0 3.5v7A1.5 1.5 0 0 0 1.5 12H6v2h-.5a.5.5 0 0 0 0 1H7v-4H1.5a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .5-.5H7V2z\"/> </svg>', 1, 'categories/n9SFvxBRP4ht04BJeZXtIT8KVTQU8K2GB5gBCiIB.webp', 12, NULL, 1, 2, '2025-04-06 07:34:55', '2025-04-14 08:49:13', NULL),
(17, 'Torre Gamer', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-pc\" viewBox=\"0 0 16 16\">   <path d=\"M5 0a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1zm.5 14a.5.5 0 1 1 0 1 .5.5 0 0 1 0-1m2 0a.5.5 0 1 1 0 1 .5.5 0 0 1 0-1M5 1.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5M5.5 3h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1\"/> </svg>', 1, 'categories/FPQ6b4OKke6UmWXQeKRec6eHcnx2lQiIBDLQDUnv.webp', 16, 12, 1, 3, '2025-04-06 08:23:34', '2025-04-14 08:48:53', NULL),
(18, 'Vehiculos', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-car-front-fill\" viewBox=\"0 0 16 16\">   <path d=\"M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679q.05.242.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.8.8 0 0 0 .381-.404l.792-1.848ZM3 10a1 1 0 1 0 0-2 1 1 0 0 0 0 2m10 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2M6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2zM2.906 5.189a.51.51 0 0 0 .497.731c.91-.073 3.35-.17 4.597-.17s3.688.097 4.597.17a.51.51 0 0 0 .497-.731l-.956-1.913A.5.5 0 0 0 11.691 3H4.309a.5.5 0 0 0-.447.276L2.906 5.19Z\"/> </svg>', 1, 'categories/nrdKJK1678AcVOzTu06iMjjimkjyZco8QFEyxvcU.png', NULL, NULL, 1, 1, '2025-04-12 04:07:58', '2025-04-14 09:19:48', NULL),
(19, 'Hogar y Muebles', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-house-heart-fill\" viewBox=\"0 0 16 16\">   <path d=\"M7.293 1.5a1 1 0 0 1 1.414 0L11 3.793V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v3.293l2.354 2.353a.5.5 0 0 1-.708.707L8 2.207 1.354 8.853a.5.5 0 1 1-.708-.707z\"/>   <path d=\"m14 9.293-6-6-6 6V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5zm-6-.811c1.664-1.673 5.825 1.254 0 5.018-5.825-3.764-1.664-6.691 0-5.018\"/> </svg>', 1, 'categories/zM6b7RF08QrH85BaLL9nA52LjMQK1XIT2xyeNhw2.png', NULL, NULL, 1, 1, '2025-04-12 04:12:29', '2025-04-14 09:19:29', NULL),
(20, 'Belleza y Cuidado', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-brush-fill\" viewBox=\"0 0 16 16\">   <path d=\"M15.825.12a.5.5 0 0 1 .132.584c-1.53 3.43-4.743 8.17-7.095 10.64a6.1 6.1 0 0 1-2.373 1.534c-.018.227-.06.538-.16.868-.201.659-.667 1.479-1.708 1.74a8.1 8.1 0 0 1-3.078.132 4 4 0 0 1-.562-.135 1.4 1.4 0 0 1-.466-.247.7.7 0 0 1-.204-.288.62.62 0 0 1 .004-.443c.095-.245.316-.38.461-.452.394-.197.625-.453.867-.826.095-.144.184-.297.287-.472l.117-.198c.151-.255.326-.54.546-.848.528-.739 1.201-.925 1.746-.896q.19.012.348.048c.062-.172.142-.38.238-.608.261-.619.658-1.419 1.187-2.069 2.176-2.67 6.18-6.206 9.117-8.104a.5.5 0 0 1 .596.04\"/> </svg>', 1, 'categories/sZWpOzTUA00iScdLmckdRRc9TMLgSzVhM3pwuVGr.png', NULL, NULL, 1, 1, '2025-04-12 04:18:40', '2025-04-14 09:53:38', NULL),
(21, 'Televisores', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-tv-fill\" viewBox=\"0 0 16 16\">   <path d=\"M2.5 13.5A.5.5 0 0 1 3 13h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5M2 2h12s2 0 2 2v6s0 2-2 2H2s-2 0-2-2V4s0-2 2-2\"/> </svg>', 1, 'categories/UV1Nt1P590bmYjP6R65OHMs8pYPszCGnJkQduy8P.png', 15, NULL, 1, 2, '2025-04-13 01:10:51', '2025-04-13 01:10:51', NULL),
(22, 'Moda', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-emoji-sunglasses-fill\" viewBox=\"0 0 16 16\">   <path d=\"M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16M2.31 5.243A1 1 0 0 1 3.28 4H6a1 1 0 0 1 1 1v.116A4.2 4.2 0 0 1 8 5c.35 0 .69.04 1 .116V5a1 1 0 0 1 1-1h2.72a1 1 0 0 1 .97 1.243l-.311 1.242A2 2 0 0 1 11.439 8H11a2 2 0 0 1-1.994-1.839A3 3 0 0 0 8 6c-.393 0-.74.064-1.006.161A2 2 0 0 1 5 8h-.438a2 2 0 0 1-1.94-1.515zM4.969 9.75A3.5 3.5 0 0 0 8 11.5a3.5 3.5 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1-3.898-2.25.5.5 0 0 1 .866-.5z\"/> </svg>', 1, 'categories/aaZL1IRJZi8uARVJWhqrObFPTNGwSY6YcWrFdGum.webp', NULL, NULL, 1, 1, '2025-04-14 08:53:49', '2025-04-14 09:18:51', NULL),
(23, 'Hombre', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-person-standing\" viewBox=\"0 0 16 16\">   <path d=\"M8 3a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3M6 6.75v8.5a.75.75 0 0 0 1.5 0V10.5a.5.5 0 0 1 1 0v4.75a.75.75 0 0 0 1.5 0v-8.5a.25.25 0 1 1 .5 0v2.5a.75.75 0 0 0 1.5 0V6.5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v2.75a.75.75 0 0 0 1.5 0v-2.5a.25.25 0 0 1 .5 0\"/> </svg>', 1, 'categories/ax6xFlIfF1Cf0TzxmmeDl6TkW0RSan924eGYsKDd.webp', 22, NULL, 1, 2, '2025-04-14 08:58:00', '2025-04-14 09:07:54', NULL),
(24, 'Camisetas', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-handbag-fill\" viewBox=\"0 0 16 16\">   <path d=\"M8 1a2 2 0 0 0-2 2v2H5V3a3 3 0 1 1 6 0v2h-1V3a2 2 0 0 0-2-2M5 5H3.36a1.5 1.5 0 0 0-1.483 1.277L.85 13.13A2.5 2.5 0 0 0 3.322 16h9.355a2.5 2.5 0 0 0 2.473-2.87l-1.028-6.853A1.5 1.5 0 0 0 12.64 5H11v1.5a.5.5 0 0 1-1 0V5H6v1.5a.5.5 0 0 1-1 0z\"/> </svg>', 1, 'categories/0gO0g4P55zpGO7GRqwZDuVrNQUCbcTmw0flHUNrl.webp', 23, 22, 1, 3, '2025-04-14 09:05:26', '2025-04-14 09:05:26', NULL),
(25, 'Mujer', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-person-standing-dress\" viewBox=\"0 0 16 16\">   <path d=\"M8 3a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3m-.5 12.25V12h1v3.25a.75.75 0 0 0 1.5 0V12h1l-1-5v-.215a.285.285 0 0 1 .56-.078l.793 2.777a.711.711 0 1 0 1.364-.405l-1.065-3.461A3 3 0 0 0 8.784 3.5H7.216a3 3 0 0 0-2.868 2.118L3.283 9.079a.711.711 0 1 0 1.365.405l.793-2.777a.285.285 0 0 1 .56.078V7l-1 5h1v3.25a.75.75 0 0 0 1.5 0Z\"/> </svg>', 1, 'categories/YMA3J5le0Xq0RN3KE2XTAOPM9lX4psW1sE8UcKqg.webp', 22, NULL, 1, 2, '2025-04-14 09:07:30', '2025-04-14 09:07:30', NULL),
(26, 'Jeans', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-person-standing\" viewBox=\"0 0 16 16\">   <path d=\"M8 3a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3M6 6.75v8.5a.75.75 0 0 0 1.5 0V10.5a.5.5 0 0 1 1 0v4.75a.75.75 0 0 0 1.5 0v-8.5a.25.25 0 1 1 .5 0v2.5a.75.75 0 0 0 1.5 0V6.5a3 3 0 0 0-3-3H7a3 3 0 0 0-3 3v2.75a.75.75 0 0 0 1.5 0v-2.5a.25.25 0 0 1 .5 0\"/> </svg>', 1, 'categories/hqZyq4FT7wUalQ3kB88EVzl7I5Mv9BBj2eOQjUzL.webp', 23, 22, 1, 3, '2025-04-14 09:09:23', '2025-04-14 09:09:23', NULL),
(27, 'Vestidos', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-person-standing-dress\" viewBox=\"0 0 16 16\">   <path d=\"M8 3a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3m-.5 12.25V12h1v3.25a.75.75 0 0 0 1.5 0V12h1l-1-5v-.215a.285.285 0 0 1 .56-.078l.793 2.777a.711.711 0 1 0 1.364-.405l-1.065-3.461A3 3 0 0 0 8.784 3.5H7.216a3 3 0 0 0-2.868 2.118L3.283 9.079a.711.711 0 1 0 1.365.405l.793-2.777a.285.285 0 0 1 .56.078V7l-1 5h1v3.25a.75.75 0 0 0 1.5 0Z\"/> </svg>', 1, 'categories/zOtB3CAfwHwA9OuDv10kY13IDexdTpVffNRjDMKD.webp', 25, 22, 1, 3, '2025-04-14 09:10:25', '2025-04-14 09:10:25', NULL),
(28, 'Pantalones', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-person-standing-dress\" viewBox=\"0 0 16 16\">   <path d=\"M8 3a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3m-.5 12.25V12h1v3.25a.75.75 0 0 0 1.5 0V12h1l-1-5v-.215a.285.285 0 0 1 .56-.078l.793 2.777a.711.711 0 1 0 1.364-.405l-1.065-3.461A3 3 0 0 0 8.784 3.5H7.216a3 3 0 0 0-2.868 2.118L3.283 9.079a.711.711 0 1 0 1.365.405l.793-2.777a.285.285 0 0 1 .56.078V7l-1 5h1v3.25a.75.75 0 0 0 1.5 0Z\"/> </svg>', 1, 'categories/Ke2oi79ZHErk6upuiUVcbjoEpBBK8opts32z2s1q.webp', 25, 22, 1, 3, '2025-04-14 09:12:10', '2025-04-14 09:12:10', NULL),
(29, 'Tecnología', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-android2\" viewBox=\"0 0 16 16\">   <path d=\"m10.213 1.471.691-1.26q.069-.124-.048-.192-.128-.057-.195.058l-.7 1.27A4.8 4.8 0 0 0 8.005.941q-1.032 0-1.956.404l-.7-1.27Q5.281-.037 5.154.02q-.117.069-.049.193l.691 1.259a4.25 4.25 0 0 0-1.673 1.476A3.7 3.7 0 0 0 3.5 5.02h9q0-1.125-.623-2.072a4.27 4.27 0 0 0-1.664-1.476ZM6.22 3.303a.37.37 0 0 1-.267.11.35.35 0 0 1-.263-.11.37.37 0 0 1-.107-.264.37.37 0 0 1 .107-.265.35.35 0 0 1 .263-.11q.155 0 .267.11a.36.36 0 0 1 .112.265.36.36 0 0 1-.112.264m4.101 0a.35.35 0 0 1-.262.11.37.37 0 0 1-.268-.11.36.36 0 0 1-.112-.264q0-.154.112-.265a.37.37 0 0 1 .268-.11q.155 0 .262.11a.37.37 0 0 1 .107.265q0 .153-.107.264M3.5 11.77q0 .441.311.75.311.306.76.307h.758l.01 2.182q0 .414.292.703a.96.96 0 0 0 .7.288.97.97 0 0 0 .71-.288.95.95 0 0 0 .292-.703v-2.182h1.343v2.182q0 .414.292.703a.97.97 0 0 0 .71.288.97.97 0 0 0 .71-.288.95.95 0 0 0 .292-.703v-2.182h.76q.436 0 .749-.308.31-.307.311-.75V5.365h-9zm10.495-6.587a.98.98 0 0 0-.702.278.9.9 0 0 0-.293.685v4.063q0 .406.293.69a.97.97 0 0 0 .702.284q.42 0 .712-.284a.92.92 0 0 0 .293-.69V6.146a.9.9 0 0 0-.293-.685 1 1 0 0 0-.712-.278m-12.702.283a1 1 0 0 1 .712-.283q.41 0 .702.283a.9.9 0 0 1 .293.68v4.063a.93.93 0 0 1-.288.69.97.97 0 0 1-.707.284 1 1 0 0 1-.712-.284.92.92 0 0 1-.293-.69V6.146q0-.396.293-.68\"/> </svg>', 1, 'categories/NAD2vIzQRPcLIcOsii8xNUJvq5MgJIBj5sdH8oDF.png', NULL, NULL, 1, 1, '2025-04-14 09:14:07', '2025-04-14 09:14:07', NULL),
(30, 'Celulares', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-phone-fill\" viewBox=\"0 0 16 16\">   <path d=\"M3 2a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2zm6 11a1 1 0 1 0-2 0 1 1 0 0 0 2 0\"/> </svg>', 1, 'categories/rJv1mdOGwFQ4lBJcIZY9aY8tUh1hLmWwlDLZIeeK.webp', 29, NULL, 1, 2, '2025-04-14 09:15:51', '2025-04-14 09:15:51', NULL),
(31, 'Smartphones', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-phone-fill\" viewBox=\"0 0 16 16\">   <path d=\"M3 2a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2zm6 11a1 1 0 1 0-2 0 1 1 0 0 0 2 0\"/> </svg>', 1, 'categories/pWhSYmpd6aTqURWQ6cQ9iRa7PRi1PfRWgz2obUfu.webp', 30, 29, 1, 3, '2025-04-14 09:17:03', '2025-04-14 09:17:03', NULL),
(32, 'Accesorios', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-earbuds\" viewBox=\"0 0 16 16\">   <path fill-rule=\"evenodd\" d=\"M6.825 4.138c.596 2.141-.36 3.593-2.389 4.117a4.4 4.4 0 0 1-2.018.054c-.048-.01.9 2.778 1.522 4.61l.41 1.205a.52.52 0 0 1-.346.659l-.593.19a.55.55 0 0 1-.69-.34L.184 6.99c-.696-2.137.662-4.309 2.564-4.8 2.029-.523 3.402 0 4.076 1.948zm-.868 2.221c.43-.112.561-.993.292-1.969-.269-.975-.836-1.675-1.266-1.563s-.561.994-.292 1.969.836 1.675 1.266 1.563m3.218-2.221c-.596 2.141.36 3.593 2.389 4.117a4.4 4.4 0 0 0 2.018.054c.048-.01-.9 2.778-1.522 4.61l-.41 1.205a.52.52 0 0 0 .346.659l.593.19c.289.092.6-.06.69-.34l2.536-7.643c.696-2.137-.662-4.309-2.564-4.8-2.029-.523-3.402 0-4.076 1.948m.868 2.221c-.43-.112-.561-.993-.292-1.969.269-.975.836-1.675 1.266-1.563s.561.994.292 1.969-.836 1.675-1.266 1.563\"/> </svg>', 1, 'categories/OPKgS3w69MYkNjoJNZGy1XkWySVZDeYIjA9zJIfh.webp', 30, 29, 1, 3, '2025-04-14 09:18:19', '2025-04-14 09:18:19', NULL),
(33, 'Periféricos', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-mouse-fill\" viewBox=\"0 0 16 16\">   <path d=\"M3 5a5 5 0 0 1 10 0v6a5 5 0 0 1-10 0zm5.5-1.5a.5.5 0 0 0-1 0v2a.5.5 0 0 0 1 0z\"/> </svg>', 1, 'categories/Cg2MqgKffeltjiQpUvfSh1Kx8o3JqAcuXiy8WbJA.webp', 13, 12, 1, 3, '2025-04-14 09:24:44', '2025-04-14 09:24:44', NULL),
(34, 'Cocina', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-egg-fill\" viewBox=\"0 0 16 16\">   <path d=\"M14 10a6 6 0 0 1-12 0C2 5.686 5 0 8 0s6 5.686 6 10\"/> </svg>', 1, 'categories/QghQh1sHMzsLlST9QHsMuMENCcplypp2NqK2K4yJ.webp', 19, NULL, 1, 2, '2025-04-14 09:27:18', '2025-04-14 09:27:18', NULL),
(35, 'Electrodomésticos', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-clock-fill\" viewBox=\"0 0 16 16\">   <path d=\"M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z\"/> </svg>', 1, 'categories/FHIsej4Me2nCFSeg2QDnwy7Oq7k6zHvWzbCwival.webp', 34, 19, 1, 3, '2025-04-14 09:31:22', '2025-04-14 09:31:22', NULL),
(36, 'Utensilios', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-cup-fill\" viewBox=\"0 0 16 16\">   <path fill-rule=\"evenodd\" d=\"M.11 3.187A.5.5 0 0 1 .5 3h13a.5.5 0 0 1 .488.608l-.22.991a3.001 3.001 0 0 1-1.3 5.854l-.132.59A2.5 2.5 0 0 1 9.896 13H4.104a2.5 2.5 0 0 1-2.44-1.958L.012 3.608a.5.5 0 0 1 .098-.42Zm12.574 6.288a2 2 0 0 0 .866-3.899z\"/> </svg>', 1, 'categories/bysg62s2nYUompGyX32QUNxaNbhduBBxA8Ha0qeM.webp', 34, 19, 1, 3, '2025-04-14 09:32:31', '2025-04-14 09:34:24', NULL),
(37, 'Sala', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-easel2-fill\" viewBox=\"0 0 16 16\">   <path d=\"M8.447.276a.5.5 0 0 0-.894 0L7.19 1H2.5A1.5 1.5 0 0 0 1 2.5V10h14V2.5A1.5 1.5 0 0 0 13.5 1H8.809z\"/>   <path fill-rule=\"evenodd\" d=\"M.5 11a.5.5 0 0 0 0 1h2.86l-.845 3.379a.5.5 0 0 0 .97.242L3.89 14h8.22l.405 1.621a.5.5 0 0 0 .97-.242L12.64 12h2.86a.5.5 0 0 0 0-1zm3.64 2 .25-1h7.22l.25 1z\"/> </svg>', 1, 'categories/IvooVzYdFpjsUCGh56jzSgAW1LccQIlZHyq6oThC.webp', 19, NULL, 1, 2, '2025-04-14 09:33:33', '2025-04-14 09:33:33', NULL),
(38, 'Decoración', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-suit-diamond-fill\" viewBox=\"0 0 16 16\">   <path d=\"M2.45 7.4 7.2 1.067a1 1 0 0 1 1.6 0L13.55 7.4a1 1 0 0 1 0 1.2L8.8 14.933a1 1 0 0 1-1.6 0L2.45 8.6a1 1 0 0 1 0-1.2\"/> </svg>', 1, 'categories/AEX0JvuRQR8YGXj6OJzKdu4gO34ac48Hbdw5E77o.webp', 37, 19, 1, 3, '2025-04-14 09:36:31', '2025-04-14 09:36:31', NULL),
(39, 'Infantil', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-balloon-fill\" viewBox=\"0 0 16 16\">   <path fill-rule=\"evenodd\" d=\"M8.48 10.901C11.211 10.227 13 7.837 13 5A5 5 0 0 0 3 5c0 2.837 1.789 5.227 4.52 5.901l-.244.487a.25.25 0 1 0 .448.224l.04-.08c.009.17.024.315.051.45.068.344.208.622.448 1.102l.013.028c.212.422.182.85.05 1.246-.135.402-.366.751-.534 1.003a.25.25 0 0 0 .416.278l.004-.007c.166-.248.431-.646.588-1.115.16-.479.212-1.051-.076-1.629-.258-.515-.365-.732-.419-1.004a2 2 0 0 1-.037-.289l.008.017a.25.25 0 1 0 .448-.224zM4.352 3.356a4 4 0 0 1 3.15-2.325C7.774.997 8 1.224 8 1.5s-.226.496-.498.542c-.95.162-1.749.78-2.173 1.617a.6.6 0 0 1-.52.341c-.346 0-.599-.329-.457-.644\"/> </svg>', 1, 'categories/psSrqdaJ2DHDLqNlib2WKk0CqXECWw0bYcrs8x3s.webp', NULL, NULL, 1, 1, '2025-04-14 09:38:26', '2025-04-14 09:38:26', NULL),
(40, 'Muebles', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-wallet-fill\" viewBox=\"0 0 16 16\">   <path d=\"M1.5 2A1.5 1.5 0 0 0 0 3.5v2h6a.5.5 0 0 1 .5.5c0 .253.08.644.306.958.207.288.557.542 1.194.542s.987-.254 1.194-.542C9.42 6.644 9.5 6.253 9.5 6a.5.5 0 0 1 .5-.5h6v-2A1.5 1.5 0 0 0 14.5 2z\"/>   <path d=\"M16 6.5h-5.551a2.7 2.7 0 0 1-.443 1.042C9.613 8.088 8.963 8.5 8 8.5s-1.613-.412-2.006-.958A2.7 2.7 0 0 1 5.551 6.5H0v6A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5z\"/> </svg>', 1, 'categories/jtyh5ZFSMoxuWfIOpMmlh4mogpdIB3nOznQS0iYr.webp', 37, 19, 1, 3, '2025-04-14 09:41:49', '2025-04-14 09:41:49', NULL),
(41, 'Juguetes', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-pencil-fill\" viewBox=\"0 0 16 16\">   <path d=\"M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z\"/> </svg>', 1, 'categories/LBCps0Kq6N59vd00yXRb0OAIxQFmRZN5NfQRQqxY.webp', 39, NULL, 1, 2, '2025-04-14 09:43:31', '2025-04-14 09:43:31', NULL),
(42, 'Juguetes Educativos', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-lightbulb-fill\" viewBox=\"0 0 16 16\">   <path d=\"M2 6a6 6 0 1 1 10.174 4.31c-.203.196-.359.4-.453.619l-.762 1.769A.5.5 0 0 1 10.5 13h-5a.5.5 0 0 1-.46-.302l-.761-1.77a2 2 0 0 0-.453-.618A5.98 5.98 0 0 1 2 6m3 8.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1l-.224.447a1 1 0 0 1-.894.553H6.618a1 1 0 0 1-.894-.553L5.5 15a.5.5 0 0 1-.5-.5\"/> </svg>', 1, 'categories/86Xm1UanDnQ0r949S2zTw7aZDbfPXTzrmse5Yxv9.webp', 41, 39, 1, 3, '2025-04-14 09:46:09', '2025-04-14 22:45:12', NULL),
(43, 'Juguetes Electrónicos', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-lightning-charge-fill\" viewBox=\"0 0 16 16\">   <path d=\"M11.251.068a.5.5 0 0 1 .227.58L9.677 6.5H13a.5.5 0 0 1 .364.843l-8 8.5a.5.5 0 0 1-.842-.49L6.323 9.5H3a.5.5 0 0 1-.364-.843l8-8.5a.5.5 0 0 1 .615-.09z\"/> </svg>', 1, 'categories/C9HN14KjShqZEz6DQjNY14CsyfZOGCzD4CUiUOjG.webp', 41, 39, 1, 3, '2025-04-14 09:47:12', '2025-04-14 22:44:38', NULL),
(44, 'Ropa', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-person-heart\" viewBox=\"0 0 16 16\">   <path d=\"M9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0m-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4m13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276Z\"/> </svg>', 1, 'categories/ZBsQVPqcQQnz84a4sa2iMPcmTJH6MgAS4wPQ7hDk.webp', 39, NULL, 1, 2, '2025-04-14 09:49:57', '2025-04-14 09:49:57', NULL),
(45, 'Bebé (0-2 años)', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-person-plus-fill\" viewBox=\"0 0 16 16\">   <path d=\"M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6\"/>   <path fill-rule=\"evenodd\" d=\"M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5\"/> </svg>', 1, 'categories/Tvd7jhbhIs6HGuZLh0bmXvZu8TBvsjkLucqnmPIx.webp', 44, 39, 1, 3, '2025-04-14 09:51:23', '2025-04-14 09:51:23', NULL),
(46, 'Niños (3-12 años)', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-person-raised-hand\" viewBox=\"0 0 16 16\">   <path d=\"M6 6.207v9.043a.75.75 0 0 0 1.5 0V10.5a.5.5 0 0 1 1 0v4.75a.75.75 0 0 0 1.5 0v-8.5a.25.25 0 1 1 .5 0v2.5a.75.75 0 0 0 1.5 0V6.5a3 3 0 0 0-3-3H6.236a1 1 0 0 1-.447-.106l-.33-.165A.83.83 0 0 1 5 2.488V.75a.75.75 0 0 0-1.5 0v2.083c0 .715.404 1.37 1.044 1.689L5.5 5c.32.32.5.754.5 1.207\"/>   <path d=\"M8 3a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3\"/> </svg>', 1, 'categories/9Q8ubKE4yEGDEEewZJMWkhNzbRWgQrO8ZtdZr30Y.webp', 44, 39, 1, 3, '2025-04-14 09:53:00', '2025-04-14 09:53:00', NULL),
(47, 'Maquillaje', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-yelp\" viewBox=\"0 0 16 16\">   <path d=\"m4.188 10.095.736-.17.073-.02A.813.813 0 0 0 5.45 8.65a1 1 0 0 0-.3-.258 3 3 0 0 0-.428-.198l-.808-.295a76 76 0 0 0-1.364-.493C2.253 7.3 2 7.208 1.783 7.14c-.041-.013-.087-.025-.124-.038a2.1 2.1 0 0 0-.606-.116.72.72 0 0 0-.572.245 2 2 0 0 0-.105.132 1.6 1.6 0 0 0-.155.309c-.15.443-.225.908-.22 1.376.002.423.013.966.246 1.334a.8.8 0 0 0 .22.24c.166.114.333.129.507.141.26.019.513-.045.764-.103l2.447-.566zm8.219-3.911a4.2 4.2 0 0 0-.8-1.14 1.6 1.6 0 0 0-.275-.21 2 2 0 0 0-.15-.073.72.72 0 0 0-.621.031c-.142.07-.294.182-.496.37-.028.028-.063.06-.094.089-.167.156-.353.35-.574.575q-.51.516-1.01 1.042l-.598.62a3 3 0 0 0-.298.365 1 1 0 0 0-.157.364.8.8 0 0 0 .007.301q0 .007.003.013a.81.81 0 0 0 .945.616l.074-.014 3.185-.736c.251-.058.506-.112.732-.242.151-.088.295-.175.394-.35a.8.8 0 0 0 .093-.313c.05-.434-.178-.927-.36-1.308M6.706 7.523c.23-.29.23-.722.25-1.075.07-1.181.143-2.362.201-3.543.022-.448.07-.89.044-1.34-.022-.372-.025-.799-.26-1.104C6.528-.077 5.644-.033 5.04.05q-.278.038-.553.104a8 8 0 0 0-.543.149c-.58.19-1.393.537-1.53 1.204-.078.377.106.763.249 1.107.173.417.41.792.625 1.185.57 1.036 1.15 2.066 1.728 3.097.172.308.36.697.695.857q.033.015.068.025c.15.057.313.068.469.032l.028-.007a.8.8 0 0 0 .377-.226zm-.276 3.161a.74.74 0 0 0-.923-.234 1 1 0 0 0-.145.09 2 2 0 0 0-.346.354c-.026.033-.05.077-.08.104l-.512.705q-.435.591-.861 1.193c-.185.26-.346.479-.472.673l-.072.11c-.152.235-.238.406-.282.559a.7.7 0 0 0-.03.314c.013.11.05.217.108.312q.046.07.1.138a1.6 1.6 0 0 0 .257.237 4.5 4.5 0 0 0 2.196.76 1.6 1.6 0 0 0 .349-.027 2 2 0 0 0 .163-.048.8.8 0 0 0 .278-.178.7.7 0 0 0 .17-.266c.059-.147.098-.335.123-.613l.012-.13c.02-.231.03-.502.045-.821q.037-.735.06-1.469l.033-.87a2.1 2.1 0 0 0-.055-.623 1 1 0 0 0-.117-.27Zm5.783 1.362a2.2 2.2 0 0 0-.498-.378l-.112-.067c-.199-.12-.438-.246-.719-.398q-.644-.353-1.295-.695l-.767-.407c-.04-.012-.08-.04-.118-.059a2 2 0 0 0-.466-.166 1 1 0 0 0-.17-.018.74.74 0 0 0-.725.616 1 1 0 0 0 .01.293c.038.204.13.406.224.583l.41.768q.341.65.696 1.294c.152.28.28.52.398.719q.036.057.068.112c.145.239.261.39.379.497a.73.73 0 0 0 .596.201 2 2 0 0 0 .168-.029 1.6 1.6 0 0 0 .325-.129 4 4 0 0 0 .855-.64c.306-.3.577-.63.788-1.006q.045-.08.076-.165a2 2 0 0 0 .051-.161q.019-.083.029-.168a.8.8 0 0 0-.038-.327.7.7 0 0 0-.165-.27\"/> </svg>', 1, 'categories/d5DDvFbpvnodOB56kjyDmI0Ui0p6sIamjU31mVnb.webp', 20, NULL, 1, 2, '2025-04-14 09:55:08', '2025-04-14 09:55:08', NULL),
(49, 'Cuidado del Cabello', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-bag-heart-fill\" viewBox=\"0 0 16 16\">   <path d=\"M11.5 4v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4zM8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1m0 6.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132\"/> </svg>', 1, 'categories/9wD0v2cRLHTn8HMCVOMY58sF0CcXejDnRTNID3Y8.webp', 20, NULL, 1, 2, '2025-04-14 10:00:21', '2025-04-14 10:00:21', NULL),
(50, 'Labios', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-bookmark-heart-fill\" viewBox=\"0 0 16 16\">   <path d=\"M2 15.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2zM8 4.41c1.387-1.425 4.854 1.07 0 4.277C3.146 5.48 6.613 2.986 8 4.412z\"/> </svg>', 1, 'categories/QBCvz7bOyenXZE9doEBzJlUh40YMhwlXQkLkgQSz.webp', 47, 20, 1, 3, '2025-04-14 10:01:26', '2025-04-14 10:02:01', NULL),
(51, 'Shampoos', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-box2-heart-fill\" viewBox=\"0 0 16 16\">   <path d=\"M3.75 0a1 1 0 0 0-.8.4L.1 4.2a.5.5 0 0 0-.1.3V15a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1V4.5a.5.5 0 0 0-.1-.3L13.05.4a1 1 0 0 0-.8-.4zM8.5 4h6l.5.667V5H1v-.333L1.5 4h6V1h1zM8 7.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132\"/> </svg>', 1, 'categories/5YncdXXKHYqjKe1c81oaEURfZ75MNlqDyUh1EXW8.webp', 49, 20, 1, 3, '2025-04-14 10:03:15', '2025-04-14 10:03:15', NULL),
(52, 'Tratamientos', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-capsule\" viewBox=\"0 0 16 16\">   <path d=\"M1.828 8.9 8.9 1.827a4 4 0 1 1 5.657 5.657l-7.07 7.071A4 4 0 1 1 1.827 8.9Zm9.128.771 2.893-2.893a3 3 0 1 0-4.243-4.242L6.713 5.429z\"/> </svg>', 1, 'categories/OaWAtq9Pppu51uF9HmvF7MZCG80JHDzbcB9BTjrp.webp', 49, 20, 1, 3, '2025-04-14 10:05:05', '2025-04-14 10:05:05', NULL),
(53, 'Gadgets', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-joystick\" viewBox=\"0 0 16 16\">   <path d=\"M10 2a2 2 0 0 1-1.5 1.937v5.087c.863.083 1.5.377 1.5.726 0 .414-.895.75-2 .75s-2-.336-2-.75c0-.35.637-.643 1.5-.726V3.937A2 2 0 1 1 10 2\"/>   <path d=\"M0 9.665v1.717a1 1 0 0 0 .553.894l6.553 3.277a2 2 0 0 0 1.788 0l6.553-3.277a1 1 0 0 0 .553-.894V9.665c0-.1-.06-.19-.152-.23L9.5 6.715v.993l5.227 2.178a.125.125 0 0 1 .001.23l-5.94 2.546a2 2 0 0 1-1.576 0l-5.94-2.546a.125.125 0 0 1 .001-.23L6.5 7.708l-.013-.988L.152 9.435a.25.25 0 0 0-.152.23\"/> </svg>', 1, 'categories/rewVqlzHw7ThnEmL1z2EKVGpM3EX9vz9qDeObr7t.webp', 29, NULL, 1, 2, '2025-04-14 22:35:44', '2025-04-14 22:35:44', NULL),
(57, 'Electrónicos', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-lightning-fill\" viewBox=\"0 0 16 16\">   <path d=\"M5.52.359A.5.5 0 0 1 6 0h4a.5.5 0 0 1 .474.658L8.694 6H12.5a.5.5 0 0 1 .395.807l-7 9a.5.5 0 0 1-.873-.454L6.823 9.5H3.5a.5.5 0 0 1-.48-.641z\"/> </svg>', 1, 'categories/slPGLaHIrGnCGNRE93H9IWN4bFn8fMZ58B7oIpCK.webp', 53, 29, 1, 3, '2025-04-14 22:45:57', '2025-04-14 22:45:57', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupones`
--

CREATE TABLE `cupones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(250) NOT NULL,
  `type_discount` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Porcentaje 2 = Monto Fijo',
  `discount` double NOT NULL,
  `type_count` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Ilimitado 2 = Limitado',
  `num_use` double NOT NULL DEFAULT 0,
  `type_cupone` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Producto 2 = Categorias 3 = Marcas',
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Activo 2 = Inactivo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cupones`
--

INSERT INTO `cupones` (`id`, `code`, `type_discount`, `discount`, `type_count`, `num_use`, `type_cupone`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(15, 'CODIGO_MAYO', 1, 40, 1, 0, 1, 1, '2025-05-08 03:13:02', '2025-05-08 03:13:02', NULL),
(16, 'NAVIDAD2025', 1, 50, 1, 0, 2, 1, '2025-05-08 03:13:58', '2025-05-08 03:13:58', NULL),
(17, 'CODIGOAÑONUEVO', 1, 70, 1, 0, 3, 1, '2025-05-09 05:17:41', '2025-05-09 05:17:41', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupone_brands`
--

CREATE TABLE `cupone_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `cupone_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cupone_brands`
--

INSERT INTO `cupone_brands` (`id`, `brand_id`, `cupone_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 9, 17, '2025-05-09 05:17:41', '2025-05-09 05:18:15', '2025-05-09 05:18:15'),
(6, 8, 17, '2025-05-09 05:17:41', '2025-05-09 05:18:15', '2025-05-09 05:18:15'),
(7, 9, 17, '2025-05-09 05:18:15', '2025-05-09 05:18:15', NULL),
(8, 8, 17, '2025-05-09 05:18:15', '2025-05-09 05:18:15', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupone_categories`
--

CREATE TABLE `cupone_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `categorie_id` bigint(20) UNSIGNED NOT NULL,
  `cupone_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cupone_categories`
--

INSERT INTO `cupone_categories` (`id`, `categorie_id`, `cupone_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(13, 39, 16, '2025-05-08 03:13:58', '2025-05-08 03:13:58', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cupone_products`
--

CREATE TABLE `cupone_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cupone_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cupone_products`
--

INSERT INTO `cupone_products` (`id`, `product_id`, `cupone_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 7, 14, '2025-04-06 08:54:49', '2025-04-06 08:54:49', NULL),
(9, 17, 15, '2025-05-08 03:13:02', '2025-05-08 03:14:17', '2025-05-08 03:14:17'),
(10, 17, 15, '2025-05-08 03:14:17', '2025-05-08 10:13:42', '2025-05-08 10:13:42'),
(11, 19, 15, '2025-05-08 03:14:17', '2025-05-08 10:13:42', '2025-05-08 10:13:42'),
(12, 17, 15, '2025-05-08 10:13:42', '2025-05-08 10:13:42', NULL),
(13, 19, 15, '2025-05-08 10:13:42', '2025-05-08 10:13:42', NULL),
(14, 13, 15, '2025-05-08 10:13:42', '2025-05-08 10:13:42', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(250) NOT NULL,
  `type_campaing` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Normal 2 = Flash 3 = Link',
  `type_discount` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Porcentaje 2 = Monto Fijo',
  `discount` double NOT NULL,
  `discount_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Producto 2 = Categorias 3 = Marcas',
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Activo 2 = Inactivo',
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `discounts`
--

INSERT INTO `discounts` (`id`, `code`, `type_campaing`, `type_discount`, `discount`, `discount_type`, `state`, `start_date`, `end_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(33, '681a8829300b3', 1, 1, 30, 1, 1, '2025-05-06 05:00:00', '2025-05-22 05:00:00', '2025-05-07 03:07:37', '2025-05-09 04:42:48', NULL),
(34, '681c3d404ec9e', 2, 1, 50, 3, 1, '2025-05-08 05:00:00', '2025-05-29 05:00:00', '2025-05-08 10:12:32', '2025-05-08 10:12:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discount_brands`
--

CREATE TABLE `discount_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `discount_brands`
--

INSERT INTO `discount_brands` (`id`, `brand_id`, `discount_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 10, 15, '2025-04-16 03:33:11', '2025-04-16 03:33:11', NULL),
(3, 27, 16, '2025-04-16 04:24:53', '2025-04-16 04:27:40', '2025-04-16 04:27:40'),
(4, 27, 16, '2025-04-16 04:27:40', '2025-04-16 06:44:18', '2025-04-16 06:44:18'),
(5, 27, 16, '2025-04-16 06:44:18', '2025-04-16 06:45:25', '2025-04-16 06:45:25'),
(6, 27, 16, '2025-04-16 06:45:25', '2025-04-16 06:45:25', NULL),
(7, 8, 18, '2025-04-27 06:35:38', '2025-04-27 06:35:38', NULL),
(8, 11, 22, '2025-04-29 08:30:37', '2025-04-29 08:30:37', NULL),
(9, 8, 27, '2025-04-29 08:41:32', '2025-04-29 08:42:58', '2025-04-29 08:42:58'),
(10, 8, 27, '2025-04-29 08:42:58', '2025-04-29 08:42:58', NULL),
(11, 8, 29, '2025-05-01 06:01:21', '2025-05-01 06:01:21', NULL),
(12, 8, 30, '2025-05-02 01:02:07', '2025-05-02 01:02:59', '2025-05-02 01:02:59'),
(13, 8, 30, '2025-05-02 01:02:59', '2025-05-02 01:02:59', NULL),
(14, 8, 32, '2025-05-07 03:04:37', '2025-05-08 09:31:50', '2025-05-08 09:31:50'),
(15, 11, 32, '2025-05-08 09:31:50', '2025-05-08 10:10:37', '2025-05-08 10:10:37'),
(16, 11, 32, '2025-05-08 10:10:37', '2025-05-08 10:10:47', '2025-05-08 10:10:47'),
(17, 11, 32, '2025-05-08 10:10:47', '2025-05-08 10:10:47', NULL),
(18, 8, 34, '2025-05-08 10:12:32', '2025-05-08 10:12:32', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discount_categories`
--

CREATE TABLE `discount_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `categorie_id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `discount_categories`
--

INSERT INTO `discount_categories` (`id`, `categorie_id`, `discount_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 29, 14, '2025-04-16 03:32:01', '2025-04-16 03:32:01', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discount_products`
--

CREATE TABLE `discount_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `discount_products`
--

INSERT INTO `discount_products` (`id`, `product_id`, `discount_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 7, 7, '2025-04-06 09:36:37', '2025-04-06 09:36:37', NULL),
(6, 27, 8, '2025-04-14 21:15:47', '2025-04-14 21:15:47', NULL),
(7, 28, 9, '2025-04-14 21:28:41', '2025-04-14 21:28:41', NULL),
(8, 12, 10, '2025-04-15 04:02:15', '2025-04-15 04:02:15', NULL),
(23, 21, 11, '2025-04-15 09:21:40', '2025-04-27 06:46:09', '2025-04-27 06:46:09'),
(24, 28, 11, '2025-04-15 09:21:40', '2025-04-27 06:46:09', '2025-04-27 06:46:09'),
(25, 34, 11, '2025-04-15 09:21:40', '2025-04-27 06:46:09', '2025-04-27 06:46:09'),
(27, 30, 11, '2025-04-15 09:21:40', '2025-04-27 06:46:09', '2025-04-27 06:46:09'),
(28, 29, 11, '2025-04-15 09:21:40', '2025-04-27 06:46:09', '2025-04-27 06:46:09'),
(29, 23, 11, '2025-04-15 09:21:40', '2025-04-27 06:46:09', '2025-04-27 06:46:09'),
(30, 14, 12, '2025-04-16 00:48:50', '2025-04-16 04:20:16', '2025-04-16 04:20:16'),
(33, 33, 13, '2025-04-16 01:17:56', '2025-04-16 03:27:17', '2025-04-16 03:27:17'),
(34, 33, 13, '2025-04-16 03:27:17', '2025-04-16 03:27:17', NULL),
(35, 14, 12, '2025-04-16 04:20:16', '2025-04-16 04:21:02', '2025-04-16 04:21:02'),
(36, 14, 12, '2025-04-16 04:21:02', '2025-04-16 04:23:16', '2025-04-16 04:23:16'),
(37, 14, 12, '2025-04-16 04:23:16', '2025-04-16 04:28:44', '2025-04-16 04:28:44'),
(38, 14, 12, '2025-04-16 04:28:44', '2025-04-16 04:29:27', '2025-04-16 04:29:27'),
(39, 14, 12, '2025-04-16 04:29:27', '2025-04-16 06:43:17', '2025-04-16 06:43:17'),
(40, 14, 12, '2025-04-16 06:43:17', '2025-04-16 06:44:08', '2025-04-16 06:44:08'),
(41, 14, 12, '2025-04-16 06:44:08', '2025-04-16 06:44:40', '2025-04-16 06:44:40'),
(42, 14, 12, '2025-04-16 06:44:40', '2025-04-16 06:45:15', '2025-04-16 06:45:15'),
(43, 14, 12, '2025-04-16 06:45:15', '2025-04-16 06:45:15', NULL),
(44, 32, 17, '2025-04-27 06:23:07', '2025-04-27 06:23:07', NULL),
(45, 34, 19, '2025-04-27 06:38:44', '2025-04-27 06:38:44', NULL),
(46, 21, 11, '2025-04-27 06:46:09', '2025-04-27 06:46:09', NULL),
(47, 28, 11, '2025-04-27 06:46:09', '2025-04-27 06:46:09', NULL),
(48, 34, 11, '2025-04-27 06:46:09', '2025-04-27 06:46:09', NULL),
(49, 30, 11, '2025-04-27 06:46:09', '2025-04-27 06:46:09', NULL),
(50, 29, 11, '2025-04-27 06:46:09', '2025-04-27 06:46:09', NULL),
(51, 23, 11, '2025-04-27 06:46:09', '2025-04-27 06:46:09', NULL),
(52, 27, 20, '2025-04-27 06:46:49', '2025-04-27 06:46:49', NULL),
(53, 6, 21, '2025-04-28 06:40:04', '2025-04-28 06:40:04', NULL),
(54, 32, 22, '2025-04-29 08:24:18', '2025-04-29 08:27:59', '2025-04-29 08:27:59'),
(55, 32, 22, '2025-04-29 08:27:59', '2025-04-29 08:30:37', '2025-04-29 08:30:37'),
(56, 32, 22, '2025-04-29 08:30:37', '2025-04-29 08:30:37', NULL),
(57, 32, 23, '2025-04-29 08:32:13', '2025-04-29 08:32:13', NULL),
(58, 32, 24, '2025-04-29 08:33:12', '2025-04-29 08:33:12', NULL),
(59, 32, 25, '2025-04-29 08:38:30', '2025-04-29 08:38:30', NULL),
(60, 27, 26, '2025-04-29 08:41:02', '2025-04-29 08:41:02', NULL),
(61, 7, 28, '2025-04-29 08:46:30', '2025-04-29 08:46:30', NULL),
(62, 27, 31, '2025-05-02 01:16:39', '2025-05-02 01:29:35', '2025-05-02 01:29:35'),
(63, 27, 31, '2025-05-02 01:29:35', '2025-05-02 01:53:50', '2025-05-02 01:53:50'),
(64, 32, 31, '2025-05-02 01:29:35', '2025-05-02 01:53:50', '2025-05-02 01:53:50'),
(65, 27, 31, '2025-05-02 01:53:50', '2025-05-02 01:56:54', '2025-05-02 01:56:54'),
(66, 32, 31, '2025-05-02 01:53:50', '2025-05-02 01:56:54', '2025-05-02 01:56:54'),
(67, 6, 31, '2025-05-02 01:53:50', '2025-05-02 01:56:54', '2025-05-02 01:56:54'),
(68, 27, 31, '2025-05-02 01:56:54', '2025-05-02 01:56:54', NULL),
(69, 32, 31, '2025-05-02 01:56:54', '2025-05-02 01:56:54', NULL),
(70, 6, 31, '2025-05-02 01:56:54', '2025-05-02 01:56:54', NULL),
(71, 12, 31, '2025-05-02 01:56:54', '2025-05-02 01:56:54', NULL),
(72, 34, 33, '2025-05-07 03:07:37', '2025-05-08 09:31:21', '2025-05-08 09:31:21'),
(73, 33, 33, '2025-05-07 03:07:37', '2025-05-08 09:31:21', '2025-05-08 09:31:21'),
(74, 32, 33, '2025-05-07 03:07:37', '2025-05-08 09:31:21', '2025-05-08 09:31:21'),
(75, 27, 33, '2025-05-07 03:07:37', '2025-05-08 09:31:21', '2025-05-08 09:31:21'),
(76, 12, 33, '2025-05-07 03:07:37', '2025-05-08 09:31:21', '2025-05-08 09:31:21'),
(77, 6, 33, '2025-05-07 03:07:37', '2025-05-08 09:31:21', '2025-05-08 09:31:21'),
(78, 7, 33, '2025-05-07 03:07:37', '2025-05-08 09:31:21', '2025-05-08 09:31:21'),
(79, 14, 33, '2025-05-07 03:07:37', '2025-05-08 09:31:21', '2025-05-08 09:31:21'),
(80, 34, 33, '2025-05-08 09:31:21', '2025-05-08 09:33:17', '2025-05-08 09:33:17'),
(81, 33, 33, '2025-05-08 09:31:21', '2025-05-08 09:33:17', '2025-05-08 09:33:17'),
(82, 32, 33, '2025-05-08 09:31:21', '2025-05-08 09:33:17', '2025-05-08 09:33:17'),
(83, 12, 33, '2025-05-08 09:31:21', '2025-05-08 09:33:17', '2025-05-08 09:33:17'),
(84, 6, 33, '2025-05-08 09:31:21', '2025-05-08 09:33:17', '2025-05-08 09:33:17'),
(85, 7, 33, '2025-05-08 09:31:21', '2025-05-08 09:33:17', '2025-05-08 09:33:17'),
(86, 14, 33, '2025-05-08 09:31:21', '2025-05-08 09:33:17', '2025-05-08 09:33:17'),
(87, 34, 33, '2025-05-08 09:33:17', '2025-05-08 09:45:21', '2025-05-08 09:45:21'),
(88, 33, 33, '2025-05-08 09:33:17', '2025-05-08 09:45:21', '2025-05-08 09:45:21'),
(89, 32, 33, '2025-05-08 09:33:17', '2025-05-08 09:45:21', '2025-05-08 09:45:21'),
(90, 12, 33, '2025-05-08 09:33:17', '2025-05-08 09:45:21', '2025-05-08 09:45:21'),
(91, 6, 33, '2025-05-08 09:33:17', '2025-05-08 09:45:21', '2025-05-08 09:45:21'),
(92, 7, 33, '2025-05-08 09:33:17', '2025-05-08 09:45:21', '2025-05-08 09:45:21'),
(93, 14, 33, '2025-05-08 09:33:17', '2025-05-08 09:45:21', '2025-05-08 09:45:21'),
(94, 27, 33, '2025-05-08 09:33:17', '2025-05-08 09:45:21', '2025-05-08 09:45:21'),
(95, 34, 33, '2025-05-08 09:45:21', '2025-05-08 09:45:21', '2025-05-08 09:45:21'),
(96, 33, 33, '2025-05-08 09:45:21', '2025-05-08 09:45:21', '2025-05-08 09:45:21'),
(97, 32, 33, '2025-05-08 09:45:21', '2025-05-08 09:45:21', '2025-05-08 09:45:21'),
(98, 12, 33, '2025-05-08 09:45:21', '2025-05-08 09:45:21', '2025-05-08 09:45:21'),
(99, 6, 33, '2025-05-08 09:45:21', '2025-05-08 09:45:21', '2025-05-08 09:45:21'),
(100, 7, 33, '2025-05-08 09:45:21', '2025-05-08 09:45:21', '2025-05-08 09:45:21'),
(101, 14, 33, '2025-05-08 09:45:21', '2025-05-08 09:45:21', '2025-05-08 09:45:21'),
(102, 27, 33, '2025-05-08 09:45:21', '2025-05-08 09:45:21', '2025-05-08 09:45:21'),
(103, 13, 33, '2025-05-08 09:45:21', '2025-05-08 09:45:21', '2025-05-08 09:45:21'),
(104, 34, 33, '2025-05-08 09:45:21', '2025-05-08 10:12:05', '2025-05-08 10:12:05'),
(105, 33, 33, '2025-05-08 09:45:21', '2025-05-08 10:12:05', '2025-05-08 10:12:05'),
(106, 32, 33, '2025-05-08 09:45:22', '2025-05-08 10:12:05', '2025-05-08 10:12:05'),
(107, 12, 33, '2025-05-08 09:45:22', '2025-05-08 10:12:05', '2025-05-08 10:12:05'),
(108, 6, 33, '2025-05-08 09:45:22', '2025-05-08 10:12:05', '2025-05-08 10:12:05'),
(109, 7, 33, '2025-05-08 09:45:22', '2025-05-08 10:12:05', '2025-05-08 10:12:05'),
(110, 14, 33, '2025-05-08 09:45:22', '2025-05-08 10:12:05', '2025-05-08 10:12:05'),
(111, 27, 33, '2025-05-08 09:45:22', '2025-05-08 10:12:05', '2025-05-08 10:12:05'),
(112, 13, 33, '2025-05-08 09:45:22', '2025-05-08 10:12:05', '2025-05-08 10:12:05'),
(113, 34, 33, '2025-05-08 10:12:05', '2025-05-09 04:42:48', '2025-05-09 04:42:48'),
(114, 33, 33, '2025-05-08 10:12:05', '2025-05-09 04:42:48', '2025-05-09 04:42:48'),
(115, 32, 33, '2025-05-08 10:12:05', '2025-05-09 04:42:48', '2025-05-09 04:42:48'),
(116, 6, 33, '2025-05-08 10:12:05', '2025-05-09 04:42:48', '2025-05-09 04:42:48'),
(117, 7, 33, '2025-05-08 10:12:05', '2025-05-09 04:42:48', '2025-05-09 04:42:48'),
(118, 14, 33, '2025-05-08 10:12:05', '2025-05-09 04:42:48', '2025-05-09 04:42:48'),
(119, 34, 33, '2025-05-09 04:42:48', '2025-05-09 04:42:48', NULL),
(120, 33, 33, '2025-05-09 04:42:48', '2025-05-09 04:42:48', NULL),
(121, 32, 33, '2025-05-09 04:42:48', '2025-05-09 04:42:48', NULL),
(122, 6, 33, '2025-05-09 04:42:48', '2025-05-09 04:42:48', NULL),
(123, 7, 33, '2025-05-09 04:42:48', '2025-05-09 04:42:48', NULL),
(124, 14, 33, '2025-05-09 04:42:48', '2025-05-09 04:42:48', NULL),
(125, 27, 33, '2025-05-09 04:42:48', '2025-05-09 04:42:48', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(250) NOT NULL,
  `slug` text NOT NULL,
  `sku` varchar(50) NOT NULL,
  `price_cop` double NOT NULL,
  `price_usd` double NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resumen` longtext NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Pendiente, 2 = Publico',
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `categorie_first_id` bigint(20) UNSIGNED NOT NULL,
  `categorie_second_id` bigint(20) UNSIGNED DEFAULT NULL,
  `categorie_third_id` bigint(20) UNSIGNED DEFAULT NULL,
  `stock` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `price_cop`, `price_usd`, `description`, `resumen`, `imagen`, `state`, `tags`, `brand_id`, `categorie_first_id`, `categorie_second_id`, `categorie_third_id`, `stock`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 'Torre Gamer Amd Ryzen 7 5700x Ddr4 32gb Ssd 1tb Rtx 4060 8gb', 'torre-gamer-amd-ryzen-7-5700x-ddr4-32gb-ssd-1tb-rtx-4060-8gb', 'Thermaltake S200 4FAN ARGB', 4463907, 1098, '<p>AVANTECH SYSTEM<br />\r\n-----------------------------------------------------<br />\r\nNUESTROS PRODUCTOS<br />\r\n&bull; Producto totalmente nuevo y sellado<br />\r\n&bull; Env&iacute;os y pagos 100% seguros con Mercadoenvios y Mercadopago<br />\r\n&bull; Garant&iacute;a total de nuestros productos<br />\r\n-----------------------------------------------------<br />\r\nCARACTER&Iacute;STICAS PRINCIPALES<br />\r\n&bull; Chasis: Thermaltake S200 4FAN ARGB (Negro o Blanco)<br />\r\n&bull; Fuente: Thermaltake BX1 650W 80+ Bronze<br />\r\n&bull; Board: B550M WIFI (Marca Msi, Asus. Gigabyte &oacute; AsRock seg&uacute;n disponibilidad)<br />\r\n&bull; Procesador: AMD RYZEN 7 5700X (8 n&uacute;cleos / 16 subprocesos)<br />\r\n&bull; Tarjeta de Video: MSI GeForce RTX 4060 8GB GDDR6 VENTUS 2X XS OC 2FAN<br />\r\n&bull; Memoria RAM: DDR4 32 GB 3200Mhz (2x16) Blindada<br />\r\n&bull; Disco S&oacute;lido SSD: Kingston NV2 PCIe Nvme M.2 1TB &oacute; Crucial P3 Plus PCIe Nvme M.2 1TB<br />\r\n&bull; Este equipo se entrega totalmente ensamblado y listo para su uso.<br />\r\n<br />\r\nGarant&iacute;a del vendedor: 12 meses</p>', 'Potente torre gamer con Ryzen 7, 32 GB de RAM y gráfica RTX 4060, ideal para juegos exigentes y alto rendimiento.', 'products/MXthju3Bh23P3fJwQcDnVsTewMfPGonmklCi3AVu.webp', 2, '[{\"item_id\":1742355081592,\"item_text\":\"Torre\"},{\"item_id\":1742355084032,\"item_text\":\"Gaming\"},{\"item_id\":1742355086336,\"item_text\":\"Ryzen\"},{\"item_id\":1742355097824,\"item_text\":\"AMD\"},{\"item_id\":1742355099585,\"item_text\":\"RTX\"},{\"item_id\":1742355187897,\"item_text\":\"Ssd\"}]', 6, 12, 16, 17, 20, '2025-03-19 08:33:30', '2025-05-09 10:10:11', NULL),
(7, 'Portátil Gamer Alienware M16 Core Ultra 9 40gb 1tb Rtx 4060', 'portatil-gamer-alienware-m16-core-ultra-9-40gb-1tb-rtx-4060', 'PW-8841568710367', 9775906, 2320, '<p>El Dell Alienware m16 R2 con tarjeta de video NVIDIA GeForce RTX 4060 se consolida como una soluci&oacute;n de alto rendimiento para usuarios exigentes que buscan potencia, confiabilidad y versatilidad. Este port&aacute;til no solo est&aacute; dise&ntilde;ado para gamers de &eacute;lite, sino tambi&eacute;n para profesionales que requieren un equipo capaz de manejar cargas de trabajo intensivas sin comprometer la eficiencia. Con su construcci&oacute;n robusta, pantalla de alta gama y tecnolog&iacute;as avanzadas, ofrece una experiencia fluida e inmersiva, ya sea para largas jornadas de trabajo o sesiones de gaming intensivo. La RTX 4060 garantiza un rendimiento gr&aacute;fico excepcional, permitiendo disfrutar de juegos en alta calidad y acelerar tareas creativas con tecnolog&iacute;as como DLSS 3 y ray tracing.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Procesador:<br />\r\nIntel&reg; Core&trade; Ultra 9 185H (24 MB de cach&eacute;, 16 n&uacute;cleos, de 2,30 a 5,10 GHz P-Core) .<br />\r\n<br />\r\nMemoria:<br />\r\n40 GB DDR5, 5600<br />\r\n<br />\r\nGr&aacute;ficos y v&iacute;deo:<br />\r\nNVIDIA&reg; GeForce RTX&trade; 4060, 8 GB GDDR6<br />\r\n<br />\r\nAlmacenamiento:<br />\r\nSSD NVMe PCIe M.2 de 1 TB<br />\r\n<br />\r\nPantalla<br />\r\n2 K (2560 x 1600) de 16&quot;, 240 Hz, sin funci&oacute;n t&aacute;ctil, sRGB al 100 %, 3 ms, Advanced Optimus, ComfortView Plus, NVIDIA G-SYNC<br />\r\n<br />\r\nTeclado<br />\r\nAlienware serie M con retroiluminaci&oacute;n RGB AlienFX (por tecla)<br />\r\n<br />\r\nC&aacute;mara<br />\r\nRGB+IR, Full HD 1080p a 30 fps<br />\r\nMicr&oacute;fonos de matriz dual<br />\r\n<br />\r\nMedidas<br />\r\n23,50x363x249,4 mm<br />\r\n<br />\r\nPeso<br />\r\n2,60 kg.<br />\r\n<br />\r\nSistema operativo:<br />\r\nWindows 11 home<br />\r\n<br />\r\nConectividad<br />\r\nTarjeta inal&aacute;mbrica Intel BE202 Wi-Fi 7 2x2 y Bluetooth 5.4<br />\r\n<br />\r\nPuertos:<br />\r\n1 puerto USB 3.2 de 1.&ordf; gen. Type-A con PowerShare<br />\r\n1 puerto USB 3.2 de 1.&ordf; gen. Type-A<br />\r\n1 puerto Type-C (incluye Thunderbolt&trade; 4.0, USB 3.2 de 2.&ordf; gen., DisplayPort 1.4 (iGPU) y suministro de alimentaci&oacute;n de 15 W [3 A/5 V])<br />\r\n1 puerto Type-C (USB 3.2 de 2.&ordf; gen., DisplayPort 1.4 (dGPU))<br />\r\n1 puerto de salida HDMI 2.1 (dGPU)<br />\r\n1 puerto de alimentaci&oacute;n/entrada de CC<br />\r\n1 puerto Ethernet RJ45<br />\r\n1 conector para auriculares global</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 'Rendimiento extremo en un diseño futurista: Alienware M16 con Core Ultra 9, 40 GB de RAM y RTX 4060, listo para todo.', 'products/eYe4c70DpU8HhgP6ZFPW4kWDyQnGwgrrH33dh4wW.webp', 2, '[{\"item_id\":1743910327950,\"item_text\":\"Intel Core Ultra 9\"},{\"item_id\":1743910333880,\"item_text\":\"DDR5\"},{\"item_id\":1743910336901,\"item_text\":\"RTX\"},{\"item_id\":1743910341048,\"item_text\":\"SSD\"},{\"item_id\":1743910348106,\"item_text\":\"1 TB\"},{\"item_id\":1743910354293,\"item_text\":\"2K\"},{\"item_id\":1743910360832,\"item_text\":\"NVIDIA\"},{\"item_id\":1743910367194,\"item_text\":\"RGB\"},{\"item_id\":1743910370353,\"item_text\":\"Alienware\"}]', 7, 12, 13, 14, 20, '2025-04-06 08:34:11', '2025-05-09 10:34:08', NULL),
(8, 'Camiseta Básica Algodón', 'camiseta-basica-algodon', 'CUSTLD-40578221', 50000, 11.57, '<p>Especificaciones T&eacute;cnicas:<br />\r\n<br />\r\nModelo: B&aacute;sica Negra/Blanca<br />\r\nG&eacute;nero: Hombre<br />\r\nEdad: Adultos<br />\r\nTipo de prenda: Camiseta<br />\r\nFormato de venta: 3 unidades<br />\r\nColores disponibles: Negro, Blanco (combinables)<br />\r\nMaterial principal: Algod&oacute;n<br />\r\nTipo de tela: Algod&oacute;n<br />\r\nComposici&oacute;n: 100% Algod&oacute;n<br />\r\nTipo de manga: Corta<br />\r\nTipo de cuello: Redondo<br />\r\nForma del calce: Recto<br />\r\nEs deportiva: S&iacute;</p>', 'Comodidad y estilo diario con esta camiseta básica 100 % algodón, suave y ligera para cualquier ocasión.', 'products/vvLoK8MjrPxqnP9KU1O0rDc5hrwq8a8nhzb6j7uK.webp', 2, '[{\"item_id\":1744607453416,\"item_text\":\"Camiseta\"},{\"item_id\":1744607458077,\"item_text\":\"Algodon\"},{\"item_id\":1744607462122,\"item_text\":\"Basico\"},{\"item_id\":1744607465342,\"item_text\":\"Cuello redondo\"},{\"item_id\":1744607468615,\"item_text\":\"Nike\"}]', 13, 22, 23, 24, 20, '2025-04-14 10:12:48', '2025-04-16 09:04:11', NULL),
(9, 'Jean Slim Azul Oscuro', 'jean-slim-azul-oscuro', 'JEANS-20251304', 66500, 15.38, '<p>Si esta buscando un pantal&oacute;n ajustado pero con una Tela flexible que te permita moverte con libertad, esta es una excelente opci&oacute;n: esta dise&ntilde;ado para que te de el equilibrio perfecto entre comodidad y funcionalidad.<br />\r\nPuedes utilizarlos con camisa y zapatos para un look elegante, o con camiseta y zapatillas para un look casual, estos pantalones son esa forma de complementar tu armario con prendas inteligentes, duraderas y vers&aacute;tiles.<br />\r\nTe garantizamos la calidad de la tela y color, son el&aacute;sticos para mayor comodidad, no te van a deste&ntilde;ir ya que no son sometidos a tinturado en lavander&iacute;a, el color es prete&ntilde;ido en la tejedur&iacute;a de la Tela. !An&iacute;mate a comprarlos&iexcl;</p>', 'Jean slim azul oscuro, moderno y versátil, ideal para un look casual o semi-formal con máxima comodidad.', 'products/oC1TXXYbZfqx2pMp42Ay9OEJt3oluuN9JpQLRI2E.webp', 2, '[{\"item_id\":1744607686034,\"item_text\":\"Jeans\"},{\"item_id\":1744607688107,\"item_text\":\"Azul\"},{\"item_id\":1744607696227,\"item_text\":\"Pantalon\"},{\"item_id\":1744607699260,\"item_text\":\"Tela\"},{\"item_id\":1744607731124,\"item_text\":\"Dril\"},{\"item_id\":1744607732735,\"item_text\":\"Elastico\"}]', 19, 22, 23, 26, 20, '2025-04-14 10:16:27', '2025-04-16 09:04:23', NULL),
(10, 'Vestido Ajustado Con Estampado Floral Ribete Con Fruncido', 'vestido-ajustado-con-estampado-floral-ribete-con-fruncido', 'VAEFRF-20257698', 75000, 17.14, '<p>100% poli&eacute;ster</p>\r\n\r\n<p>Instrucciones de cuidado del material: Lavado a m&aacute;quina</p>\r\n\r\n<p>Talla: L</p>', 'Comodidad transpirable en estilo: disfruta de nuestros vestidos de manga corta de color puro diseñados para las actividades relajadas de la mujer moderna.', 'products/mjVGesLWMGq7YiOFzKD2T3z5gYAHTXe8IbqzpxnF.webp', 2, '[{\"item_id\":1744607929502,\"item_text\":\"Vestido\"},{\"item_id\":1744607936338,\"item_text\":\"Ajustado\"},{\"item_id\":1744607939052,\"item_text\":\"Estampado\"},{\"item_id\":1744607940999,\"item_text\":\"Flores\"},{\"item_id\":1744607943831,\"item_text\":\"Fruncido\"},{\"item_id\":1744607952405,\"item_text\":\"Mujer\"}]', 25, 22, 25, 27, 20, '2025-04-14 10:19:54', '2025-04-16 09:04:32', NULL),
(11, 'Pantalón de Lino Beige', 'pantalon-de-lino-beige', 'PLB-20257690', 158000, 36.55, '<p>Caracter&iacute;sticas del conjunto de pantalones: 1. C&oacute;modo y universal: &aacute;cido acr&iacute;lico suave y el&aacute;stico, el comportamiento del cintur&oacute;n largo puede proporcionar un ajuste holgado c&oacute;modo y universal. Movimiento libre.</p>', 'Fresco y sofisticado: pantalón de lino beige ideal para climas cálidos y estilos relajados con un toque elegante.', 'products/pdxwT8IYTfM3NpPKXdL6wrdqFfa04DYt2VV7DRl1.webp', 2, '[{\"item_id\":1744608223920,\"item_text\":\"Pantalon\"},{\"item_id\":1744608226118,\"item_text\":\"Lino\"},{\"item_id\":1744608229390,\"item_text\":\"Beige\"},{\"item_id\":1744608233504,\"item_text\":\"Mujer\"},{\"item_id\":1744608243079,\"item_text\":\"Ancho\"}]', 26, 22, 25, 28, 20, '2025-04-14 10:24:44', '2025-04-16 09:04:40', NULL),
(12, 'Apple iPhone 14 Pro Max 128 GB Morado Oscuro', 'apple-iphone-14-pro-max-128-gb-morado-oscuro', 'IP-141287', 3990000, 922.94, '<p>El iPhone 14 Pro Max te permite captar detalles incre&iacute;bles gracias a su c&aacute;mara gran angular de 48 MP. Adem&aacute;s, trae la Dynamic Island y una pantalla siempre activa, para que puedas interactuar con tu iPhone de una forma completamente nueva. Y viene con Detecci&oacute;n de Choques(1), una funcionalidad de seguridad que pide ayuda cuando no est&aacute;s en condiciones de hacerlo.</p>', 'iPhone 14 Pro Max en morado oscuro, potencia y elegancia con 128 GB para una experiencia premium al estilo Apple.', 'products/cH3OhfN2KT1v1tePZydnBFmssSMAhRarY4aIg6bG.webp', 2, '[{\"item_id\":1744608413067,\"item_text\":\"Iphone\"},{\"item_id\":1744608416683,\"item_text\":\"Apple\"},{\"item_id\":1744608422830,\"item_text\":\"14 Pro Max\"},{\"item_id\":1744608427464,\"item_text\":\"128GB\"},{\"item_id\":1744608429995,\"item_text\":\"Morado\"}]', 8, 29, 30, 31, 20, '2025-04-14 10:27:59', '2025-04-16 09:04:49', NULL),
(13, 'Cargador Inalámbrico MagSafe', 'cargador-inalambrico-magsafe', 'CIM-20251516', 485000, 112.19, '<p>Carga certificada Qi2:<br />\r\nDisfrute de la comodidad de la carga inal&aacute;mbrica de 15 W que viene con la garant&iacute;a de la certificaci&oacute;n Qi2 para obtener aumentos de energ&iacute;a r&aacute;pidos, seguros y eficientes.<br />\r\n<br />\r\nDuplica la velocidad:<br />\r\nDisfrute de una carga inal&aacute;mbrica ultrarr&aacute;pida de 15W y encienda sus dispositivos 2 veces m&aacute;s r&aacute;pido*. Consigue tu iPhone 15 del 0 al 50% en tan solo 44 minutos.<br />\r\n<br />\r\nPantalla inteligente informativa:<br />\r\nControle el proceso de carga de su dispositivo. Desde porcentajes de bater&iacute;a hasta tiempos de recarga completa, la pantalla inteligente intuitiva garantiza que est&eacute; siempre actualizado.</p>', 'Carga rápida y sin cables con el cargador inalámbrico MagSafe, diseñado para encajar a la perfección con tu iPhone.', 'products/iGdynpMZ0MeNfauG13X0FUD59UHk7NPQ7AIAF9mc.webp', 2, '[{\"item_id\":1744608564495,\"item_text\":\"Cargador\"},{\"item_id\":1744608569171,\"item_text\":\"Inalambrico\"},{\"item_id\":1744608571657,\"item_text\":\"MagSage\"},{\"item_id\":1744608572904,\"item_text\":\"Apple\"}]', 8, 29, 30, 32, 5, '2025-04-14 10:30:15', '2025-04-16 09:04:57', NULL),
(14, 'Notebook Dell Inspiron 15 3520 Intel Core I5-1235u 16gb Ddr4 512gb Ssd', 'notebook-dell-inspiron-15-3520-intel-core-i5-1235u-16gb-ddr4-512gb-ssd', 'NTI-151235', 1785420, 412.99, '<p>Especificaciones</p>\r\n\r\n<p>Modelo<br />\r\n&bull; Marca: Dell<br />\r\n&bull; L&iacute;nea: Inspiron 3520<br />\r\n<br />\r\nSoftware<br />\r\n&bull; Sistema operativo: Ubuntu Linux 20.04 LTS<br />\r\n<br />\r\nProcesador<br />\r\n&bull; Procesador: Intel Core i5-1235U (10 n&uacute;cleos (Eff 8 / Perf 2), 1.3 GHz / 4.4 GHz 12 MB)<br />\r\n<br />\r\nGr&aacute;ficos<br />\r\n&bull; Gr&aacute;ficos: Intel Iris Xe Graphics<br />\r\n<br />\r\nMemoria<br />\r\n&bull; Memoria interna: 16GB DDR4-SDRAM<br />\r\n&bull; Disposici&oacute;n de la memoria: 2 x 8 GB<br />\r\n&bull; Memoria interna m&aacute;xima: 64GB (2 x 32GB SO-DIMM DDR4)<br />\r\n<br />\r\nAlmacenamiento<br />\r\n&bull; Almacenamiento: SSD 512GB M.2 PCIe NVMe<br />\r\n&bull; Soporte de almacenamiento: 1 x SSD M.2 PCIe NVMe + 1 x SATA 2,5&quot; HDD<br />\r\n<br />\r\nPantalla<br />\r\n&bull; Diagonal de pantalla: 15.6&quot; (39,6 cm)<br />\r\n&bull; Resoluci&oacute;n de pantalla: 1920 x 1080 Full HD<br />\r\n&bull; Gama de colores: NTSC 45%<br />\r\n&bull; Brillo de pantalla: 250nits<br />\r\n&bull; Tipo de panel: IPS<br />\r\n&bull; Relaci&oacute;n de aspecto nativa: 16:9<br />\r\n&bull; Pantalla antirreflectante: S&iacute;<br />\r\n&bull; Frecuencia de actualizaci&oacute;n: 120Hz / 35 ms<br />\r\n<br />\r\nC&aacute;mara<br />\r\n&bull; C&aacute;mara frontal: 720px HD, 30 fps<br />\r\n<br />\r\nAudio<br />\r\n&bull; Altavoces: Stereo (2 x 2W)<br />\r\n&bull; Micr&oacute;fono: S&iacute;<br />\r\n<br />\r\nRedes<br />\r\n&bull; Wi-Fi: Wi-Fi 5 (802.11ac)<br />\r\n&bull; Bluetooth: S&iacute;<br />\r\n&bull; LAN Ethernet: No<br />\r\n<br />\r\nPuertos e interfaces<br />\r\n&bull; 1 x USB 2.0<br />\r\n&bull; 2 x USB 3.2 Gen 1<br />\r\n&bull; 1 x HDMI 1.4b<br />\r\n&bull; 1 x Combo Audio Jack 3.5mm<br />\r\n&bull; 1 x Lector Memoria SDXC, SD, SDHC<br />\r\n&bull; 1 x Entrada CC<br />\r\n<br />\r\nTeclado<br />\r\n&bull; Idioma del teclado: Espa&ntilde;ol LA (Incluye letra &Ntilde;)<br />\r\n&bull; Teclado num&eacute;rico: S&iacute;<br />\r\n&bull; Retroiluminado: No<br />\r\n<br />\r\nBater&iacute;a<br />\r\n&bull; Bater&iacute;a: 41Wh / 3 Celdas (Pol&iacute;mero de Litio)<br />\r\n&bull; Adaptador: 65W<br />\r\n<br />\r\nPeso, dimensiones y caracter&iacute;sticas<br />\r\n&bull; 358 x 248 x 19 mm<br />\r\n&bull; Peso: 1.66 kg<br />\r\n&bull; Color: Silver (Plateado)<br />\r\n&nbsp;</p>', 'Notebook Dell Inspiron 15 con Intel Core i5, 16 GB de RAM y 512 GB SSD, para un rendimiento eficiente y fluido en todo momento.', 'products/Snc7QFkXycCwlwmUlR595FsO4TZsQKgzVpgkl4Bt.webp', 2, '[{\"item_id\":1744608722300,\"item_text\":\"Notebook\"},{\"item_id\":1744608740342,\"item_text\":\"Dell\"},{\"item_id\":1744608743265,\"item_text\":\"Inspiron\"},{\"item_id\":1744608747174,\"item_text\":\"Core I5\"},{\"item_id\":1744608754614,\"item_text\":\"DDR4\"},{\"item_id\":1744608757423,\"item_text\":\"512SSD\"},{\"item_id\":1744608761314,\"item_text\":\"INTEL\"}]', 27, 12, 13, 14, 20, '2025-04-14 10:33:45', '2025-04-16 09:05:04', NULL),
(15, 'Logitech M185, Mouse Inalámbrico, Win Mac Chrome Linux Azul', 'logitech-m185-mouse-inalambrico-win-mac-chrome-linux-azul', 'LG-185423', 61900, 14.32, '<p>ESPECIFICACIONES<br />\r\n<br />\r\n&bull; Dimensiones del mouse (altura x anchura x profundidad):<br />\r\n60 mm x 99 mm x 39 mm<br />\r\n&bull; Peso del mouse (incluye bater&iacute;as): 75,2 g<br />\r\n&bull; Dimensiones del receptor (altura x anchura x profundidad):<br />\r\n14,4 mm x 18,7 mm x 6,1 mm<br />\r\n&bull; Peso del receptor: 1,8 g<br />\r\n&bull; Tecnolog&iacute;a de sensor: Seguimiento &oacute;ptico avanzado<br />\r\n&bull; Resoluci&oacute;n de sensor: 1000<br />\r\n&bull; N&uacute;mero de botones: 3<br />\r\n&bull; Bot&oacute;n rueda (S&iacute;/No): S&iacute;<br />\r\n&bull; Duraci&oacute;n de bater&iacute;as: Duraci&oacute;n de bater&iacute;as de hasta 12 meses*<br />\r\n&bull; Tipo de bater&iacute;as: Una bater&iacute;a AA<br />\r\n&bull; Distancia de funcionamiento inal&aacute;mbrico: Aproximadamente 10 m*<br />\r\n&bull; Tecnolog&iacute;a inal&aacute;mbrica: Conexi&oacute;n inal&aacute;mbrica avanzada de 2,4 GHz<br />\r\n&bull; Interfaz: Receptor USB</p>', 'Mouse inalámbrico Logitech M185, compatible con Windows, Mac, Chrome y Linux, diseño compacto y color azul elegante.', 'products/NSM0UA1ZDTBaKcMRSucBCqehRaqCRrcmKipJJ5yP.webp', 2, '[{\"item_id\":1744608907690,\"item_text\":\"Logitech\"},{\"item_id\":1744608916898,\"item_text\":\"M185\"},{\"item_id\":1744608918995,\"item_text\":\"Mouse\"},{\"item_id\":1744608923829,\"item_text\":\"Inalambrico\"},{\"item_id\":1744608926006,\"item_text\":\"Azul\"}]', 28, 12, 13, 33, 20, '2025-04-14 10:35:51', '2025-04-16 09:05:12', NULL),
(16, 'Licuadora Imusa Infiny Force 10 1.75 L gris con vaso de vidrio 120V', 'licuadora-imusa-infiny-force-10-175-l-gris-con-vaso-de-vidrio-120v', 'LC-101756', 124900, 28.89, '<p>Especificaciones</p>\r\n\r\n<p>- 6 Cuchillas en acero inoxidable con exclusiva tecnolog&iacute;a POWELIX&reg; para un licuado perfecto.<br />\r\n- 10 velocidades + pulso: M&aacute;ximo control en tus recetas<br />\r\n- Potencia de 600W: Eficiencia y rapidez en tus preparaciones.<br />\r\n- Vaso de vidrio de 1,75 L termorresistente: Ideal para sopas y batidos.<br />\r\n- Capacidad &Uacute;til 1.25 Litros<br />\r\n- Sistema de acople Carbon Drive: Mayor resistencia y durabilidad.<br />\r\n- Garant&iacute;a de 2 a&ntilde;os: Confianza y respaldo de Imusa.</p>', 'Licuadora Imusa Infiny Force 10 con vaso de vidrio de 1.75 L, potente y duradera para preparar batidos y más con facilidad.', 'products/agZ56NZafSvwEHbdh7ghdirRSmTmWlVSIFqNiTMI.webp', 2, '[{\"item_id\":1744609036895,\"item_text\":\"Licuadora\"},{\"item_id\":1744609043192,\"item_text\":\"Imusa\"},{\"item_id\":1744609046296,\"item_text\":\"Infiny\"},{\"item_id\":1744609047327,\"item_text\":\"Force\"},{\"item_id\":1744609054243,\"item_text\":\"1.75L\"},{\"item_id\":1744609057062,\"item_text\":\"120V\"}]', 29, 19, 34, 35, 7, '2025-04-14 10:38:07', '2025-04-16 09:05:22', NULL),
(17, 'Juego Cuchillos X6 Piezas', 'juego-cuchillos-x6-piezas', 'CX-620258', 45000, 10.41, '<p>El Juego Cuchillos X6 Piezas Con Pelador es la soluci&oacute;n ideal para quienes buscan calidad y funcionalidad en la cocina. Este conjunto incluye cinco cuchillos dise&ntilde;ados para satisfacer todas tus necesidades culinarias, desde el corte de verduras hasta la preparaci&oacute;n de carnes. Cada cuchillo est&aacute; fabricado con materiales de alta calidad que garantizan un corte preciso y duradero.</p>', 'Juego de 6 cuchillos de alta calidad, ideales para cocina diaria con diseño ergonómico y precisión en cada corte.', 'products/ZxMliKLAHG0CVlIcVBW8Vood76UVodB0WcHsrQ1m.webp', 2, '[{\"item_id\":1744609208396,\"item_text\":\"Cuchillos\"},{\"item_id\":1744609210806,\"item_text\":\"X6\"},{\"item_id\":1744609214908,\"item_text\":\"Piezas\"},{\"item_id\":1744609216879,\"item_text\":\"Juego\"}]', 30, 19, 34, 36, 20, '2025-04-14 10:40:39', '2025-04-16 09:05:34', NULL),
(18, 'Sofá Seccional Convertible U Moderno Con Chaise Doble', 'sofa-seccional-convertible-u-moderno-con-chaise-doble', 'SS-20257698', 4772000, 1103.82, '<p>Ofrecemos acceso a productos seleccionados de proveedores internacionales. Debido a la log&iacute;stica internacional, los tiempos de env&iacute;o pueden variar. Consulta la informaci&oacute;n de entrega antes de completar tu compra.</p>', 'Sofá seccional convertible en forma de U, moderno y con chaise doble, perfecto para el confort y estilo de tu sala.', 'products/dMPvdTJ2hDzTEyWQ8czwb7mu2hFHveJ76Ss9m4PG.webp', 2, '[{\"item_id\":1744609357587,\"item_text\":\"Sofa\"},{\"item_id\":1744609359533,\"item_text\":\"Seccional\"},{\"item_id\":1744609362297,\"item_text\":\"Convertible\"},{\"item_id\":1744609365565,\"item_text\":\"Tugo\"},{\"item_id\":1744609366751,\"item_text\":\"Doble\"}]', 31, 19, 37, 40, 20, '2025-04-14 10:43:37', '2025-04-16 09:05:44', NULL),
(19, 'Cuadros Decorativos Modernos 90x60 Guitarra De Fuego', 'cuadros-decorativos-modernos-90x60-guitarra-de-fuego', 'CD-906078', 95000, 21.97, '<p>uadros Decorativos en un solo cuerpo area total: 90 cm de Alto 60 cm de Ancho<br />\r\n<br />\r\nMateriales: Retablo en MDF con borde de 3 cms listo para colgar en la pared.<br />\r\n<br />\r\nImpresi&oacute;n en la mas alta resoluci&oacute;n<br />\r\nTerminado laminado brillante permite limpiar<br />\r\n<br />\r\nconsta de un solo cuerpo<br />\r\n<br />\r\n1 de 90 cm x 60 cms<br />\r\n<br />\r\n<br />\r\nDimensi&oacute;n total: 90 cms de alto por 60 cms de ancho<br />\r\n<br />\r\nDise&ntilde;o personalizados (Tu escoges el estilo o nos envias la imagen que deseas)<br />\r\n<br />\r\nEcon&oacute;micos elegantes y de excelentes acabados</p>', 'Cuadro decorativo moderno de 90x60 con una vibrante guitarra de fuego, ideal para darle un toque único y artístico a tu espacio.', 'products/m42sc6NVahYQupJceZkKLl6n2L96yjjyPEo6FCfh.webp', 2, '[{\"item_id\":1744609491385,\"item_text\":\"Cuadros\"},{\"item_id\":1744609493478,\"item_text\":\"Decorativos\"},{\"item_id\":1744609498061,\"item_text\":\"90X60\"},{\"item_id\":1744609532042,\"item_text\":\"Fuego\"}]', 32, 19, 37, 38, 20, '2025-04-14 10:46:39', '2025-04-16 09:05:55', NULL),
(20, 'Set de 72 Bloques Armotodo con Tula', 'set-de-72-bloques-armotodo-con-tula', 'SB-725676', 38700, 8.95, '<p>Especificaciones:</p>\r\n\r\n<p><br />\r\n- Diversidad de Construcciones: Este armatodo cl&aacute;sico ofrece infinitas posibilidades de juego con sus 72 piezas.<br />\r\n- F&aacute;cil Organizaci&oacute;n: Viene con una tula que facilita la limpieza y el orden.<br />\r\n- Dimensiones y Peso Ideales: Cada bloque est&aacute; dise&ntilde;ado para ser f&aacute;cilmente manejable por manos peque&ntilde;as, con un set que mide 24x17x12 cm y pesa solo 0.32 kg.<br />\r\n&nbsp;</p>', 'Set de 72 bloques Armotodo con tula, perfectos para desarrollar la creatividad y habilidades motrices de los más pequeños.', 'products/mFUVE1wyeVdf3x6hEHWl0vLu73nlHzNztvcTDt7G.webp', 2, '[{\"item_id\":1744609690566,\"item_text\":\"Set\"},{\"item_id\":1744609692000,\"item_text\":\"Bloques\"},{\"item_id\":1744609698394,\"item_text\":\"Niños\"},{\"item_id\":1744609712907,\"item_text\":\"Armotodo\"},{\"item_id\":1744609716974,\"item_text\":\"Creatividad\"},{\"item_id\":1744609720101,\"item_text\":\"72\"}]', 33, 39, 41, 42, 20, '2025-04-14 10:49:16', '2025-04-16 09:06:04', NULL),
(21, 'Tablet Infantil Amazon Kids Fire 7 Con Funda 2022 De 32gb Color Violeta', 'tablet-infantil-amazon-kids-fire-7-con-funda-2022-de-32gb-color-violeta', 'TA-2022327', 538923, 124.66, '<p>Especificaciones</p>\r\n\r\n<ul>\r\n	<li>Memoria RAM: 2 GB</li>\r\n	<li>Tama&ntilde;o de la pantalla: 17.78 &quot;</li>\r\n	<li>Capacidad: 32 GB</li>\r\n	<li>Sistema operativo: Android 2022.</li>\r\n	<li>Dise&ntilde;ada para llevar a todas partes.</li>\r\n	<li>La duraci&oacute;n de la bater&iacute;a depende del uso que se le d&eacute; al producto.</li>\r\n</ul>', 'Tablet infantil Amazon Fire 7 de 32 GB con funda violeta, diseñada para el entretenimiento y aprendizaje seguro de los niños.', 'products/znoPCyIlKGskpp6780YBHvBBzPXmdWe4igt4Ms5J.webp', 2, '[{\"item_id\":1744609868580,\"item_text\":\"Tablet\"},{\"item_id\":1744609873473,\"item_text\":\"Infantil\"},{\"item_id\":1744609878873,\"item_text\":\"Amazon Kids\"},{\"item_id\":1744609882558,\"item_text\":\"Violeta\"}]', 34, 39, 41, 43, 20, '2025-04-14 10:52:28', '2025-04-16 09:06:12', NULL),
(22, 'Set Bodys Mamelucos Original 3 Piezas Bebe Niña Manga Larga', 'set-bodys-mamelucos-original-3-piezas-bebe-nina-manga-larga', 'BN-20257689', 56890, 13.16, '<p>Set 1:<br />\r\n<br />\r\nBody con un estampado floral en tonos rosados y detalles en rojo, perfecto para un look dulce y elegante.<br />\r\nBody marr&oacute;n con peque&ntilde;os detalles de flores blancas, ideal para un estilo cl&aacute;sico.<br />\r\nBody rojo con el mensaje &quot;NEVER GROW UP&quot; y detalles de flores, para un look alegre y positivo.<br />\r\n<br />\r\nSet 2:<br />\r\nBody con dise&ntilde;o de flores en tonos rosados y verdes, dando un toque fresco y natural.<br />\r\nBody gris con un patr&oacute;n sencillo de rayas, perfecto para un estilo minimalista.<br />\r\n<br />\r\nBody rosa con el mensaje &quot;CRIB HAIR DON&#39;T CARE&quot;, divertido y moderno.<br />\r\n<br />\r\nTallas Disponibles: Disponible en tallas 0/3 meses, 3/6 meses y 6/9 meses, adapt&aacute;ndose perfectamente al crecimiento de tu beb&eacute;.<br />\r\n<br />\r\nPracticidad y Comodidad: Los bodys cuentan con botones de presi&oacute;n en la parte inferior, facilitando el cambio de pa&ntilde;ales. El dise&ntilde;o de cuello expandible permite vestir y desvestir al beb&eacute; de manera f&aacute;cil y sin molestias.<br />\r\n<br />\r\nF&aacute;cil de Cuidar: Lavables a m&aacute;quina, estos bodys mantienen sus colores vibrantes y su suavidad tras cada lavado, siendo una opci&oacute;n pr&aacute;ctica para los padres.</p>', 'Set de 3 bodys mamelucos originales para bebé niña, con manga larga, suaves y cómodos para su piel delicada.', 'products/StCWPadOHAADAGupAwmv77owMLmABCCQnYGhB5q8.webp', 2, '[{\"item_id\":1744610046956,\"item_text\":\"Set\"},{\"item_id\":1744610050445,\"item_text\":\"Bodys\"},{\"item_id\":1744610053437,\"item_text\":\"Mamelucos\"},{\"item_id\":1744610054416,\"item_text\":\"3\"},{\"item_id\":1744610056644,\"item_text\":\"Piezas\"},{\"item_id\":1744610058605,\"item_text\":\"Bebe\"}]', 35, 39, 44, 45, 20, '2025-04-14 10:54:52', '2025-04-16 09:06:23', NULL),
(23, 'Sudadera Deportiva Para Niño Making Jaz Barcelona Y Madrid', 'sudadera-deportiva-para-nino-making-jaz-barcelona-y-madrid', 'BM-29245467', 72000, 16.65, '<p>El modelo deportivo es unisex, lo que lo hace vers&aacute;til y adecuado para cualquier ni&ntilde;o. Disponible en una variedad de colores, permite que cada peque&ntilde;o exprese su personalidad mientras se mantiene activo y c&oacute;modo.<br />\r\nCon un estampado de su equipo favorito de excelente calidad y durabilidad.<br />\r\nEste conjunto es perfecto para el uso en casa, en el parque o en actividades deportivas. Con su dise&ntilde;o atractivo y funcional, se convertir&aacute; en una prenda favorita en el armario de los m&aacute;s j&oacute;venes.</p>', 'Sudadera deportiva para niño Making Jaz, con diseño exclusivo de Barcelona y Madrid, cómoda y estilosa para cualquier actividad.', 'products/DXuE5luJXi966E2AytyR8oG23g5NaGD1FHNVp2XN.webp', 2, '[{\"item_id\":1744610168586,\"item_text\":\"Sudadera\"},{\"item_id\":1744610172702,\"item_text\":\"Deportiva\"},{\"item_id\":1744610176797,\"item_text\":\"Barcelona\"},{\"item_id\":1744610179316,\"item_text\":\"Madrid\"},{\"item_id\":1744610184339,\"item_text\":\"Niño\"}]', 36, 39, 44, 46, 20, '2025-04-14 10:56:53', '2025-04-16 09:06:35', NULL),
(24, 'Labial Loreal Paris Infallible Le Matte Le Rouge Paris x 5ml', 'labial-loreal-paris-infallible-le-matte-le-rouge-paris-x-5ml', 'LP-56780987', 61400, 14.2, '<p>&iexcl;T&uacute; eres Infallible y tu maquillaje tambi&eacute;n lo es!<br />\r\n<br />\r\nComplementa tu look con el resto de nuestra gama para rostro Infallible 32h Matte Cover o Infallible 24h Base en Polvo.</p>', 'Labial L\'Oréal Paris Infallible Le Matte Le Rouge de 5 ml, color intenso y acabado mate duradero para un look impecable.', 'products/daCc2r2rtiTddG4mss2jZ7rqXcy4i057jLUgtKEt.webp', 2, '[{\"item_id\":1744610301821,\"item_text\":\"Labial\"},{\"item_id\":1744610303424,\"item_text\":\"Loreal\"},{\"item_id\":1744610306878,\"item_text\":\"Le Matte\"},{\"item_id\":1744610308783,\"item_text\":\"Rouge\"},{\"item_id\":1744610309736,\"item_text\":\"Paris\"},{\"item_id\":1744610313930,\"item_text\":\"5ml\"}]', 37, 20, 47, 50, 20, '2025-04-14 10:59:07', '2025-04-16 08:58:54', NULL),
(25, 'Shampoo Maria Salome Anticaspa x 400ml', 'shampoo-maria-salome-anticaspa-x-400ml', 'MR-40096587', 30090, 6.96, '<p>Ingredientes: Con extractos naturales de coco, romero, quina y sauce. Contiene &aacute;cido salic&iacute;lico.<br />\r\n<br />\r\nTipo de cabello: Normal a graso<br />\r\n<br />\r\nModo de uso: Aplique sobre el cabello h&uacute;medo, realice masajes circulares en el cuero cabelludo con la yema de los dedos por 5 minutos.<br />\r\nEnjuague con abundante agua. Use m&iacute;nimo 2 o 3 veces por semana para garantizar resultados.</p>', 'Shampoo María Salomé anticaspa de 400 ml, fórmula eficaz para combatir la caspa y dejar el cabello limpio y saludable.', 'products/mB86eEQX5NQSmsbyntbfO3WtUH1EGrebZyWSdlH6.webp', 2, '[{\"item_id\":1744610431039,\"item_text\":\"Shampoo\"},{\"item_id\":1744610432564,\"item_text\":\"Maria\"},{\"item_id\":1744610436837,\"item_text\":\"Salome\"},{\"item_id\":1744610439235,\"item_text\":\"Anticaspa\"},{\"item_id\":1744610443748,\"item_text\":\"400ml\"}]', 38, 20, 49, 51, 20, '2025-04-14 11:01:02', '2025-04-16 08:59:56', NULL),
(26, 'Mascarilla Placenta L. Keratina - Ml A', 'mascarilla-placenta-l-keratina-ml-a', 'MI-256478', 36900, 8.54, '<p>Especificaciones</p>\r\n\r\n<ul>\r\n	<li>Formato de venta: Unidad</li>\r\n	<li>Unidades por pack: 1</li>\r\n	<li>Para cabello con frizz.</li>\r\n	<li>Formato: crema.</li>\r\n	<li>Presentaci&oacute;n: pote.</li>\r\n	<li>Es un producto hipoalerg&eacute;nico.</li>\r\n	<li>Para aplicar en cabello h&uacute;medo.</li>\r\n	<li>Con enjuague.</li>\r\n	<li>Sin sulfatos ni parabenos.</li>\r\n	<li>Con fragancia.</li>\r\n</ul>', 'Mascarilla de placenta L. Keratina, tratamiento revitalizante para un cabello suave, nutrido y lleno de vitalidad.', 'products/3q1jyvUNQ4Fd7z4cx2Cwjw3QAFr7rZVP0Mqj18C9.webp', 2, '[{\"item_id\":1744610553307,\"item_text\":\"Mascarilla\"},{\"item_id\":1744610555461,\"item_text\":\"Placenta\"},{\"item_id\":1744610557554,\"item_text\":\"Keratina\"},{\"item_id\":1744610560023,\"item_text\":\"MI A\"}]', 39, 20, 49, 52, 20, '2025-04-14 11:03:13', '2025-04-16 09:00:19', NULL),
(27, 'Apple iPhone 15 Pro Max 512gb', 'apple-iphone-15-pro-max-512gb', 'IP-73243604', 5670000, 1323.9, '<p><strong>iPhone 15 Pro Max</strong></p>\r\n\r\n<ul>\r\n	<li><strong>Homologado en Colombia (2023-09-14, C&oacute;digo: TM-23-0713).</strong> Consulta la carta en la web de la CRC.</li>\r\n	<li>Dise&ntilde;o en titanio de grado aeroespacial, ligero y resistente.</li>\r\n	<li>Chip A17 Pro: rendimiento gr&aacute;fico revolucionario para juegos inmersivos.</li>\r\n	<li>Sistema de c&aacute;maras Pro avanzado con m&uacute;ltiples distancias focales y fotos de s&uacute;per alta resoluci&oacute;n de 48MP.</li>\r\n	<li>Nuevo bot&oacute;n Acci&oacute;n personalizable.</li>\r\n	<li>USB-C con velocidades de transferencia hasta 20 veces m&aacute;s r&aacute;pidas (USB 3).</li>\r\n	<li>Wi-Fi 6E para descargas y cargas ultrarr&aacute;pidas.</li>\r\n	<li>B&uacute;squeda de precisi&oacute;n mejorada para encontrar amigos.</li>\r\n	<li>Bater&iacute;a de larga duraci&oacute;n.</li>\r\n	<li>Funciones de seguridad: Asistencia en carretera v&iacute;a sat&eacute;lite, Emergencia SOS v&iacute;a sat&eacute;lite y Detecci&oacute;n de accidentes.</li>\r\n	<li>Fabricado con materiales reciclados y dise&ntilde;ado para la accesibilidad.</li>\r\n	<li>iOS 17 con nuevas funciones como Cartel de contacto y Name Drop.</li>\r\n	<li><strong>Importante:</strong> Verifica la homologaci&oacute;n en tu pa&iacute;s antes de comprar. No aceptamos devoluciones por falta de homologaci&oacute;n. Pregunta por la disponibilidad de color.</li>\r\n</ul>\r\n\r\n<p><strong>Se entrega el celular de la referencia y capacidad especificada en el t&iacute;tulo del anuncio.</strong></p>', 'Potencia, rendimiento y elegancia en el smartphone más avanzado de Apple: el iPhone 15 Pro Max.', 'products/S6B9K2OV7ugwhXdMNdXbo4riJXvWzd1tfpoiddo2.webp', 2, '[{\"item_id\":1744647121067,\"item_text\":\"Apple\"},{\"item_id\":1744647125273,\"item_text\":\"Iphone\"},{\"item_id\":1744647129084,\"item_text\":\"15 Pro Max\"},{\"item_id\":1744647134141,\"item_text\":\"512gb\"}]', 8, 29, 30, 31, 20, '2025-04-14 21:13:53', '2025-05-08 08:58:30', NULL),
(28, 'Diadema Gamer Hyperx Cloud Stinger 2 Core Negro-pc Color Negro', 'diadema-gamer-hyperx-cloud-stinger-2-core-negro-pc-color-negro', 'HD-228767', 155900, 36, '<p>Especificaciones:<br />\r\n<br />\r\nAuriculares<br />\r\nConductor: Din&aacute;mico, 40 mm con imanes de neodimio<br />\r\nFactor de forma: sobre la oreja, circumaural, parte trasera cerrada<br />\r\nRespuesta de frecuencia: 10 Hz - 25 kHz<br />\r\nSensibilidad: -40,5 dBV (1 V/Pa a 1 kHz)<br />\r\nTHD: 2%<br />\r\nTipo de marco: Pl&aacute;stico<br />\r\nAlmohadillas: Espuma suave y tela<br />\r\n<br />\r\nMicr&oacute;fono<br />\r\nElemento: micr&oacute;fono de condensador electret<br />\r\nPatr&oacute;n polar: bidireccional, cancelaci&oacute;n de ruido<br />\r\nSensibilidad: -40,5 dBV (1 V/Pa a 1 kHz)</p>', 'Auriculares gamer HyperX Cloud Stinger 2 Core, sonido envolvente DTS:X y micrófono con cancelación de ruido, ideales para PC, PS4, PS5, Xbox y Switch.', 'products/MtxawtHnSxHoTmDSdMhPQSA9VjLUQbloTxZZq9fB.webp', 2, '[{\"item_id\":1744648002962,\"item_text\":\"Diadema\"},{\"item_id\":1744648004533,\"item_text\":\"Gamer\"},{\"item_id\":1744648007215,\"item_text\":\"Gaming\"},{\"item_id\":1744648010437,\"item_text\":\"Hyperx\"},{\"item_id\":1744648012456,\"item_text\":\"Stinger\"},{\"item_id\":1744648014453,\"item_text\":\"Negro\"},{\"item_id\":1744648016070,\"item_text\":\"Core\"}]', 40, 12, 13, 33, 20, '2025-04-14 21:27:44', '2025-05-10 05:38:42', NULL),
(29, 'Parlante Bluetooth Portatil Karaoke Bafle Microfono Bowmann Color Negro 5V', 'parlante-bluetooth-portatil-karaoke-bafle-microfono-bowmann-color-negro-5v', 'PB-512354', 145100, 33.59, '<p>Caracter&iacute;sticas:<br />\r\n&bull; Radio Fm.<br />\r\n&bull; Reproduce MP3, USB, Micro SD.<br />\r\n&bull; Bluetooth Integrado.<br />\r\n&bull; Entrada Auxiliar Audio y Micr&oacute;fono.<br />\r\n&bull; Pantalla Display.<br />\r\n&bull; Control Remoto.<br />\r\n&bull; Potencia: 30 Watts.<br />\r\n&bull; 2 Parlantes 6.5&rdquo; con luz LED.<br />\r\n&bull; Bater&iacute;a Recargable 2400 mAh.<br />\r\n&bull; Manija para transportar.<br />\r\n&bull; Dimensiones: Alto 54cm - Ancho 25cm - Largo 20cm.<br />\r\nIncluye:<br />\r\n&bull; Micr&oacute;fono.<br />\r\n&bull; Control remoto.<br />\r\n&bull; Cable USB.<br />\r\n&bull; Manual del usuario.</p>', 'Parlante portátil Bowmann BTS-265K con Bluetooth, luces LED, micrófono incluido y batería recargable de 30 W, ideal para karaoke y fiestas.', 'products/fDGrEHnnWG8asIn7NsWUGgyJHamcrguuEKGwsEZM.webp', 2, '[{\"item_id\":1744652842298,\"item_text\":\"Parlante\"},{\"item_id\":1744652846531,\"item_text\":\"Bluetooth\"},{\"item_id\":1744652850453,\"item_text\":\"Bafle\"},{\"item_id\":1744652851681,\"item_text\":\"5V\"},{\"item_id\":1744652855688,\"item_text\":\"Bowmann\"},{\"item_id\":1744652858863,\"item_text\":\"Microfono\"}]', 20, 29, 53, 57, 20, '2025-04-14 22:48:16', '2025-04-16 09:01:24', NULL),
(30, 'Audífonos gamer alámbricos Logitech G G Pro negro', 'audifonos-gamer-alambricos-logitech-g-g-pro-negro', 'AG=20257689', 519900, 120, '<p>Especificaciones:</p>\r\n\r\n<ul>\r\n	<li>Alcance inal&aacute;mbrico de 20&nbsp;m.</li>\r\n	<li>Asistente de voz integrado: no.</li>\r\n	<li>Con cancelaci&oacute;n de ruido.</li>\r\n	<li>Micr&oacute;fono flexible incorporado.</li>\r\n	<li>Resistentes al polvo.</li>\r\n	<li>Su clasificaci&oacute;n IP es N/a.</li>\r\n	<li>El largo del cable es de 2m.</li>\r\n	<li>Uso apto para profesional.</li>\r\n	<li>C&oacute;modos y pr&aacute;cticos.</li>\r\n	<li>Tama&ntilde;o del altavoz: 5cm.</li>\r\n</ul>', 'Audífonos gamer Logitech G Pro con micrófono direccional, drivers PRO-G de 50 mm y diseño profesional, ideales para jugadores exigentes.', 'products/ovSc4u2nGM5pFSTLYMfFC4up472faT4zfrILdsAo.webp', 2, '[{\"item_id\":1744652985664,\"item_text\":\"Audífonos\"},{\"item_id\":1744652992421,\"item_text\":\"gamer\"},{\"item_id\":1744652995887,\"item_text\":\"Logitech\"},{\"item_id\":1744652998255,\"item_text\":\"alámbricos\"},{\"item_id\":1744653001536,\"item_text\":\"negro\"}]', 28, 29, 53, 57, 20, '2025-04-14 22:50:35', '2025-05-10 05:38:25', NULL),
(31, 'Enchufe Inteligente Wifi Alexa X4 Y Google Nest Smart Plug Color Blanco', 'enchufe-inteligente-wifi-alexa-x4-y-google-nest-smart-plug-color-blanco', 'EI-20266587', 110000, 25.47, '<p>Especificaciones:</p>\r\n\r\n<ul>\r\n	<li>Conexi&oacute;n por wifi.</li>\r\n	<li>Funciona en espa&ntilde;ol y en ingl&eacute;s.</li>\r\n	<li>Apto para la red el&eacute;ctrica de tu pa&iacute;s.</li>\r\n</ul>', 'Pack de 4 enchufes inteligentes WiFi en color blanco, compatibles con Alexa y Google Nest, ideales para automatizar tus dispositivos en casa.', 'products/uLbB4hMQX02Bx69H4VnxWNE16U3hxS9JRPPbbHaH.webp', 2, '[{\"item_id\":1744653124104,\"item_text\":\"Enchufe\"},{\"item_id\":1744653129770,\"item_text\":\"Inteligente\"},{\"item_id\":1744653133016,\"item_text\":\"Alexa\"},{\"item_id\":1744653138738,\"item_text\":\"Smart\"},{\"item_id\":1744653143705,\"item_text\":\"Google\"}]', 41, 29, 53, 57, 20, '2025-04-14 22:53:10', '2025-04-16 09:02:19', NULL),
(32, 'Control Inalámbrico Microsoft Xbox Velocity Green Color Verde', 'control-inalambrico-microsoft-xbox-velocity-green-color-verde', 'CX-568709', 249900, 58, '<p>Especificaciones:</p>\r\n\r\n<ul>\r\n	<li>Cuenta con Bluetooth.</li>\r\n	<li>Mando inal&aacute;mbrico.</li>\r\n	<li>Compatible con: Computadoras.</li>\r\n	<li>Con sistema de vibraci&oacute;n incorporado.</li>\r\n	<li>Cuenta con pilas.</li>\r\n	<li>Diversi&oacute;n garantizada con tu joystick Xbox.</li>\r\n	<li>Dise&ntilde;o ergon&oacute;mico.</li>\r\n</ul>', 'Control inalámbrico Xbox Velocity Green con diseño ergonómico, batería de hasta 40 horas, botón Compartir y conectividad Bluetooth para jugar en Xbox, PC y dispositivos móviles.', 'products/cjmhuFgbv0C26Tm7BwbaakFlUwdEb67iaxIMh541.webp', 2, '[{\"item_id\":1744654269096,\"item_text\":\"Control\"},{\"item_id\":1744654271957,\"item_text\":\"Inalámbrico\"},{\"item_id\":1744654276007,\"item_text\":\"Microsoft\"},{\"item_id\":1744654280188,\"item_text\":\"Xbox\"},{\"item_id\":1744654283736,\"item_text\":\"Velocity\"},{\"item_id\":1744654286533,\"item_text\":\"Verde\"}]', 11, 29, 53, 57, 20, '2025-04-14 23:12:12', '2025-05-10 05:39:00', NULL),
(33, 'Audífonos Bluetooth True Wireless Para Samsung Galaxy Buds', 'audifonos-bluetooth-true-wireless-para-samsung-galaxy-buds', 'GB=568734', 390677, 90.45, '<p>Este producto usado o reacondicionado ha sido inspeccionado y probado profesionalmente para que funcione y parezca nuevo. C&oacute;mo un producto pasa a formar parte de Amazon Renewed, el lugar de destino de los productos reacondicionados de segunda mano: un cliente compra un producto nuevo y lo devuelve o lo cambia por un modelo nuevo o diferente. Los proveedores cualificados de Amazon inspeccionan y prueban ese producto para que funcione y parezca nuevo. Luego, el producto se vende como un producto de Amazon Renewed en Amazon. Si no est&aacute;s satisfecho con la compra, los productos renovados pueden ser reemplazados o reembolsados bajo la garant&iacute;a renovada de Amazon. - Tus o&iacute;dos nunca lo han tenido tan bien -Los aud&iacute;fonos Galaxy Buds2 llevan tu pasi&oacute;n por la m&uacute;sica a nuevas alturas con un sonido retumbante que te hace sentir como si estuvieras en el escenario con tu banda favorita - Apaga los ruidos, sintoniza las voces - La cancelaci&oacute;n activa de ruido bloquea los sonidos no deseados y te ayuda a mantener la concentraci&oacute;n est&eacute;s donde est&eacute;s; el modo de sonido ambiental de baja latencia capta el sonidos que quieres escuchar, para que siempre tengas el nivel de audio perfecto para cada momento: se siente bien mientras se ve bien -Los Galaxy Buds2 tienen un dise&ntilde;o c&oacute;modo y discreto que es un 10% m&aacute;s peque&ntilde;o y liviano que los Galaxy Buds+; puede que llegues al final de tu lista de reproducci&oacute;n antes de recordar que los llevas puestos - Escucha con claridad, habla con confianza -Los auriculares, los 3 micr&oacute;fonos y la tecnolog&iacute;a de reducci&oacute;n de ruido garantizan que las voces se transmitan de forma n&iacute;tida y clara, ya sea que est&eacute;s chateando con un amigo o dirigiendo una conferencia telef&oacute;nica de alto riesgo Este producto est&aacute; reacondicionado de grado A lo que significa que est&aacute; en excelentes condiciones.</p>', 'Auriculares inalámbricos Samsung Galaxy Buds con sonido de calidad sintonizado por AKG, hasta 6 horas de duración de la batería y estuche con carga inalámbrica.', 'products/DcU9Z4NX9A3fBhQjpHDBEonpeN8niRyba1GaFvOy.webp', 2, '[{\"item_id\":1744654472888,\"item_text\":\"Audífonos\"},{\"item_id\":1744654475962,\"item_text\":\"Bluetooth\"},{\"item_id\":1744654480034,\"item_text\":\"Wireless\"},{\"item_id\":1744654483178,\"item_text\":\"Samsung\"},{\"item_id\":1744654486671,\"item_text\":\"Galaxy Buds\"}]', 10, 29, 53, 57, 20, '2025-04-14 23:16:30', '2025-04-16 09:03:12', NULL),
(34, 'Reloj Inteligente Xiaomi Redmi Watch 5 Active Negro Original', 'reloj-inteligente-xiaomi-redmi-watch-5-active-negro-original', 'XR=202565', 195000, 45.15, '<p>Especificaciones:</p>\r\n\r\n<p>*Los datos de duraci&oacute;n de la bater&iacute;a se basan en el modo de uso normal y fueron analizados en los laboratorios internos de Xiaomi. Los resultados reales pueden variar.</p>\r\n\r\n<p>*El reloj debe estar conectado al Bluetooth del celular. Actualmente, no se admiten llamadas de voz mediante aplicaciones de terceros.</p>\r\n\r\n<p>*Este producto y sus funciones no est&aacute;n dise&ntilde;ados para fines m&eacute;dicos ni para predecir, diagnosticar, prevenir o tratar enfermedades.</p>\r\n\r\n<p>*Incluye una correa de TPU en color negro obsidiana, gris plateado o violeta lavanda como opci&oacute;n est&aacute;ndar. Las dem&aacute;s correas se venden por separado.</p>\r\n\r\n<p>*Los datos de brillo, bisel y relaci&oacute;n pantalla-cuerpo provienen de los laboratorios internos de Xiaomi. Los resultados reales pueden variar.</p>\r\n\r\n<p>*La frecuencia de actualizaci&oacute;n de la pantalla puede variar seg&uacute;n la interfaz. Consulta el caso de uso real.</p>\r\n\r\n<p>*Descarga m&aacute;s esferas de reloj exclusivas en la aplicaci&oacute;n Mi Fitness. Los efectos reales pueden diferir de las im&aacute;genes mostradas en esta p&aacute;gina. Consulta la aplicaci&oacute;n para m&aacute;s detalles.</p>\r\n\r\n<p>*Solo los celulares con tecnolog&iacute;a Xiaomi HyperOS admiten la funci&oacute;n de esfera de reloj con retrato.</p>\r\n\r\n<p>*Los datos de distancia de toma de audio direccional provienen de los laboratorios internos de Xiaomi. Los resultados reales pueden variar seg&uacute;n las condiciones de uso.</p>\r\n\r\n<p>*La m&uacute;sica en el Redmi Watch 5 debe transferirse desde un celular Android.</p>\r\n\r\n<p>*La duraci&oacute;n de la bater&iacute;a de 24 d&iacute;as se prob&oacute; en el modo de uso normal con el reloj completamente cargado, con la configuraci&oacute;n predeterminada de f&aacute;brica y una car&aacute;tula negra verde amarillenta, con el monitoreo del sue&ntilde;o de alta precisi&oacute;n activado y el monitoreo de ox&iacute;geno en la sangre desactivado. Se realizaron detecciones de frecuencia card&iacute;aca cada 10 minutos, notificaciones de 100 mensajes, 2 llamadas y 3 alarmas diarias, 200 activaciones de pantalla por elevaci&oacute;n de mu&ntilde;eca, sincronizaci&oacute;n manual de datos una vez al d&iacute;a, 15 minutos de llamadas por Bluetooth a la semana y 90 minutos de ejercicio a la semana.</p>\r\n\r\n<p>*Con el monitoreo de la frecuencia card&iacute;aca durante todo el d&iacute;a activado, el reloj realizar&aacute; mediciones con una determinada frecuencia. Consulta la aplicaci&oacute;n para m&aacute;s detalles sobre la frecuencia y el principio de monitoreo.</p>\r\n\r\n<p>*El monitoreo del ox&iacute;geno en la sangre debe activarse manualmente. Consulta la aplicaci&oacute;n para m&aacute;s detalles sobre la frecuencia y el principio de monitoreo.</p>\r\n\r\n<p>*Resistencia al agua de 5ATM: El Redmi Watch 5 cuenta con una clasificaci&oacute;n de resistencia al agua de 5ATM (equivalente a 50 metros de profundidad), basada en la norma ISO 22810:2010. El n&uacute;mero de informe de prueba es 68.189.24.0556.01. Es adecuado para uso en piscinas, nataci&oacute;n cerca de la costa y otras actividades acu&aacute;ticas en aguas poco profundas. No se recomienda su uso en duchas de agua caliente, saunas o buceo. Evita impactos directos de corrientes de agua mientras realizas deportes acu&aacute;ticos. La resistencia al agua no es permanente y puede disminuir con el tiempo.</p>\r\n\r\n<p>*Las correas de cuero y trenzadas no son adecuadas para actividades en las que entren en contacto con agua o sudor, como la nataci&oacute;n o el ejercicio. Se recomienda utilizar otros tipos de correas para estas actividades.</p>\r\n\r\n<p>*Deportes acu&aacute;ticos: Incluye nataci&oacute;n en piscina, aguas abiertas, navegaci&oacute;n, surf de remo, polo acu&aacute;tico, esqu&iacute; acu&aacute;tico, kayak, rafting, remo, lanchas a motor, nataci&oacute;n con aletas, buceo, nataci&oacute;n art&iacute;stica, esn&oacute;rquel, kitesurf, cabalgatas, embarcaciones de drag&oacute;n y otros deportes acu&aacute;ticos.</p>\r\n\r\n<p>*Cursos de carreras: Carrera/caminata b&aacute;sica, carrera/caminata avanzada, trote b&aacute;sico, carrera para quemar grasa (b&aacute;sica), carrera para quemar grasa (avanzada), MIIT, carrera de resistencia (b&aacute;sica), carrera de resistencia (avanzada), carrera por intervalos (b&aacute;sica) y carrera por intervalos (avanzada).</p>\r\n\r\n<p>*Las im&aacute;genes, modelos, datos, funciones, rendimiento, especificaciones, interfaz de usuario y otra informaci&oacute;n del producto mostrada en esta p&aacute;gina son solo de referencia y pueden diferir del producto real. Xiaomi se reserva el derecho de realizar modificaciones. Para m&aacute;s informaci&oacute;n, consulta el producto real.</p>\r\n\r\n<p>*No expongas el reloj inteligente a campos magn&eacute;ticos intensos, ya que esto podr&iacute;a afectar su funcionalidad.</p>', 'Smartwatch Xiaomi Redmi Watch 5 Active con pantalla LCD de 2\", llamadas Bluetooth, monitoreo de frecuencia cardíaca y oxígeno, batería de hasta 18 días y resistencia al agua de 5 ATM.', 'products/EzIkv5tILjxr85ULs7Rhk4hVLep7RAWbba49NYVl.webp', 2, '[{\"item_id\":1744654691466,\"item_text\":\"Inteligente\"},{\"item_id\":1744654694921,\"item_text\":\"Reloj\"},{\"item_id\":1744654699048,\"item_text\":\"Xiaomi Redmi\"},{\"item_id\":1744654702280,\"item_text\":\"Watch 5\"},{\"item_id\":1744654705472,\"item_text\":\"Negro\"}]', 9, 29, 53, 57, 20, '2025-04-14 23:19:26', '2025-04-16 09:03:40', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `imagen`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 'products/0THDnlK51e7CVOcz12WBYZc2NEFvDmkHmXFpmUOX.jpg', '2025-03-04 02:52:04', '2025-03-04 02:52:04', NULL),
(3, 5, 'products/TMyHvBa12LR6ik74wX1ViG67VBVvHZgpxKf4kPr3.jpg', '2025-03-04 03:03:27', '2025-03-04 03:03:27', NULL),
(6, 6, 'products/5jPQTmGaw9PHTaiKUHXBw8HfC5cMCH8Chjh7IVFa.webp', '2025-04-06 08:28:25', '2025-04-06 08:28:25', NULL),
(7, 6, 'products/M8LJSnaP2btZoLx3sqc6enuWxf8tnxNvb2ULV5aA.webp', '2025-04-06 08:28:29', '2025-04-06 08:28:29', NULL),
(11, 6, 'products/uPq2ym5U0sIlmhJXGV9lbAARzfUsmz0GBHarfv5J.webp', '2025-04-06 08:28:54', '2025-04-06 08:28:54', NULL),
(12, 27, 'products/JIgwz8h9nbVJvwiIjMaV5CMyiPWGmKVzxmhAou13.webp', '2025-04-16 07:30:17', '2025-04-16 07:30:17', NULL),
(13, 27, 'products/v6GKbWeW2DlsdD4zCRNYcXjLhhXq9gb9DZvpSxlc.webp', '2025-04-16 07:30:21', '2025-04-16 07:30:21', NULL),
(14, 27, 'products/uxlJpBCQ68Y3dhRZ0LuGXIyuHd06meac5qrNZR9E.webp', '2025-04-16 07:30:25', '2025-04-16 07:30:25', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_specifications`
--

CREATE TABLE `product_specifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `propertie_id` bigint(20) UNSIGNED DEFAULT NULL,
  `value_add` text DEFAULT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Activo 2 = Inactivo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `product_specifications`
--

INSERT INTO `product_specifications` (`id`, `product_id`, `attribute_id`, `propertie_id`, `value_add`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(19, 27, 14, NULL, 'Apple', 1, '2025-04-16 07:05:31', '2025-04-16 07:05:31', NULL),
(20, 27, 15, NULL, 'Iphone 15', 1, '2025-04-16 07:05:46', '2025-04-16 07:05:46', NULL),
(21, 27, 16, NULL, 'Iphone 15 Pro Max', 1, '2025-04-16 07:05:57', '2025-04-16 07:05:57', NULL),
(22, 27, 17, NULL, 'Si', 1, '2025-04-16 07:06:04', '2025-04-16 07:06:04', NULL),
(23, 27, 18, NULL, '1', 1, '2025-04-16 07:06:12', '2025-04-16 07:06:12', NULL),
(24, 27, 19, NULL, '2', 1, '2025-04-16 07:06:18', '2025-04-16 07:06:53', NULL),
(25, 27, 20, NULL, 'Nano-SIM', 1, '2025-04-16 07:07:59', '2025-04-16 07:08:08', NULL),
(26, 27, 21, NULL, 'Si', 1, '2025-04-16 07:08:17', '2025-04-16 07:08:17', NULL),
(27, 27, 22, 17, NULL, 1, '2025-04-16 07:08:55', '2025-04-16 07:08:55', NULL),
(28, 27, 22, 18, NULL, 1, '2025-04-16 07:09:01', '2025-04-16 07:09:01', NULL),
(29, 27, 22, 19, NULL, 1, '2025-04-16 07:09:07', '2025-04-16 07:09:07', NULL),
(30, 27, 23, NULL, '8 GB', 1, '2025-04-16 07:09:13', '2025-04-16 07:09:13', NULL),
(31, 27, 24, NULL, 'Apple A17 Pro', 1, '2025-04-16 07:09:35', '2025-04-16 07:09:35', NULL),
(32, 27, 25, NULL, '3.78 GHz', 1, '2025-04-16 07:09:48', '2025-04-16 07:09:48', NULL),
(33, 27, 26, NULL, '6.7\"', 1, '2025-04-16 07:10:00', '2025-04-16 07:10:00', NULL),
(34, 27, 27, NULL, 'HDR', 1, '2025-04-16 07:10:08', '2025-04-16 07:10:08', NULL),
(35, 27, 28, NULL, '2796 px x 1290 px', 1, '2025-04-16 07:10:30', '2025-04-16 07:10:30', NULL),
(36, 27, 29, NULL, 'OLED', 1, '2025-04-16 07:10:37', '2025-04-16 07:10:37', NULL),
(44, 27, 30, 27, NULL, 1, '2025-04-17 04:55:49', '2025-04-17 04:55:49', NULL),
(45, 27, 30, 28, NULL, 1, '2025-04-17 04:55:52', '2025-04-17 04:55:52', NULL),
(46, 27, 30, 29, NULL, 1, '2025-04-17 04:55:57', '2025-04-17 04:55:57', NULL),
(47, 27, 30, 30, NULL, 1, '2025-04-17 04:56:00', '2025-04-17 04:56:00', NULL),
(48, 12, 30, 27, NULL, 1, '2025-04-17 08:03:00', '2025-04-17 08:03:00', NULL),
(49, 12, 30, 28, NULL, 1, '2025-04-17 08:03:07', '2025-04-17 08:03:07', NULL),
(50, 12, 30, 29, NULL, 1, '2025-04-17 08:03:10', '2025-04-17 08:03:10', NULL),
(51, 12, 30, 30, NULL, 1, '2025-04-17 08:03:13', '2025-04-17 08:03:13', NULL),
(52, 34, 30, 27, NULL, 1, '2025-05-08 09:53:44', '2025-05-08 09:55:45', '2025-05-08 09:55:45'),
(53, 34, 30, 27, NULL, 1, '2025-05-08 09:56:20', '2025-05-08 09:56:20', NULL),
(54, 34, 32, NULL, '[{\"id\":31,\"name\":\"Color\"},{\"id\":32,\"name\":\"Color Rojo\"}]', 1, '2025-05-13 03:26:20', '2025-05-13 03:26:20', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_variations`
--

CREATE TABLE `product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `propertie_id` bigint(20) UNSIGNED DEFAULT NULL,
  `value_add` text DEFAULT NULL,
  `add_price` double NOT NULL DEFAULT 0,
  `stock` double NOT NULL DEFAULT 0,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Activo 2 = Inactivo',
  `product_variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `product_variations`
--

INSERT INTO `product_variations` (`id`, `product_id`, `attribute_id`, `propertie_id`, `value_add`, `add_price`, `stock`, `state`, `product_variation_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(18, 27, 22, 17, NULL, 0, 20, 1, NULL, '2025-04-16 07:12:01', '2025-04-16 07:12:44', NULL),
(19, 27, 22, 18, NULL, 150000, 20, 1, NULL, '2025-04-16 07:13:12', '2025-04-16 07:13:12', NULL),
(20, 27, 22, 19, NULL, 200000, 20, 1, NULL, '2025-04-16 07:13:31', '2025-04-16 07:13:31', NULL),
(30, 27, 30, 30, NULL, 0, 10, 1, 20, '2025-04-17 04:57:10', '2025-04-17 04:57:10', NULL),
(31, 27, 30, 29, NULL, 0, 10, 1, 20, '2025-04-17 04:57:45', '2025-04-17 04:57:45', NULL),
(32, 27, 30, 28, NULL, 0, 20, 1, 19, '2025-04-17 04:57:56', '2025-04-17 04:57:56', NULL),
(33, 27, 30, 27, NULL, 0, 20, 1, 18, '2025-04-17 04:58:05', '2025-04-17 04:58:05', NULL),
(34, 12, 30, 27, NULL, 0, 5, 1, NULL, '2025-04-17 08:03:34', '2025-04-17 08:03:34', NULL),
(35, 12, 30, 28, NULL, 0, 5, 1, NULL, '2025-04-17 08:03:41', '2025-04-17 08:03:41', NULL),
(36, 12, 30, 29, NULL, 0, 5, 1, NULL, '2025-04-17 08:03:49', '2025-04-17 08:03:49', NULL),
(37, 12, 30, 30, NULL, 0, 5, 1, NULL, '2025-04-17 08:03:55', '2025-04-17 08:03:55', NULL),
(39, 34, 30, 27, NULL, 0, 3, 1, 38, '2025-05-08 09:54:09', '2025-05-08 09:54:09', NULL),
(40, 34, 30, 27, NULL, 0, 5, 1, NULL, '2025-05-08 09:57:09', '2025-05-08 09:57:09', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `code` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `properties`
--

INSERT INTO `properties` (`id`, `attribute_id`, `name`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Rosado', '#ff8080', '2025-02-23 04:59:02', '2025-02-23 04:59:02', NULL),
(2, 2, 'Amarillo', '#d8f40b', '2025-02-23 05:01:32', '2025-02-23 05:01:32', NULL),
(4, 1, 'XL', NULL, '2025-02-23 05:38:51', '2025-02-23 05:38:51', NULL),
(5, 1, 'L', NULL, '2025-02-23 05:39:00', '2025-02-23 05:39:00', NULL),
(6, 8, '16 GB', NULL, '2025-03-16 21:46:19', '2025-03-16 21:46:19', NULL),
(7, 8, '32 GB', NULL, '2025-03-16 21:46:27', '2025-03-16 21:46:27', NULL),
(8, 8, '64 GB', NULL, '2025-03-16 21:46:30', '2025-03-16 21:46:30', NULL),
(9, 13, '16GB', NULL, '2025-03-19 08:46:48', '2025-03-19 08:46:48', NULL),
(10, 13, '32GB', NULL, '2025-03-19 08:46:53', '2025-03-19 08:46:53', NULL),
(11, 13, '64GB', NULL, '2025-03-19 08:46:57', '2025-03-19 08:46:57', NULL),
(12, 13, '128GB', NULL, '2025-03-19 08:47:03', '2025-03-19 08:47:03', NULL),
(14, 12, '512GB', NULL, '2025-03-19 08:47:59', '2025-03-19 08:47:59', NULL),
(15, 12, '1TB', NULL, '2025-03-19 08:48:03', '2025-03-19 08:48:03', NULL),
(16, 12, '2TB', NULL, '2025-03-19 08:48:06', '2025-03-19 08:48:06', NULL),
(17, 22, '256 GB', NULL, '2025-04-16 07:01:34', '2025-04-16 07:01:34', NULL),
(18, 22, '512 GB', NULL, '2025-04-16 07:01:41', '2025-04-16 07:01:41', NULL),
(19, 22, '1 TB', NULL, '2025-04-16 07:01:52', '2025-04-16 07:01:52', NULL),
(24, 31, 'Azul', NULL, '2025-04-17 04:41:03', '2025-04-17 04:41:03', NULL),
(25, 31, 'Rojo', NULL, '2025-04-17 04:41:10', '2025-04-17 04:41:10', NULL),
(26, 31, 'Verde', NULL, '2025-04-17 04:41:14', '2025-04-17 04:41:14', NULL),
(27, 30, 'Titanio Natural', '#686464', '2025-04-17 04:54:21', '2025-04-17 04:54:21', NULL),
(28, 30, 'Titanio Azul', '#373e72', '2025-04-17 04:54:55', '2025-04-17 04:54:55', NULL),
(29, 30, 'Titanio Blanco', '#c7c9dc', '2025-04-17 04:55:12', '2025-04-17 04:55:12', NULL),
(30, 30, 'Titanio Negro', '#232325', '2025-04-17 04:55:28', '2025-04-17 04:55:28', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `method_payment` varchar(250) NOT NULL,
  `currency_total` varchar(50) NOT NULL,
  `currency_payment` varchar(50) NOT NULL,
  `discount` double DEFAULT NULL,
  `subtotal` double NOT NULL,
  `total` double NOT NULL,
  `description` longtext DEFAULT NULL,
  `price_dolar` double DEFAULT NULL,
  `n_transaccion` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted__at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `method_payment`, `currency_total`, `currency_payment`, `discount`, `subtotal`, `total`, `description`, `price_dolar`, `n_transaccion`, `created_at`, `updated_at`, `deleted__at`) VALUES
(14, 14, 'PAYPAL', 'USD', 'USD', 0, 856.69, 856.69, NULL, 0, '9SR326087N1428710', '2025-05-10 09:47:29', '2025-05-10 09:47:29', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sale_addres`
--

CREATE TABLE `sale_addres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `surname` varchar(250) NOT NULL,
  `company` varchar(250) DEFAULT NULL,
  `country_region` varchar(250) DEFAULT NULL,
  `address` varchar(250) NOT NULL,
  `street` varchar(250) DEFAULT NULL,
  `city` varchar(250) DEFAULT NULL,
  `postcode_zip` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted__at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sale_addres`
--

INSERT INTO `sale_addres` (`id`, `sale_id`, `name`, `surname`, `company`, `country_region`, `address`, `street`, `city`, `postcode_zip`, `phone`, `email`, `created_at`, `updated_at`, `deleted__at`) VALUES
(14, 14, 'JAIME ANDRES', 'GUACARAPARE', 'Microsoft', 'Colombia', 'CALLE 71A 3 70', 'Casa esquinera verde de dos pisos, entrega rapida, de caracter urgente.', 'Neiva', '410001', '3187318310', 'jaimeandres274@gmail.com', '2025-05-10 09:47:29', '2025-05-10 09:47:29', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sale_details`
--

CREATE TABLE `sale_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `type_discount` tinyint(1) DEFAULT NULL,
  `discount` double DEFAULT 0,
  `type_campaing` tinyint(1) UNSIGNED DEFAULT NULL,
  `code_cupon` varchar(250) DEFAULT NULL,
  `code_discount` varchar(50) DEFAULT NULL,
  `product_variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` double NOT NULL DEFAULT 1,
  `price_unit` double NOT NULL,
  `subtotal` double NOT NULL,
  `total` double NOT NULL,
  `currency` varchar(20) NOT NULL DEFAULT 'COP',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted__at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sale_details`
--

INSERT INTO `sale_details` (`id`, `sale_id`, `product_id`, `type_discount`, `discount`, `type_campaing`, `code_cupon`, `code_discount`, `product_variation_id`, `quantity`, `price_unit`, `subtotal`, `total`, `currency`, `created_at`, `updated_at`, `deleted__at`) VALUES
(17, 14, 6, 1, 30, 1, NULL, '681a8829300b3', NULL, 1, 1098, 768.6, 768.6, 'USD', '2025-05-10 09:47:29', '2025-05-10 09:33:37', NULL),
(18, 14, 8, NULL, NULL, NULL, NULL, NULL, NULL, 2, 11.57, 11.57, 23.14, 'USD', '2025-05-10 09:47:29', '2025-05-10 09:33:51', NULL),
(19, 14, 24, NULL, NULL, NULL, NULL, NULL, NULL, 2, 14.2, 14.2, 28.4, 'USD', '2025-05-10 09:47:29', '2025-05-10 09:33:53', NULL),
(20, 14, 11, NULL, NULL, NULL, NULL, NULL, NULL, 1, 36.55, 36.55, 36.55, 'USD', '2025-05-10 09:47:29', '2025-05-10 09:33:41', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(250) NOT NULL,
  `label` varchar(250) DEFAULT NULL,
  `type_slider` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Principal 2 = Banners 3 = Productos',
  `subtitle` longtext DEFAULT NULL,
  `imagen` varchar(250) NOT NULL,
  `link` text DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `price_original` float(10,0) DEFAULT NULL,
  `price_campaing` float(10,0) DEFAULT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Activo 2 = Inactivo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `label`, `type_slider`, `subtitle`, `imagen`, `link`, `color`, `price_original`, `price_campaing`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'Portátil Gamer Alienware M16 Core Ultra 9 40gb 1tb Rtx 4060', 'A partir de $ 9.775.906', 3, 'Ultima Tecnologia Agregada', 'sliders/hdUgU6FhXUX146j4nnd9zsE2JphzG0HeS5IFVbmB.png', 'http://localhost:4200/landing/portatil-gamer-alienware-m16-core-ultra-9-40gb-1tb-rtx-4060?discount=67f204d5df7f0', '#b2aeae', 9775906, 6843134, 1, '2025-04-06 09:43:01', '2025-04-15 03:58:58', NULL),
(5, 'La Mejor Coleccion de SmartWatch 2025', '<span>A partir de <b>$ 100.000</b></span>', 1, '<p>Oferta Exclusiva                                      <span>-15%                                         <svg width=\"94\" height=\"20\" viewBox=\"0 0 94 20\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">                                           <path d=\"M74.8576 4.63367L78.6048 5.11367C80.9097 5.35155 82.8309 5.75148 84.4483 5.97993L86.6581 6.31091L88.4262 6.63948C89.4684 6.81761 90.2699 6.9312 90.8805 6.99186C93.3213 7.24888 92.7011 6.63674 92.8183 6.12534C92.9355 5.61394 93.7175 5.37081 91.3267 4.45886C90.73 4.24001 89.9345 3.97481 88.8826 3.65818L87.1034 3.12577L84.8643 2.63282C83.236 2.28025 81.2402 1.82307 78.8684 1.52138L75.0177 0.981633C73.6188 0.823014 72.1417 0.730003 70.5389 0.582533C63.0297 0.0282543 55.4847 0.193022 48.0068 1.07459C39.9065 2.04304 31.9328 3.87384 24.2213 6.53586C18.0824 8.61764 12.1674 11.3089 6.56479 14.5692C4.88189 15.5255 3.25403 16.5756 1.68892 17.7145C0.568976 18.5077 -0.00964231 18.9932 0.0547097 19.0858C0.388606 19.6584 10.6194 13.1924 25.151 8.99361C32.789 6.72748 40.6283 5.20536 48.5593 4.44848C55.8569 3.76455 63.1992 3.69678 70.5082 4.24591L74.8223 4.62335\" fill=\"currentColor\"></path>                                        </svg>                                     </span>                                  de Descuento esta Semana</p>', 'sliders/cztBUbHMt9HXWjQjBgpyP9pvfifjY37kphNH4ewC.png', NULL, '#b29090', NULL, NULL, 1, '2025-04-10 01:22:17', '2025-04-10 01:22:17', NULL),
(8, 'La mejor Coleccion de Portatiles 2026', '<span>A partir de <b>$ 1.500.000</b></span>', 1, '<p>Oferta Exclusiva                                      <span>-35%                                         <svg width=\"94\" height=\"20\" viewBox=\"0 0 94 20\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">                                           <path d=\"M74.8576 4.63367L78.6048 5.11367C80.9097 5.35155 82.8309 5.75148 84.4483 5.97993L86.6581 6.31091L88.4262 6.63948C89.4684 6.81761 90.2699 6.9312 90.8805 6.99186C93.3213 7.24888 92.7011 6.63674 92.8183 6.12534C92.9355 5.61394 93.7175 5.37081 91.3267 4.45886C90.73 4.24001 89.9345 3.97481 88.8826 3.65818L87.1034 3.12577L84.8643 2.63282C83.236 2.28025 81.2402 1.82307 78.8684 1.52138L75.0177 0.981633C73.6188 0.823014 72.1417 0.730003 70.5389 0.582533C63.0297 0.0282543 55.4847 0.193022 48.0068 1.07459C39.9065 2.04304 31.9328 3.87384 24.2213 6.53586C18.0824 8.61764 12.1674 11.3089 6.56479 14.5692C4.88189 15.5255 3.25403 16.5756 1.68892 17.7145C0.568976 18.5077 -0.00964231 18.9932 0.0547097 19.0858C0.388606 19.6584 10.6194 13.1924 25.151 8.99361C32.789 6.72748 40.6283 5.20536 48.5593 4.44848C55.8569 3.76455 63.1992 3.69678 70.5082 4.24591L74.8223 4.62335\" fill=\"currentColor\"></path>                                        </svg>                                     </span>                                  de Descuento esta Semana</p>', 'sliders/xaYt7LdlAvAVaekVP721AJCVxdxKFicDsxzP4Dch.png', 'http://localhost:4200/landing/portatil-gamer-alienware-m16-core-ultra-9-40gb-1tb-rtx-4060?discount=67f204d5df7f0', '#b2a9a9', NULL, NULL, 1, '2025-04-10 02:00:24', '2025-04-10 20:33:40', NULL),
(9, 'Apple <br> iPhone 15 Pro Max', NULL, 2, 'Rebajas 20% en toda la tienda', 'sliders/EIfj7xR1XdFjXN8eaxufqesMjRMLyNAtTUFdaGrC.png', 'http://localhost:4200/discount/67fd34b3b1b81', NULL, NULL, NULL, 1, '2025-04-14 21:19:11', '2025-04-14 22:26:59', NULL),
(10, 'Hyperx Cloud <br> Stinger', NULL, 2, 'Rebajas 35% de descuento', 'sliders/9v7rhaVfxA7z2DIYoAS7u37dPvfIr06oev4UuQfQ.png', 'http://localhost:4200/discount/67fd37b97698a', '#494646', NULL, NULL, 1, '2025-04-14 21:29:42', '2025-04-14 22:26:00', NULL),
(11, 'Apple iPhone 14 Pro Max 128 GB Morado Oscuro', NULL, 3, 'Oferta Exclusiva -35% de Descuento en Apple', 'sliders/earytOsB6vV4qr4EPynxmlO62Z7rZypKekV1kd9E.png', 'http://localhost:4200/discount/67fd93f767dcd', '#b3a8a8', 3990000, 1396500, 1, '2025-04-15 04:04:46', '2025-04-15 04:11:58', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(250) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `uniqd` varchar(50) DEFAULT NULL,
  `avatar` varchar(250) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `type_user` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 = Administrador, 2 = Cliente.',
  `code_verified` varchar(50) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `phone`, `uniqd`, `avatar`, `email`, `type_user`, `code_verified`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 'Andres', 'Dev', '3187318310', '6797f63722d82', NULL, 'jaimeandres274@hotmail.com', 1, NULL, '2025-01-28 04:17:14', '$2y$12$5zGSBKI6kqaGI0Z2tA8KFOBNMi0.C8/fGDd3muSceP6IBmtmrPhG6', NULL, '2025-01-28 02:10:15', '2025-01-28 04:17:14', NULL),
(14, 'Jaime Andres', 'Sotelo', '3187318310', '67f92cc5bdb25', NULL, 'jaime_guacarapareso@fet.edu.co', 2, NULL, '2025-05-08 06:16:12', '$2y$12$62QlfF8bc/OpVkPF6/A5f.oObY2.Pce5WbMFmyHNn9X1.g5o19gIu', NULL, '2025-04-11 19:52:54', '2025-05-05 07:51:02', NULL),
(16, 'Ily', 'Lain', '3183422398', '67f92cc5bdb29', NULL, 'ilylain@outlook.es', 2, NULL, '2025-04-11 19:53:43', '$2y$12$62QlfF8bc/OpVkPF6/A5f.oObY2.Pce5WbMFmyHNn9X1.g5o19gIu', NULL, '2025-04-11 19:52:54', '2025-05-05 07:51:02', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_addres`
--

CREATE TABLE `user_addres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `surname` varchar(250) NOT NULL,
  `company` varchar(250) DEFAULT NULL,
  `country_region` varchar(250) DEFAULT NULL,
  `address` varchar(250) NOT NULL,
  `street` varchar(250) DEFAULT NULL,
  `city` varchar(250) DEFAULT NULL,
  `postcode_zip` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted__at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user_addres`
--

INSERT INTO `user_addres` (`id`, `user_id`, `name`, `surname`, `company`, `country_region`, `address`, `street`, `city`, `postcode_zip`, `phone`, `email`, `created_at`, `updated_at`, `deleted__at`) VALUES
(1, 14, 'JAIME ANDRES', 'GUACARAPARE', 'Microsoft', 'Colombia', 'CALLE 71A 3 70', 'Casa esquinera verde de dos pisos, entrega rapida, de caracter urgente.', 'Neiva', '410001', '3187318310', 'jaimeandres274@gmail.com', '2025-05-09 08:22:16', '2025-05-09 08:35:51', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cupones`
--
ALTER TABLE `cupones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cupone_brands`
--
ALTER TABLE `cupone_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cupone_categories`
--
ALTER TABLE `cupone_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cupone_products`
--
ALTER TABLE `cupone_products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `discount_brands`
--
ALTER TABLE `discount_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `discount_categories`
--
ALTER TABLE `discount_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `discount_products`
--
ALTER TABLE `discount_products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sale_addres`
--
ALTER TABLE `sale_addres`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `user_addres`
--
ALTER TABLE `user_addres`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `cupones`
--
ALTER TABLE `cupones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `cupone_brands`
--
ALTER TABLE `cupone_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `cupone_categories`
--
ALTER TABLE `cupone_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `cupone_products`
--
ALTER TABLE `cupone_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `discount_brands`
--
ALTER TABLE `discount_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `discount_categories`
--
ALTER TABLE `discount_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `discount_products`
--
ALTER TABLE `discount_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `product_specifications`
--
ALTER TABLE `product_specifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `sale_addres`
--
ALTER TABLE `sale_addres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `user_addres`
--
ALTER TABLE `user_addres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
