<?php
session_start();
if (!isset($_SESSION['id'])) {
    header("Location: ../index.php");
    exit();
}

require_once '../controller/tratamientos_controller.php';

$tratamientosController = new TratamientosController();
$tratamientos = $tratamientosController->obtenerTratamientos();

// Manejo de acciones del CRUD
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['accion'])) {
        if ($_POST['accion'] === 'crear') {
            $tratamientosController->crearTratamiento($_POST['titulo'], $_POST['descripcion'], $_POST['precio']);
        } elseif ($_POST['accion'] === 'actualizar') {
            $tratamientosController->actualizarTratamiento($_POST['id'], $_POST['titulo'], $_POST['descripcion'], $_POST['precio']);
        } elseif ($_POST['accion'] === 'eliminar') {
            $tratamientosController->eliminarTratamiento($_POST['id']);
        }
        header("Location: crud_tratamientos.php");
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CargaTratamientos</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../style/tratamientos.css">
    <link rel="stylesheet" href="../style/button.css">
</head>
<body class="bg-light">
    <div class="container my-5">
        <h1 class="text-center mb-4">Administrar Tratamientos</h1>
        
        <!-- Formulario para Crear Tratamiento -->
        <div class="card mb-4">
            <div class="card-header custom-header">
                <h2 class="h5 mb-0">Crear Nuevo Tratamiento</h2>
            </div>
            <div class="card-body">
                <form method="POST" class="row g-3" enctype="multipart/form-data">
                    <input type="hidden" name="accion" value="crear">
                    <div class="col-md-6">
                        <label for="titulo" class="form-label">Título</label>
                        <input type="text" name="titulo" id="titulo" class="form-control" placeholder="Título" required>
                    </div>
                    <div class="col-md-6">
                        <label for="precio" class="form-label">Precio</label>
                        <input type="number" name="precio" id="precio" class="form-control" step="0.01" placeholder="Precio" required>
                    </div>
                    <div class="col-12">
                        <label for="descripcion" class="form-label">Descripción</label>
                        <textarea name="descripcion" id="descripcion" class="form-control" placeholder="Descripción" rows="3" required></textarea>
                    </div>
                    <div class="col-12">
                      <label for="imagen" class="form-label">Imagen</label>
                        <input type="file" name="imagen" id="imagen" class="form-control" accept="image/*" required>
                        </div>
                    <div class="col-12 text-end">
                        <button type="submit" class="btn-create">Crear</button>
                        <button class="btn-cancel"><a href="../index.php">Cancelar</a></button>
                    </div>
                </form>
            </div>
        </div>
        
        <!-- Tabla para Actualizar y Eliminar -->
        <div class="card">
            <div class="card-header custom-header">
                <h2 class="h5 mb-0">Tratamientos Existentes</h2>
            </div>
            <div class="card-body">
                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th scope="col">Título</th>
                            <th scope="col">Descripción</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Imagen</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($tratamientos as $tratamiento): ?>
                            <tr>
                                <form method="POST" enctype="multipart/form-data">
                                    <td>
                                        <input type="text" name="titulo" class="form-control" value="<?php echo htmlspecialchars($tratamiento['titulo']); ?>" required>
                                    </td>
                                    <td>
                                        <textarea name="descripcion" class="form-control" rows="2" required><?php echo htmlspecialchars($tratamiento['descripcion']); ?></textarea>
                                    </td>
                                    <td>
                                        <input type="number" name="precio" class="form-control" step="0.01" value="<?php echo $tratamiento['precio']; ?>" required>
                                    </td>
                                    <td>
                                <input type="file" name="imagen" class="form-control">
                                <?php if (!empty($tratamiento['imagen'])): ?>
                                    <img src="../uploads/<?php echo $tratamiento['imagen']; ?>" alt="Imagen del tratamiento" style="max-width: 70px; max-height: 70px;">
                                <?php endif; ?>
                            </td>
                                    <td>
                                        <input type="hidden" name="id" value="<?php echo $tratamiento['id']; ?>">
                                        <div class="d-flex gap-2">
                                            <button type="submit" name="accion" value="actualizar" class="btn-update">Actualizar</button>
                                            <button type="submit" name="accion" value="eliminar" class="btn-delete">Eliminar</button>
                                        </div>
                                    </td>
                                </form>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Botón para volver -->
        <div class="text-center mt-4">
            <a href="../index.php" class="btn-return">Volver a la página principal</a>
        </div>
    </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
