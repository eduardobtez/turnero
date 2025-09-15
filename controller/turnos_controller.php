<?php
session_start();
require_once '../model/turnos_model.php';
require_once '../database/db.php';

class TurnosController {
    private $model;

    public function __construct() {
        $this->model = new TurnosModel();
    }

    public function reservarTurno() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $id_usuario = $_SESSION['id']; 
            $id_persona = $this->getIdPersonaByIdUsuario($id_usuario);

            if ($id_persona === null) {
                echo "No se pudo obtener el id_persona para este usuario.";
                return;
            }

            $fecha = $_POST['fecha'];
            $hora = $_POST['hora'];
            $diagnostico = $_POST['diagnostico'];

            if (!empty($fecha) && !empty($hora) && !empty($diagnostico)) {
                $resultado = $this->model->crearTurno($id_persona, $fecha, $hora, $diagnostico);
                if ($resultado) {
                    header("Location: ../index.php?mensaje=Turno reservado con éxito");
                    exit();
                } else {
                    echo "Error al reservar el turno.";
                }
            } else {
                echo "Todos los campos son obligatorios.";
            }
        }
    }

    public function editarTurno() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['id_turno'], $_POST['fecha'], $_POST['hora'], $_POST['diagnostico'])) {
            $id_turno = $_POST['id_turno'];
            $fecha = $_POST['fecha'];
            $hora = $_POST['hora'];
            $diagnostico = $_POST['diagnostico'];

            $resultado = $this->model->editarTurno($id_turno, $fecha, $hora, $diagnostico);
            if ($resultado) {
                header("Location: ../view/consultas_asistente.php");
                exit();
            } else {
                echo "Error al actualizar el turno.";
            }
        } else {
            echo "Faltan datos.";
        }
    }

    public function eliminarTurno() {
        if (isset($_GET['id'])) {
            $id_turno = $_GET['id'];
            if ($this->model->eliminarTurno($id_turno)) {
                header("Location: ../view/consultas_asistente.php");
                exit();
            } else {
                echo "Error al eliminar el turno.";
            }
        }
    }

    private function getIdPersonaByIdUsuario($id_usuario) {
        try {
            $db = (new Db())->conection;
            $stmt = $db->prepare("SELECT id_persona FROM usuarios WHERE id_usuario = :id_usuario");
            $stmt->bindParam(':id_usuario', $id_usuario, PDO::PARAM_INT);
            $stmt->execute();
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return $result ? $result['id_persona'] : null;
        } catch (PDOException $e) {
            return null;
        }
    }
}

// Procesamiento de las acciones
$controller = new TurnosController();
if (isset($_GET['action'])) {
    switch ($_GET['action']) {
        case 'reservar':
            $controller->reservarTurno();
            break;
        case 'editar':
            $controller->editarTurno();
            break;
        case 'eliminar':
            $controller->eliminarTurno();
            break;
        default:
            echo "Acción no válida.";
    }
}
?>
