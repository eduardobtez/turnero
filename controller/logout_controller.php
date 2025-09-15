<?php
session_start();
session_destroy(); // Destruir la sesión

// Redirigir al index
header("Location: ../index.php"); // Asegúrate de que esta ruta sea correcta
exit(); // Importante para asegurarte de que el código no siga ejecutándose después de la redirección
?>
