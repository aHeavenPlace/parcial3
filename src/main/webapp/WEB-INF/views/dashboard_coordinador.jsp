<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Dashboard Coordinador - Saber Pro</title>
    <style>
        /* Estilos consistentes con el sistema */
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        
        :root {
            --primary: #8B5CF6;
            --primary-dark: #7C3AED;
            --primary-light: #A78BFA;
            --dark-bg: #0F0F15;
            --dark-surface: #1A1A25;
            --dark-card: #252536;
            --light-text: #F5F5F7;
            --light-text-secondary: #A1A1AA;
            --border-color: #333344;
            --success: #10B981;
            --warning: #F59E0B;
            --error: #EF4444;
            --info: #3B82F6;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }
        
        body {
            background-color: var(--dark-bg);
            color: var(--light-text);
            min-height: 100vh;
            padding: 0;
            position: relative;
            overflow-x: hidden;
        }
        
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: 
                radial-gradient(circle at 10% 20%, rgba(139, 92, 246, 0.05) 0%, transparent 50%),
                radial-gradient(circle at 90% 80%, rgba(139, 92, 246, 0.05) 0%, transparent 50%);
            z-index: -1;
        }
        
        /* Header */
        .dashboard-header {
            background: var(--dark-card);
            border-bottom: 1px solid var(--border-color);
            padding: 24px 40px;
            position: sticky;
            top: 0;
            z-index: 100;
            backdrop-filter: blur(10px);
        }
        
        .header-content {
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .welcome-section h1 {
            font-size: 28px;
            font-weight: 700;
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 4px;
        }
        
        .welcome-section p {
            color: var(--light-text-secondary);
            font-size: 16px;
        }
        
        .header-actions {
            display: flex;
            gap: 16px;
            align-items: center;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(139, 92, 246, 0.3);
        }
        
        .logout-btn {
            background: rgba(239, 68, 68, 0.1);
            color: var(--error);
            border: 1px solid rgba(239, 68, 68, 0.3);
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .logout-btn:hover {
            background: rgba(239, 68, 68, 0.2);
            transform: translateY(-2px);
        }
        
        /* Main Content */
        .dashboard-main {
            max-width: 1400px;
            margin: 0 auto;
            padding: 40px;
        }
        
        /* Stats Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 24px;
            margin-bottom: 40px;
        }
        
        .stat-card {
            background: var(--dark-card);
            border-radius: 16px;
            padding: 30px;
            border: 1px solid var(--border-color);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
            text-align: center;
        }
        
        .stat-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 16px;
        }
        
        .stat-value {
            font-size: 36px;
            font-weight: 700;
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin: 8px 0;
        }
        
        .stat-label {
            color: var(--light-text-secondary);
            font-size: 16px;
        }
        
        /* Table Container */
        .table-container {
            background: var(--dark-card);
            border-radius: 16px;
            padding: 30px;
            border: 1px solid var(--border-color);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }
        
        .table-header {
            display: flex;
            justify-content: between;
            align-items: center;
            margin-bottom: 24px;
        }
        
        .table-title {
            font-size: 20px;
            font-weight: 600;
            color: var(--light-text);
        }
        
        /* Table Styles */
        .students-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 16px;
        }
        
        .students-table th {
            background: var(--dark-surface);
            padding: 16px;
            text-align: left;
            font-weight: 600;
            color: var(--light-text);
            border-bottom: 2px solid var(--border-color);
        }
        
        .students-table td {
            padding: 16px;
            border-bottom: 1px solid var(--border-color);
        }
        
        .students-table tr:hover {
            background: rgba(139, 92, 246, 0.05);
        }
        
        /* Action Buttons */
        .action-buttons {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }
        
        .btn-action {
            padding: 6px 12px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 500;
            transition: all 0.2s ease;
            border: 1px solid;
        }
        
        .btn-view {
            background: rgba(59, 130, 246, 0.1);
            color: var(--info);
            border-color: rgba(59, 130, 246, 0.3);
        }
        
        .btn-edit {
            background: rgba(245, 158, 11, 0.1);
            color: var(--warning);
            border-color: rgba(245, 158, 11, 0.3);
        }
        
        .btn-delete {
            background: rgba(239, 68, 68, 0.1);
            color: var(--error);
            border-color: rgba(239, 68, 68, 0.3);
        }
        
        .btn-action:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }
        
        /* Student Name */
        .student-name {
            font-weight: 500;
            color: var(--light-text);
        }
        
        .student-document {
            color: var(--light-text-secondary);
            font-size: 13px;
            margin-top: 4px;
        }
        
        /* Score Display */
        .score-badge {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 14px;
            display: inline-block;
        }
        
        /* Responsive */
        @media (max-width: 1024px) {
            .dashboard-main {
                padding: 20px;
            }
            
            .header-content {
                flex-direction: column;
                gap: 16px;
                text-align: center;
            }
            
            .header-actions {
                justify-content: center;
            }
            
            .action-buttons {
                flex-direction: column;
                gap: 8px;
            }
        }
        
        @media (max-width: 768px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }
            
            .students-table {
                display: block;
                overflow-x: auto;
            }
        }
        
        /* Animaciones */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .stat-card, .table-container {
            animation: fadeInUp 0.6s ease;
        }
        
        .stat-card:nth-child(2) {
            animation-delay: 0.1s;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="dashboard-header">
        <div class="header-content">
            <div class="welcome-section">
                <h1>Dashboard del Coordinador</h1>
                <p>Gestión Integral de Estudiantes - Saber Pro 2025</p>
            </div>
            <div class="header-actions">
                <a href="/coordinador/alumnos/nuevo" class="btn-primary">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M12 5v14M5 12h14"/>
                    </svg>
                    Nuevo Alumno
                </a>
                <a href="/logout" class="logout-btn">Cerrar Sesión</a>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="dashboard-main">
        <!-- Statistics -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon">
                    <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                        <circle cx="9" cy="7" r="4"></circle>
                        <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                        <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                    </svg>
                </div>
                <div class="stat-value">${totalAlumnos}</div>
                <div class="stat-label">Total de Alumnos Inscritos</div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon">
                    <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polyline points="22 7 13.5 15.5 8.5 10.5 2 17"></polyline>
                        <polyline points="16 7 22 7 22 13"></polyline>
                    </svg>
                </div>
                <div class="stat-value">${promedioPuntaje}</div>
                <div class="stat-label">Puntaje Promedio Global</div>
            </div>
        </div>

        <!-- Students Table -->
        <div class="table-container">
            <div class="table-header">
                <h2 class="table-title">Listado de Alumnos</h2>
            </div>
            
            <table class="students-table">
                <thead>
                    <tr>
                        <th>Documento</th>
                        <th>Nombre Completo</th>
                        <th>Correo Electrónico</th>
                        <th>Puntaje Total</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="alumno" items="${alumnos}">
                    <tr>
                        <td>
                            <div class="student-document">${alumno.numeroDocumento}</div>
                        </td>
                        <td>
                            <div class="student-name">
                                ${alumno.primerNombre} 
                                <c:if test="${not empty alumno.segundoNombre}">${alumno.segundoNombre}</c:if>
                                ${alumno.primerApellido}
                                <c:if test="${not empty alumno.segundoApellido}">${alumno.segundoApellido}</c:if>
                            </div>
                        </td>
                        <td>${alumno.correo}</td>
                        <td>
                            <span class="score-badge">${alumno.puntajeTotal}</span>
                        </td>
                        <td>
                            <div class="action-buttons">
                                <a href="/coordinador/alumnos/informe/${alumno.id}" class="btn-action btn-view">
                                    Ver Informe
                                </a>
                                <a href="/coordinador/alumnos/editar/${alumno.id}" class="btn-action btn-edit">
                                    Editar
                                </a>
                                <a href="/coordinador/alumnos/eliminar/${alumno.id}" 
                                   class="btn-action btn-delete"
                                   onclick="return confirm('¿Estás seguro que deseas eliminar este alumno?');">
                                    Eliminar
                                </a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </main>

    <script>
        // Confirmación mejorada para eliminación
        document.addEventListener('DOMContentLoaded', function() {
            const deleteLinks = document.querySelectorAll('.btn-delete');
            deleteLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    if (!confirm('¿Estás seguro que deseas eliminar permanentemente este alumno?\nEsta acción no se puede deshacer.')) {
                        e.preventDefault();
                    }
                });
            });
        });
    </script>
</body>
</html>