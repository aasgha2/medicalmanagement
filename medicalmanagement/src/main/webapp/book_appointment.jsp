<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDAO"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@page isELIgnored="false"%>
<%@page import="com.model.Doctor"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Appointment</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.shadow-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@include file="component/navigation_bar.jsp"%>
	<c:if test="${empty patientObj }">
		<c:redirect url="login_patient.jsp"></c:redirect>
	</c:if>
	<div class="container p-3">
		<div class="row">

			<div class="align-middle">
				<div class="card shadow-card">
					<div class="card-body">
						<p class="text-center fs-3">Book an Appointment</p>
						<c:if test="${not empty appointmentBookErrorMessage}">
							<p class="fs-4 text-center text-danger">${appointmentBookErrorMessage}</p>
							<c:remove var="appointmentBookErrorMessage" scope="session" />
						</c:if>
						<c:if test="${not empty appointmentBookSuccessMessage}">
							<p class=" fs-4 text-center text-success">${appointmentBookSuccessMessage}</p>
							<c:remove var="appointmentBookSuccessMessage" scope="session" />
						</c:if>
						<form class="row g-3" action="bookAppointment" method="post">

							<input type="hidden" name="userid" value="${patientObj.id }">

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
									<label class="form-label">Phone</label> <input type="text"
										required name="number" class="form-control">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col">
									<label class="form-label">Date of Birth</label> <input required
										name="birthdate" type="date" class="form-control">
								</div>

								<div class="col">
									<label for="gender" class="form-label">Gender</label> <select
										class="form-control" name="gender" required>
										<option value="male">Male</option>
										<option value="female">Female</option>
										<option value="male">Other</option>
										<option value="female">Prefer not to respond</option>
									</select>
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
									<label for="date" class="form-label">Appointment
										Date</label> <input type="date" class="form-control" required
										name="date">
								</div>



								<div class="col">
									<label for="doctor" class="form-label">Doctor</label> <select
										required class="form-control" name="doctor">
										<option value="">--select--</option>
										<%
										DoctorDAO dao = new DoctorDAO(DBConnect.getConnection());
										List<Doctor> list = dao.getDoctors();
										for (Doctor d : list) {
										%>
										<option value="<%=d.getId()%>"><%=d.getFullName()%>
										</option>
										<%
										}
										%>




									</select>
								</div>
							</div>
							<div class="col-md-12">
								<label>Issue Description</label>
								<textarea required name="description" class="form-control" rows="3"
									cols=""></textarea>
							</div>

							<c:if test="${empty patientObj }">
								<a href="login_patient.jsp"
									class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>

							<c:if test="${not empty patientObj }">
								<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



	<%-- 	<%@include file="component/footer.jsp"%>
 --%>
</body>
</html>