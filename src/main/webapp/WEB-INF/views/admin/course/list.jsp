<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
    <title>Lista de Cursos</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/assets/external-libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/list_course.css">
</head>

<body>

    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h1>Cursos</h1>
                <a class="btn btn-info new-button" href="/admin/course/new">Cadastrar novo</a>
            </div>
            <table class="panel-body table table-hover">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Código</th>
                        <th>Instrutor</th>
                        <th>Descrição</th>
                        <th>Status</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${courses}" var="course">
                        <tr>
                            <td>${course.name()}</td>
                            <td>${course.code()}</td>
                            <td>${course.instructorEmail()}</td>
                            <td>${course.description()}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${course.status() == 'ACTIVE'}">
                                        <span class="status-badge status-active">ATIVO</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="status-badge status-inactive">INATIVO</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <div class="actions-cell">
                                    <label class="switch">
                                        <input type="checkbox" ${course.status()=='ACTIVE' ? 'checked' : ''
                                            }
                                            onchange="toggleCourseStatus('${course.code()}', this.checked)">
                                        <span class="slider"></span>
                                    </label>
                                    <a class="btn btn-primary btn-sm" href="/admin/course/edit/${course.id()}">Editar</a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <script src="/assets/js/list_course.js"></script>
</body>
</html>