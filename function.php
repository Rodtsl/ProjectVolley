
<?php
function getLogin($conn) {
    $sql =  'SELECT login FROM adherents';
    foreach  ($conn->query($sql) as $row) {
        print $row['login'] . "\t";
  }
}
?>

