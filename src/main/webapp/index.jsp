<%@page import="com.emergentes.modelo.Calificacion"%>
<%@page import="java.util.ArrayList"%>
<%
    if (session.getAttribute("listacal") == null) {
        ArrayList<Calificacion> lisaux = new ArrayList<Calificacion>();
        session.setAttribute("listacal", lisaux);
    } else {
    }
    ArrayList<Calificacion> lista = (ArrayList<Calificacion>) session.getAttribute("listacal");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            max-width: 500px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            animation: fadeIn 1s ease;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        p {
            margin: 5px 0;
        }
        h1 {
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
        a {
            text-decoration: none;
            color: #007bff;
            transition: color 0.3s;
        }
        a:hover {
            color: #0056b3;
        }
        .btn {
            padding: 10px 20px;
            background-color: #ffc107;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #ffca28;
        }
        .edit-link {
            color: #007bff;
        }
        .edit-link:hover {
            color: #0044cc;
        }
        .delete-link {
            color: #dc3545;
        }
        .delete-link:hover {
            color: #bd2130;
        }
    </style>
</head>
<body>
    <div class="container">
        <div>
            <p>PRIMER PARCIAL TEM-742</p>
            <p>Nombre: Ronald Gutierrez Flores</p>
            <p>Carnet: 9996011</p>
        </div>
        <h1>Registro de Calificaciones</h1>
        <a href="MainServlet?op=nuevo" class="btn">Nuevo registro</a>
        <table>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>P1(30)</th>
                <th>P2(30)</th>
                <th>EF(40)</th>
                <th>NOTA</th>
                <th></th>
                <th></th>
            </tr>
            <% 
                if (lista != null) {
                    for (Calificacion item : lista) {
            %>
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getNombres()%> <%= item.getApellidos()%></td>
                <td><%= item.getP1()%></td>
                <td><%= item.getP2()%></td>
                <td><%= item.getEF()%></td>
                <td><%= item.getNota()%></td>
                <td>
                    <a href="MainServlet?op=editar&id=<%= item.getId()%>" class="edit-link">Editar</a>
                </td>
                <td>
                    <a href="MainServlet?op=eliminar&id=<%= item.getId()%>" class="delete-link">Eliminar</a>
                </td>
            </tr>
            <% 
                }
            }
            %>
        </table>
    </div>
</body>
</html>