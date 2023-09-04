<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index</title>
</head>
<body>
    <h1>Hello!!!! :d</h1>
    <form action="" method="post">
        
        <label for="nombre">Nombre</label>
        <input type="text" name="nombre">
        
        <label for="apellido">Apellido</label>
        <input type="text" name="apellido">
        
        <label for="codigo">Codigo</label>
        <input type="number" name="codigo">

        <p>Intereses</p>
        <label for="">Deporte</label>
        <input type="checkbox" name="intereses" value="deporte">
        <label for="">Código</label>
        <input type="checkbox" name="intereses" value="codigo">
        <label for="">Cine</label>
        <input type="checkbox" name="intereses" value="cine">
<br>
        <label for="">Uno</label>
        <input type="radio" name="radio" value="One">
        <label for="">Dos</label>
        <input type="radio" name="radio" value="Two">
        <label for="">Tres</label>
        <input type="radio" name="radio" value="Three">

        <label for="color">Color</label>
        <input type="color" name="color">

        <label for="fechaNacimiento">Fecha Nacimiento</label>
        <input type="date" name="fechaNacimiento">

        <button>Guardar</button>
    </form>
</body>
</html>