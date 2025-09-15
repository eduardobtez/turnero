<?php
require_once '../model/user_model.php';

class RegisterController {

    public function showRegisterForm() {
        // Mostrar el formulario de registro
        require_once '../view/register.php';
    }

    public function handleRegister() {
        // Procesar los datos del formulario de registro
        if (isset($_POST["registrar"])) {
        }
        $nombre = $_POST["nombre"];
        $apellido = $_POST["apellido"];
        $dni = $_POST["dni"];
        $correo = $_POST["correo"];
        $usuario = $_POST["usuario"];
        $contrasenia = $_POST["contrasenia"];

        // Asignar el rol predeterminado
        $rol = 'paciente';  // El rol 'paciente' será asignado siempre

        // Llamar al modelo para registrar al usuario
        $userModel = new UserModel();
        $registroExitoso = $userModel->registerUser($nombre, $apellido, $dni, $correo, $usuario, $contrasenia);

        if ($registroExitoso) {
            header("Location: ../index.php"); // Redirigir a la página principal
            exit();
        } else {
            echo "Error al registrar el usuario.";
        }
    }
}

// Crear una instancia del controlador y llamar al método
$obj = new RegisterController();
$obj->handleRegister();
