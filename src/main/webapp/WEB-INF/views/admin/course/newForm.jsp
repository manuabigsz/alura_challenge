<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
    <title>Cadastrar novo Curso</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/assets/external-libs/bootstrap/css/bootstrap.min.css">
</head>

<body>
    <div class="container">
        <section class="panel panel-primary vertical-space">
            <div class="panel-heading">
                <h1>Cadastrar novo curso</h1>
            </div>

            <form:form modelAttribute="newCourseForm" cssClass="form-horizontal panel-body"
                action="/admin/course/new" method="post">
                
                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">
                        ${error}
                    </div>
                </c:if>

                <div class="row form-group">
                    <div class="col-md-9">
                        <label for="newCourse-name">Nome:</label>
                        <form:input path="name" id="newCourse-name" cssClass="form-control"
                            required="required" />
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-md-9">
                        <label for="newCourse-code">Código:</label>
                        <form:input path="code" id="newCourse-code" cssClass="form-control"
                            required="required" />
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-md-9">
                        <label for="newCourse-instructorEmail">E-mail do Instrutor:</label>
                        <form:input path="instructorEmail" type="email" id="newCourse-instructorEmail" 
                            cssClass="form-control" required="required" />
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-md-9">
                        <label for="newCourse-categoryCode">Categoria:</label>
                        <form:select path="categoryCode" id="newCourse-categoryCode" 
                            cssClass="form-control" required="required">
                            <option value="">Selecione uma categoria</option>
                            <c:forEach items="${categories}" var="category">
                                <option value="${category.code}">${category.name}</option>
                            </c:forEach>
                        </form:select>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-md-9">
                        <label for="newCourse-description">Descrição:</label>
                        <form:textarea path="description" id="newCourse-description" 
                            cssClass="form-control" rows="4" required="required" />
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-md-9">
                        <input class="btn btn-success" type="submit" value="Salvar" />
                        <a class="btn btn-default" href="/admin/courses">Cancelar</a>
                    </div>
                </div>
            </form:form>
        </section>
    </div>
</body>
</html>