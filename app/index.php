<?php
    include("inc/header.inc");
?>

<!-- navigation bar -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  <a class="navbar-brand" href="/">OneApp</a>
  <ul class="navbar-nav ml-auto">
    <li class="nav-item">
      <a class="nav-link" href="register.php">Register</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="login.php">Login</a>
    </li>
  </ul>
</nav>

<br /><br /><br />
<!-- body -->
<div class="container">
  <div class="jumbotron">
    <h1>Welcome to OneApp</h1>      
    <p>With OneApp you can track covid19 stats, weather forecast and play 2048 game.</p>
  </div>  
</div>
<img src="images/main.png" class="img-rounded" width="50%" style="margin-left: 350px;" alt="main image" />

<?php
    include("inc/footer.inc");
?>