<?php
require_once '../database/db.php';

// Verifica si el usuario está autenticado
session_start();
if (!isset($_SESSION['id'])) {
    header("Location: ../index.php");
    exit();
}

$id_usuario = $_SESSION['id'];

// Conexión a la base de datos
$db = new Db();
$conexion = $db->conection;

// Si la petición es de actualización de los datos de perfil (nombre, apellido, email, teléfono)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['guardar_datos'])) {

        // Obtener los valores enviados desde el formulario
        $nuevo_valor_nombre = isset($_POST['nuevo_valor_nombre']) ? $_POST['nuevo_valor_nombre'] : '';
        $nuevo_valor_apellido = isset($_POST['nuevo_valor_apellido']) ? $_POST['nuevo_valor_apellido'] : '';
        $nuevo_valor_email = isset($_POST['nuevo_valor_email']) ? $_POST['nuevo_valor_email'] : '';
        $nuevo_valor_telefono = isset($_POST['nuevo_valor_telefono']) ? $_POST['nuevo_valor_telefono'] : '';
        $nuevo_valor_usuario = isset($_POST['nuevo_valor_usuario']) ? $_POST['nuevo_valor_usuario'] : '';

        // Validación de los campos (simple)
        if (!empty($nuevo_valor_nombre) && !empty($nuevo_valor_apellido) && !empty($nuevo_valor_email) && !empty($nuevo_valor_telefono)) {

            try {
                // Iniciar una transacción
                $conexion->beginTransaction();

                // Actualizar la tabla personas
                $stmt = $conexion->prepare("UPDATE personas SET nombre = :nuevo_valor_nombre, apellido = :nuevo_valor_apellido, email = :nuevo_valor_email, telefono = :nuevo_valor_telefono WHERE id_persona = (SELECT id_persona FROM usuarios WHERE id_usuario = :id_usuario)");
                $stmt->bindParam(':nuevo_valor_nombre', $nuevo_valor_nombre, PDO::PARAM_STR);
                $stmt->bindParam(':nuevo_valor_apellido', $nuevo_valor_apellido, PDO::PARAM_STR);
                $stmt->bindParam(':nuevo_valor_email', $nuevo_valor_email, PDO::PARAM_STR);
                $stmt->bindParam(':nuevo_valor_telefono', $nuevo_valor_telefono, PDO::PARAM_STR);
                $stmt->bindParam(':id_usuario', $id_usuario, PDO::PARAM_INT);
                $stmt->execute();

                // Actualizar la tabla usuarios (usuario)
                if (!empty($nuevo_valor_usuario)) {
                    $stmt = $conexion->prepare("UPDATE usuarios SET usuario = :nuevo_valor_usuario WHERE id_usuario = :id_usuario");
                    $stmt->bindParam(':nuevo_valor_usuario', $nuevo_valor_usuario, PDO::PARAM_STR);
                    $stmt->bindParam(':id_usuario', $id_usuario, PDO::PARAM_INT);
                    $stmt->execute();
                }

                // Si la contraseña se ha actualizado
                if (isset($_POST['contrasenia_actual']) && isset($_POST['nueva_contrasenia']) && isset($_POST['confirmar_contrasenia'])) {
                    $contrasenia_actual = $_POST['contrasenia_actual'];
                    $nueva_contrasenia = $_POST['nueva_contrasenia'];
                    $confirmar_contrasenia = $_POST['confirmar_contrasenia'];

                    // Validación de contraseñas
                    if ($nueva_contrasenia === $confirmar_contrasenia) {
                        // Verificamos que la contraseña actual sea correcta
                        $stmt = $conexion->prepare("SELECT contrasenia FROM usuarios WHERE id_usuario = :id_usuario");
                        $stmt->bindParam(':id_usuario', $id_usuario, PDO::PARAM_INT);
                        $stmt->execute();
                        $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

                        // Verificamos si la contraseña actual es correcta
                        if (password_verify($contrasenia_actual, $usuario['contrasenia'])) {
                            // Si la contraseña actual es correcta, actualizamos la nueva
                            $stmt = $conexion->prepare("UPDATE usuarios SET contrasenia = :nueva_contrasenia WHERE id_usuario = :id_usuario");
                            $stmt->bindParam(':nueva_contrasenia', password_hash($nueva_contrasenia, PASSWORD_BCRYPT), PDO::PARAM_STR);
                            $stmt->bindParam(':id_usuario', $id_usuario, PDO::PARAM_INT);
                            $stmt->execute();
                        } else {
                            echo "La contraseña actual es incorrecta.";
                        }
                    } else {
                        echo "Las contraseñas no coinciden.";
                    }
                }

               // Confirmar los cambios
               $conexion->commit();
                
               // Establecer mensaje de éxito
               $_SESSION['mensaje'] = "Datos guardados correctamente"; // Mensaje de éxito
               header("Location: ../view/Perfil.php"); // Redirige al perfil después de guardar
               exit();
           } catch (Exception $e) {
               $conexion->rollBack();
               echo "Error en la transacción: " . $e->getMessage();
           }
       } else {
           echo "Todos los campos deben ser completados.";
       }
   }
}
?>
