<!DOCTYPE html>
<html>
    
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>GSB Compte-rendu-</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
        <link href="bootstrap-3.3.6-dist/css/Maxime.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato:400,700,300" />
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    </head>
    <body>
 
<?php
	$this->load->helper('url');
	$path = base_url();
?>
    
    <div class="container">
<div class="row">
<div class="col-xs-12">
    
    <div class="main">
            
        <div class="row">
        <div class="col-xs-12 col-sm-6 col-sm-offset-1">
                    
            <h2>Bienvenue sur Galaxy Swiss-Bourdin !</h2><br>
            <h2>Identifiez-vous !</h2>
            
            	<?php if (isset($erreur))	echo '<div class ="erreur"><ul><li>'.$erreur.'</li></ul></div>'; ?>
                    
            <form name="login" role="form" class="form-horizontal" method="post" charset="utf-8">
                <div class="form-group">
                <div class="col-md-8"><input name="username" placeholder="Identifiant" class="form-control" type="text" id="UserUsername"/></div>
                </div> 
                
                <div class="form-group">
                <div class="col-md-8"><input name="password" placeholder="Mot de passe" class="form-control" type="password" id="UserPassword"/></div>
                </div> 
                
                <div class="form-group">
                <div class="col-md-offset-0 col-md-8"><input  class="btn btn-success btn btn-success" type="button" value="Connexion" onclick="window.open('acceuil.php');"/></div>
                </div>
            
            </form>
            
            <img src="logo.jpg" ></img>
        </div>
        </div>
        
    </div>
</div>
</div>
</div>
    </body>
</html>

