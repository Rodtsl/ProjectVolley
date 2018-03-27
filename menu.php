
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">SCPVOLLEY</a>
    </div>
    <ul class="nav navbar-nav">
        <li class="active"><a href="index.php">Accueil</a></li>
      <li><a href="#">Actualités</a></li>
      <li><a href="#">Equipes</a></li>
      <li><a href="#">Calendriers/résultats</a></li>
      <li><a href="#">Galerie Photos</a></li>
      <li><a href="#">Partenaires</a></li>
      <li><a href="#">Rejoignez-nous</a></li>
      <li><a href="contact.php">Contact</a></li>
      <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> Espace Club <span class="caret" ></span></a>
          <ul class="dropdown-menu">
                <div class="container">
<div class="row">
<div class="row col-sm-12">
    
    <div class="main">
            
        <div class="row">
        <div class="col-xs-12 col-sm-6 col-sm-offset-1">
                    
            <h4>Identifiez-vous !</h4>
            <br>
            
            	<?php if (isset($erreur))	echo '<div class ="erreur"><ul><li>'.$erreur.'</li></ul></div>'; ?>
                    
            <form action="<?php echo $path.'c_default/connecter';?>" name="login" role="form" class="form-horizontal" method="post" accept-charset="utf-8">
                <div class="form-group">
                <div class="col-md-4"><input name="username" placeholder="Identifiant" class="form-control" type="text" id="UserUsername"/></div>
                </div> 
                
                <div class="form-group">
                <div class="col-md-4"><input name="password" placeholder="Mot de passe" class="form-control" type="password" id="UserPassword"/></div>
                </div> 
                
                <div class="form-group">
                <div class="col-md-offset-0 col-md-4"><input  class="btn btn-success btn btn-success" type="submit" value="Connexion"/></div>
                </div>
            
            </form>
        </div>
        </div>
        
    </div>
</div>
</div>
          </ul>
        </li>
      
    </ul>
  </div>
</nav>

