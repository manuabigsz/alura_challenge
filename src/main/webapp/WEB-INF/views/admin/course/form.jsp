<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
    <title>${isEdit ? 'Editar' : 'Cadastrar novo'} Curso</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/assets/external-libs/bootstrap/css/bootstrap.min.css">
</head>

<body>
<div class="container">
    <section class="panel panel-primary vertical-space">
        <div class="panel-heading">
            <h1>${isEdit ? 'Editar' : 'Cadastrar novo'} curso</h1>
        </div>

        <form:form modelAttribute="newCourseForm" cssClass="form-horizontal panel-body"
                   action="${isEdit ? '/admin/course/edit/'.concat(newCourseForm.id) : '/admin/course/new'}"
                   method="post">

            <c:if test="${isEdit}">
                <form:hidden path="id"/>
            </c:if>

            <div class="row form-group">
                <div class="col-md-9">
                    <label for="newCourse-name">Nome:</label>
                    <form:input path="name" id="newCourse-name" cssClass="form-control"
                                required="required" />
                    <form:errors path="name" cssClass="text-danger"/>
                </div>
            </div>

            <div class="row form-group">
                <div class="col-md-9">
                    <label for="newCourse-code">Código:</label>
                    <form:input path="code" id="newCourse-code" cssClass="form-control"
                                required="required" />
                    <form:errors path="code" cssClass="text-danger"/>
                </div>
            </div>

            <div class="row form-group">
                <div class="col-md-9">
                    <label for="newCourse-instructorEmail">E-mail do Instrutor:</label>
                    <form:input path="instructorEmail" type="email" id="newCourse-instructorEmail"
                                cssClass="form-control" required="required" />
                    <form:errors path="instructorEmail" cssClass="text-danger"/>
                </div>
            </div>

            <div class="row form-group">
                <div class="col-md-9">
                    <label for="newCourse-categoryCode">Categoria:</label>
                    <form:select path="categoryCode" id="newCourse-categoryCode"
                                 cssClass="form-control" required="required">
                        <option value="">Selecione uma categoria</option>
                        <c:forEach items="${categories}" var="category">
                            <option value="${category.code}"
                                    ${newCourseForm.categoryCode == category.code ? 'selected' : ''}>
                                ${category.name}
                            </option>
                        </c:forEach>
                    </form:select>
                    <form:errors path="categoryCode" cssClass="text-danger"/>
                </div>
            </div>

            <div class="row form-group">
                <div class="col-md-9">
                    <label for="newCourse-description">Descrição:</label>
                    <form:textarea path="description" id="newCourse-description"
                                   cssClass="form-control" rows="4" required="required" />
                    <form:errors path="description" cssClass="text-danger"/>
                </div>
            </div>

            <div class="row form-group">
                <div class="col-md-9">
                    <c:if test="${isEdit}">
                        <a class="btn btn-default" href="/admin/courses">Cancelar</a>
                    </c:if>
                    <input class="btn btn-success" type="submit" value="${isEdit ? 'Atualizar' : 'Salvar'}" />
                </div>
            </div>
        </form:form>
    </section>
</div>
</body>
</html>