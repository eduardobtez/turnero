<?php
session_start();
require_once '../database/db.php';

// Verifica si el usuario está autenticado
if (!isset($_SESSION['id'])) {
    header("Location: ../index.php");
    exit();
}

$id_usuario = $_SESSION['id'];

// Conexión a la base de datos
$db = new Db();
$conexion = $db->conection;

// Obtener la información de la persona
$stmt = $conexion->prepare("SELECT p.nombre, p.apellido, p.email, p.telefono, u.contrasenia
                            FROM personas p
                            JOIN usuarios u ON p.id_persona = u.id_persona
                            WHERE u.id_usuario = :id_usuario");
$stmt->bindParam(':id_usuario', $id_usuario, PDO::PARAM_INT);
$stmt->execute();
$perfil = $stmt->fetch(PDO::FETCH_ASSOC);

// Si la petición es de actualización de los datos de perfil (nombre, apellido, email, teléfono)
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['nuevo_valor'])) {
    $campo = $_POST['campo'];
    $nuevo_valor = $_POST['nuevo_valor'];

    if (!empty($nuevo_valor)) {
        // Verifica que el campo de datos a actualizar sea válido
        if (in_array($campo, ['nombre', 'apellido', 'email', 'telefono'])) {
            $stmt = $conexion->prepare("UPDATE personas SET $campo = :nuevo_valor WHERE id_persona = (SELECT id_persona FROM usuarios WHERE id_usuario = :id_usuario)");
            $stmt->bindParam(':nuevo_valor', $nuevo_valor, PDO::PARAM_STR);
            $stmt->bindParam(':id_usuario', $id_usuario, PDO::PARAM_INT);
            if ($stmt->execute()) {
                header("Location: Perfil.php");
                exit();
            } else {
                echo "Error al actualizar la información.";
            }
        } else {
            echo "Campo no válido para editar.";
        }
    }
}

// Si la petición es para cambiar la contraseña
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['nueva_contrasenia'])) {
    $nueva_contrasenia = $_POST['nueva_contrasenia'];
    $confirmar_contrasenia = $_POST['confirmar_contrasenia'];

    // Validación de las contraseñas
    if ($nueva_contrasenia === $confirmar_contrasenia) {
        // Comprobar que la contraseña actual sea correcta
        $stmt = $conexion->prepare("SELECT contrasenia FROM usuarios WHERE id_usuario = :id_usuario");
        $stmt->bindParam(':id_usuario', $id_usuario, PDO::PARAM_INT);
        $stmt->execute();
        $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

        // Si la contraseña actual es correcta, actualizamos la nueva
        if (password_verify($_POST['contrasenia_actual'], $usuario['contrasenia'])) {
            $stmt = $conexion->prepare("UPDATE usuarios SET contrasenia = :nueva_contrasenia WHERE id_usuario = :id_usuario");
            $stmt->bindParam(':nueva_contrasenia', password_hash($nueva_contrasenia, PASSWORD_BCRYPT), PDO::PARAM_STR);
            $stmt->bindParam(':id_usuario', $id_usuario, PDO::PARAM_INT);
            if ($stmt->execute()) {
                echo "Contraseña actualizada correctamente.";
                header("Location: perfil.php");
                exit();
            } else {
                echo "Error al cambiar la contraseña.";
            }
        } else {
            echo "La contraseña actual es incorrecta.";
        }
    } else {
        echo "Las contraseñas no coinciden.";
    }
}
?>
