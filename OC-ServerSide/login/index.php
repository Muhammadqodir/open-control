<?php
  require "../routing.php";
  session_start();

  if(isset($_SESSION["is_login"])){
    goToRoute("dashboard");
  }
?>
<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

  <title>Сухой законъ - Авторизация</title>
  <link rel="stylesheet" href="style.css">
</head>

<body>
  <br><br>
  <h1>СтройКомпания</h1>
  <h3>Авторизация</h3>

  <form class="login_form" method="POST" action="login.php">
    <?php if(isset($_SESSION["message"])) : ?>
      <div class="alert alert-danger" role="alert">
        <?php echo $_SESSION["message"]; unset($_SESSION['message']); ?>
      </div>
    <?php endif; ?>
    <div class="form-group">
      <label for="exampleInputEmail1">Логин</label>
      <input class="form-control" id="login" name="login" placeholder="Введите логин">
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">Пароль</label>
      <input type="password" class="form-control" id="password" name="password" placeholder="Введите пароль">
    </div>

    <div class="btn_center">
      <button type="submit" class="btn btn-primary btn_center">Войти</button>
    </div>
  </form>

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>

</html>