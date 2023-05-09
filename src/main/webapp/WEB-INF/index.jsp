<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NINJA GOLD</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>
	<div class="container p-2">

		<div class="row p-6">
			<div class="col">
				<p>
					You Gold: <span
						class="border border-primary border-3 m-2 d-inline-block ps-4 pe-4">${gold}</span>
				</p>
				<a href="/reset">Empezar de nuevo</a>
			</div>
		</div>

		<div class="row">
			<div class="col">
				<div class="card" style="width: 18rem;">
					<div class="card-body text-center">
						<form action="/gold" method="POST">
							<h2>Farm</h2>
							<p>(earns 10-20 gold)</p>
							<input type="hidden" name="lugar" value="farm" />
							<button type="submit" class="btn btn-info" id="Farm" name="Farm">Find
								Gold!</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 18rem;">
					<div class="card-body text-center">
						<form action="/gold" method="POST">
							<h2>Cave</h2>
							<p>(earns 5-10 gold)</p>
							<input type="hidden" name="lugar" value="cave" />
							<button type="submit" class="btn btn-info" id="Farm" name="Farm">Find
								Gold!</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 18rem;">
					<div class="card-body text-center">
						<form action="/gold" method="POST">
							<h2>House</h2>
							<p>(earns 2-5 gold)</p>
							<input type="hidden" name="lugar" value="house" />
							<button type="submit" class="btn btn-info" id="Farm" name="Farm">Find
								Gold!</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 18rem;">
					<div class="card-body text-center">
						<form action="/gold" method="POST">
							<h2>Casino</h2>
							<p>(earns 0-50 gold)</p>
							<input type="hidden" name="lugar" value="casino" />
							<button type="submit" class="btn btn-info" id="Farm" name="Farm">Find
								Gold!</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 18rem;">
					<div class="card-body text-center">
						<form action="/gold" method="POST">
							<h2>Spa</h2>
							<p>(earns 5-20 gold)</p>
							<input type="hidden" name="lugar" value="spa" />
							<button type="submit" class="btn btn-info" id="Farm" name="Farm">Find
								Gold!</button>
						</form>
					</div>
				</div>
			</div>

		</div>

		<div class="row">
			<div class="col">
				<c:forEach var="act" items="${act}">
					<c:if test="${act.contains('earned') }">
						<p class="text-success">
							<c:out value="${act }"></c:out>
						</p>
					</c:if>
					<c:if test="${act.contains('lost') }">
						<p class="text-danger">
							<c:out value="${act }"></c:out>
						</p>
					</c:if>
				</c:forEach>
			</div>
		</div>

	</div>

</body>
</html>