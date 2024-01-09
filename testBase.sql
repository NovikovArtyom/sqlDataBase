-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 09 2024 г., 23:25
-- Версия сервера: 10.8.4-MariaDB
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `testBase`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Customer`
--

CREATE TABLE `Customer` (
  `id` bigint(20) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Customer`
--

INSERT INTO `Customer` (`id`, `name`, `city`) VALUES
(1, 'Поляков Никита ', 'Москва'),
(2, 'Новиков Артём', 'Переславль-Залесский'),
(3, 'Яна Базаева', 'Ярославль'),
(4, 'Наташа', 'Питер');

-- --------------------------------------------------------

--
-- Структура таблицы `Product`
--

CREATE TABLE `Product` (
  `id` bigint(20) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Product`
--

INSERT INTO `Product` (`id`, `name`, `cost`) VALUES
(1, 'Бутылка колы', 100),
(2, 'Бутылка Пепси', 110),
(3, 'Лэйс с крабом', 150),
(4, 'Лэйс с Сашлыком', 160);

-- --------------------------------------------------------

--
-- Структура таблицы `Request`
--

CREATE TABLE `Request` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `supplier_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Request`
--

INSERT INTO `Request` (`id`, `customer_id`, `supplier_id`) VALUES
(1, 2, 2),
(2, 1, 2),
(3, 2, 1),
(4, 1, 2),
(5, 1, 1),
(6, 3, 3),
(7, 3, 1),
(8, 3, 2),
(9, 1, 3),
(10, 2, 1),
(11, 4, 1),
(12, 4, 1),
(13, 3, 1),
(14, 4, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Request_Item`
--

CREATE TABLE `Request_Item` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `volume` double NOT NULL,
  `request_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Request_Item`
--

INSERT INTO `Request_Item` (`id`, `product_id`, `volume`, `request_id`) VALUES
(1, 1, 1000, 1),
(2, 2, 2000, 1),
(3, 1, 2, 2),
(4, 2, 20, 3),
(5, 1, 1, 4),
(6, 2, 1, 4),
(7, 1, 1, 4),
(8, 2, 1, 4),
(9, 1, 3, 4),
(10, 2, 3, 4),
(11, 1, 2, 2),
(12, 1, 2, 1),
(13, 1, 1000, 5),
(14, 1, 10000, 5),
(15, 3, 100, 6),
(16, 4, 200, 6),
(17, 2, 10000, 6),
(18, 1, 20000, 6),
(19, 1, 5000, 7),
(20, 2, 5000, 8),
(21, 3, 10000, 9),
(22, 3, 50000, 9),
(23, 1, 12000, 10),
(24, 1, 2, 11),
(25, 1, 49, 12),
(26, 1, 1, 13),
(27, 4, 3, 13),
(28, 3, 2, 13),
(29, 1, 2, 13),
(30, 1, 51, 14);

-- --------------------------------------------------------

--
-- Структура таблицы `Supplier`
--

CREATE TABLE `Supplier` (
  `id` bigint(20) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Supplier`
--

INSERT INTO `Supplier` (`id`, `name`) VALUES
(1, 'ООО \"COCA-COLA\"'),
(2, 'ООО \"PEPSI\"'),
(3, 'ООО \"ЛЭЙС\"');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Request`
--
ALTER TABLE `Request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Индексы таблицы `Request_Item`
--
ALTER TABLE `Request_Item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Индексы таблицы `Supplier`
--
ALTER TABLE `Supplier`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Customer`
--
ALTER TABLE `Customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Product`
--
ALTER TABLE `Product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Request`
--
ALTER TABLE `Request`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `Request_Item`
--
ALTER TABLE `Request_Item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `Supplier`
--
ALTER TABLE `Supplier`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Request`
--
ALTER TABLE `Request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `Supplier` (`id`),
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`id`);

--
-- Ограничения внешнего ключа таблицы `Request_Item`
--
ALTER TABLE `Request_Item`
  ADD CONSTRAINT `request_item_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `Request` (`id`),
  ADD CONSTRAINT `request_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
