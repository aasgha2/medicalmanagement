<%@page import="com.db.DBConnect"%>
<%@page import="com.model.Donor"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.DonorDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Appointments</title>
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
.shadow-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	margin-bottom: 25px;
}
</style>
</head>
<body>
	<%@include file="component/navigation_bar.jsp"%>
	<c:if test="${empty patientObj }">
		<c:redirect url="login_patient.jsp"></c:redirect>
	</c:if>
	<div class="p-3">
		<div class="align-middle">
			<div class="card shadow-card">
				<div class="card-body">
					<p class="text-center fs-3">Donors</p>

					<table class="table table-danger table-hover">
						<thead>
							<tr>
								<th scope="col">Full Name</th>
								<th scope="col">Birth Date</th>
								<th scope="col">Gender</th>
								<th scope="col">Blood Type</th>
								<th scope="col">Donor Type</th>
								<th scope="col">Email</th>
								<th scope="col">Phone</th>
							</tr>
						</thead>
						<tbody>
							<%
							DonorDAO donorDAO = new DonorDAO(DBConnect.getConnection());
							List<Donor> donorList = donorDAO.getAllDonors();
							for (Donor d : donorList) {
							%>
							<tr>
								<td><%=d.getFullName()%></td>
								<td><%=d.getBirthDate()%></td>
								<td><%=d.getGender()%></td>
								<td><%=d.getBloodType()%></td>
								<td><%=d.getDonorType()%></td>
								<td><%=d.getEmail()%></td>
								<td><%=d.getPhone()%></td>

								<%
								}
								%>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>