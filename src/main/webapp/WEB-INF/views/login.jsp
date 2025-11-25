<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Login - Saber Pro 2025</title>
    <style>
        /* Estilos minimalistas y sofisticados */
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&display=swap');
        
        :root {
            --primary: #8B5CF6;
            --primary-dark: #7C3AED;
            --dark-bg: #0F0F15;
            --dark-surface: #1A1A25;
            --dark-card: #252536;
            --light-text: #F5F5F7;
            --light-text-secondary: #A1A1AA;
            --border-color: #333344;
            --success: #10B981;
            --error: #EF4444;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }
        
        body {
            background-color: var(--dark-bg);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            color: var(--light-text);
            position: relative;
            overflow: hidden;
        }
        
        /* Fondo con patrón sutil */
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: 
                radial-gradient(circle at 15% 50%, rgba(139, 92, 246, 0.03) 0%, transparent 55%),
                radial-gradient(circle at 85% 30%, rgba(139, 92, 246, 0.03) 0%, transparent 55%);
            z-index: -1;
        }
        
        /* Contenedor principal */
        .login-container {
            width: 100%;
            max-width: 440px;
            background: var(--dark-card);
            border-radius: 16px;
            padding: 48px 40px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            border: 1px solid var(--border-color);
            position: relative;
            overflow: hidden;
        }
        
        /* Efecto de acento sutil */
        .login-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(90deg, var(--primary), var(--primary-dark));
        }
        
        /* Encabezado */
        .login-header {
            text-align: center;
            margin-bottom: 36px;
        }
        
        .logo {
            width: 60px;
            height: 60px;
            margin: 0 auto 16px;
            background: var(--dark-surface);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid var(--border-color);
        }
        
        .logo-inner {
            width: 32px;
            height: 32px;
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            border-radius: 8px;
            transform: rotate(45deg);
        }
        
        .login-header h1 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 8px;
            letter-spacing: -0.5px;
        }
        
        .login-header p {
            color: var(--light-text-secondary);
            font-size: 15px;
            font-weight: 400;
        }
        
        /* Formulario */
        .form-group {
            margin-bottom: 24px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--light-text);
            font-size: 14px;
        }
        
        .input-container {
            position: relative;
        }
        
        .input-field {
            width: 100%;
            padding: 14px 16px;
            background: var(--dark-surface);
            border: 1px solid var(--border-color);
            border-radius: 10px;
            color: var(--light-text);
            font-size: 15px;
            transition: all 0.2s ease;
            appearance: none;
            -webkit-appearance: none;
        }
        
        .input-field:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.1);
        }
        
        .input-field::placeholder {
            color: var(--light-text-secondary);
        }
        
        /* Estilo específico para el select */
        select.input-field {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%23A1A1AA'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M19 9l-7 7-7-7'%3E%3C/path%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 16px center;
            background-size: 16px;
            padding-right: 44px;
        }
        
        /* Iconos sutiles para campos */
        .input-container::before {
            content: '';
            position: absolute;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            width: 18px;
            height: 18px;
            opacity: 0.5;
            background-size: contain;
            background-repeat: no-repeat;
        }
        
        #correo + .input-container::before {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%23A1A1AA'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z' /%3E%3C/svg%3E");
        }
        
        #password + .input-container::before {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%23A1A1AA'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z' /%3E%3C/svg%3E");
        }
        
        /* Para el select, no mostrar icono adicional */
        #tipo + .input-container::before {
            display: none;
        }
        
        /* Botón */
        .submit-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            border: none;
            border-radius: 10px;
            color: white;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
            margin-top: 8px;
            position: relative;
            overflow: hidden;
        }
        
        .submit-btn:hover {
            background: linear-gradient(135deg, var(--primary-dark), #6D28D9);
            box-shadow: 0 4px 12px rgba(139, 92, 246, 0.3);
        }
        
        .submit-btn:active {
            transform: scale(0.98);
        }
        
        /* Mensajes de estado */
        .message {
            padding: 14px 16px;
            border-radius: 10px;
            margin-top: 20px;
            text-align: center;
            font-weight: 500;
            font-size: 14px;
            animation: fadeIn 0.4s ease;
            border: 1px solid;
        }
        
        .error {
            background: rgba(239, 68, 68, 0.1);
            color: var(--error);
            border-color: rgba(239, 68, 68, 0.2);
        }
        
        .success {
            background: rgba(16, 185, 129, 0.1);
            color: var(--success);
            border-color: rgba(16, 185, 129, 0.2);
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-8px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        /* Enlace de ayuda sutil */
        .help-link {
            text-align: center;
            margin-top: 24px;
        }
        
        .help-link a {
            color: var(--light-text-secondary);
            text-decoration: none;
            font-size: 14px;
            transition: color 0.2s ease;
        }
        
        .help-link a:hover {
            color: var(--primary);
        }
        
        /* Efectos responsivos */
        @media (max-width: 480px) {
            .login-container {
                padding: 36px 24px;
            }
            
            .login-header h1 {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <div class="logo">
                <div class="logo-inner"></div>
            </div>
            <h1>Saber Pro 2025</h1>
            <p>Accede a tu cuenta para continuar</p>
        </div>
        
        <form method="post" action="/login">
            <div class="form-group">
                <label for="correo">Correo electrónico</label>
                <div class="input-container">
                    <input type="email" 
                           id="correo" 
                           name="correo" 
                           class="input-field" 
                           placeholder="usuario@uts.edu.co" 
                           required />
                </div>
            </div>
            
            <div class="form-group">
                <label for="password">Contraseña</label>
                <div class="input-container">
                    <input type="password" 
                           id="password" 
                           name="contrasena" 
                           class="input-field" 
                           placeholder="Ingresa tu contraseña" 
                           required />
                </div>
            </div>
            
            <div class="form-group">
                <label for="tipo">Tipo de usuario</label>
                <div class="input-container">
                    <select id="tipo" name="tipo" class="input-field" required>
                        <option value="" disabled selected>Selecciona una opción</option>
                        <option value="ESTUDIANTE">Estudiante</option>
                        <option value="COORDINADOR">Coordinador</option>
                    </select>
                </div>
            </div>
            
            <button type="submit" class="submit-btn">Iniciar Sesión</button>
        </form>
        
        <c:if test="${not empty error}">
            <div class="message error">
                ${error}
            </div>
        </c:if>
        
        <div class="help-link">
            <a href="#">¿Necesitas ayuda para acceder?</a>
        </div>
    </div>
</body>
</html>