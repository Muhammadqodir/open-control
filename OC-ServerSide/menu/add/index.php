<?php
require "../../config.php";
require "../../routing.php";
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
  <title>Сухой законъ - Добавить позицию</title>
  <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <link rel="stylesheet" href="../../css/dashboard.css">
</head>

<body>
  <nav class="navbar navbar-light bg-light">
    <div class="mr-auto p-2">
      <span class="navbar-brand mb-0 h1"><i class="fa-solid fa-pizza-slice"></i> Добавить</span>
    </div>
    <div class="p-2"><a class="btn btn-danger" href="<?php echo getRoute("menu") ?>" role="button"><i class="fa-solid fa-xmark"></i></a></div>
  </nav>
  <div class="container dashboard_content">
    <form method="post" enctype="multipart/form-data" action="add_new_position.php">
      <?php if (isset($_SESSION["message"])) : ?>
        <div class="alert alert-danger" role="alert">
          <?php echo $_SESSION["message"];
          unset($_SESSION['message']); ?>
        </div>
      <?php endif; ?>
      <div class="form-group">
        <label for="title">Название позиции</label>
        <input class="form-control" id="title" name="title" placeholder="Название">
      </div>

      <div class="form-group">
        <label for="description">Состав</label>

        <!-- Create the editor container -->
        <div id="editor"></div>

        <!-- Include the Quill library -->
        <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

        <!-- Initialize Quill editor -->
        <script>
          var quill = new Quill('#editor', {
            theme: 'snow'
          });
          quill.on('text-change', function(delta, source) {
            $('#description').html(quill.root.innerHTML)
          });
        </script>
        <textarea class="form-control" hidden id="description" name="description" placeholder="Состав"></textarea>
      </div>
      <div class="form-group">
        <label for="price">Цена</label>
        <input type="number" data-bind="value:replyNumber" class="form-control" id="price" name="price" placeholder="Цена">
      </div>
      <?php require "../../db_helper.php";
      $db = new DBHelper(); ?>
      <div class="form-group">
        <label for="category">Категория</label>
        <select class="form-control" id="category" name="category" placeholder="Категория">
          <?php foreach ($db->getCategories() as $item) : ?>
            <option value="<?php echo $item["id"] ?>"><?php echo $item["name"] ?></option>
          <?php endforeach; ?>
        </select>
      </div>
      <div class="row">
        <div class="col-md-4 col-lg-2">
          <img class="file_preview" src="../../placeholder.png" id="img_preview1">
        </div>
        <div class="col-md-8 col-lg-10">

          <div class="form-group">
            <label for="photo">Фото</label>
            <div class="input-group mb-3">
              <div class="custom-file">
                <input type="file" accept="image/*" onchange="previewImage(1)" class="custom-file-input" id="photo1" name="photo1">
                <label class="custom-file-label" for="photo">Выберите фото</label>
              </div>
            </div>
          </div>
        </div>
      </div>
      

      <div class="row">
        <div class="col-md-4 col-lg-2">
          <img class="file_preview" src="../../placeholder.png" id="img_preview2">
        </div>
        <div class="col-md-8 col-lg-10">

          <div class="form-group">
            <label for="photo">Фото</label>
            <div class="input-group mb-3">
              <div class="custom-file">
                <input type="file" accept="image/*" onchange="previewImage(2)" class="custom-file-input" id="photo2" name="photo2">
                <label class="custom-file-label" for="photo">Выберите фото</label>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-4 col-lg-2">
          <img class="file_preview" src="../../placeholder.png" id="img_preview3">
        </div>
        <div class="col-md-8 col-lg-10">

          <div class="form-group">
            <label for="photo">Фото</label>
            <div class="input-group mb-3">
              <div class="custom-file">
                <input type="file" accept="image/*" onchange="previewImage(3)" class="custom-file-input" id="photo3" name="photo3">
                <label class="custom-file-label" for="photo">Выберите фото</label>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-4 col-lg-2">
          <img class="file_preview" src="../../placeholder.png" id="img_preview4">
        </div>
        <div class="col-md-8 col-lg-10">

          <div class="form-group">
            <label for="photo">Фото</label>
            <div class="input-group mb-3">
              <div class="custom-file">
                <input type="file" accept="image/*" onchange="previewImage(4)" class="custom-file-input" id="photo4" name="photo4">
                <label class="custom-file-label" for="photo">Выберите фото</label>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div style="text-align: end;">
        <button type="submit" class="btn btn-success"><i class="fa-solid fa-plus"></i> Добавить</button>
      </div>
    </form>
  </div>


  <script>
    function previewImage(id) {
      var oFReader = new FileReader();
      oFReader.readAsDataURL(document.getElementById("photo"+id).files[0]);

      oFReader.onload = function(oFREvent) {
        document.getElementById("img_preview"+id).src = oFREvent.target.result;
      };
    };
  </script>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>

</html>