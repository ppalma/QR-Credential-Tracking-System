<?php
class AttendeesController extends AppController {

	var $name = 'Attendees';
	var $helpers = array('Ajax', 'Javascript', 'Time');

	function index() {
		$this->Attendee->recursive = 0;
		$conditions =null;
		//TODO: U know U most fix it!!!, just 4 test
		if( $this->Session->read('Auth.User.id') != '4db4705a-fd98-4194-8be5-1e2ca457f137') 
		{
			$conditions = array('User.id =' => $this->Session->read('Auth.User.id'));
		}
			
		$this->set('attendees', $this->paginate($conditions));
			


	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid attendee', true));
			$this->redirect(array('action' => 'index'));
		}
		$this->set('attendee', $this->Attendee->read(null, $id));
	}

	function add() {
		if (!empty($this->data)) {
			$this->Attendee->create();
			if ($this->Attendee->save($this->data)) {
				$this->Session->setFlash(__('The attendee has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The attendee could not be saved. Please, try again.', true));
			}
		}
		$types = $this->Attendee->Type->find('list');
		$users =  $this->Attendee->User->find('list',array('conditions' => array('User.id =' => $this->Session->read('Auth.User.id')),));
		$this->set(compact('types','users'));
	}

	function edit($id = null) {
		if (!$id && empty($this->data)) {
			$this->Session->setFlash(__('Invalid attendee', true));
			$this->redirect(array('action' => 'index'));
		}
		if (!empty($this->data)) {
			if ($this->Attendee->save($this->data)) {
				$this->Session->setFlash(__('The attendee has been saved', true));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The attendee could not be saved. Please, try again.', true));
			}
		}
		if (empty($this->data)) {
			$this->data = $this->Attendee->read(null, $id);
		}
		$types = $this->Attendee->Type->find('list');
		$users =  $this->Attendee->User->find('list',array('conditions' => array('User.id =' => $this->Session->read('Auth.User.id')),));
		$this->set(compact('types','users'));
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash(__('Invalid id for attendee', true));
			$this->redirect(array('action'=>'index'));
		}
		if ($this->Attendee->delete($id)) {
			$this->Session->setFlash(__('Attendee deleted', true));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('Attendee was not deleted', true));
		$this->redirect(array('action' => 'index'));
	}
}
?>