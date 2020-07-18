<!DOCTYPE html>
<html>
<head>
	<title>Big Library System</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
	<h3 class="p-4">Author Form</h3>
  <ul class="nav nav-tabs m-3">
   <li class="nav-item">
   <a class="nav-link" href="index.php">Home</a>
 </li>
	  <li class="nav-item">
   <a class="nav-link" href="create.php">Add a media</a>
   </li>
   <li class="nav-item">
   <a class="nav-link" href="createauth.php">Add a Author</a>
   </li> 
</ul>
	<form action="actions/a_createauth.php" method="post"class="col-md-6">
		<label >Name</label>
		<div class="form-row">
			<div class="col">
				<input type="text" class="form-control" placeholder="First name" name="first_name">
			</div>
			<div class="col">
				<input type="text" class="form-control" placeholder="Last name" name="last_name">
			</div>
		</div>
		<br>
		<button type="submit" class="btn btn-primary" name="submit">Submit</button>
	</form>
</body>
</html>