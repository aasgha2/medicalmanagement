<%@page import="com.model.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Information</title>
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
						<p class="fs-3 text-center">Register Doctor</p>
						<c:if test="${not empty doctorInfoErrorMessage}">
							<p class="fs-3 text-center text-danger">
								<i class="fa-solid fa-square-xmark"></i>
								${doctorInfoErrorMessage}
							</p>
							<c:remove var="doctorInfoErrorMessage" scope="session" />
						</c:if>
						<c:if test="${not empty doctorInfoSuccessMessage}">
							<div class="fs-3 text-center text-success" role="alert">
								<i class="fa-solid fa-square-check"></i>
								${doctorInfoSuccessMessage}
							</div>
							<c:remove var="doctorInfoSuccessMessage" scope="session" />
						</c:if>
						<form action="../addDoctor" method="post">
							<div class="row mb-3">
								<div class="col">
									<label class="form-label">Full Name</label> <input type="text"
										required name="fullname" class="form-control">
								</div>
								<div class="col">
									<label class="form-label">Email</label> <input type="text"
										required name="email" class="form-control">
								</div>

								<div class="col">
									<label class="form-label">Date of Birth</label> <input required
										name="birthdate" type="date" class="form-control">
								</div>
								<div class="col">
									<label class="form-label">Education</label> <input required
										name="education" type="text" class="form-control">
								</div>
							</div>


							<div class="mb-3">
								<label class="form-label">Street Address</label> <input required
									name="address" type="text" class="form-control">
							</div>


							<div class="row mb-3">
								<div class="col">

									<label class="form-label">City</label> <input required
										name="city" type="text" class="form-control">

								</div>
								<div class="col">

									<label for="state" class="form-label">State</label>
									<div class="col-sm-10">
										<select required class="form-control" id="state" name="state">
											<option value="">N/A</option>
											<option value="AK">Alaska</option>
											<option value="AL">Alabama</option>
											<option value="AR">Arkansas</option>
											<option value="AZ">Arizona</option>
											<option value="CA">California</option>
											<option value="CO">Colorado</option>
											<option value="CT">Connecticut</option>
											<option value="DC">District of Columbia</option>
											<option value="DE">Delaware</option>
											<option value="FL">Florida</option>
											<option value="GA">Georgia</option>
											<option value="HI">Hawaii</option>
											<option value="IA">Iowa</option>
											<option value="ID">Idaho</option>
											<option value="IL">Illinois</option>
											<option value="IN">Indiana</option>
											<option value="KS">Kansas</option>
											<option value="KY">Kentucky</option>
											<option value="LA">Louisiana</option>
											<option value="MA">Massachusetts</option>
											<option value="MD">Maryland</option>
											<option value="ME">Maine</option>
											<option value="MI">Michigan</option>
											<option value="MN">Minnesota</option>
											<option value="MO">Missouri</option>
											<option value="MS">Mississippi</option>
											<option value="MT">Montana</option>
											<option value="NC">North Carolina</option>
											<option value="ND">North Dakota</option>
											<option value="NE">Nebraska</option>
											<option value="NH">New Hampshire</option>
											<option value="NJ">New Jersey</option>
											<option value="NM">New Mexico</option>
											<option value="NV">Nevada</option>
											<option value="NY">New York</option>
											<option value="OH">Ohio</option>
											<option value="OK">Oklahoma</option>
											<option value="OR">Oregon</option>
											<option value="PA">Pennsylvania</option>
											<option value="PR">Puerto Rico</option>
											<option value="RI">Rhode Island</option>
											<option value="SC">South Carolina</option>
											<option value="SD">South Dakota</option>
											<option value="TN">Tennessee</option>
											<option value="TX">Texas</option>
											<option value="UT">Utah</option>
											<option value="VA">Virginia</option>
											<option value="VT">Vermont</option>
											<option value="WA">Washington</option>
											<option value="WI">Wisconsin</option>
											<option value="WV">West Virginia</option>
											<option value="WY">Wyoming</option>
										</select>
									</div>

								</div>

								<div class="col">
									<label class="form-label">Zip Code</label> <input type="text"
										required name="zipcode" class="form-control">
								</div>
							</div>

							<div class="row mb-3">
								<div class="col">
									<label class="form-label">Home Phone</label> <input type="text"
										required name="homenumber" class="form-control">
								</div>

								<div class="col">
									<label class="form-label">Mobile Phone</label> <input
										type="text" required name="mobilenumber" class="form-control">
								</div>
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>

							<div class="d-grid gap-2 col-3 mx-auto">
								<button type="submit" class="btn btn-secondary">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="align-middle">
				<div class="card shadow-card">
					<div class="card-body">
						<table class="table table-info table-hover">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Email</th>
									<th scope="col">Date of Birth</th>
									<th scope="col">Education</th>
									<th scope="col">Street Address</th>
									<th scope="col">City</th>
									<th scope="col">State</th>
									<th scope="col">Zip Code</th>
									<th scope="col">Home Phone</th>
									<th scope="col">Mobile Phone</th>
									<th scope="col">Password</th>
									<th scope="col">Modify</th>
								</tr>
							</thead>
							<tbody>
								<%
								DoctorDAO doctorDAO = new DoctorDAO(DBConnect.getConnection());
								List<Doctor> doctorList = doctorDAO.getDoctors();
								for (Doctor d : doctorList) {
								%>
								<tr>
									<td><%=d.getFullName()%></td>
									<td><%=d.getEmail()%></td>
									<td><%=d.getBirthDate()%></td>
									<td><%=d.getEducation()%></td>
									<td><%=d.getAddress()%></td>
									<td><%=d.getCity()%></td>
									<td><%=d.getState()%></td>
									<td><%=d.getZipCode()%></td>
									<td><%=d.getHomePhone()%></td>
									<td><%=d.getMobilePhone()%></td>
									<td><%=d.getPassword()%></td>

									<td><a href="edit_doctor.jsp?id=<%=d.getId()%>"
										class="btn btn-sm btn-info">Edit</a> <a
										href="../deleteDoctor?id=<%=d.getId()%>"
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