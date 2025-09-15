<?php
session_start();
if (!isset($_SESSION['id']) || $_SESSION['rol'] !== 'paciente') {
    header("Location: ../index.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservar Turno</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../style/button.css">
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="card mx-auto w-75 shadow">
        <div class="card-body">
            <h1 class="text-center mb-4">Reservar Turno</h1>
            
            <form action="../controller/turnos_controller.php" method="POST">
                <div class="mb-3">
                    <label for="fecha" class="form-label">Fecha:</label>
                    <input type="date" class="form-control" id="fecha" name="fecha" required>
                </div>
                
                <div class="mb-3">
                    <label for="hora" class="form-label">Hora del Turno:</label>
                    <select name="hora" id="hora" class="form-select" required>
                        <option value="" selected disabled>Seleccionar Hora</option>
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
                    <textarea class="form-control" id="diagnostico" name="diagnostico" rows="3" required></textarea>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn-reserve">Reservar Turno</button>
                </div>
            </form>

            <div class="text-center mt-3">
                <a href="../index.php" class="btn-return">Volver a la página principal</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
