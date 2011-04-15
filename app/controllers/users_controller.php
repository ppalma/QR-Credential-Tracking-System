

<?php
uses('sanitize');
class UsersController extends AppController {

	var $name = 'Users';
	var $components = array('Auth','Email');

	function login(){ // Check for incoming login request.
		if ($this->data) {
			// Use the AuthComponent’s login action
			if ($this->Auth->login($this->data)) {
				// Retrieve user data
				$results = $this->User->find(array('User.username' =>
				$this->data['User']['username']), array('User.active'), null, false);
				// Check to see if the User’s account isn’t active
				if ($results['User']['active'] == 0) {
					// Uh Oh!
					$this->Session->setFlash(_('Your account has not been activated yet!'));
					$this->Auth->logout();
					$this->redirect('/users/login');
				}
				// Cool, user is active, redirect post login
				else {
					$this->redirect('/');
				}
			}
		}}
		function logout(){

			$this->Session->delete('Permissions');
			$this->redirect($this->Auth->logout());
		}

		// Allow users to access the following action when not logged in
		function beforeFilter() {
			//$this->Auth->allow('register', 'thanks', 'confirm', 'logout');
			$this->Auth->allow('*');
			$this->Auth->autoRedirect = false;
		}
		// Allows a user to sign up for a new account
		function register() {
			if (!empty($this->data)) {
				// See my previous post if this is forgien to you
			
				$this->data['User']['password'] =
				$this->Auth->password($this->data['User']['password']);
				$this->User->data = Sanitize::clean($this->data);
				// Successfully created account – send activation email
				if ($this->User->save()) {
					$this->__sendActivationEmail($this->User->getLastInsertID());
					// this view is not show / listed – use your imagination and inform
					// users that an activation email has been sent out to them.
					$this->redirect('/users/thanks');
				}
				// Failed, clear password field
				else {
					$this->data['User']['password'] = null;
				}
			}
		}
		/**
		 * Send out an activation email to the user.id specified by $user_id
		 *  @param Int $user_id User to send activation email to
		 *  @return Boolean indicates success
		 */
		function __sendActivationEmail($user_id) {
			$user = $this->User->find(
			array('User.id' => $user_id), array('User.id','User.email_address', 'User.username','User.created'), null, false);

			if ($user === false) {
				debug(__METHOD__." failed to retrieve User data for user.id: {$user_id}");
				return false;
			}
			
			// Set data for the "view" of the Email
			
			
			$this->set('activate_url', 'http://' . env('SERVER_NAME') . '/users/activate/' .
			$user['User']['id']. '/' . 
			$this->getActivationHash($user));
			
			
		//	debug($this->getActivationHash($user));
		
			$this->set('username', $this->data['User']['username']);

			$this->Email->to = $user['User']['email_address'];
			$this->Email->subject = env('SERVER_NAME') . ' – Please confirm your email address';
			$this->Email->from = 'noreply@ic.uach.cl';
			$this->Email->template = 'user_confirm';
			$this->Email->sendAs = 'text';   // you probably want to use both :)
		//	debug($this->Email);
			return $this->Email->send();
			
		}
		/**
		 * Activates a user account from an incoming link
		 *
		 *  @param Int $user_id User.id to activate
		 *  @param String $in_hash Incoming Activation Hash from the email
		 */
		function activate($user_id = null, $in_hash = null) {
			$this->User->id = $id;
			if ($this->User->exists() && ($in_hash == $this->User->getActivationHash()))
			{
				// Update the active flag in the database
				$this->User->saveField('active', 1);

				// Let the user know they can now log in!
				$this->Session->setFlash('Your account has been activated, please log in below');
				$this->redirect('login');
			}

			// Activation failed, render ‘/views/user/activate.ctp’ which should tell the user.
		}
		
		function getActivationHash($user = null)
        {
                if (!isset($user)) {       
                        return false;
                }
              
                return substr(
                Security::hash(Configure::read('Security.salt'). 
                $user['User']['created']. 
                date('Ymd')), 
                0, 
                8);
        }
		function thanks() {
			$this->Session->setFlash(_('un wereber'));

			$this->redirect(array('action' => 'index'));
		}
		function index() {
			$this->User->recursive = 0;
			$this->set('users', $this->paginate());
		}

		function view($id = null) {
			if (!$id) {
				$this->Session->setFlash(__('Invalid user', true));
				$this->redirect(array('action' => 'index'));
			}
			$this->set('user', $this->User->read(null, $id));
		}

		function add() {
			if (!empty($this->data)) {
				$this->User->create();
				if ($this->User->save($this->data)) {
					$this->Session->setFlash(__('The user has been saved', true));
					$this->redirect(array('action' => 'index'));
				} else {
					$this->Session->setFlash(__('The user could not be saved. Please, try again.', true));
				}
			}
			$groups = $this->User->Group->find('list');
			$this->set(compact('groups'));
		}

		function edit($id = null) {
			if (!$id && empty($this->data)) {
				$this->Session->setFlash(__('Invalid user', true));
				$this->redirect(array('action' => 'index'));
			}
			if (!empty($this->data)) {
				if ($this->User->save($this->data)) {
					$this->Session->setFlash(__('The user has been saved', true));
					$this->redirect(array('action' => 'index'));
				} else {
					$this->Session->setFlash(__('The user could not be saved. Please, try again.', true));
				}
			}
			if (empty($this->data)) {
				$this->data = $this->User->read(null, $id);
			}
			$groups = $this->User->Group->find('list');
			$this->set(compact('groups'));
		}

		function delete($id = null) {
			if (!$id) {
				$this->Session->setFlash(__('Invalid id for user', true));
				$this->redirect(array('action'=>'index'));
			}
			if ($this->User->delete($id)) {
				$this->Session->setFlash(__('User deleted', true));
				$this->redirect(array('action'=>'index'));
			}
			$this->Session->setFlash(__('User was not deleted', true));
			$this->redirect(array('action' => 'index'));
		}
}
?>