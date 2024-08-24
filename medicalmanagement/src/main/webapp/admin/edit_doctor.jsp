<%@page import="com.model.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Information</title>
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
.paint_card {
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
				<div class="card paint_card">
					<div class="card-body">
						<p class="fs-3 text-center">Modify Doctor Details</p>
						<c:if test="${not empty doctorUpdateErrorMessage}">
							<p class="fs-3 text-center text-danger">
								<i class="fa-solid fa-square-xmark"></i>
								${doctorUpdateErrorMessage}
							</p>
							<c:remove var="doctorUpdateErrorMessage" scope="session" />
						</c:if>
						<c:if test="${not empty doctorUpdateSuccessMessage}">
							<div class="fs-3 text-center text-success" role="alert">
								<i class="fa-solid fa-square-check"></i>
								${doctorUpdateSuccessMessage}
							</div>
							<c:remove var="doctorUpdateSuccessMessage" scope="session" />
						</c:if>

						<%
						DoctorDAO doctorDAO2 = new DoctorDAO(DBConnect.getConnection());
						Doctor d = doctorDAO2.getDoctorById(Integer.parseInt(request.getParameter("id")));
						%>
						<form action="../updateDoctor" method="post">
							<div class="row mb-3">
								<div class="col">
									<label class="form-label">Full Name</label> <input type="text"
										required name="fullname" class="form-control"
										value="<%=d.getFullName()%>">
								</div>
								<div class="col">
									<label class="form-label">Email</label> <input type="text"
										required name="email" class="form-control"
										value="<%=d.getEmail()%>">
								</div>

								<div class="col">
									<label class="form-label">Date of Birth</label> <input required
										name="birthdate" type="date" class="form-control"
										value="<%=d.getBirthDate()%>">
								</div>
								<div class="col">
									<label class="form-label">Education</label> <input required
										name="education" type="text" class="form-control"
										value="<%=d.getEducation()%>">
								</div>
							</div>


							<div class="mb-3">
								<label class="form-label">Street Address</label> <input required
									name="address" type="text" class="form-control"
									value="<%=d.getAddress()%>">
							</div>


							<div class="row mb-3">
								<div class="col">

									<label class="form-label">City</label> <input required
										name="city" type="text" class="form-control"
										value="<%=d.getCity()%>">

								</div>
								<div class="col">

									<label for="state" class="form-label">State</label>
									<div class="col-sm-10">
										<select required class="form-control" id="state" name="state">
											<option value=""><%=d.getState()%></option>
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
										required name="zipcode" class="form-control"
										value="<%=d.getZipCode()%>">
								</div>
							</div>

							<div class="row mb-3">
								<div class="col">
									<label class="form-label">Home Phone</label> <input type="text"
										required name="homenumber" class="form-control"
										value="<%=d.getHomePhone()%>">
								</div>

								<div class="col">
									<label class="form-label">Mobile Phone</label> <input
										type="text" required name="mobilenumber" class="form-control"
										value="<%=d.getMobilePhone()%>">
								</div>
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control"
									value="<%=d.getPassword()%>">
							</div>

							<input type="hidden" name="id" value="<%=d.getId()%>">

							<div class="d-grid gap-2 col-3 mx-auto">
								<button type="submit" class="btn btn-secondary">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>