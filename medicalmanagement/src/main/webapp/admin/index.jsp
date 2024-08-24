<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Module</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint_card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navigation_bar.jsp"%>
	<c:if test="${empty adminObj }">
		<c:redirect url="../login_admin.jsp"></c:redirect>
	</c:if>
	<div class="container p-5">
		<p class="text-center fs-3">Admin Central</p>
		<c:if test="${not empty errorMsg}">
			<p class="fs-3 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<c:if test="${not empty succMsg}">
			<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		<div class="row mb-3">

			<div class="col-sm-6">
				<div class="card paint_card">
					<div class="card-body">
						<h5 class="card-title">Doctors</h5>
						<p class="card-text">View and Add Doctors</p>
						<a href="doctor_info.jsp" class="btn btn-info"><i
							class="fa-solid fa-user-doctor"></i></a>
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="card paint_card">
					<div class="card-body">
						<h5 class="card-title">Patient Appointments</h5>
						<p class="card-text">View Patient Appointment</p>
						<a href="view_patient_appointment.jsp" class="btn btn-info"><i
							class="fa-solid fa-bed"></i></a>
					</div>
				</div>
			</div>
		</div>

		<div class="row mb-3">
			<div class="col">
				<div class="card paint_card">
					<div class="card-body">
						<h5 class="card-title">Donors</h5>
						<p class="card-text">View and Add Donors</p>
						<a href="donor_info.jsp" class="btn btn-danger"><i
							class="fa-solid fa-heart-pulse"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>