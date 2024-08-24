<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Login</title>
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
						<p class="fs-4 text-center">Patient Login</p>
						<c:if test="${not empty patientLogoutSuccessMessage }">
							<p class="text-center text-success fs-3">
								<i class="fa-solid fa-square-check"></i>
								${patientLogoutSuccessMessage}
							</p>
							<c:remove var="patientLogoutSuccessMessage" scope="session" />
						</c:if>
						<c:if test="${not empty patientLoginErrorMessage }">
							<p class="text-center text-danger fs-3">
								<i class="fa-solid fa-square-xmark"></i>
								${patientLoginErrorMessage}
							</p>
							<c:remove var="patientLoginErrorMessage" scope="session" />
						</c:if>
						<form action="userLogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email address</label> <input required
									name="email" type="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>
							<button type="submit" class="btn bg-info text-white col-md-12">Login</button>
						</form>
						<br> Don't have an account? Register <a href="signup.jsp"
							class="clink">here</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>