    <?php 
    
    
    
    class DataAccess extends CI_Model {
    	
    	
    	
	public function getInfosVisiteur($login, $mdp){
		$req = "select visiteur.VIS_MATRICULE as idUser, visiteur.VIS_NOM as nom, visiteur.VIS_PRENOM as prenom,visiteur.VIS_DATEEMBAUCHE as password 
				from visiteur 
				where visiteur.login=? and visiteur.mdp=?";
		$rs = $this->db->query($req, array ($login, $mdp)
				);
		$ligne = $rs->first_row('array'); 
		return $ligne;
	}
	
	
    }
	
	
	?>