<?php
require_once '../database/db.php';

class UserModel {
    private $db;

    public function __construct() {
        $this->db = new Db(); // Asegúrate de que Db esté correctamente incluido
    }

    // Registrar nuevo usuario
    public function registerUser($nombre, $apellido, $dni, $correo, $usuario, $contrasenia) {
        try {
            $conn = $this->db->conection;
            $conn->beginTransaction();

            $sqlPersonas = "INSERT INTO personas (nombre, apellido, dni, telefono, email) VALUES (:nombre, :apellido, :dni, :telefono, :correo)";
            $stmtPersonas = $this->db->conection->prepare($sqlPersonas);
            $stmtPersonas->execute([
                ':nombre' => $nombre,
                ':apellido' => $apellido,
                ':dni' => $dni,
                ':telefono' => $telefono,
                ':correo' => $correo
            ]);

            $idPersona = $this->db->conection->lastInsertId();

            $sqlUsuarios = "INSERT INTO usuarios (id_persona, usuario, contrasenia, id_roles) VALUES (:id_persona, :usuario, :contrasenia, :id_roles)";
            $stmtUsuarios = $this->db->conection->prepare($sqlUsuarios);
            $stmtUsuarios->execute([
                ':id_persona' => $idPersona,
                ':usuario' => $usuario,
                ':contrasenia' => password_hash($contrasenia, PASSWORD_BCRYPT),
                ':id_roles' => 3
            ]);

            $this->db->conection->commit();
            return true;
        } catch (PDOException $e) {
            $this->db->conection->rollBack();
            echo "Error al registrar usuario: " . $e->getMessage();
            return false;
        }
    }

    // Actualizar la información de un usuario (perfil)
    public function actualizarPerfil($usuario_id, $campo, $nuevo_valor) {
        try {
            $sql = "UPDATE personas p JOIN usuarios u ON p.id_persona = u.id_persona SET p.$campo = :nuevo_valor WHERE u.id_usuario = :id_usuario";
            $stmt = $this->db->conection->prepare($sql);
            $stmt->bindParam(':nuevo_valor', $nuevo_valor, PDO::PARAM_STR);
            $stmt->bindParam(':id_usuario', $usuario_id, PDO::PARAM_INT);
            return $stmt->execute();
        } catch (PDOException $e) {
            echo "Error al actualizar los datos: " . $e->getMessage();
            return false;
        }
    }
}
?>
