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
        <!-- JS -->
<script src="~/Scripts/jquery-1.10.2.min.js"></script>
<script src="~/Scripts/bootstrap.min.js"></script>   <!-- Bootstrap v3.3.5 -->
<script src="~/Scripts/moment.js"></script>
<script src="~/Scripts/bootstrap-datetimepicker.min.js"></script>
<script src="~/Scripts/Core.js"></script>
        <script>
        jQuery(function () {
        	jQuery('#startDate').datetimepicker();
        	jQuery('#endDate').datetimepicker();
        	jQuery("#startDate").on("dp.change",function (e) {
                jQuery('#endDate').data("DateTimePicker").setMinDate(e.date);
        	});
        	jQuery("#endDate").on("dp.change",function (e) {
                jQuery('#startDate').data("DateTimePicker").setMaxDate(e.date);
        	});
        });
</script>
    </head>
    <script>
jQuery(document).ready(function () {

    jQuery('.datepicker').datetimepicker({ format: 'DD/MM/YYYY' });
    jQuery('.datetimepicker').datetimepicker();

});
</script>
    <body>
    <h1> Nouveau compte rendu de visite</h1>
    <br>
<div class="container">
	<div class="col-sm-6" style="height:75px;">
	   <div class='col-md-5'>
  			<h2>Praticiens :</h2>
 	 <div class="dropdown">
    		<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
    			<span class="caret"></span></button>
   					 <ul class="dropdown-menu">
     					 <li><a href="#">Nom des praticiens à récupérer ds la BDD</a></li>
    				</ul>
	</div>
  		</div>
  	</div>
</div>
<br>
<div class="container">
	<div class="col-sm-6" style="height:75px;">
	   <div class='col-md-5'>
			<div class="form-group">
				<h2>Date :</h2>
				<div class='input-group date' id='startDate'>
					<input type='date' class="form-control" name="startDate" />
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
			</div>
		</div>
</div>
</div>
<div class="container">
	<div class="col-sm-6" style="height:75px;">
	   <div class='col-md-5'>
<h2>Motif :</h2>
<TEXTAREA NAME="param5" rows="6" cols="40">
</TEXTAREA>
		</div>
</div>
</div>
<br>
<br>
<br>
<br>
<br>
<div class="container">
	<div class="col-sm-6" style="height:75px;">
	   <div class='col-md-5'>
<h2>Bilan:</h2>
<TEXTAREA NAME="param5" rows="6" cols="40">
</TEXTAREA>
		</div>
</div>
</div>
<div class="container">
	<div class="col-sm-6" style="margin-top:100px; margin-left:-15px;">
	   <div class='col-md-5'>
<div class="form-group">
                <div class="col-md-offset-0 col-md-8"><input  class="btn btn-success btn btn-success" type="button" value="Ajouter" onclick="window.open('??');"/></div>
                </div>
                </div>
                </div>
                </div>
   </body>
</html>