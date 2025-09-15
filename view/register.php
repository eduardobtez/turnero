<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrarse</title>
    <script>
        // Función para alternar entre mostrar/ocultar la contraseña
        function togglePassword() {
            var contrasenia = document.getElementById("contrasenia");
            var checkbox = document.getElementById("showPassword");

            if (checkbox.checked) {
                contrasenia.type = "text"; // Mostrar la contraseña
            } else {
                contrasenia.type = "password"; // Ocultar la contraseña
            }
        }
    </script>
</head>
<body>
    <h1>Formulario de Registro</h1>
    <form action="../controller/register_controller.php" method="post">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" id="nombre" required><br><br>

        <label for="apellido">Apellido:</label>
        <input type="text" name="apellido" id="apellido" required><br><br>

        <label for="dni">DNI:</label>
        <input type="text" name="dni" id="dni" required><br><br>

        <label for="correo">Correo:</label>
        <input type="email" name="correo" id="correo" required><br><br>
        
        <label for="telefono">Teléfono:</label>
        <input type="text" name="telefono" id="telefono" required><br><br>

        <label for="usuario">Usuario:</label>
        <input type="text" name="usuario" id="usuario" required><br><br>

        <label for="contrasenia">Contraseña:</label>
        <input type="password" name="contrasenia" id="contrasenia" required><br><br>

        <!-- Checkbox para mostrar/ocultar la contraseña -->
        <label>
            <input type="checkbox" id="showPassword" onclick="togglePassword()"> Mostrar contraseña
        </label><br><br>

        <input type="submit" name="registrar" value="Registrar">
    </form>
</body>
</html>
