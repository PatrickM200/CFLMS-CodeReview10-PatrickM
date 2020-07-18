<!DOCTYPE html>
<html>
<head>
	<title>Big Library System</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
   <h3 class="p-4">Add Media Form</h3>
  
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
	
	<form action="actions/a_create.php" method="post"class="col-md-6">
		 
		<div  class="form-group">
			<label >Title</label>
			<input type="text" class="form-control" name="title" >
		</div>
		<div class="form-row">
		<div  class="form-group col-md-6">
			<label >ISBN</label>
			<input type="text" class="form-control" name="ISBN">
		</div>
	    
		 <div class="form-group col-md-6">
		 	<label for="inputState">Media Type</label>
		 	<select id="inputState" class="form-control" name="type_id">
		 		 <?php
		 		 include ("actions/db_connect.php");
		 		 $sql = "SELECT * FROM media_type";
		 		 $result = mysqli_query($conn, $sql);
		 		 $conn->close();
		 		 if($result->num_rows == 0){
		 		 	echo "No result";
		 		 }elseif($result->num_rows == 1){
		 		 	$row = $result->fetch_assoc();
		 		 	echo "<option selected value=".$row["type_id"].">".$row["type_id"]." : ".$row["type_name"]  ."</option>";
		 		 }else{
		 		 	$rows = $result->fetch_all(MYSQLI_ASSOC);
		 		 	foreach($rows as $key => $value){
		 		 		echo  "<option value=".$value["type_id"].">".$value["type_id"]." : ".$value["type_name"]  ."</option>";
		 		 	}
		 		 };
		 		 ?>
		 		 <option> add a media type</option>
		 	</select>
		 </div>
		 </div>
		 <div  class="form-group">
			<label >Image URL</label>
			<input type="text" class="form-control" name="image_url">
		</div>
		 <div class="form-row">
		 <div class="form-group col-md-6" >
		 	<label for="inputState">Publisher</label>
		 	<select id="inputState" class="form-control" name="publisher_id">
		 		 <?php
		 		 include ("actions/db_connect.php");
		 		 $sql = "SELECT * FROM publisher";
		 		 $result = mysqli_query($conn, $sql);
		 		 $conn->close();
		 		 if($result->num_rows == 0){
		 		 	echo "No result";
		 		 }elseif($result->num_rows == 1){
		 		 	$row = $result->fetch_assoc();
		 		 	echo "<option selected value=".$row["publisher_id"] .">".$row["publisher_id"]." : ".$row["publisher_name"] ."</option>";
		 		 }else{
		 		 	$rows = $result->fetch_all(MYSQLI_ASSOC);
		 		 	foreach($rows as $key => $value){
		 		 		echo  "<option value=".$value["publisher_id"]." >".$value["publisher_id"]." : ".$value["publisher_name"] ."</option>";
		 		 	}
		 		 };
		 		 ?>
		 		 <option>only supported publisher allowed!</option>
		 	</select>
		 </div>
		<div  class="form-group col-md-6">
			<label >Publish Date</label>
			<input type="date" class="form-control" name="publish_date">
		</div>
	    </div>
			
		</div>
		<div class="form-group ">
		 	<label for="inputState">Author</label>
		 	<select id="inputState" class="form-control" name="author_id">
		 		 <?php
		 		 include ("actions/db_connect.php");
		 		 $sql = "SELECT * FROM author";
		 		 $result = mysqli_query($conn, $sql);
		 		 $conn->close();
		 		 if($result->num_rows == 0){
		 		 	echo "No result";
		 		 }elseif($result->num_rows == 1){
		 		 	$row = $result->fetch_assoc();
		 		 	echo "<option value=".$row["author_id"]. "selected>".$row["author_id"]." : ".$row["first_name"] ." ".$row["last_name"] ."</option>";
		 		 }else{
		 		 	$rows = $result->fetch_all(MYSQLI_ASSOC);
		 		 	foreach($rows as $key => $value){
		 		 		echo  "<option value=".$value["author_id"]. ">".$value["author_id"]." : ".$value["first_name"] ." ".$value["last_name"] ."</option>";
		 		 	}
		 		 };
		 		 ?>
		 		 <option> add a Author</option>
		 	</select>
		 </div>
		 
		 <div class="form-group  form-check">
		 	<input class="form-check-input" type="radio" name="availability" id="exampleRadios1" value="yes" checked>
		 	<label class="form-check-label" for="exampleRadios1">
		 		Available
		 	</label>
		 </div>
		<div class="form-group form-check ">
			<input class="form-check-input" type="radio" name="availability" id="exampleRadios2" value="no">
			<label class="form-check-label " for="exampleRadios2">
				Unavailable
			</label>
		</div>
		
		<button type="submit" class="btn btn-primary" name="submit">Submit</button>
	 
	
	</form>
</body>
</html>