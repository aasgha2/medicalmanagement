<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@page isELIgnored="false"%>
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-info">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-laptop-medical"></i> Medical Management</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<c:if test="${empty patientObj }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="login_doctor.jsp"><i
							class="fa-solid fa-user-doctor"></i> Doctor</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="login_patient.jsp"><i
							class="fa-solid fa-bed"></i> Patient</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="login_admin.jsp"><i
							class="fa-solid fa-unlock-keyhole"></i> Admin</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="book_appointment.jsp"><i
							class="fa-solid fa-clock"></i> Book Appointment</a></li>
				</c:if>


				<c:if test="${not empty patientObj }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="book_appointment.jsp"><i class="fa-solid fa-book"></i> Book
							Appointments</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="view_appointment.jsp"><i class="fa-solid fa-magnifying-glass"></i> View
							Appointments</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="view_donor.jsp"><i class="fa-solid fa-heart-pulse"></i> View
							Donors</a></li>

					<div class="dropdown">
						<button class="btn btn-light dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">
							<i class="fa-solid fa-user"></i> ${patientObj.fullName}
						</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="userLogout">Logout</a></li>

						</ul>
					</div>




				</c:if>

				<!--         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li> -->


			</ul>

		</div>
	</div>
</nav>