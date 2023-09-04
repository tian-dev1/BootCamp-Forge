<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="js/funciones.js"></script>
    <title>Index</title>
</head>
<body>
    <h1>Hello!!!! :d</h1>
    <h2>Comunicación</h2>
    <h3>Mañana</h3>
    <!-- <h4><c:out value="${User}" /></h4>
    <h4><c:out value="${usuario }" /> </h4> -->
    <h2><c:out value = "${usuario.nombre}" /></h2>    
    <h2><c:out value = "${usuario.getNombreCompleto()}" /></h2>
    <h2><c:out value = "${usuario.getCalcularSalario()}" /></h2>
</body>
</html>