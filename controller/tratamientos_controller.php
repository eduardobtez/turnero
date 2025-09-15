<?php
require_once '../database/db.php';

class TratamientosController {
    private $db;

    public function __construct() {
        $this->db = (new Db())->conection;
    }

     // Obtener todos los tratamientos o uno específico si se pasa ID
     public function obtenerTratamientos($id = null) {
        try {
            if ($id) {
                $stmt = $this->db->prepare("SELECT * FROM tratamientos WHERE id = :id");
                $stmt->bindParam(':id', $id);
            } else {
                $stmt = $this->db->prepare("SELECT * FROM tratamientos");
            }
            $stmt->execute();
            return $id ? $stmt->fetch(PDO::FETCH_ASSOC) : $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return [];
        }
    }

    // Crear un nuevo tratamiento
    public function crearTratamiento($titulo, $descripcion, $precio, $imagen) {
        // Verificar si se ha cargado una imagen
        if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] == 0) {
            // Generar un nombre único para la imagen
            $nombreImagen = time() . '-' . $_FILES['imagen']['name'];
            
            // Ruta completa donde se guardará la imagen
            $rutaImagen = '../uploads/' . $nombreImagen;

            // Mover el archivo desde la carpeta temporal a 'uploads'
            if (move_uploaded_file($_FILES['imagen']['tmp_name'], $rutaImagen)) {
                // Insertar tratamiento con imagen
                $stmt = $this->db->prepare("INSERT INTO tratamientos (titulo, descripcion, precio, imagen) VALUES (:titulo, :descripcion, :precio, :imagen)");
                $stmt->bindParam(':titulo', $titulo);
                $stmt->bindParam(':descripcion', $descripcion);
                $stmt->bindParam(':precio', $precio);
                $stmt->bindParam(':imagen', $nombreImagen);
                return $stmt->execute();
            } else {
                return false; // Error al mover la imagen
            }
        } else {
            // Si no se carga una imagen, insertar tratamiento sin imagen
            $stmt = $this->db->prepare("INSERT INTO tratamientos (titulo, descripcion, precio) VALUES (:titulo, :descripcion, :precio)");
            $stmt->bindParam(':titulo', $titulo);
            $stmt->bindParam(':descripcion', $descripcion);
            $stmt->bindParam(':precio', $precio);
            return $stmt->execute();
        }
    }

    // Actualizar un tratamiento
    public function actualizarTratamiento($id, $titulo, $descripcion, $precio) {
        $nombreImagen = null;

        // Verificar si se ha cargado una nueva imagen
        if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] == 0) {
            // Generar un nombre único para la imagen
            $nombreImagen = time() . '-' . $_FILES['imagen']['name'];
            
            // Ruta completa donde se guardará la imagen
            $rutaImagen = '../uploads/' . $nombreImagen;

            // Mover el archivo desde la carpeta temporal a 'uploads'
            if (move_uploaded_file($_FILES['imagen']['tmp_name'], $rutaImagen)) {
                // Actualizar tratamiento con nueva imagen
                $stmt = $this->db->prepare("UPDATE tratamientos SET titulo = :titulo, descripcion = :descripcion, precio = :precio, imagen = :imagen WHERE id = :id");
                $stmt->bindParam(':titulo', $titulo);
                $stmt->bindParam(':descripcion', $descripcion);
                $stmt->bindParam(':precio', $precio);
                $stmt->bindParam(':imagen', $nombreImagen);
                $stmt->bindParam(':id', $id);
                return $stmt->execute();
            } else {
                return false; // Error al mover la imagen
            }
        } else {
            // Si no se carga una nueva imagen, actualizar el tratamiento sin cambiar la imagen
            $stmt = $this->db->prepare("UPDATE tratamientos SET titulo = :titulo, descripcion = :descripcion, precio = :precio WHERE id = :id");
            $stmt->bindParam(':titulo', $titulo);
            $stmt->bindParam(':descripcion', $descripcion);
            $stmt->bindParam(':precio', $precio);
            $stmt->bindParam(':id', $id);
            return $stmt->execute();
        }
    }

    // Eliminar un tratamiento
    public function eliminarTratamiento($id) {
        $stmt = $this->db->prepare("DELETE FROM tratamientos WHERE id = :id");
        $stmt->bindParam(':id', $id);
        return $stmt->execute();
    }
}
?>
