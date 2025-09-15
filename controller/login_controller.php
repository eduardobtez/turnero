<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
// Incluir el archivo que contiene la clase Db
require_once '../database/db.php'; // Asegúrate de que esta ruta sea correcta

// Crear una instancia de la clase Db para obtener la conexión PDO
$db = new Db();
$conexion = $db->conection; // Ahora tienes la conexión PDO disponible

if (!empty($_POST["ingresar"])) {
    if (!empty($_POST["usuario"]) && !empty($_POST["contrasenia"])) {
        $usuario = $_POST["usuario"];
        $password = $_POST["contrasenia"];

        // Prevenir SQL injection con prepared statements
        $stmt = $conexion->prepare("
            SELECT u.*, p.nombre, p.apellido, r.rol
            FROM usuarios u
            LEFT JOIN personas p ON u.id_persona = p.id_persona
            JOIN roles r ON u.id_roles = r.id_roles
            WHERE u.usuario = :usuario
        ");
        
        // Vinculamos el parámetro
        $stmt->bindParam(':usuario', $usuario, PDO::PARAM_STR);
        $stmt->execute();
        
        // Verificar si se encontraron registros
        if ($stmt->rowCount() > 0) {
            $datos = $stmt->fetch(PDO::FETCH_OBJ);

            // Verificar la contraseña
            if (password_verify($password, $datos->contrasenia)) {
                // Almacenar los datos del usuario en la sesión
                $_SESSION["id"] = $datos->id_usuario;
                $_SESSION["usuario"] = $datos->usuario;
                $_SESSION["nombre_completo"] = $datos->nombre . " " . $datos->apellido; // Nombre completo
                $_SESSION["rol"] = $datos->rol; // Almacenar el rol como 'paciente', 'asistente', 'doctora', etc.


                // Redirigir según el rol del usuario
                switch ($datos->rol) {
                    case 'paciente':
                        header("Location: ../index.php");
                        break;
                    case 'asistente':
                        header("Location: ../index.php"); // Redirige según el rol
                        break;
                    case 'doctora':
                        header("Location: ../index.php"); // Redirige según el rol
                        break;
                    default:
                        echo "<div>Acceso Denegado. Rol de usuario no reconocido.</div>";
                        exit();
                }
                
                exit(); // Para evitar la ejecución posterior del código
            } else {
                echo "<div>Acceso Denegado. Contraseña incorrecta.</div>";
            }
        } else {
            echo "<div>Acceso Denegado. Usuario no encontrado.</div>";
        }

        $stmt->close();
    } else {
        echo "<div>Campos Vacíos. Por favor, complete todos los campos.</div>";
    }
}
?>
