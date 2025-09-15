<?php
session_start();
require_once '../controller/carrito_controller.php';
require_once '../controller/tratamientos_controller.php';

$carritoController = new CarritoController();
$tratamientosController = new TratamientosController();

// Verificar si hay alguna acción (agregar o eliminar) en el carrito
if (isset($_GET['action']) && isset($_GET['id'])) {
    $idTratamiento = (int)$_GET['id'];
    $action = $_GET['action'];

    if ($action == 'agregar') {
        $carritoController->agregarAlCarrito($idTratamiento);
        $_SESSION['mensaje'] = "¡Reserva agregada al carrito exitosamente!";
        header("Location: ../view/tratamientos.php");
        exit();
    } elseif ($action == 'eliminar') {
        $carritoController->eliminarDelCarrito($idTratamiento);
        $_SESSION['mensaje'] = "¡Tratamiento eliminado del carrito!";
        header("Location: ../view/carrito.php");
        exit();
    }
}

// Obtener tratamientos en el carrito
$carrito = $carritoController->obtenerCarrito();
$tratamientos = [];

foreach ($carrito as $idTratamiento => $cantidad) {
    $tratamiento = $tratamientosController->obtenerTratamientos($idTratamiento);
    if ($tratamiento) {
        $tratamientos[$idTratamiento] = $tratamiento;
    }
}

$total = $carritoController->calcularTotal($tratamientos);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../style/nav.css">
    <link rel="stylesheet" href="../style/button.css">
</head>
<body>

<!-- Navbar -->
<nav class="nav">
    <div>
        <ul>
            <li><a href="../index.php">Home</a></li>
            <li><a href="../view/tratamientos.php">Tratamientos</a></li>
            <li><a class="register-button" href="../controller/LogoutController.php">Cerrar Sesión</a></li>
        </ul>
    </div>
</nav>

<div class="container mt-4">
    <!-- Mensaje de éxito de agregar o eliminar tratamiento -->
    <?php if (isset($_SESSION['mensaje'])): ?>
        <div class="alert alert-success text-center" id="mensaje" role="alert">
            <?php echo $_SESSION['mensaje']; ?>
        </div>
        <?php unset($_SESSION['mensaje']); ?>
    <?php endif; ?>

    <!-- Verificar si el pago fue exitoso -->
    <?php if (isset($_GET['estado_pago']) && $_GET['estado_pago'] == 'exitoso'): ?>
        <div class="alert alert-success text-center" id="mensaje_pago" role="alert">
            ¡Tu pago ha sido procesado exitosamente!
        </div>
    <?php endif; ?>

    <h2 class="text-center mb-4">Tu Carrito</h2>

    <?php if (empty($carrito)): ?>
        <div class="alert alert-warning text-center">No tienes tratamientos en tu carrito.</div>
    <?php else: ?>
        <div class="table-responsive">
            <table class="table table-bordered table-striped text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Tratamiento</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($tratamientos as $id => $tratamiento): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($tratamiento['titulo']); ?></td>
                            <td><?php echo $carrito[$id]; ?></td>
                            <td>$<?php echo number_format($tratamiento['precio'], 2); ?></td>
                            <td>
                                <a href="carrito.php?action=eliminar&id=<?php echo $id; ?>" class="btn-delete">Eliminar</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>

        <div class="d-flex justify-content-between align-items-center mt-3">
            <h4><strong>Total: $<?php echo number_format($total, 2); ?></strong></h4>
        </div>
        
        <form action="../controller/procesar_pagos.php" method="POST" id="form_pago">
            <div class="mb-3">
                <button type="button" class="btn-reserve" data-bs-toggle="modal" data-bs-target="#tarjetaModal">Realizar Pago</button>
            </div>

            <!-- Modal para ingresar datos de la tarjeta -->
            <div class="modal fade" id="tarjetaModal" tabindex="-1" aria-labelledby="tarjetaModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="tarjetaModalLabel">Ingrese los datos de su tarjeta de crédito</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="numero_tarjeta" class="form-label">Número de tarjeta</label>
                                <input type="text" class="form-control" id="numero_tarjeta" name="numero_tarjeta" required pattern="\d{10}" title="Debe tener 10 dígitos">
                            </div>
                            <div class="mb-3">
                                <label for="fecha_expiracion" class="form-label">Fecha de vencimiento</label>
                                <input type="month" class="form-control" id="fecha_expiracion" name="fecha_expiracion" required>
                            </div>
                            <div class="mb-3">
                                <label for="cvv" class="form-label">CVV</label>
                                <input type="text" class="form-control" id="cvv" name="cvv" required pattern="\d{3}" title="Debe tener 3 dígitos">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn-cancel" data-bs-dismiss="modal">Cerrar</button>
                            <button type="submit" class="btn-edit">Realizar Pago</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    <?php endif; ?>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Verificar si el mensaje de pago exitoso existe
    window.onload = function() {
        const mensajePago = document.getElementById('mensaje_pago');
        if (mensajePago) {
            setTimeout(function() {
                mensajePago.style.display = 'none'; // Ocultar el mensaje después de 1 segundo
            }, 1000); // 1000 milisegundos = 1 segundo
        }
    }
</script>

</body>
</html>
