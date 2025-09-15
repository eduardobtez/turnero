<?php
session_start();

// Verificar que los datos de la tarjeta estén completos
if (!isset($_POST['numero_tarjeta']) || !isset($_POST['fecha_expiracion']) || !isset($_POST['cvv'])) {
    echo "Faltan datos para procesar el pago con tarjeta.";
    exit();
}

// Obtener el total directamente desde la sesión
if (!isset($_SESSION['total'])) {
    echo "Error al obtener el total.";
    exit();
}

$total = $_SESSION['total'];

// Recoger los datos de la tarjeta
$numero_tarjeta = $_POST['numero_tarjeta'];
$fecha_expiracion = $_POST['fecha_expiracion'];
$cvv = $_POST['cvv'];

// Validación de tarjeta: 10 dígitos para el número de tarjeta y 3 dígitos para el CVV
if (!preg_match('/^\d{10}$/', $numero_tarjeta)) {
    echo "El número de tarjeta debe tener 10 dígitos.";
    exit();
}

if (!preg_match('/^\d{3}$/', $cvv)) {
    echo "El CVV debe tener 3 dígitos.";
    exit();
}

// Si todo está correcto, marcar el pago como exitoso
$_SESSION['pago_exitoso'] = true;

// Vaciar el carrito después del pago
unset($_SESSION['carrito']);
unset($_SESSION['total']);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pago Exitoso</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- Modal de éxito -->
<div class="modal fade" id="pagoExitosoModal" tabindex="-1" aria-labelledby="pagoExitosoModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="pagoExitosoModalLabel">Pago Exitoso</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>El pago fue procesado exitosamente. Total: $<?php echo number_format($total, 2); ?></p>
      </div>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Mostrar el modal de éxito
    window.onload = function() {
        var myModal = new bootstrap.Modal(document.getElementById('pagoExitosoModal'), {
            keyboard: false
        });
        myModal.show();

        // Redirigir después de 3 segundos (el tiempo que dura el modal)
        setTimeout(function() {
            window.location.href = '../view/reservar_turno.php?estado_pago=exitoso';
        }, 2000);  // 3 segundos
    }
</script>

</body>
</html>
