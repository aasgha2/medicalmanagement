<%@page import="com.model.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.model.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Appointments</title>
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

	<div class="p-3">
		<div class="align-middle">
			<div class="card shadow-card">
				<div class="card-body">
					<p class="text-center fs-3">Appointments</p>
					<c:if test="${not empty resultAddError}">
						<p class="fs-3 text-center text-danger">
							<i class="fa-solid fa-square-xmark"></i> ${resultAddError}
						</p>
						<c:remove var="resultAddError" scope="session" />
					</c:if>
					<c:if test="${not empty resultAddSuccess}">
						<div class="fs-3 text-center text-success" role="alert">
							<i class="fa-solid fa-square-check"></i> ${resultAddSuccess}
						</div>
						<c:remove var="resultAddSuccess" scope="session" />
					</c:if>
					<table class="table table-info table-hover">
						<thead>
							<tr>
								<th scope="col">Full Name</th>
								<th scope="col">Email</th>
								<th scope="col">Number</th>
								<th scope="col">DOB</th>
								<th scope="col">Gender</th>
								<th scope="col">Street Address</th>
								<th scope="col">City</th>
								<th scope="col">State</th>
								<th scope="col">Zip Code</th>
								<th scope="col">Date</th>
								<th scope="col">Doctor</th>
								<th scope="col">Reason for Visit</th>
								<th scope="col">Diagnosis</th>
								<th scope="col">Treatment(Rx)</th>
								<th scope="col">Notes</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							Doctor d = (Doctor) session.getAttribute("doctorObj");
							AppointmentDAO appointmentDAO = new AppointmentDAO(DBConnect.getConnection());
							List<Appointment> appointmentList = appointmentDAO.getAppointmentByDoctor(d.getId());
							for (Appointment a : appointmentList) {
							%>
							<tr>
								<td><%=a.getFullName()%></td>
								<td><%=a.getEmail()%></td>
								<td><%=a.getNumber()%></td>
								<td><%=a.getBirthDate()%></td>
								<td><%=a.getGender()%></td>
								<td><%=a.getAddress()%></td>
								<td><%=a.getCity()%></td>
								<td><%=a.getState()%></td>
								<td><%=a.getZipCode()%></td>
								<td><%=a.getDate()%></td>
								<td><%=d.getFullName()%></td>
								<td><%=a.getDescription()%></td>
								<td><%=a.getDiagnosis()%></td>
								<td><%=a.getTreatment()%></td>
								<td><%=a.getNotes()%></td>

								<td>
									<%
									if (a.getDiagnosis().equals("In Progress")) {
									%> <a
									href="add_results.jsp?id=<%=a.getId()%>"
									class="btn btn-info btn-sm">Add Results</a>

								
								<%
								} else {
								%>
								<a class="btn btn-secondary btn-sm disabled">Complete</a>
								<%
								}
								%>
								<%
								}
								%>
							</td>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>