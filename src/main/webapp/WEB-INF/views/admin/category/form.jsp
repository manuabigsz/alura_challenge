	<%@ page pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	
	<!DOCTYPE html>
	<html>
	<head>
	    <title>${isEdit ? 'Editar' : 'Cadastrar nova'} Categoria</title>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link rel="stylesheet" type="text/css" href="/assets/external-libs/bootstrap/css/bootstrap.min.css">
	</head>
	
	<div class="container">
	    <section class="panel panel-primary vertical-space">
	        <div class="panel-heading">
	            <h1>${isEdit ? 'Editar' : 'Cadastrar nova'} categoria</h1>
	        </div>
	
	        <form:form modelAttribute="newCategoryForm" cssClass="form-horizontal panel-body" 
	                   action="${isEdit ? '/admin/category/edit/'.concat(newCategoryForm.id) : '/admin/category/new'}" 
	                   method="post">
	            
	            <c:if test="${isEdit}">
	                <form:hidden path="id"/>
	            </c:if>
	            
	            <div class="row form-group">
	                <div class="col-md-9">
	                    <label for="newCategory-name">Nome:</label>
	                    <form:input path="name" id="newCategory-name" cssClass="form-control" required="required"/>
	                    <form:errors path="name" cssClass="text-danger"/>
	                </div>
	
	                <div class="col-md-9">
	                    <label for="newCategory-code">Código:</label>
	                    <form:input path="code" id="newCategory-code" cssClass="form-control" required="required"/>
	                    <form:errors path="code" cssClass="text-danger"/>
	                </div>
	
	                <div class="col-md-9">
	                    <label for="newCategory-color">Cor:</label>
	                    <form:input path="color" id="newCategory-color" cssClass="form-control" required="required"/>
	                    <form:errors path="color" cssClass="text-danger"/>
	                </div>
	
	                <div class="col-md-9">
	                    <label for="newCategory-order">Ordem:</label>
	                    <form:input path="order" type="number" min="1" id="newCategory-order" cssClass="form-control" required="required"/>
	                    <form:errors path="order" cssClass="text-danger"/>
	                </div>
	            </div>
	
	            <div class="form-group">
	                <c:if test="${isEdit}">
	                    <a class="btn btn-default" href="/admin/categories">Cancelar</a>
	                </c:if>
	                <input class="btn btn-success submit" type="submit" value="${isEdit ? 'Atualizar' : 'Salvar'}"/>
	            </div>
	        </form:form>
	    </section>
	</div>