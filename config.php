<?php

	/*
	 * CONFIGURATION SAISIE DES NOTES / VALIDATION DES SEMESTRES
	 *
	 * Contient la configuration de l'application :
	 * - la configuration de la base de données
	 * - diverses options de configuration
	 */


	// Configuration de la base de données MySQL
	define('BDD_USERNAME', 'scp1');                 //nom d'utilisateur
	define('BDD_PASSWORD', 'scp1');                     //mot de passe
	define('BDD_HOSTNAME', '10.189.251.9');            //nom d'hôte du serveur pgsl
	define('BDD_DATABASE', 'scp1');     //nom de la base de données

	// Affiche chaque requête SQL sur la page.
	define('DEBUG_PDO', false);

	// Active l'affichage des erreurs/warnings PHP.
	define('DEBUG_PHP', true);

	//Durée minimale d'une session en minutes.
	define('SESSION_TIMEOUT', 2 * 60 * 60);

	// Préfixe des tables de la base de données (Saisie des Notes et Validation des Semestres)
	define('BDD_PREFIX_G', 'g_');

?>
