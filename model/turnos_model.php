<?php
require_once '../database/db.php';

class TurnosModel {
    private $db;

    public function __construct() {
        $this->db = (new Db())->conection;
    }

    public function crearTurno($id_persona, $fecha, $hora, $diagnostico) {
        try {
            $stmt = $this->db->prepare("INSERT INTO turnos (id_persona, fecha, hora, diagnostico) 
                                        VALUES (:id_persona, :fecha, :hora, :diagnostico)");
            $stmt->bindParam(':id_persona', $id_persona, PDO::PARAM_INT);
            $stmt->bindParam(':fecha', $fecha);
            $stmt->bindParam(':hora', $hora);
            $stmt->bindParam(':diagnostico', $diagnostico);
            return $stmt->execute();
        } catch (PDOException $e) {
            return false;
        }
    }

    public function obtenerTurnos() {
        try {
            $stmt = $this->db->prepare("SELECT t.id_turno, p.nombre, p.apellido, t.fecha, t.hora, t.diagnostico 
                                        FROM turnos t 
                                        JOIN personas p ON t.id_persona = p.id_persona");
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return [];
        }
    }

    public function obtenerTurnoPorId($id_turno) {
        try {
            $stmt = $this->db->prepare("SELECT t.id_turno, p.nombre, p.apellido, t.fecha, t.hora, t.diagnostico 
                                        FROM turnos t 
                                        JOIN personas p ON t.id_persona = p.id_persona 
                                        WHERE t.id_turno = :id_turno");
            $stmt->bindParam(':id_turno', $id_turno, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetch(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return false;
        }
    }

    public function editarTurno($id_turno, $fecha, $hora, $diagnostico) {
        try {
            $stmt = $this->db->prepare("UPDATE turnos SET fecha = :fecha, hora = :hora, diagnostico = :diagnostico 
                                        WHERE id_turno = :id_turno");
            $stmt->bindParam(':fecha', $fecha);
            $stmt->bindParam(':hora', $hora);
            $stmt->bindParam(':diagnostico', $diagnostico);
            $stmt->bindParam(':id_turno', $id_turno, PDO::PARAM_INT);
            return $stmt->execute();
        } catch (PDOException $e) {
            return false;
        }
    }

    public function eliminarTurno($id_turno) {
        try {
            $stmt = $this->db->prepare("DELETE FROM turnos WHERE id_turno = :id_turno");
            $stmt->bindParam(':id_turno', $id_turno, PDO::PARAM_INT);
            return $stmt->execute();
        } catch (PDOException $e) {
            return false;
        }
    }
}
?>
