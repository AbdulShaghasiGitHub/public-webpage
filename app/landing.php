<?php
include("inc/header.inc");
session_start();
?>

<!-- navigation bar -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
    <a class="navbar-brand" href="/">OneApp</a>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" href="">Welcome <?php echo $_SESSION['username']; ?></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="logout.php">Logout</a>
        </li>
    </ul>
</nav>

<br /><br /><br /><br />
<!-- contents (links to other services) -->
<div class="row">
    <div>
        <div class="card" style="width: 25rem; margin-left: 70px;">
            <img src="images/cov19.jpeg" style="height: 330px;" class="card-img-top" alt=" covid 19 card">
            <div class="card-body">
                <p class="card-text">This app will provide you with the most upto date statistics of the Corona Virus cases throughout the world. </p>
                <p class="card-text">You will also be able to filter results based on the your country of choice.</p>
                <p class="card-text">The GUI offers a Google MAP with the number confirmed cases labelled on each country.</p>

                <a href="https://master.d2xj6kawqg2itd.amplifyapp.com/" target="_blank" rel="noopener noreferrer" class="btn btn-primary" style="margin-left: 120px;">Go To App</a>
            </div>
        </div>
    </div>
    <div class="col-sm-1">
        <div class="card" style="width: 25rem; margin-left: 45px;">
            <img src="images/weather.jpeg" style="height: 330px;" class="card-img-top" alt=" weather card">
            <div class="card-body">
                <p class="card-text">This app will provide you with the most upto date weather information. The information is obtained from open source $
                <p class="card-text">You will be able to see weather details of your specific city in a country. </p>
                <p class="card-text">The GUI is consisting of Weather label as well as panel to show weather info of your city.</p>
                <a href="http://weather-app.us-east-1.elasticbeanstalk.com/" target="_blank" rel="noopener noreferrer" class="btn btn-primary" style="margin-left: 120px;">Go To App</a>
            </div>
        </div>
    </div>
    <div class="col-sm-1">
        <div class="card" style="width: 25rem; margin-left: 380px;">
            <img src="images/2048.png" style="height: 330px;" class="card-img-top" alt="game card">
            <div class="card-body">
                <p class="card-text">2048 Game is an open source game developed and deployed to docker hub by Alexwhen. I obtained the image from docker $
                <p class="card-text">The game challenges you to score 2048 points by adding up the numbers.</p>
                <p class="card-text">The GUI is fun and you can play the game by using your keyboard's arrow keys.</p>
                <a href="http://a514088e8c24f4accaf0ce1469c9007c-1333649148.us-east-1.elb.amazonaws.com/" target="_blank" rel="noopener noreferrer" class="btn btn-primary" style="margin-left: 120px;">Go To App</a>
            </div>
        </div>
    </div>
</div>

<?php
include("inc/footer.inc");
?>