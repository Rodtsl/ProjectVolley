<!DOCTYPE html>
<html>
     
    <head>
    <meta charset = "UTF-8"/>
        <title>Mon application</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Connexion � mon application">
        <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
        <link href="bootstrap-3.3.6-dist/css/Maxime.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato:400,700,300" />
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    </head>
    <body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand""active" href="#">Visiteur Médical</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Modification des Comptes-rendus <span class="sr-only">(current)</span></a></li>
        <li><a href="newCRv.php">Saisie des Comptes-rendus</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Consultation des données <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Liste des comptes-rendus de visite</a></li>
            <li><a href="#">Another action</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Profil <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Déconnexion</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<br>
<div class="jumbotron">
  <h1>Présentation de GSB</h1><br>
  <p>Le laboratoire désire mettre à disposition des visiteurs médicaux une application Web permettant de
centraliser les comptes-rendus de visite. Cette base d'information sera utilisée à des fins d'élaboration
de la démarche de communication auprès des praticiens et donnera une vision individuelle et
synthétique de l'activité de représentation.</p><br>
</div>

</body>
