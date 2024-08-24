<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint_card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="component/navigation_bar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Patient Registration</p>
						<c:if test="${not empty registerSuccessMessage }">
							<p class="text-center text-success fs-3"><i class="fa-solid fa-square-check"></i> ${registerSuccessMessage}</p>
							<c:remove var="registerSuccessMessage" scope="session" />
						</c:if>

						<c:if test="${not empty registerErrorMessage }">
							<p class="text-center text-danger fs-3"><i class="fa-solid fa-square-xmark"></i> ${registerErrorMessage}</p>
							<c:remove var="registerErrorMessage" scope="session" />
						</c:if>
						<form action="user_register" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input required
									name="fullname" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Email address</label> <input required
									name="email" type="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>
							<button type="submit" class="btn bg-info text-white col-md-12">Register</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>