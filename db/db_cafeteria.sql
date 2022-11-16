-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2022 a las 16:09:00
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_cafeteria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `precioAdicional` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `nombre`, `pais`, `precioAdicional`) VALUES
(1, 'Volcanica', 'Estados Unidos', 500),
(2, 'JAVA', 'Kenia', 350),
(3, 'CoffeeBean', 'Indonesia', 200),
(4, 'Death Wish', 'Mixto', 400),
(18, 'Wild Jo', 'Arabia', 550);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodecafe`
--

CREATE TABLE `tipodecafe` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioBase` float NOT NULL,
  `id_marca_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipodecafe`
--

INSERT INTO `tipodecafe` (`id`, `nombre`, `imagen`, `descripcion`, `cantidad`, `precioBase`, `id_marca_fk`) VALUES
(2, 'Café irlandés', 'images/products/634d609a55b98.jpg', 'Este tipo de espresso doble en el que se añade Whisky  y una capa consistente de nata montada o crema. Se suele servir en copa de cóctel.', 250, 1100, 4),
(3, 'Latte', 'images/products/634d60a23c949.jpg', 'Utiliza, el café espresso como base, al que se añade leche y espuma de leche.', 600, 550, 1),
(4, 'Expresso', 'images/products/634d60acce87f.jpg', 'Uno de los tipos de café más básicos y sencillos, únicamente consiste en una infusión de café que se consigue hirviendo agua en contacto con el grano. Se puede preparar en pocos segundos. Es un tipo de café corto, y su tamaño suele rondar los 250ml. Habitualmente se usa como el café de la variante arábiga y suele tener algo de espuma por encima.', 250, 400, 3),
(5, 'Americano', 'images/products/634d60b899b03.jpg', 'Este tipo de café derivado del espresso se caracteriza por añadir una cantidad de agua mucho mayor de lo habitual en su preparación, teniendo como resultado un producto suyo sabor es menos potente y algo más aguado, algo que lo hace menos amargo y facilita un sabor dulce. En este caso se realizaría primero un espresso y a este se le añadiría externamente agua hirviendo.', 300, 450, 3),
(7, 'Café bombón', 'images/products/634d60c1539fa.jpg', 'Una versión mucho más endulzada del café con leche, ya que se sustituye la leche normal por la leche condensada. Lo habitual es que se ponga primero ésta y luego agregar el café.', 450, 700, 2),
(8, 'Carajillo', 'images/products/634d60cac7827.jpg', 'El carajillo es un café preparado como un espresso al cual se le añade, además de la infusión, cierta cantidad de alguna bebida espirituosa, generalmente brandy, orujo o whisky. Primero se hecha el licor previamente calentado y posteriormente el café.', 400, 1000, 4),
(9, 'Lungo', 'images/products/634d60d2f23f1.jpg', 'Se trata de un tipo de café en el que la extracción de agua en contacto con los granos de café se realiza de manera más prolongada, lo que conlleva una mayor cantidad de infusión. Suele servirse en tazas grandes o incluso vasos largos.', 800, 950, 18),
(12, 'Ristretto', 'images/products/634d60dbc6577.jpg', 'Es una variante del espresso que se caracteriza por tener la misma cantidad de café pero emplear para ella una proporción menor de agua. Consiguiendo así un café concentrado de sabor muy potente, para los grandes amantes de café.', 200, 750, 1),
(13, 'Cappuccino', 'images/products/634d60e57398d.jpg', 'Es de los cafés más habituales, siendo similar al café con leche con la excepción de que en este caso solo encontramos alrededor de un tercio de café y el resto de leche. Generalmente esta es espumada, y suele añadírsele de forma espolvoreada algo de cacao en polvo para darle un sabor más dulce.', 450, 850, 1),
(14, 'Mocca', 'images/products/634d60ee88c04.jpg', 'Es una variante del tradicional café con leche en el que además de leche y café se emplea obligatoriamente chocolate o cacao ya sea en forma de sirope o en polvo.', 550, 650, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'admin@gmail.com', '$2y$10$eY3rENXkUIFQZexUgh2ghe.EQ9gdjFhzMyDsuHTzkU2fT7G4f2TRC');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipodecafe`
--
ALTER TABLE `tipodecafe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_marca_fk` (`id_marca_fk`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `tipodecafe`
--
ALTER TABLE `tipodecafe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tipodecafe`
--
ALTER TABLE `tipodecafe`
  ADD CONSTRAINT `tipodecafe_ibfk_1` FOREIGN KEY (`id_marca_fk`) REFERENCES `marca` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
