<?php
session_start();
if (!isset($_SESSION['id']) || ($_SESSION['rol'] !== 'asistente' && $_SESSION['rol'] !== 'doctora')) {
    header("Location: ../index.php");
    exit();
}

require_once '../model/turnos_model.php';
$turnosModel = new TurnosModel();
$turnos = $turnosModel->obtenerTurnos();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Turnos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../style/button.css">

    <!-- enlaces para los script de exportar -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.25/jspdf.plugin.autotable.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>
</head>
<body>
    <div class="container my-5">
        <h1 class="title-table">Gestión de Turnos</h1>

        <!-- Tabla de Turnos -->
        <div class="table-responsive">
            <table id='myTable' class="table-bordered">
                <thead class="table">
                    <tr class="table-text">
                        <th>Paciente</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Diagnóstico</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($turnos as $turno): ?>
                        <tr class="table-content">
                            <td><?= htmlspecialchars($turno['nombre'] . ' ' . $turno['apellido']) ?></td>
                            <td><?= htmlspecialchars($turno['fecha']) ?></td>
                            <td><?= htmlspecialchars($turno['hora']) ?></td>
                            <td><?= htmlspecialchars($turno['diagnostico']) ?></td>
                            <td>
                                <div class="d-flex gap-2">
                                    <!-- Botón para abrir el modal de edición -->
                                    <button class="btn-edit" 
                                            data-bs-toggle="modal" 
                                            data-bs-target="#modalEditar" 
                                            data-id="<?= $turno['id_turno'] ?>"
                                            data-fecha="<?= $turno['fecha'] ?>"
                                            data-hora="<?= $turno['hora'] ?>"
                                            data-diagnostico="<?= $turno['diagnostico'] ?>"
                                            >Editar</button>
                                    
                                    <!-- Enlace para eliminar -->
                                    <a href="../controller/turnos_controller.php?action=eliminar&id=<?= $turno['id_turno'] ?>" 
                                       class="btn-delete"
                                       onclick="return confirm('¿Seguro que deseas cancelar este turno?');">
                                        Eliminar
                                    </a>
                                </div>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>

        <!-- Botón para volver -->
        <div class="text-center mt-4">
            <a href="../index.php" class="btn-return">Volver a la página principal</a>
        </div>
           <!-- Botones para exportar -->
    <div class="export-buttons">
        <button id="exportPDF" class="btn btn-outline-warning">Exportar a PDF</button>
        <button id="exportExcel" class="btn btn-outline-success">Exportar a Excel</button>
    </div>
    </div>

    <!-- Modal para editar turnos -->
    <div class="modal fade" id="modalEditar" tabindex="-1" aria-labelledby="modalEditarLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalEditarLabel">Editar Turno</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="../controller/turnos_controller.php?action=editar" method="POST">
                        <input type="hidden" name="id_turno" id="turno_id">
                        <div class="mb-3">
                            <label for="fecha" class="form-label">Fecha</label>
                            <input type="date" class="form-control" id="fecha" name="fecha" required>
                        </div>
                        <div class="mb-3">
                            <label for="hora" class="form-label">Hora</label>
                            <input type="time" class="form-control" id="hora" name="hora" required>
                        </div>
                        <div class="mb-3">
                            <label for="diagnostico" class="form-label">Diagnóstico</label>
                            <input type="text" class="form-control" id="diagnostico" name="diagnostico" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn-save">Guardar cambios</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts necesarios -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Inicialización de DataTable -->
    <script>
        $(document).ready(function() {
            $('#myTable').DataTable({
                responsive: true,
                autoWidth: false,
                language: {
                    url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json'
                }
            });

            // Abrir el modal y cargar los datos del turno en el formulario
            $('#modalEditar').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Botón que disparó el modal
                var idTurno = button.data('id');
                var fecha = button.data('fecha');
                var hora = button.data('hora');
                var diagnostico = button.data('diagnostico');

                var modal = $(this);
                modal.find('#turno_id').val(idTurno);
                modal.find('#fecha').val(fecha);
                modal.find('#hora').val(hora);
                modal.find('#diagnostico').val(diagnostico);
            });
        });
    </script>

    <!--script para exportar archivos-->
<script>
const table = document.getElementById('myTable') || null;

const exportPDFButton = document.getElementById('exportPDF');
    if (exportPDFButton) {
        exportPDFButton.addEventListener('click', () => {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF({
                orientation: 'landscape', // Cambia la orientación a paisaje
            });
            doc.autoTable({
                html: '#myTable',
                startY: 20,
                theme: 'striped',
                headStyles: { fontSize: 10 }, 
                bodyStyles: { fontSize: 8 },  
                margin: { top: 10, right: 10, bottom: 10, left: 10 },
            });
            doc.save('Consultas_informe.pdf');
        });
    }

    const exportExcelButton = document.getElementById('exportExcel');
    if (exportExcelButton) {
        exportExcelButton.addEventListener('click', () => {
            const wb = XLSX.utils.table_to_book(document.getElementById('myTable'), { sheet: "Sheet1" });
            XLSX.writeFile(wb, 'Consultas_informe.xlsx');
        });
    }
</script>

</body>
</html>
