<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function index()
	{
		$this->load->view('welcome_message');
	}
	
	
	
	
	public function connecter ()
	{	// TODO : conrôler que l'obtention des données postées ne rend pas d'erreurs
	
	$this->load->model('authentif');
	
	$login = $this->input->post('login');
	$mdp = $this->input->post('mdp');
	$statut=$this->input->post('statut');
	
	$authUser = $this->authentif->authentifier($login, $mdp, $statut);
	
	if(empty($authUser))
	{
		$data = array('erreur'=>'Login ou mot de passe incorrect');
		$this->templates->load('t_connexion', 'v_connexion', $data);
	}
	else
	{
		$this->authentif->connecter($authUser['id'], $authUser['nom'], $authUser['prenom'], $authUser['statut']);
		$this->index();
	}
}

}
