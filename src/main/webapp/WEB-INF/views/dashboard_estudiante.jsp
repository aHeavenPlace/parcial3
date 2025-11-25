<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Dashboard Estudiante - Saber Pro 2025</title>
    <style>
        /* Estilos consistentes con el login */
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
            max-width: 1200px;
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
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
        }
        
        /* Cards */
        .card {
            background: var(--dark-card);
            border-radius: 16px;
            padding: 30px;
            border: 1px solid var(--border-color);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
            animation: fadeInUp 0.6s ease;
        }
        
        .card-full {
            grid-column: 1 / -1;
        }
        
        .card-header {
            display: flex;
            align-items: center;
            margin-bottom: 24px;
        }
        
        .card-icon {
            width: 48px;
            height: 48px;
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 16px;
        }
        
        .card-title {
            font-size: 20px;
            font-weight: 600;
            color: var(--light-text);
        }
        
        /* Información Personal */
        .info-grid {
            display: grid;
            gap: 16px;
        }
        
        .info-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 16px;
            background: var(--dark-surface);
            border-radius: 10px;
            border-left: 4px solid var(--primary);
        }
        
        .info-label {
            color: var(--light-text-secondary);
            font-weight: 500;
        }
        
        .info-value {
            font-weight: 600;
            color: var(--light-text);
        }
        
        /* Puntaje Total */
        .score-display {
            text-align: center;
            padding: 30px;
            background: linear-gradient(135deg, var(--dark-surface), var(--dark-card));
            border-radius: 12px;
            border: 1px solid var(--border-color);
            margin-bottom: 24px;
        }
        
        .score-value {
            font-size: 48px;
            font-weight: 700;
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin: 10px 0;
        }
        
        .score-label {
            color: var(--light-text-secondary);
            font-size: 16px;
        }
        
        /* Tabla de Resultados */
        .results-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 16px;
        }
        
        .results-table th {
            background: var(--dark-surface);
            padding: 16px;
            text-align: left;
            font-weight: 600;
            color: var(--light-text);
            border-bottom: 2px solid var(--border-color);
        }
        
        .results-table td {
            padding: 16px;
            border-bottom: 1px solid var(--border-color);
        }
        
        .results-table tr:hover {
            background: rgba(139, 92, 246, 0.05);
        }
        
        .area-name {
            font-weight: 500;
            color: var(--light-text);
        }
        
        .area-score {
            font-weight: 600;
            color: var(--primary-light);
        }
        
        /* Estado de Beneficios */
        .benefits-status {
            text-align: center;
            padding: 30px;
        }
        
        .benefits-message {
            font-size: 18px;
            font-weight: 600;
            padding: 16px 24px;
            border-radius: 10px;
            background: rgba(59, 130, 246, 0.1);
            border: 1px solid rgba(59, 130, 246, 0.3);
            color: var(--info);
            display: inline-block;
        }
        
        /* Responsive */
        @media (max-width: 968px) {
            .dashboard-main {
                grid-template-columns: 1fr;
                padding: 20px;
            }
            
            .header-content {
                flex-direction: column;
                gap: 16px;
                text-align: center;
            }
        }
        
        @media (max-width: 480px) {
            .dashboard-header {
                padding: 20px;
            }
            
            .welcome-section h1 {
                font-size: 24px;
            }
            
            .card {
                padding: 20px;
            }
            
            .score-value {
                font-size: 36px;
            }
        }
        
        /* Animaciones */
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to   { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="dashboard-header">
        <div class="header-content">
            <div class="welcome-section">
                <h1>Bienvenido/a ${alumno.primerNombre} ${alumno.primerApellido}</h1>
                <p>Dashboard Estudiantil - Saber Pro 2025</p>
            </div>
            <a href="/logout" class="logout-btn">Cerrar Sesión</a>
        </div>
    </header>

    <!-- Main Content -->
    <main class="dashboard-main">
        <!-- Información Personal -->
        <div class="card">
            <div class="card-header">
                <div class="card-icon">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                        <circle cx="12" cy="7" r="4"></circle>
                    </svg>
                </div>
                <h2 class="card-title">Información Personal</h2>
            </div>
            <div class="info-grid">
                <div class="info-item">
                    <span class="info-label">Documento</span>
                    <span class="info-value">${alumno.numeroDocumento}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">Correo Electrónico</span>
                    <span class="info-value">${alumno.correo}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">Teléfono</span>
                    <span class="info-value">${alumno.telefono}</span>
                </div>
            </div>
        </div>

        <!-- Puntaje Total -->
        <div class="card">
            <div class="card-header">
                <div class="card-icon">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <polyline points="22 7 13.5 15.5 8.5 10.5 2 17"></polyline>
                        <polyline points="16 7 22 7 22 13"></polyline>
                    </svg>
                </div>
                <h2 class="card-title">Puntaje Total</h2>
            </div>
            <div class="score-display">
                <div class="score-value">${alumno.puntajeTotal}</div>
                <div class="score-label">Puntaje Global Obtenido</div>
            </div>
        </div>

        <!-- Resultados por Área -->
        <div class="card card-full">
            <div class="card-header">
                <div class="card-icon">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path>
                        <polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline>
                        <line x1="12" y1="22.08" x2="12" y2="12"></line>
                    </svg>
                </div>
                <h2 class="card-title">Resultados por Área</h2>
            </div>

            <c:choose>
                <c:when test="${not empty resultados}">
                    <table class="results-table">
                        <thead>
                        <tr>
                            <th>Área de Conocimiento</th>
                            <th>Puntaje Obtenido</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="resultado" items="${resultados}">
                            <tr>
                                <td class="area-name">${resultado.area}</td>
                                <td class="area-score">${resultado.puntaje}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <p style="color: var(--light-text-secondary);">
                        Aún no hay resultados registrados para este estudiante.
                    </p>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Estado de Beneficios -->
        <div class="card card-full">
            <div class="card-header">
                <div class="card-icon">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                    </svg>
                </div>
                <h2 class="card-title">Estado de Beneficios</h2>
            </div>
            <div class="benefits-status">
                <div class="benefits-message">${mensajeBeneficio}</div>
            </div>
        </div>
    </main>
</body>
</html>
