<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Informe del Alumno - Saber Pro 2025</title>
    <style>
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
            overflow-x: hidden;
        }

        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background-image:
                radial-gradient(circle at 10% 20%, rgba(139,92,246,0.05) 0%, transparent 50%),
                radial-gradient(circle at 90% 80%, rgba(139,92,246,0.05) 0%, transparent 50%);
            z-index: -1;
        }

        .header {
            background: var(--dark-card);
            border-bottom: 1px solid var(--border-color);
            padding: 24px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header-title h1 {
            font-size: 26px;
            font-weight: 700;
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .header-title p {
            color: var(--light-text-secondary);
            margin-top: 4px;
        }

        .header-actions a {
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 500;
            border: 1px solid var(--border-color);
            color: var(--light-text-secondary);
            transition: all 0.2s ease;
            margin-left: 8px;
        }

        .header-actions a.primary-link {
            border-color: transparent;
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: #fff;
        }

        .header-actions a:hover {
            transform: translateY(-1px);
            box-shadow: 0 6px 18px rgba(0,0,0,0.25);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 32px 40px 40px;
            display: grid;
            grid-template-columns: 1.2fr 1fr;
            gap: 24px;
        }

        .card {
            background: var(--dark-card);
            border-radius: 16px;
            padding: 24px 28px;
            border: 1px solid var(--border-color);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        .card-full {
            grid-column: 1 / -1;
        }

        .card-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .card-icon {
            width: 44px;
            height: 44px;
            border-radius: 12px;
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
        }

        .card-title {
            font-size: 18px;
            font-weight: 600;
        }

        .info-grid {
            display: grid;
            gap: 12px;
        }

        .info-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 14px;
            background: var(--dark-surface);
            border-radius: 10px;
        }

        .info-label {
            color: var(--light-text-secondary);
            font-size: 14px;
        }

        .info-value {
            font-weight: 600;
        }

        .score-main {
            text-align: center;
            padding: 16px;
        }

        .score-number {
            font-size: 40px;
            font-weight: 700;
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 4px;
        }

        .score-caption {
            color: var(--light-text-secondary);
        }

        .benefits-list {
            margin-top: 8px;
        }

        .benefit-item {
            padding: 12px 14px;
            border-radius: 10px;
            background: rgba(16,185,129,0.06);
            border: 1px solid rgba(16,185,129,0.25);
            color: var(--success);
            margin-bottom: 10px;
        }

        .benefit-empty {
            padding: 12px 14px;
            border-radius: 10px;
            background: rgba(148,163,184,0.08);
            border: 1px solid rgba(148,163,184,0.3);
            color: var(--light-text-secondary);
        }

        @media (max-width: 960px) {
            .container {
                grid-template-columns: 1fr;
                padding: 24px 20px 32px;
            }
        }
    </style>
</head>
<body>
<header class="header">
    <div class="header-title">
        <h1>Informe del Alumno</h1>
        <p>
            ${alumno.primerNombre}
            <c:if test="${not empty alumno.segundoNombre}">${alumno.segundoNombre}</c:if>
            ${alumno.primerApellido}
            <c:if test="${not empty alumno.segundoApellido}">${alumno.segundoApellido}</c:if>
        </p>
    </div>
    <div class="header-actions">
        <a href="/coordinador/dashboard" class="primary-link">Volver al Dashboard</a>
        <a href="/logout">Cerrar Sesión</a>
    </div>
</header>

<main class="container">
    <!-- Datos del alumno -->
    <section class="card">
        <div class="card-header">
            <div class="card-icon">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none"
                     stroke="currentColor" stroke-width="2">
                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                    <circle cx="12" cy="7" r="4"></circle>
                </svg>
            </div>
            <h2 class="card-title">Información del Estudiante</h2>
        </div>
        <div class="info-grid">
            <div class="info-row">
                <span class="info-label">Documento</span>
                <span class="info-value">${alumno.numeroDocumento}</span>
            </div>
            <div class="info-row">
                <span class="info-label">Correo</span>
                <span class="info-value">${alumno.correo}</span>
            </div>
            <div class="info-row">
                <span class="info-label">Teléfono</span>
                <span class="info-value">
                    <c:out value="${alumno.telefono != null ? alumno.telefono : 'No registrado'}"/>
                </span>
            </div>
        </div>
    </section>

    <!-- Puntaje global y resumen -->
    <section class="card">
        <div class="card-header">
            <div class="card-icon">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none"
                     stroke="currentColor" stroke-width="2">
                    <polyline points="22 7 13.5 15.5 8.5 10.5 2 17"></polyline>
                    <polyline points="16 7 22 7 22 13"></polyline>
                </svg>
            </div>
            <h2 class="card-title">Puntaje Global</h2>
        </div>
        <div class="score-main">
            <div class="score-number">
                <c:out value="${alumno.puntajeTotal != null ? alumno.puntajeTotal : 0}"/>
            </div>
            <div class="score-caption">Puntaje total en Saber Pro</div>
        </div>
    </section>

    <!-- Beneficios -->
    <section class="card card-full">
        <div class="card-header">
            <div class="card-icon">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none"
                     stroke="currentColor" stroke-width="2">
                    <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                </svg>
            </div>
            <h2 class="card-title">Beneficios Aplicables</h2>
        </div>

        <div class="benefits-list">
            <c:choose>
                <c:when test="${not empty beneficios}">
                    <c:forEach var="b" items="${beneficios}">
                        <div class="benefit-item">
                            <strong>${b.descripcion}</strong>
                            <c:if test="${not empty b.minimoPuntaje}">
                                <br/>
                                <span style="font-size:13px;color:var(--light-text-secondary);">
                                    Aplica desde puntaje: ${b.minimoPuntaje}
                                </span>
                            </c:if>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="benefit-empty">
                        Este estudiante no aplica a beneficios con el puntaje actual.
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </section>
</main>
</body>
</html>
