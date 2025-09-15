<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Julieta Pontte - Dermatóloga</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- link del login.css-->
     <link rel="stylesheet" href="../style/login.css">
</head>
<body>
    <div class="login-container">
        <h3 class="text-center mb-4">¡Bievenidos!</h3>
        <form action="../controller/login_controller.php" method="post">
            <fieldset>
                <legend class="mb-3 text-center">Inicio de Sesión</legend>
                
                <div class="mb-3">
                    <label for="usuario" class="form-label">Usuario:</label>
                    <input type="text" class="form-control" name="usuario" id="usuario" required>
                </div>
                
                <div class="mb-3 position-relative">
                    <label for="contrasenia" class="form-label">Contraseña:</label>
                    <input type="password" class="form-control" name="contrasenia" id="contrasenia" required>
                    <span class="toggle-password" onclick="togglePassword()">
                        <i class="fa-regular fa-eye" id="eye-icon"></i> <!-- Icono de ojo abierto -->
                        <i class="fa-regular fa-eye-slash" id="eye-slash-icon" style="display: none;"></i> <!-- Icono de ojo cerrado -->
                    </span>
                </div>
                
                <div class="d-grid">
                    <input type="submit" class="btn btn-primary" name="ingresar" id="ingresar" value="Ingresar">
                </div>
            </fieldset>
        </form>
        <div class="form-footer">
            <p>¿Aún no tienes cuenta? <a href="../view/register.php">Registrarse</a></p>
            <a href="../index.php" class="btn btn-secondary mt-2">Cancelar</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function togglePassword() {
            var passwordField = document.getElementById('contrasenia');
            var eyeIcon = document.getElementById('eye-icon');
            var eyeSlashIcon = document.getElementById('eye-slash-icon');
            
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                eyeIcon.style.display = 'none';
                eyeSlashIcon.style.display = 'block';
            } else {
                passwordField.type = 'password';
                eyeIcon.style.display = 'block';
                eyeSlashIcon.style.display = 'none';
            }
        }
    </script>
</body>
</html>
