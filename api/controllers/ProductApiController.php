<?php
require_once 'api/models/ProductApiModel.php';
require_once 'api/views/ProductApiView.php';
require_once 'api/models/MarcaApiModel.php';

class ProductApiController {
    private $model;
    private $view;
    private $data;
    private $marcamodel;

    public function __construct() {
        $this->view = new ProductApiView();
        $this->data = file_get_contents("php://input"); 
        $this->model = new ProductApiModel();
        $this->marcamodel = new MarcaApiModel();
    }

    private function getData() {
        return json_decode($this->data);
    }

    private function getColumns() {
        $columns = [];
        $result = $this->model->getColumns();
        foreach ($result as $column) {
            array_push($columns, $column->Field);
        }
        return $columns;
    }

    function get($params = null) {
        if ($params != null) { //Busco por ID
            $id = $params[':ID'];
            if (is_numeric($id) && $id > 0) {
                $product = $this->model->get($id);
                if ($product) {
                    $this->view->response($product, 200);  
                } else {
                    $this->view->response("No existe el producto con el id: {$id}", 404);
                }
            } else {
                return $this->view->response("Parámetro inválido.", 400);
            }
        } else { //Busco la colección entera según parámetros obtenidos por $_GET
            $columns = $this->getColumns(); // Guardo las columnas de product en una variable.
            // Inicializo las variables
            $sort = ($_GET['sort'] ?? "nombre");
            $order = ($_GET['order'] ?? "asc");
            $page = (int)($_GET['page'] ?? 1);
            $limit = (int)($_GET['limit'] ?? 50);
            $startAt = ($page*$limit)-$limit;
            if (($order != "asc") && ($order != "desc")) {
                return $this->view->response("Método de ordenamiento inválido", 400);
            }
            if (!in_array(strtolower($sort), $columns)) {
                return $this->view->response("Parámetro de ordenamiento inválido.", 400);
            }
            if (isset($_GET['marca'])) {
                $marca = $_GET['marca'];
                if ($this->existMarca($marca)) {
                    $products = $this->model->getAllByMarca($marca);
                    return $this->view->response($products, 200);
                } else {
                    return $this->view->response("La marca {$marca} no existe", 404);
                }
            }
            if ((!is_numeric($page) || $page <= 0) || (!is_numeric($limit) || $limit <= 0)) {
                return $this->view->response("Parámetros de paginación inválidos.", 400);
            }
            $products = $this->model->getAll($sort, $order, $limit, $startAt);
            return $this->view->response($products, 200);
        }
    }

    private function existMarca($name) {
        $marcas = $this->marcamodel->getAll();
        foreach($marcas as $marca) {
            if ($marca->nombre == $name) return true;
        }
        return false;
    }

    public function add($params = null) {
        $data = $this->getData();

        $id = $this->model->save($data->nombre, $data->descripcion, $data->cantidad, $data->precioBase, $data->id_marca_fk);
        
        $product = $this->model->get($id);
        if ($product)
            return $this->view->response($product, 200);
        else
            return $this->view->response("El producto no fue creado.", 500);
    }

    public function edit($params = null) {
        $id = $params[':ID'];
        $data = $this->getData();
        $product = $this->model->get($id);
        if ($product) {
            $this->model->edit($id, $data->nombre ?? $product[0]->nombre, $data->descripcion ?? $product[0]->descripcion, $data->cantidad ?? $product[0]->cantidad, $data->precioBase ?? $product[0]->precioBase, $data->id_marca_fk ?? $product[0]->id_marca_fk);
            return $this->view->response("El producto fue modificado con éxito.", 200);
        } else
            return $this->view->response("El producto con el id: {$id} no existe", 404);
    }
}