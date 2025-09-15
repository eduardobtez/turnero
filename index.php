<?php
session_start(); // Iniciar la sesión para acceder a los datos almacenados

// Verificar si el usuario está logueado
$nombre_completo = isset($_SESSION['nombre_completo']) ? $_SESSION['nombre_completo'] : null;
$rol = isset($_SESSION['rol']) ? $_SESSION['rol'] : null;
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Julieta Pontte - Dermatóloga</title>
    <!-- Enlace a Bootstrap (puedes usar la versión más reciente) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-OgVRvuATP1z7JjD0pRVDI2eL2Ff7/sy2yKK6a2xj3c1qAX8HAsv9hWl+5/5N2D5V" crossorigin="anonymous">
    <!-- Enlace css-->
    <link rel="stylesheet" href="style/index.css">

</head>
<body>
    <header class="header">
        <nav class="nav">
            <ul>
                <?php if ($nombre_completo): ?>
                    <!-- Si el usuario está logueado -->
                    <li><?php echo htmlspecialchars($nombre_completo); ?></li>

                    <?php if ($rol === 'paciente'): ?>
                        <!-- Si es paciente, muestra la opción de reservar cita -->
                        <li><a href="view/reservar_turno.php">Reservar Cita</a></li>
                        <li><a href="view/tratamientos.php">Tratamientos</a></li>
                        <li><a href="view/perfil.php">Mi Perfil</a></li>

                    <?php elseif ($rol === 'asistente'): ?>
                        <!-- Si es asistente, muestra la opción de agendar cita -->
                        <li><a href="view/asistente_turnos.php">Turnos</a></li>
                        <li><a href="view/consultas_asistente.php">Consultas</a></li>
                        <li><a href="view/crud_tratamientos.php">Tratamientos</a></li>

                    <?php elseif ($rol === 'doctora'): ?>
                        <!-- Si es doctora, muestra la opción de consultas -->
                        <li><a href="view/consultas_asistente.php">Cronograma</a></li>
                    <?php endif; ?>

                    <!-- Opción de cerrar sesión -->
                    <li><a href="controller/logout_controller.php">Cerrar Sesión</a></li>
                <?php else: ?>

                    <!-- Si no está logueado, muestra las opciones de la página principal -->
                    <li><a href="view/tratamientos.php">Tratamientos</a></li>
                    <li><a href="model/login.php">Turnos</a></li>
                    <li><a href="model/login.php" class="register-button">Iniciar Sesión</a></li>
                <?php endif; ?>
            </ul>
        </nav>
    </header>
    <main class="main-content">
    <div class="text-container">
        <h1>TODO EL CUIDADO PARA LA SALUD DE TU PIEL</h1>
        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh.</p>
</main>

<!-- Imagen en un contenedor separado fuera de main -->
<div class="image-container">
    <img src="img/Model.png" alt="Dermatóloga">
</div>

<a href="https://wa.me/5493704925944" class="whatsapp-icon">
    <img src="img/ws-ic.png" alt="WhatsApp">
</a>

    <!-- Scripts de Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zyqzJ7K3Jl7l53Z9L5c5fw5OOc4YpD3piW2cK4pW" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0VQ8F5/xX3hfLhZXhjjAD6YsZysXzW8vwev95l98TT+x+v4X" crossorigin="anonymous"></script>
</body>
</html>
