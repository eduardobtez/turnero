<?php
require_once '../database/db.php';

class PersonasModel {
    private $db;

    public function __construct() {
        $this->db = (new Db())->conection;
    }

    public function buscarPacientePorDni($dni) {
        try {
            $stmt = $this->db->prepare("SELECT * FROM personas WHERE dni = :dni");
            $stmt->bindParam(':dni', $dni);
            $stmt->execute();
            return $stmt->fetch(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return false;
        }
    }

    public function crearPersona($nombre, $apellido, $dni, $telefono, $email) {
        try {
            $stmt = $this->db->prepare("INSERT INTO personas (nombre, apellido, dni, telefono, email) VALUES (:nombre, :apellido, :dni, :telefono, :email)");
            $stmt->bindParam(':nombre', $nombre);
            $stmt->bindParam(':apellido', $apellido);
            $stmt->bindParam(':dni', $dni);
            $stmt->bindParam(':telefono', $telefono);
            $stmt->bindParam(':email', $email);
            $stmt->execute();
            return $this->db->lastInsertId();
        } catch (PDOException $e) {
            return false;
        }
    }
}
?>
