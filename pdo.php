<?php
  /**
   * Modèle
   * Database.class.php
   *
   * Méthodes liées à l'accès à la base de donnée.
   */



  use PDO;
  use PDOException;
  require_once 'config.php';
  
  /**
   * Class BaseDB
   *
   * Classe de base de données de base.
   *
   * @package SDN
   */
  function print_r2($val){ //fonction de debug
     echo "<PRE>";
     print_r($val);
     echo "</PRE>";

   }
  function apostropheSession($string){//change une apostrophe vers un backslash une appostrophe pour les variables de sessions
    $string=preg_replace("~\'~", "\'", $string);
    return $string;
    }

  class BaseDB //PDO en classe
  {

    private $db;
    private $username;
    private $password;
    private $database;
    private $host;


    /**
     * Créé une nouvelle instance du gestionnaire de base de données.
     *
     * @param bool $autoconnect spécifie si on doit se connecter automatiquement ou pas
     *             (true par défaut; utilisé pour installer la base de données)
     */
    public function __construct($username, $password, $database, $host)//constructeur de PDO
    {
      $this->username = $username;
      $this->password = $password;
      $this->database = $database;
      $this->host     = $host;

      $this->connexionBDD();
    }
    private function connexionBDD()//Fonction servant à faire la connection à la base de donnée
    {
      try {
        //connexion à la base de données
    $this->db = new PDO('pgsql:host=' . $this->host . ';dbname=' . $this->database,
      $this->username, $this->password);
        if (DEBUG_PDO) {
          $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }

      } catch (PDOException $e) {
        die('Erreur lors de la connexion à la base : ' . $e->getMessage() .
          "\n<br>Si la base n'existe pas encore, créez-la puis exécutez installation_bdd.php.");
      }
    }
    public function __destruct()
    {
      $this->close();
    }
    /**
     * Fermeture de la base de données.
     */
    public function close()
    {
      if ($this->db !== null) {
        $this->db = null;
      }
    }
    /**
     * Commence une transaction.
     */
    public function beginTransaction()
    {
      $this->db->beginTransaction();
    }
    /**
     * Commit les changements effectués durant la transaction.
     */
    public function commit()
    {
      $this->db->commit();
    }
    public function query($sql)
        {
        return $this->db->query($sql);
        }

    /**
     * Exécute une requête retournant des lignes sur la base de données Oracle.
     *
     * @param string $sql la requête à exécuter, avec des placeholders
     * @param array $bindings les valeurs des placeholders
     * @return array une liste des résultats retournés
     */
    protected function executerRequeteAvecResultat($sql, $bindings = null)
    {
  //      
  //      print_r2($this->executerRequete($sql, $bindings)->fetchAll(PDO::FETCH_ASSOC));
      return $this->executerRequete($sql, $bindings)->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Exécute une requête qui ne retourne pas de lignes (ex: INSERT INTO) sur la base de données Oracle.
     *
     * @param string $sql la requête à exécuter, avec des placeholders
     * @param array $bindings les valeurs des placeholders
     * @throws PDOException si la requête a échoué
     * @return PDOStatement le statement correspondant à la requête exécutée
     */
    protected function executerRequete($sql, $bindings = null)
    {
      //print_r2($stmt);
      if ($bindings !== null && is_array($bindings)) {
        foreach ($bindings as $key => $value) {
          $stmt->bindValue($key, $value);
        }
      }
      $this->executerRequete($sql, $bindings)->fetchAll(PDO::FETCH_ASSOC);
      $succes = $stmt->execute();

      if (!$succes) {
        $error = $stmt->errorInfo();
        echo "requete pas execute";
        throw new PDOException($error[0] . ': ' . $error[2]);
      }
      //print_r2($stmt);
      return $stmt;
    }
  }

  /**
   * Class Database
   *
   * Gère toutes les méthodes d'accès à la base de données.
   * Si vous avez besoin d'accéder à la base de données, créez une méthode adéquate ici.
   * Pareil pour l'écriture.
   *
   * @package SDN
   */
  class Database extends BaseDB
  {

    function __construct()
    {
      parent::__construct(BDD_USERNAME, BDD_PASSWORD, BDD_DATABASE, BDD_HOSTNAME);
    }
    
     function afficheLogin()//function d'affichage de la table coureur
    {
      
      $sql = "select login from adherents";
      
      //print_r2($this->executerRequeteAvecResultat($sql));
      return $this->executerRequeteAvecResultat($sql);
    
    }
    function getLogin() {
    $sql =  'select login,mdp,nom from adherents';
     foreach  ($this->query($sql) as $row) {
        print $row['login'] . "\t";
        print  $row['mdp'] . "\t";
        print $row['nom'] . "\n";
        }
    }    
    function getMatch(){
       $sql=' select id_creneau,debut, fin, salles.nom as "salle", eq.nom as "equipe", nom_equipe_b as "adversaire" from creneaux join salles using(id_salle) join matchs ma using(id_creneau) join equipes eq on ma.id_equipe_a=eq.id_equipe' ;
       echo"<script>


  $(document).ready(function() {

    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listWeek'
      },
      defaultDate: '2016-05-02',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow more link when too many events
      events: [
      ";
      foreach  ($this->query($sql) as $row){
        echo "{
          id: ".$row['id_creneau'].",
          title: 'MATCH DE".$row['equipe']." contre ".  apostropheSession($row['adversaire'])." (".$row['salle'].")',
          start: '".$row['debut']."',
          end:'".$row['fin']."'    
        },";  
        
      }
      echo "  ]
    });
  });
</script>";
    }    
  }
  
  
?>
