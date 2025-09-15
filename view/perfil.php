<?php
session_start();
if (!isset($_SESSION['id']) || $_SESSION['rol'] !== 'paciente') {
    header("Location: ../index.php");
    exit();
}

// Conexión a la base de datos
require_once '../database/db.php';
$db = new Db();
$conexion = $db->conection;

$id_usuario = $_SESSION['id'];

// Obtener los datos del perfil del paciente
$stmt = $conexion->prepare("SELECT p.nombre, p.apellido, p.email, p.telefono, u.usuario
                            FROM personas p
                            JOIN usuarios u ON p.id_persona = u.id_persona
                            WHERE u.id_usuario = :id_usuario");
$stmt->bindParam(':id_usuario', $id_usuario, PDO::PARAM_INT);
$stmt->execute();
$perfil = $stmt->fetch(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil del Paciente</title>
    <!-- Agregar Bootstrap 5.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Agregar FontAwesome para los íconos -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../style/button.css">
</head>

<body class="bg-light">

    <!-- Mostrar mensaje de éxito -->
    <?php if (isset($_SESSION['mensaje'])): ?>
    <div class="alert alert-success text-center" id="exito" role="alert">
        <?php echo $_SESSION['mensaje']; ?>
    </div>
    <?php unset($_SESSION['mensaje']); ?>
<?php endif; ?>

    <div class="container py-5">
        <div class="card mx-auto w-75 shadow">
            <div class="card-body">
                <h1 class="text-center mb-4">Editar Perfil</h1>

                <!-- Formulario de edición de perfil -->
                <form action="../controller/perfil_controller.php" method="POST">
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nuevo_valor_nombre" value="<?php echo htmlspecialchars($perfil['nombre']); ?>" >
                    </div>

                    <div class="mb-3">
                        <label for="apellido" class="form-label">Apellido</label>
                        <input type="text" class="form-control" id="apellido" name="nuevo_valor_apellido" value="<?php echo htmlspecialchars($perfil['apellido']); ?>" >
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="nuevo_valor_email" value="<?php echo htmlspecialchars($perfil['email']); ?>" >
                    </div>

                    <div class="mb-3">
                        <label for="telefono" class="form-label">Teléfono</label>
                        <input type="text" class="form-control" id="telefono" name="nuevo_valor_telefono" value="<?php echo htmlspecialchars($perfil['telefono']); ?>" >
                    </div>

                    <div class="mb-3">
                        <label for="usuario" class="form-label">Usuario</label>
                        <input type="text" class="form-control" id="usuario" name="nuevo_valor_usuario" value="<?php echo htmlspecialchars($perfil['usuario']); ?>" >
                    </div>

                    <h5 class="mt-4 mb-3">Cambiar Contraseña</h5>

                    <div class="mb-3 position-relative">
                        <label for="contrasenia_actual" class="form-label">Contraseña Actual</label>
                        <input type="password" class="form-control" id="contrasenia_actual" name="contrasenia_actual" >
                        <!-- Ícono de ojo para mostrar/ocultar -->
                        <i class="fas fa-eye position-absolute" id="toggle_eye_actual" style="right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;"></i>
                    </div>

                    <div class="mb-3 position-relative">
                        <label for="nueva_contrasenia" class="form-label">Nueva Contraseña</label>
                        <input type="password" class="form-control" id="nueva_contrasenia" name="nueva_contrasenia" >
                        <!-- Ícono de ojo para mostrar/ocultar -->
                        <i class="fas fa-eye position-absolute" id="toggle_eye_nueva" style="right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;"></i>
                    </div>

                    <div class="mb-3 position-relative">
                        <label for="confirmar_contrasenia" class="form-label">Confirmar Nueva Contraseña</label>
                        <input type="password" class="form-control" id="confirmar_contrasenia" name="confirmar_contrasenia" >
                        <!-- Ícono de ojo para mostrar/ocultar -->
                        <i class="fas fa-eye position-absolute" id="toggle_eye_confirmar" style="right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;"></i>
                    </div>

                    <div class="d-grid">
                        <button type="submit" name="guardar_datos" class="btn-save">Guardar Cambios</button>
                    </div>
                </form>

                <div class="text-center mt-3">
                    <a href="../index.php" class="btn-return">Volver a la página principal</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts de Bootstrap 5.3 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Script para mostrar/ocultar las contraseñas -->
    <script>
        document.getElementById("toggle_eye_actual").addEventListener("click", function() {
            let input = document.getElementById("contrasenia_actual");
            let icon = document.getElementById("toggle_eye_actual");
            if (input.type === "password") {
                input.type = "text";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            } else {
                input.type = "password";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            }
        });

        document.getElementById("toggle_eye_nueva").addEventListener("click", function() {
            let input = document.getElementById("nueva_contrasenia");
            let icon = document.getElementById("toggle_eye_nueva");
            if (input.type === "password") {
                input.type = "text";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            } else {
                input.type = "password";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            }
        });

        document.getElementById("toggle_eye_confirmar").addEventListener("click", function() {
            let input = document.getElementById("confirmar_contrasenia");
            let icon = document.getElementById("toggle_eye_confirmar");
            if (input.type === "password") {
                input.type = "text";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            } else {
                input.type = "password";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            }
        });
    </script>

    <!-- Script para ocultar mensaje después de 1 segundos -->
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
