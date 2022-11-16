<?php
require_once 'libs/Router.php';
require_once 'api/controllers/ProductApiController.php';

$router = new Router();

$router->addRoute('products', 'GET', 'ProductApiController', 'get'); //lista todos los productos.
$router->addRoute('products/:ID', 'GET', 'ProductApiController', 'get'); //devuelve un producto por id.
$router->addRoute('products', 'POST', 'ProductApiController', 'add'); //agrega un producto.
$router->addRoute('products/:ID', 'PUT', 'ProductApiController', 'edit'); //modifica un producto.

$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);