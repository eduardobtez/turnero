<?php
session_start();
require_once '../model/TurnosModel.php';
require_once '../model/PersonasModel.php';

class ReservarTurnoAsistenteController {
    private $turnosModel;
    private $personasModel;

    public function __construct() {
        $this->turnosModel = new TurnosModel();
        $this->personasModel = new PersonasModel();
    }

    public function reservarTurno() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Datos del paciente
            $nombre = $_POST['nombre'];
            $apellido = $_POST['apellido'];
            $dni = $_POST['dni'];
            $telefono = $_POST['telefono'];
            $email = $_POST['email'];

            // Si el paciente tiene id_persona, solo actualizamos los datos
            if (isset($_POST['id_persona']) && !empty($_POST['id_persona'])) {
                $id_persona = $_POST['id_persona'];
            } else {
                // Insertar los datos del paciente en la tabla personas
                $id_persona = $this->personasModel->crearPersona($nombre, $apellido, $dni, $telefono, $email);
            }

            if ($id_persona) {
                // Datos del turno
                $fecha = $_POST['fecha'];
                $hora = $_POST['hora'];
                $diagnostico = $_POST['diagnostico'];

                // Insertar el turno en la tabla turnos
                $resultado = $this->turnosModel->crearTurno($id_persona, $fecha, $hora, $diagnostico);
                if ($resultado) {
                    header("Location: ../index.php");
                    exit();
                } else {
                    echo "Error al reservar el turno.";
                }
            } else {
                echo "Error al guardar los datos del paciente.";
            }
        }
    }
}

// Ejecutar la acción si se accede directamente al controlador
$controller = new ReservarTurnoAsistenteController();
$controller->reservarTurno();
?>
