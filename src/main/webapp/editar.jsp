<%@page import="com.emergentes.modelo.Calificacion"%>
<%
    Calificacion reg = (Calificacion) request.getAttribute("miobjcal");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        .container {
            max-width: 500px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            animation: fadeIn 1s ease;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
        }
        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 50%;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
         p {
            margin: 5px 0;
        }
        h1 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>  
    <div class="container">
            <p>PRIMER PARCIAL TEM-742</p>
            <p>Nombre: Ronald Gutierrez Flores</p>
            <p>Carnet: 9996011</p>
        </div>
        <h1>Registro de Calificaciones</h1>
    <form action="MainServlet" method="post">
        <table>
            <tr>
                <td>ID</td>
                <td> <input type="text" name="id" value="<%= reg.getId()%>" size="2" readonly=""></td>
            </tr>
            <tr>
                <td>Nombres</td>
                <td> <input type="text" name="nombres" value="<%= reg.getNombres()%>" size="2"  ></td> 
                <td>Apellidos</td>
                <td> <input type="text" name="apellidos" value="<%= reg.getApellidos()%>" size="2"  ></td>
            </tr>
            <tr>
                <td>Parcial 1</td>
                <td> <input type="text" name="p1" id="p1" value="<%= reg.getP1()%>" size="2" ></td>
            </tr>
            <tr>
                <td>Parcial 2</td>
                <td> <input type="text" name="p2" id="p2" value="<%= reg.getP2()%>" size="2" ></td>
            </tr>
            <tr>
                <td>EXAMEN FINAL</td>
                <td> <input type="text" name="ef" id="ef" value="<%= reg.getEF()%>" size="2" ></td>
            </tr>
            <tr>
                <td>Nota</td>
                <td> <input type="text" name="nota" id="nota" value="<%= reg.getEF()%>" size="2" readonly=""></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="Enviar" >
                </td>
            </tr>
        </table>
    </form>

<script>            
    function validarInput(input, max) {
        var valor = parseInt(input.value) || 0;
        if (valor > max) {
            input.value = max;
        }
        calcularNota(); // Llama a la función para recalcular la nota después de la validación
    }

    // Event listener para validar los campos de los parciales y el examen final mientras se escriben
    document.getElementById('p1').addEventListener('input', function () {
        validarInput(this, 30);
    });
    document.getElementById('p2').addEventListener('input', function () {
        validarInput(this, 30);
    });
    document.getElementById('ef').addEventListener('input', function () {
        validarInput(this, 40);
    });

    // Función para calcular la nota
    function calcularNota() {
        var p1 = parseInt(document.getElementById('p1').value) || 0;
        var p2 = parseInt(document.getElementById('p2').value) || 0;
        var ef = parseInt(document.getElementById('ef').value) || 0;

        // Calcular la nota
        var nota = p1 + p2 + ef;
        document.getElementById('nota').value = nota;
    }

    // Calcular la nota inicialmente
    calcularNota();
</script>
    </body>
</html>
