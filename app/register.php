<?php
include("inc/header.inc");
?>

<!-- script to process user registration -->
<?php
include("db/creds.php");

session_start();

if (isset($_POST['username'])) {
    $firstname = $_POST['fname'];
    $lastname = $_POST['lname'];
    $email = $_POST['email'];
    $username = $_POST['username'];
    $password = $_POST['password'];

    $q = "INSERT INTO users (firstname, lastname, email, username, password)
              VALUES ('$firstname','$lastname','$email','$username',SHA('$password'))";

    $results = mysqli_query($db, $q) or die(mysqli_error($db));
}
?>

<!-- navigation bar -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
    <a class="navbar-brand" href="/">OneApp</a>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" href="login.php">Login</a>
        </li>
    </ul>
</nav>

<br/><br/><br/><br/><br/>
<!-- user registration form -->
<div class="container">
    <h2>Registration</h2>
    <form action="" method="POST">
        <div class="form-group">
            <label for="firstname">Firstname</label>
            <input type="text" class="form-control" id="firstname" placeholder="Enter Firstname" name="fname" required>
        </div>
        <div class="form-group">
            <label for="lastname">Lastname</label>
            <input type="text" class="form-control" id="lastname" placeholder="Enter Lastname" name="lname" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="text" class="form-control" id="email" placeholder="Enter Email" name="email" required>
        </div>
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" id="username" placeholder="Enter Username" name="username" required>
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password" required>
        </div>
        <div class="form-group form-check">
            <label class="form-check-label">
                <input class="form-check-input" type="checkbox" name="remember"> Remember me
            </label>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>


<?php
include("inc/footer.inc");
?>