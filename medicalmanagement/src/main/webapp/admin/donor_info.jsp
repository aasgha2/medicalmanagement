<%@page import="com.model.Donor"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DonorDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Donor Information</title>
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
.shadow-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	margin-bottom: 25px;
}
</style>
</head>
<body>
	<%@include file="navigation_bar.jsp"%>
	<c:if test="${empty adminObj }">
		<c:redirect url="../login_admin.jsp"></c:redirect>
	</c:if>
	<div class="container-fluid p-3">
		<div class="row">
			<div class="align-middle">
				<div class="card shadow-card">
					<div class="card-body">
						<p class="fs-3 text-center">Register Donor</p>
						<c:if test="${not empty donorInfoErrorMessage}">
							<p class="fs-3 text-center text-danger">
								<i class="fa-solid fa-square-xmark"></i>
								${donorInfoErrorMessage}
							</p>
							<c:remove var="donorInfoErrorMessage" scope="session" />
						</c:if>
						<c:if test="${not empty donorInfoSuccessMessage}">
							<div class="fs-3 text-center text-success" role="alert">
								<i class="fa-solid fa-square-check"></i>
								${donorInfoSuccessMessage}
							</div>
							<c:remove var="donorInfoSuccessMessage" scope="session" />
						</c:if>
						<form action="../addDonor" method="post">
							<div class="row mb-3">
								<div class="col">
									<label class="form-label">Full Name</label> <input type="text"
										required name="fullname" class="form-control">
								</div>

								<div class="col">
									<label class="form-label">Date of Birth</label> <input required
										name="birthdate" type="date" class="form-control">
								</div>
								<div class="col">
									<label for="gender" class="form-label">Gender</label> <select
										required class="form-control" id="gender" name="gender">
										<option value="male">N/A</option>
										<option value="male">Male</option>
										<option value="female">Female</option>
										<option value="male">Other</option>
										<option value="female">Prefer not to respond</option>
									</select>
								</div>
							</div>


							<div class="row mb-3">
								<div class="col">
									<label for="bloodtype" class="form-label">Blood Type</label> <select
										required class="form-control" id="bloodtype" name="bloodtype">
										<option value="male">N/A</option>
										<option value="male">A+</option>
										<option value="female">A-</option>
										<option value="male">B+</option>
										<option value="female">B-</option>
										<option value="male">O+</option>
										<option value="female">O-</option>
										<option value="male">AB+</option>
										<option value="female">AB-</option>
									</select>
								</div>

								<div class="col">
									<label for="donortype" class="form-label">Donor Type</label> <select
										required class="form-control" id="donortype" name="donortype">

										<option value="male">N/A</option>
										<option value="male">Blood</option>
										<option value="female">Heart</option>
										<option value="male">Kidney</option>
										<option value="female">Liver</option>
										<option value="female">Other</option>
									</select>
								</div>
							</div>
							<div class="row mb-3">

								<div>
									<label class="form-label">Email</label> <input type="text"
										required name="email" class="form-control">
								</div>
								<div class="col">
									<label class="form-label">Phone</label> <input type="text"
										required name="phone" class="form-control">
								</div>
							</div>


							<div class="d-grid gap-2 col-3 mx-auto">
								<button type="submit" class="btn btn-danger">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="align-middle">
				<div class="card shadow-card">
					<div class="card-body">
						<table class="table table-danger table-hover">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Date of Birth</th>
									<th scope="col">Gender</th>
									<th scope="col">Blood Type</th>
									<th scope="col">Donor Type</th>
									<th scope="col">Email</th>
									<th scope="col">Phone</th>
									<th scope="col">Modify</th>
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

									<td><a href="edit_donor.jsp?id=<%=d.getId()%>"
										class="btn btn-sm btn-info">Edit</a> <a
										href="../deleteDonor?id=<%=d.getId()%>"
										class="btn btn-sm btn-danger">Delete</a></td>
								</tr>
								<%
								}
								%>


							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>
	</div>
</body>
</html>