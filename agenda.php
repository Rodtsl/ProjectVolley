<?php
 require_once "pdo.php";
   
    $db = new Database();
   

      

?>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <link href='fullcalendar-3.9.0/fullcalendar.min.css' rel='stylesheet' />
  <link href='fullcalendar-3.9.0/fullcalendar.print.min.css' rel='stylesheet' media='print' />
  <script src='fullcalendar-3.9.0/lib/moment.min.js'></script>
  <script src='fullcalendar-3.9.0/lib/jquery.min.js'></script>
  <script src='fullcalendar-3.9.0/fullcalendar.min.js'></script>
  <script>
            


 
</script>
 
      
      <?php 


  $sql = $db->getMatch();

?>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>
</head>

<body>
    <?php include('menu.php'); ?>

  <div id='calendar'></div>

</body>
</html>
