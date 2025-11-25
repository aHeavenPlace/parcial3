<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Gestión de Alumno - Saber Pro 2025</title>
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
            font-size: 24px;
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

        .header-actions a:hover {
            transform: translateY(-1px);
            box-shadow: 0 6px 18px rgba(0,0,0,0.25);
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 32px 40px 40px;
        }

        .card {
            background: var(--dark-card);
            border-radius: 16px;
            padding: 28px 30px;
            border: 1px solid var(--border-color);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        .card-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 18px 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        label {
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 6px;
        }

        .input-field {
            padding: 10px 12px;
            border-radius: 8px;
            border: 1px solid var(--border-color);
            background: var(--dark-surface);
            color: var(--light-text);
            font-size: 14px;
        }

        .input-field:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 2px rgba(139,92,246,0.25);
        }

        .form-actions {
            margin-top: 24px;
            display: flex;
            justify-content: flex-end;
            gap: 12px;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 500;
            border: none;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: #fff;
        }

        .btn-secondary {
            background: transparent;
            border: 1px solid var(--border-color);
            color: var(--light-text-secondary);
        }

        .btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 6px 16px rgba(0,0,0,0.25);
        }

        @media (max-width: 768px) {
            .container {
                padding: 24px 20px 32px;
            }
            .form-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<header class="header">
    <div class="header-title">
        <c:choose>
            <c:when test="${not empty alumno.id}">
                <h1>Editar Alumno</h1>
                <p>Actualiza los datos del estudiante seleccionado</p>
            </c:when>
            <c:otherwise>
                <h1>Nuevo Alumno</h1>
                <p>Registra un nuevo estudiante para Saber Pro 2025</p>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="header-actions">
        <a href="/coordinador/dashboard">Volver al Dashboard</a>
    </div>
</header>

<main class="container">
    <div class="card">
        <h2 class="card-title">Datos del Alumno</h2>

        <form method="post" action="/coordinador/alumnos">
            <!-- id oculto para edición -->
            <c:if test="${not empty alumno.id}">
                <input type="hidden" name="id" value="${alumno.id}" />
            </c:if>

            <div class="form-grid">
                <div class="form-group">
                    <label for="numeroDocumento">Número de Documento</label>
                    <input type="text" id="numeroDocumento" name="numeroDocumento"
                           class="input-field" value="${alumno.numeroDocumento}" required />
                </div>

                <div class="form-group">
                    <label for="primerNombre">Primer Nombre</label>
                    <input type="text" id="primerNombre" name="primerNombre"
                           class="input-field" value="${alumno.primerNombre}" required />
                </div>

                <div class="form-group">
                    <label for="segundoNombre">Segundo Nombre</label>
                    <input type="text" id="segundoNombre" name="segundoNombre"
                           class="input-field" value="${alumno.segundoNombre}" />
                </div>

                <div class="form-group">
                    <label for="primerApellido">Primer Apellido</label>
                    <input type="text" id="primerApellido" name="primerApellido"
                           class="input-field" value="${alumno.primerApellido}" required />
                </div>

                <div class="form-group">
                    <label for="segundoApellido">Segundo Apellido</label>
                    <input type="text" id="segundoApellido" name="segundoApellido"
                           class="input-field" value="${alumno.segundoApellido}" />
                </div>

                <div class="form-group">
                    <label for="correo">Correo Electrónico</label>
                    <input type="email" id="correo" name="correo"
                           class="input-field" value="${alumno.correo}" required />
                </div>

                <div class="form-group">
                    <label for="telefono">Teléfono</label>
                    <input type="text" id="telefono" name="telefono"
                           class="input-field" value="${alumno.telefono}" />
                </div>

                <div class="form-group">
                    <label for="puntajeTotal">Puntaje Total</label>
                    <input type="number" step="0.1" id="puntajeTotal" name="puntajeTotal"
                           class="input-field" value="${alumno.puntajeTotal}" />
                </div>
            </div>

            <div class="form-actions">
                <a href="/coordinador/dashboard" class="btn btn-secondary">Cancelar</a>
                <button type="submit" class="btn btn-primary">
                    <c:choose>
                        <c:when test="${not empty alumno.id}">Guardar Cambios</c:when>
                        <c:otherwise>Crear Alumno</c:otherwise>
                    </c:choose>
                </button>
            </div>
        </form>
    </div>
</main>
</body>
</html>
