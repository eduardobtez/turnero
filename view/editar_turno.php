<?php 
// Archivo: EditarTurno.php

session_start();
if (!isset($_SESSION['id']) || $_SESSION['rol'] !== 'asistente') {
    header("Location: ../index.php");
    exit();
}

require_once '../model/TurnosModel.php';

// Verificamos si el ID de turno fue enviado por POST
if (!isset($_POST['id_turno'])) {
    echo "ID de turno no proporcionado.";
    exit();
}

$id_turno = $_POST['id_turno']; // Recuperamos el ID desde POST
$turnosModel = new TurnosModel();
$turno = $turnosModel->obtenerTurnoPorId($id_turno);

if (!$turno) {
    echo "Turno no encontrado.";
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Turno</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container my-5">
        <h1 class="text-center mb-4">Editar Turno</h1>

        <!-- Formulario para editar el turno -->
        <form action="../controller/turnos_controller.php" method="POST" class="border rounded p-4 bg-light shadow">
            <input type="hidden" name="id_turno" value="<?= $turno['id_turno'] ?>">

            <!-- Campo Fecha -->
            <div class="mb-3">
                <label for="fecha" class="form-label">Fecha del Turno:</label>
                <input type="date" id="fecha" name="fecha" class="form-control" value="<?= $turno['fecha'] ?>" required>
            </div>

            <!-- Campo Hora -->
            <div class="mb-3">
                <label for="hora" class="form-label">Hora del Turno:</label>
                <select name="hora" id="hora" class="form-select" required>
                    <option value="08:00" <?= $turno['hora'] === "08:00" ? "selected" : "" ?>>08:00</option>
                    <option value="08:30" <?= $turno['hora'] === "08:30" ? "selected" : "" ?>>08:30</option>
                    <option value="08:30" <?= $turno['hora'] === "09:00" ? "selected" : "" ?>>09:00</option>
                    <option value="08:30" <?= $turno['hora'] === "09:30" ? "selected" : "" ?>>09:30</option>
                    <option value="08:30" <?= $turno['hora'] === "10:00" ? "selected" : "" ?>>10:00</option>
                    <option value="08:30" <?= $turno['hora'] === "10:30" ? "selected" : "" ?>>10:30</option>
                    <option value="08:30" <?= $turno['hora'] === "11:00" ? "selected" : "" ?>>11:10</option>
                    <option value="08:30" <?= $turno['hora'] === "11:30" ? "selected" : "" ?>>11:30</option>
                    <option value="08:30" <?= $turno['hora'] === "12:00" ? "selected" : "" ?>>12:30</option>
                    <option value="08:30" <?= $turno['hora'] === "17:00" ? "selected" : "" ?>>17:00</option>
                    <option value="08:30" <?= $turno['hora'] === "17:30" ? "selected" : "" ?>>17:30</option>
                    <option value="08:30" <?= $turno['hora'] === "18:00" ? "selected" : "" ?>>18:00</option>
                    <option value="08:30" <?= $turno['hora'] === "18:30" ? "selected" : "" ?>>18:30</option>
                    <option value="08:30" <?= $turno['hora'] === "19:00" ? "selected" : "" ?>>19:00</option>
                    <option value="08:30" <?= $turno['hora'] === "19:30" ? "selected" : "" ?>>19:30</option>
                    <option value="08:30" <?= $turno['hora'] === "20:00" ? "selected" : "" ?>>20:00</option>
                    <option value="08:30" <?= $turno['hora'] === "20:30" ? "selected" : "" ?>>20:30</option>
                    <option value="08:30" <?= $turno['hora'] === "21:00" ? "selected" : "" ?>>21:00</option>
                </select>
            </div>

            <!-- Campo Diagnóstico -->
            <div class="mb-3">
                <label for="diagnostico" class="form-label">Diagnóstico:</label>
                <textarea id="diagnostico" name="diagnostico" class="form-control" rows="4" required><?= $turno['diagnostico'] ?></textarea>
            </div>

            <!-- Botones -->
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                <a href="../index.php" class="btn btn-secondary">Volver a la página principal</a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
