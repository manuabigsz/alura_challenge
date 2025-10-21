<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="/assets/css/login.css">
</head>
<body class="login-page">
    <div class="container">
        <div class="login-box">
            <h2>Já estuda com a gente?</h2>
            <p>Faça seu login e boa aula!</p>
            <a href="/admin/categories" class="btn-login">ENTRAR</a>
        </div>
        <div class="courses">
            <h2>Ainda não estuda com a gente?</h2>
            <p>São mais de mil cursos nas seguintes áreas:</p>
            <div class="grid">
                <c:forEach var="category" items="${categories}">
                    <div class="card">
                        <div style="margin-bottom: 12px; text-align: left;">
                            <img src="/assets/icons/${category.code}.svg"
                                 alt="${category.name}"
                                 style="width: 40px; height: 40px; display: block; margin-bottom: 8px;"
                                 onerror="this.style.display='none'">

                            <h3 style="color: ${category.color}; font-weight: normal; margin: 0; line-height: 1.2;">
                                Escola_<br>
                                <span style="font-weight: bold;">${category.name}</span>
                            </h3>
                        </div>
                        <p style="margin: 8px 0 0 0; text-align: left;">
                            <c:set var="courses" value="${coursesByCategory[category.id]}" />
                            <c:choose>
                                <c:when test="${not empty courses}">
                                    <c:forEach var="courseName" items="${courses}" varStatus="status">
                                        ${courseName}<c:if test="${!status.last}">, </c:if>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    Cursos em breve
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>