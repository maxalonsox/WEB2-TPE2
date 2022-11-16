<?php 

class ProductApiModel {
    private $db;

    public function __construct() {
        $this->db = $this->connect();
    }

    public function connect() {
        $db = new PDO('mysql:host=localhost;'.'dbname=db_cafeteria;charset=utf8','root','');
        return $db;
    }

    public function get($id) {
        $query = $this->db->prepare("SELECT * FROM tipodecafe WHERE id=?");
        $query->execute(array($id));
        $products = $query->fetchAll(PDO::FETCH_OBJ);
        return $products;
    }

    public function getAll($field, $order, $limit, $startAt) {
        $query = $this->db->prepare("SELECT * FROM tipodecafe ORDER BY $field $order LIMIT $limit OFFSET $startAt");
        $query->execute();
        $products = $query->fetchAll(PDO::FETCH_OBJ); //devuelve un arreglo con todos los tipos de café
        return $products;
    }

    public function getAllByMarca($marca) {
        $query = $this->db->prepare("SELECT P.* FROM tipodecafe P JOIN marca M ON P.id_marca_fk = M.id WHERE M.nombre=?");
        $query->execute(array($marca));
        $products = $query->fetchAll(PDO::FETCH_OBJ);
        return $products;
    }

    public function save($nombre, $descripcion, $cantidad, $precioBase, $id_marca_fk) {
        $query = $this->db->prepare("INSERT INTO tipodecafe (id, nombre, imagen, descripcion, cantidad, precioBase, id_marca_fk) VALUES (?,?,?,?,?,?,?)");
        $query->execute(array(null, $nombre, "", $descripcion, $cantidad, $precioBase, $id_marca_fk));
        return $this->db->lastInsertId();
    }

    public function edit($id, $nombre, $descripcion, $cantidad, $precioBase, $id_marca_fk) {
        $query = $this->db->prepare("UPDATE tipodecafe SET nombre=?, descripcion=?, cantidad=?, precioBase=?, id_marca_fk=? WHERE id=?");
        $query->execute(array($nombre, $descripcion, $cantidad, $precioBase, $id_marca_fk, $id));
    }

    public function getColumns() {
        $query = $this->db->prepare('DESCRIBE tipodecafe');
        $query->execute();
        $columns = $query->fetchAll(PDO::FETCH_OBJ);
        return $columns;
    }
}