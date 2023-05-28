<?php
require "../config.php";
require "../routing.php";
session_start();
if (!isset($_SESSION["is_login"])) {
  goToRoute("login");
  exit();
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>СтройКомпания - Настройки</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <link rel="stylesheet" href="../css/dashboard.css">
</head>

<body>
  <?php include("../inc/navbar.php") ?>

  <div class="container dashboard_content">
    <div class="d-flex">
      <div class="mr-auto p-2">
        <h3>Настройки</h3>
      </div>
    </div>

    <!-- Positions -->
    <?php require "../db_helper.php";
    $db = new DBHelper(); ?>
    <div class="row menu_items">
      <?php foreach ($db->getAllFields() as $item) : ?>
        <div class="col-lg-4 col-md-6">
          <form action="change.php" method="get">
            <div class="form-group">
              <input name="name" value="<?php echo $item["name"] ?>" hidden>
              <label for="<?php echo $item["name"] ?>"><?php echo $item["name"] ?></label>
              <input name="value" class="form-control" id="<?php echo $item["name"] ?>" value="<?php echo $item["value"] ?>">
            </div>
            <button type="submit" class="btn btn-primary">Сохранить</button><br><br>
          </form>
        </div>
      <?php endforeach; ?>

    </div>
  </div>

  <script>
    var selectedId = -1;

    function showConfirmDialog(id) {
      selectedId = id;
      $('#removeConfirmation').modal('toggle');
    }

    function remove() {
      window.location.href = '<?php echo getRoute("menu/remove_position.php?id=") ?>' + selectedId;
    }
  </script>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>

</html>