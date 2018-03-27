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

    /**
     * Établit la connexion à la base de données.
     */
    /*$dsn = 'pgsql:dbname=scp1;host=10.189.251.9';
*$user = 'scp1';
*$password = 'scp1';
*
    *try {
*    $dbh = new PDO($dsn, $user, $password);
*} catch (PDOException $e) {
*    echo 'Connexion échouée : ' . $e->getMessage();
*}*/
    private function connexionBDD()//Fonction servant à faire la connection à la base de donnée
    {
      try {
        //connexion à la base de données
          $dsn = 'pgsql:dbname='.$this->database.';host='.$this->host;
       $this->db = new PDO($dsn,
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



    /**
     * Exécute une requête retournant des lignes sur la base de données Oracle.
     *
     * @param string $sql la requête à exécuter, avec des placeholders
     * @param array $bindings les valeurs des placeholders
     * @return array une liste des résultats retournés
     */
    protected function executerRequeteAvecResultat($sql, $bindings = null)
    {
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
     
    //    print_r2($this->db->prepare($sql)) ;  
      $stmt = $this->db->prepare($sql);

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
      $sql = "SELECT * FROM adherents";
      print_r2($sql);
      //print_r2($this->executerRequeteAvecResultat($sql));
      return $this->executerRequeteAvecResultat($sql);
    }
  }
?>
