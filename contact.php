<?php include('menu.php'); ?>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">
        <link href='custom.css' rel='stylesheet' type='text/css'>
    </head>
    <body>
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="validator.js"></script>
        <script src="contact.js"></script>
    </body>
</html>
<br/>
      <div class="row col-sm-12">
   <nav class="col-sm-1"> 
   </nav>

<nav class="col-sm-6">  
    <form id="contact-form" method="post" action="contact.php" role="form">

    <div class="messages"></div>

    <div class="controls">

        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label for="form_name">Prénom* :</label>
                    <input id="form_name" type="text" name="name" class="form-control" placeholder="Martin *" required="required" data-error="Firstname is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="form_lastname">Nom* :</label>
                    <input id="form_lastname" type="text" name="surname" class="form-control" placeholder="Durand *" required="required" data-error="Lastname is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label for="form_email">Email* :</label>
                    <input id="form_email" type="email" name="email" class="form-control" placeholder="exemple@gmail.com *" required="required" data-error="Valid email is required.">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="form_phone">Téléphone :</label>
                    <input id="form_phone" type="tel" name="phone" class="form-control" placeholder="0102030405">
                    <div class="help-block with-errors"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="form-group">
                    <label for="form_message">Message* :</label>
                    <textarea id="form_message" name="message" class="form-control" placeholder="Votre Message *" rows="6" required="required" data-error="Please,leave us a message."></textarea>
                    <div class="help-block with-errors"></div>
                </div>
            </div>
            <div class="col-md-12">
                <input type="submit" class="btn btn-success btn-send" value="Envoyer votre message">
            </div>
        </div>
        </nav>
          <nav class="col-sm-3">  
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2890.859076947793!2d1.3039720505296026!3d43.5678194658641!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12aeb140d3d2ae13%3A0xe049c13c4699e7a1!2s1+Rue+d&#39;Estujats%2C+31830+Plaisance-du-Touch!5e0!3m2!1sfr!2sfr!4v1522142231648" width="450" height="320" frameborder="0" style="border:0" allowfullscreen></iframe>
        </nav>
          <nav class="col-sm-1"> 
   </nav>
        </div>
</form>