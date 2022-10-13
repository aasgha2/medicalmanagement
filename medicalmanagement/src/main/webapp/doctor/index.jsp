<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Central</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.shadow-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<c:if test="${empty doctorObj }">
		<c:redirect url="../login_doctor.jsp"></c:redirect>
	</c:if>
	<%@include file="navigation_bar.jsp"%>

	<div class="container p-5">
		<p class="text-center fs-3">Dashboard</p>

		<div class="row mb-3">

			<div class="col-sm-6">
				<div class="card paint_card">
					<div class="card-body">
						<h5 class="card-title">Appointments</h5>
						<p class="card-text">View and Update Appointments</p>
						<a href="patient_appointment.jsp" class="btn btn-info"><i
							class="fa-solid fa-user-doctor"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>