<?php
include("inc/header.inc");

// connect to database
include("db/creds.php");

// authenticate user
// process login user based on username
if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $q = "select * from users where username='$username' and password=SHA('$password')";
    $results = mysqli_query($db, $q) or die(mysqli_error($db));

    if (mysqli_num_rows($results) > 0) {
        session_start();
        $_SESSION['username'] = $username;

        header("Location:landing.php");
        exit(0);
    } else {
        unset($_POST['username']);
        unset($_POST['password']);
        echo "User name or password is incorrect. New to the site? Click <a href='sign-up.php'>here</a> to sign up.";
    }
}
?>
<!-- navigation bar -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
    <a class="navbar-brand" href="/">OneApp</a>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" href="register.php">Register</a>
        </li>
    </ul>
</nav>

<br /><br /><br /><br /><br />
<!-- user registration form -->
<div class="container">
    <h2>Login</h2>
    <form action="" method="POST">
        <div class="form-group">
            <label for="username">Firstname</label>
            <input type="text" class="form-control" id="username" placeholder="Enter Firstname" name="username" required>
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