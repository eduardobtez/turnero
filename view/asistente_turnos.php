<?php
session_start();
if (!isset($_SESSION['id']) || $_SESSION['rol'] !== 'asistente') {
    header("Location: ../index.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservar Turno - Asistente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../style/tratamientos.css">
    <link rel="stylesheet" href="../style/button.css">
</head>
<body>
    <div class="container my-5">
        <h1 class="text-center mb-4">Reservar Turno - Asistente</h1>

        <!-- Formulario para buscar paciente por DNI -->
        <form action="asistente_turnos.php" method="POST" class="border rounded p-4 bg-light shadow mb-4">
            <h3 class="mb-3">Buscar Paciente</h3>
            <div class="mb-3">
                <label for="dni" class="form-label">DNI del Paciente:</label>
                <input type="text" id="dni" name="dni" class="form-control" required>
            </div>
            <button type="submit" name="accion" value="buscarPaciente" class="btn-reserver">Buscar</button>
        </form>

        <?php
        if (isset($_POST['accion']) && $_POST['accion'] === 'buscarPaciente') {
            require_once '../model/PersonasModel.php';
            $personasModel = new PersonasModel();
            $dni = $_POST['dni'];
            $paciente = $personasModel->buscarPacientePorDni($dni);
        
            if ($paciente) {
                $nombre = $paciente['nombre'];
                $apellido = $paciente['apellido'];
                $dni = $paciente['dni'];
                $telefono = $paciente['telefono'];
                $email = $paciente['email'];
                $id_persona = $paciente['id_persona'];
            } else {
                echo '<div class="alert alert-danger">Paciente no encontrado. Debe cargar los datos.</div>';
            }
        }
        ?>

        <!-- Formulario para reservar el turno -->
        <form action="../controller/reservarturno_asistente.php" method="POST" class="border rounded p-4 bg-light shadow">
            <h3 class="mb-3">Datos del Paciente</h3>
            <input type="hidden" id="id_persona" name="id_persona" value="<?= isset($id_persona) ? $id_persona : '' ?>">

            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="text" id="nombre" name="nombre" class="form-control" value="<?= isset($nombre) ? $nombre : '' ?>" required>
            </div>

            <div class="mb-3">
                <label for="apellido" class="form-label">Apellido:</label>
                <input type="text" id="apellido" name="apellido" class="form-control" value="<?= isset($apellido) ? $apellido : '' ?>" required>
            </div>

            <div class="mb-3">
                <label for="dni" class="form-label">DNI:</label>
                <input type="text" id="dni" name="dni" class="form-control" value="<?= isset($dni) ? $dni : '' ?>" required>
            </div>

            <div class="mb-3">
                <label for="telefono" class="form-label">Teléfono:</label>
                <input type="text" id="telefono" name="telefono" class="form-control" value="<?= isset($telefono) ? $telefono : '' ?>" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Correo Electrónico:</label>
                <input type="email" id="email" name="email" class="form-control" value="<?= isset($email) ? $email : '' ?>" required>
            </div>

            <h3 class="mb-3">Datos del Turno</h3>
            <div class="mb-3">
                <label for="fecha" class="form-label">Fecha del Turno:</label>
                <input type="date" id="fecha" name="fecha" class="form-control" min="<?= date('Y-m-d'); ?>" required>
            </div>

            <div class="mb-3">
                <label for="hora" class="form-label">Hora del Turno:</label>
                <select name="hora" id="hora" class="form-select" required>
                    <option value="08:00">08:00</option>
                    <option value="08:30">08:30</option>
                    <option value="09:00">09:00</option>
                    <option value="09:30">09:30</option>
                    <option value="10:00">10:00</option>
                    <option value="10:30">10:30</option>
                    <option value="11:00">11:00</option>
                    <option value="11:30">11:30</option>
                    <option value="17:00">17:00</option>
                    <option value="17:30">17:30</option>
                    <option value="18:00">18:00</option>
                    <option value="18:30">18:30</option>
                    <option value="19:00">19:00</option>
                    <option value="19:30">19:30</option>
                    <option value="20:00">20:00</option>
                    <option value="20:30">20:30</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="diagnostico" class="form-label">Diagnóstico:</label>
                <textarea id="diagnostico" name="diagnostico" class="form-control" rows="4" required></textarea>
            </div>

            <div class="d-flex justify-content-between">
                <button type="submit" class="btn-reserve">Reservar Turno</button>
                <a href="../index.php" class="btn-return">Volver a la página principal</a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
