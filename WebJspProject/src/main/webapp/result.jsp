<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.lang.Math" %>
<!DOCTYPE html>
<html>
<head>
    <title>Resultado</title>
</head>
<body>
<%
    // Captura de los valores introducidos en el formulario
    double valor1 = Double.parseDouble(request.getParameter("valor1"));
    double valor2 = request.getParameter("valor2").isEmpty() ? 0 : Double.parseDouble(request.getParameter("valor2"));
    double valor3 = request.getParameter("valor3").isEmpty() ? 0 : Double.parseDouble(request.getParameter("valor3"));
    double valor4 = request.getParameter("valor4").isEmpty() ? 0 : Double.parseDouble(request.getParameter("valor4"));

    // Contar cuántos valores fueron introducidos
    int count = 0;
    if (valor1 != 0) count++;
    if (valor2 != 0) count++;
    if (valor3 != 0) count++;
    if (valor4 != 0) count++;

    // Determinar la figura según la cantidad de valores introducidos
    if (count == 1) {
        // Si solo hay un valor, es un círculo
        double radio = valor1 != 0 ? valor1 : (valor2 != 0 ? valor2 : (valor3 != 0 ? valor3 : valor4));
        double diametro = 2 * radio;
        double circunferencia = 2 * Math.PI * radio;
        double area = Math.PI * Math.pow(radio, 2);
%>
        <h2>Figura: Círculo</h2>
        <p>Radio: <%= radio %></p>
        <p>Diámetro: <%= diametro %></p>
        <p>Circunferencia: <%= circunferencia %></p>
        <p>Área: <%= area %></p>
<%
    } else if (count == 3) {
        // Si hay tres valores, es un triángulo
        double[] lados = {valor1, valor2, valor3};
        java.util.Arrays.sort(lados); // Ordenar los lados para facilitar la comparación
        double a = lados[0], b = lados[1], c = lados[2];
        String tipoTriangulo;
        if (a == b && b == c) {
            tipoTriangulo = "Equilátero"; // Todos los lados son iguales
        } else if (a == b || b == c || a == c) {
            tipoTriangulo = "Isósceles"; // Dos lados son iguales
        } else {
            tipoTriangulo = "Escaleno"; // Todos los lados son diferentes
        }
        double s = (a + b + c) / 2; // Semiperímetro
        double area = Math.sqrt(s * (s - a) * (s - b) * (s - c)); // Fórmula de Herón para el área
%>
        <h2>Figura: Triángulo <%= tipoTriangulo %></h2>
        <p>Lados: <%= a %>, <%= b %>, <%= c %></p>
        <p>Área: <%= area %></p>
<%
    } else if (count == 4) {
        if (valor1 == valor2 && valor2 == valor3 && valor3 == valor4) {
            // Si los cuatro valores son iguales, es un cuadrado
            double lado = valor1;
            double perimetro = 4 * lado;
            double area = Math.pow(lado, 2);
%>
            <h2>Figura: Cuadrado</h2>
            <p>Lado: <%= lado %></p>
            <p>Perímetro: <%= perimetro %></p>
            <p>Área: <%= area %></p>
<%
        } else {
            // Si los valores no son todos iguales, es un rectángulo
            double lado1 = valor1;
            double lado2 = valor2;
            double perimetro = 2 * (lado1 + lado2);
            double area = lado1 * lado2;
%>
            <h2>Figura: Rectángulo</h2>
            <p>Lados: <%= lado1 %>, <%= lado2 %></p>
            <p>Perímetro: <%= perimetro %></p>
            <p>Área: <%= area %></p>
<%
        }
    } else {
%>
        <h2>Datos insuficientes o incorrectos para determinar la figura.</h2>
<%
    }
%>
    <!-- Botón para volver al formulario de entrada -->
    <form action="index.jsp" method="get">
        <input type="submit" value="Volver">
    </form>
</body>
</html>

