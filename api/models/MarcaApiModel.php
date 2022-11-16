<?php

class MarcaApiModel {
    private $db;

    public function __construct() {
        $this->db = $this->connect();
    }

    public function connect() {
        $db = new PDO('mysql:host=localhost;'.'dbname=db_cafeteria;charset=utf8','root','');
        return $db;
    }

    function getAll() {
        $query = $this->db->prepare('SELECT * FROM marca');
        $query->execute();
        $marcas = $query->fetchAll(PDO::FETCH_OBJ);
        return $marcas;
    }
}