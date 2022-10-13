<%@page import="com.db.DBConnect"%>
<%@page import="com.model.Appointment"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Dashboard</title>
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

	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Add Patient Results</p>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						AppointmentDAO appointmentDAO = new AppointmentDAO(DBConnect.getConnection());

						//TEST
						/* Appointment a = new Appointment();
						a.setFullName("Test User");
						a.setBirthDate("09/09/09");
						a.setEmail("test@test.com");
						a.setDescription("Major Stomach Pain"); */

						Appointment a = appointmentDAO.getAppointmentById(id);
						%>
						<form class="row" action="../addResult" method="post">
							<div class="col-md-6">
								<label>Patient Name</label> <input type="text" readonly
									value="<%=a.getFullName()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<label>Date of Birth</label> <input type="text"
									value="<%=a.getBirthDate()%>" readonly class="form-control">
							</div>


							<div class="col-md-6">
								<br> <label>Email</label> <input type="text" readonly
									value="<%=a.getEmail()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<br> <label>Description of Issue</label> <input type="text"
									readonly value="<%=a.getDescription()%>" class="form-control">
							</div>

							<div class="col-md-12">
								<br> <label>Diagnosis</label>
								<textarea required name="diagnosis" class="form-control" row="3"
									cols=""></textarea>
							</div>

							<div class="col-md-12">
								<br> <label>Treatment(Rx)</label>
								<textarea required name="treatment" class="form-control" row="3"
									cols=""></textarea>
							</div>

							<div class="col-md-12">
								<br> <label>Additional Notes</label>
								<textarea required name="notes" class="form-control" row="3"
									cols=""></textarea>
							</div>

							<input type="hidden" name="id" value="<%=a.getId()%>"> <input
								type="hidden" name="doctorId" value="<%=a.getDoctorId()%>">

							<button class=" mt-3 btn btn-info col-md-6 offset-md-3">Submit</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>