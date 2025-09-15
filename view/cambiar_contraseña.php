<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Cambiar Contraseña</title>
</head>
<body>
    <h1>Cambiar Contraseña</h1>
    <form method="POST" action="../controller/perfil_controller.php">
        <label for="contrasenia_actual">Contraseña actual:</label>
        <input type="password" name="contrasenia_actual" required><br>

        <label for="nueva_contrasenia">Nueva contraseña:</label>
        <input type="password" name="nueva_contrasenia" required><br>

        <label for="confirmar_contrasenia">Confirmar nueva contraseña:</label>
        <input type="password" name="confirmar_contrasenia" required><br>

        <button type="submit">Cambiar Contraseña</button>
    </form>
</body>
</html>
