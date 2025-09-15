<?php
// Incluir la clase Db que maneja la conexión a la base de datos
require_once '../database/db.php'; // Ajusta la ruta según tu estructura

// Crear la conexión
$conexion = new Db();
$db = $conexion->conection;  // Aquí accedemos a la conexión

// Verificar si la conexión fue exitosa
if (!$db) {
    die("Error de conexión a la base de datos");
}

// Obtener los turnos desde la base de datos
$query = "SELECT fecha, hora FROM turnos"; // Asegúrate de que las columnas 'fecha' y 'hora' existen
$stmt = $db->prepare($query);
$stmt->execute();

// Obtener los resultados
$turnos = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Devolver los datos en formato JSON
echo json_encode($turnos);
?>
