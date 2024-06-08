<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
	</head>
		<style>
	body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
}

.wrapper {
    max-width: 400px;
    margin: 100px auto;
    background: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.title-text {
    text-align: center;
    margin-bottom: 20px;
}

.title {
    font-size: 24px;
    color: #333;
}

.form-container {
    padding: 20px;
    border-top: 1px solid #ddd;
}

.field {
    position: relative;
    margin-bottom: 20px;
}



.field input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    outline: none;
}

.field input:focus + label,
.field input:valid + label {
    top: 0;
    font-size: 12px;
    color: #333;
}

.btn-layer {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(to right, #0088ff, #00bbff);
    border-radius: 5px;
    transition: 0.5s;
    z-index: -1;
}

.field input[type="submit"] {
    width: 100%;
    padding: 10px;
   
    border-radius: 5px;
    
    font-weight: bold;
    cursor: pointer;

    position: relative;
    z-index: 1;
}

.field input[type="submit"]:hover + .btn-layer {
    width: 0%;
}
	
	</style>
	<body>
			<div class="wrapper">
				<div class="title-text">
					<div class="title login">
						Login
					</div>
				</div>
				<div class="form-container">
					<div class="form-inner">
							<form action="userServlet" class="login"  method="post">
							<div class="field">
								<input type="hidden"  class="form-control" name="command" value ="AdminLogin" >
								<label>Email</label>
								<input type="text" placeholder="Enter Email" name="email" required="required">
							</div><br>
							<div class="field">
								<label>Password</label>
								<input type="password" placeholder="Enter Password" name="pass" required="required">
							</div><br>
						<div class="field btn">
							<div class="btn-layer"></div>
							<input type="submit" value="Login">
						</div>

						</form>
					</div>
				</div>
			</div>
	   </body>
</html>