<?php
require_once '../database/db.php';

class CarritoController {
    private $db;

    public function __construct() {
        $this->db = (new Db())->conection; // Aseguramos que la conexión se establezca
    }

    public function agregarAlCarrito($idTratamiento) {
        session_start();
        if (!isset($_SESSION['carrito'])) {
            $_SESSION['carrito'] = [];
        }
        if (isset($_SESSION['carrito'][$idTratamiento])) {
            $_SESSION['carrito'][$idTratamiento]++;
        } else {
            $_SESSION['carrito'][$idTratamiento] = 1;
        }
    }

    public function eliminarDelCarrito($idTratamiento) {
        session_start();
        if (isset($_SESSION['carrito'][$idTratamiento])) {
            unset($_SESSION['carrito'][$idTratamiento]);
        }
    }

    public function obtenerCarrito() {
        return isset($_SESSION['carrito']) ? $_SESSION['carrito'] : [];
    }

    public function calcularTotal($tratamientos) {
        try {
            $total = 0;
    
            // Verificamos que $_SESSION['carrito'] sea un arreglo
            if (isset($_SESSION['carrito']) && is_array($_SESSION['carrito'])) {
                foreach ($_SESSION['carrito'] as $id => $cantidad) {
                    // Verificamos que el tratamiento exista y tenga un precio válido
                    if (isset($tratamientos[$id]['precio'])) {
                        $total += $tratamientos[$id]['precio'] * $cantidad;
                    }
                }
            }

            $_SESSION['total'] = $total; // Guardamos el total en la sesión

    
            return $total;
        } catch (Exception $e) {
            return 0; // Si hay un error, devolvemos 0 para evitar fallos
        }
    }

    public function registrarCompra($idUsuario, $total) {
        try {
            // Conexión a la base de datos
            $conexion = $this->db;
    
            // Preparar la consulta para insertar la compra
            $query = "INSERT INTO compras (id_usuario, total, fecha_compra) VALUES (?, ?, NOW())";
            $stmt = $conexion->prepare($query);
    
            if ($stmt) {
                $stmt->bind_param("id", $idUsuario, $total);
                $stmt->execute();
    
                // Obtener el ID de la compra recién creada
                $idCompra = $stmt->insert_id;
    
                // Insertar los detalles de la compra (tratamientos)
                foreach ($_SESSION['carrito'] as $idTratamiento => $cantidad) {
                    $query_detalle = "INSERT INTO detalles_compras (id_compra, id_tratamiento, cantidad) VALUES (?, ?, ?)";
                    $stmt_detalle = $conexion->prepare($query_detalle);
                    if ($stmt_detalle) {
                        $stmt_detalle->bind_param("iii", $idCompra, $idTratamiento, $cantidad);
                        $stmt_detalle->execute();
                        $stmt_detalle->close();
                    }
                }
    
                // Vaciar el carrito después de la compra
                unset($_SESSION['carrito']);
    
                $stmt->close();
                return true;
            } else {
                throw new Exception("Error al preparar la consulta");
            }
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
            return false;
        }
    }
    
}
?>
