<?php

class AppController extends Controller {
	/**
	 * components
	 *
	 * Array of components to load for every controller in the application
	 *
	 * @var $components array
	 * @access public
	 */
	var $components = array('Auth','Session','Menu');
	var $helpers = array('Menu','Html','Form','Session');
	/**
	 * beforeFilter
	 *
	 * Application hook which runs prior to each controller action
	 *
	 * @access public
	 */
	function beforeFilter(){
		//Override default fields used by Auth component
		$this->Auth->fields = array('username'=>'email_address','password'=>'password');
		//Set application wide actions which do not require authentication
		// $this->Auth->allow(array('*'));
		$this->Auth->allow(array('display','register','activate', 'login', 'confirm', 'logout'));//IMPORTANT for CakePHP 1.2 final release change this to $this->Auth->allow(array('display'));
		//Set the default redirect for users who logout
		$this->Auth->logoutRedirect = '/';
		//Set the default redirect for users who login
		$this->Auth->loginRedirect = '/';
		//Extend auth component to include authorisation via isAuthorized action
		$this->Auth->authorize = 'controller';
		//Restrict access to only users with an active account
		$this->Auth->userScope = array('User.active = 1');
		//Pass auth component data over to view files
		$this->set('Auth',$this->Auth->user());
	}
	/**
	 * beforeRender
	 *
	 * Application hook which runs after each action but, before the view file is
	 * rendered
	 *
	 * @access public
	 */
	function beforeRender(){
		//If we have an authorised user logged then pass over an array of controllers
		//to which they have index action permission
		if($this->Auth->user()){
			$controllerList = Configure::listObjects('controller');
			$permittedControllers = array();
			foreach($controllerList as $controllerItem){
				if($controllerItem <> 'App'){
					if($this->__permitted($controllerItem,'index')){
						//	            if(true){
						$permittedControllers[] = $controllerItem;
					}
				}
			}
		}
		$this->set(compact('permittedControllers'));
	}
	/**
	 * isAuthorized
	 *
	 * Called by Auth component for establishing whether the current authenticated
	 * user has authorization to access the current controller:action
	 *
	 * @return true if authorised/false if not authorized
	 * @access public
	 */

	function isAuthorized(){
		return $this->__permitted($this->name,$this->action);
	}

	/**
	 * __permitted
	 *
	 * Helper function returns true if the currently authenticated user has permission
	 * to access the controller:action specified by $controllerName:$actionName
	 * @return
	 * @param $controllerName Object
	 * @param $actionName Object
	 */
	function __permitted($controllerName,$actionName){
		//Ensure checks are all made lower case
		$controllerName = low($controllerName);
		$actionName = low($actionName);
		//If permissions have not been cached to session...
		if(!$this->Session->check('Permissions')){
			//...then build permissions array and cache it
			$permissions = array();
			//everyone gets permission to logout
			$permissions[]='users:logout';
			//Import the User Model so we can build up the permission cache
			App::import('Model', 'User');
			$thisUser = new User;
			//Now bring in the current users full record along with groups
			$thisGroups = $thisUser->find(array('User.id'=>$this->Auth->user('id')));
			$thisGroups = $thisGroups['Group'];
			foreach($thisGroups as $thisGroup){
				$thisPermissions = $thisUser->Group->find(array('Group.id'=>$thisGroup['id']));
				$thisPermissions = $thisPermissions['Permission'];
				foreach($thisPermissions as $thisPermission){
					$permissions[]=$thisPermission['name'];
				}
			}
			//write the permissions array to session
			$this->Session->write('Permissions',$permissions);


		}else{
			//...they have been cached already, so retrieve them
			$permissions = $this->Session->read('Permissions');
		}
		//Now iterate through permissions for a positive match
			

		foreach($permissions as $permission){

			//$this->Session->write('Menu.main',$permissions );
			if($permission == '*'){
				return true;//Super Admin Bypass Found
			}
			if($permission == $controllerName.':*'){
					
				return true;//Controller Wide Bypass Found

			}
			if($permission == $controllerName.':'.$actionName){
					
				$this->createMenu($permissions);
				return true;//Specific permission found
			}
		}
		$this->Session->delete('Permissions');
			
		return false;
	}
	function createMenu($permissions=NULL)
	{
		if($permissions)
		{
			$permited = array();
			$content = array();
			$menus = array();
			foreach($permissions as $permission)
			{
				$link = explode(":", $permission);
				$content[$link[0]][$link[1]] = $link[0]."/".$link[1]; 	
					
			}
			$permited['Auto'] = $content;
			
			debug($permited);

			$this->Session->write('Menu.main', $permited);
		}
	}
}

?>