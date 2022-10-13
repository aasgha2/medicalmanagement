<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page</title>
<%@include file="component/allcss.jsp"%>

<style type="text/css">
.paint_card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	margin-bottom: 25px;
}
</style>
</head>
<body>
	<%@include file="component/navigation_bar.jsp"%>
	<%-- 	<%
	Connection connection = DBConnect.getConnection();
	out.print(connection);
	%> --%>

	<div id="carouselExampleCaptions" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="image/carousel1.jpg" class="center-block w-100" alt="..."
					height="500px">
				<div class="carousel-caption d-none d-md-block">
					<h5>Everyone Has a Right to Medical Technology</h5>
					<p>We work to limit financial and technological blockers
						between patients and doctors.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="image/carousel2.jpg" class="d-block w-100" alt="..."
					height="500px">
				<div class="carousel-caption d-none d-md-block">
					<h5>Diligence to Bring Patients and Doctors Together</h5>
					<p>With our easy to use applications, booking appointments has
						never been easier.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="image/carousel3.jpg" class="d-block w-100" alt="..."
					height="500px">
				<div class="carousel-caption d-none d-md-block">
					<h5>Health Care Should Not Discriminate</h5>
					<p>Location and financial resources should not block proactive
						and reactive treatment</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="container p-3">
		<div class="row">
			<figure class="text-center">
				<blockquote class="blockquote">
					<h1 class="display-3">Welcome to Medical Management</h1>
				</blockquote>
				<figcaption class="blockquote-footer">What Would You
					Like to Do?</figcaption>
			</figure>
			<div class="col-sm-6">
				<div class="card paint_card">
					<div class="card-body">
						<h5 class="card-title">Doctor Login</h5>
						<p class="card-text">Login as a Doctor</p>
						<a href="login_doctor.jsp" class="btn btn-info"><i
							class="fa-solid fa-user-doctor"></i></a>
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="card paint_card">
					<div class="card-body">
						<h5 class="card-title">Patient Login</h5>
						<p class="card-text">Login as a Patient</p>
						<a href="login_patient.jsp" class="btn btn-info"><i
							class="fa-solid fa-bed"></i></a>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-6">
				<div class="card paint_card">
					<div class="card-body">
						<h5 class="card-title">Book Appointment</h5>
						<p class="card-text">Book Patient Appointments</p>
						<a href="book_appointment.jsp" class="btn btn-info"><i
							class="fa-solid fa-clock"></i></a>
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="card paint_card">
					<div class="card-body">
						<h5 class="card-title">Admin</h5>
						<p class="card-text">Enter as an Admin</p>
						<a href="login_admin.jsp" class="btn btn-danger"><i
							class="fa-solid fa-unlock-keyhole"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-danger md-end"
			data-bs-toggle="modal" data-bs-target="#exampleModal">Interested
			in Donating?</button>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Donations</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">Click the button below to download
						our interest form!</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<a href="form/donor_form.pdf" class="btn btn-primary">Download
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>