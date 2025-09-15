<?php
require_once '../controller/tratamientos_controller.php';
session_start(); // Asegurarnos de que la sesión está iniciada

$tratamientosController = new TratamientosController();
$tratamientos = $tratamientosController->obtenerTratamientos();
// Verificar si el usuario está logueado
$nombre_completo = isset($_SESSION['nombre_completo']) ? $_SESSION['nombre_completo'] : null;
$rol = isset($_SESSION['rol']) ? $_SESSION['rol'] : null;
?>



<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tratamientos</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../style/nav.css">
    <link rel="stylesheet" href="../style/button.css">
    <link rel="stylesheet" href="../style/tratamientos.css">
</head>
<body>

<!-- Navbar -->
<nav class="nav">
    <div>
        <ul>
            <!-- Enlaces comunes -->
            <li><a href="../index.php">Home</a></li>
            
            <?php if ($nombre_completo): ?>
                <!-- Si el usuario está logueado -->

                <?php if ($rol === 'paciente'): ?>
                    <!-- Si es paciente, muestra el enlace de Carrito -->
                    <li><a href="../view/carrito.php">Carrito</a></li>
                <?php endif; ?>

                <!-- Opción de cerrar sesión -->
                <li><a class="register-button" href="../controller/logout_controller.php">Cerrar Sesión</a></li>

            <?php else: ?>
                <!-- Si no está logueado, muestra las opciones de la página principal -->
                <li><a class="register-button" href="../model/login.php">Iniciar Sesión</a></li>
            <?php endif; ?>
        </ul>
    </div>
</nav>


    <!-- Mostrar mensaje de éxito -->
    <?php if (isset($_SESSION['mensaje'])): ?>
    <div class="alert alert-success text-center" id="exito" role="alert">
        <?php echo $_SESSION['mensaje']; ?>
    </div>
    <?php unset($_SESSION['mensaje']); ?>
<?php endif; ?>

    <header class="custom">
        <h1>Tratamientos Disponibles</h1>
    </header>
    <main class="container my-4">
        <div class="row">
            <?php foreach ($tratamientos as $tratamiento): ?>
                <div class="col-md-4 mb-4">
                    <div class="card shadow h-100">
                        <div class="card-body">
                            <!-- Mostrar la imagen del tratamiento -->
                            <?php if (!empty($tratamiento['imagen'])): ?>
                                <img src="../uploads/<?php echo htmlspecialchars($tratamiento['imagen']); ?>" class="card-img-top" alt="Imagen de <?php echo htmlspecialchars($tratamiento['titulo']); ?>" style="max-height: 200px; object-fit: cover;">
                            <?php endif; ?>
                            <h5 class="card-title">
                                <?php echo htmlspecialchars($tratamiento['titulo']); ?>
                            </h5>
                            <p class="card-text">
                                <?php echo htmlspecialchars($tratamiento['descripcion']); ?>
                            </p>
                            <p class="card-text">
                                <strong>Precio:</strong> 
                                $<?php echo number_format($tratamiento['precio'], 2); ?>
                            </p>

                            <?php if (isset($_SESSION['usuario'])): ?>
                                <!-- Usuario autenticado: permite agregar al carrito -->
                                <button class="btn-reserver">
                                    <a href="carrito.php?action=agregar&id=<?php echo $tratamiento['id']; ?>">Reservar</a>
                                </button>
                            <?php else: ?>
                                <!-- Usuario NO autenticado: muestra el modal -->
                                <button class="btn-reserver" data-bs-toggle="modal" data-bs-target="#loginModal">
                                    Reservar
                                </button>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>  
            <?php endforeach; ?>
        </div>
    </main>

    <!-- Modal de advertencia para iniciar sesión -->
    <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginModalLabel">Iniciar Sesión</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body">
                    Debes iniciar sesión para poder agregar tratamientos a tu carrito.
                </div>
                <div class="modal-footer">
                    <a href="../model/login.php" class="btn-sesion">Iniciar Sesión</a>
                    <button type="button" class="btn-cancel" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script 
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
    </script>

  <!-- Script para eliminar el mensaje después de 2 segundos -->
<script>
    // Solo eliminar el mensaje si existe
    window.onload = function() {
        var message = document.getElementById('exito');
        if (message) {
            setTimeout(function() {
                message.style.display = 'none'; // Ocultar el mensaje después de 2 segundos
            }, 1000); // Espera 2 segundos
        }
    };
</script>

</body>
</html>





