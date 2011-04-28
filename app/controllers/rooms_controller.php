<?php
class RoomsController extends AppController {

	var $name = 'Rooms';
	var $scaffold;

	//Automaticaly load ajax layout in every call
	var $components = array('RequestHandler');

	
	function listAllJson() {
		//Replaced with requestHandler
		//$this->layout = 'ajax';
		$rooms = $this->Room->find('all');
		$this->set('room', $rooms);
	}


}
?>