<?php
class MenuComponent extends Object {
	var $components = array('Session');

	/**
	 * Enter description here ...
	 */
	function startup() {

		$userMenu = array();
		$generalMenu = array();

		$generalMenu[__('Home', true)] = '/';

		if(!$this->Session->check('Auth.User')) {
			$userMenu[__('Register', true)] = '/users/register';
			$userMenu[__('Login', true)] = '/users/login';
				
		}
		else {
			$userMenu[__('Logout', true)] = '/users/logout';
		}

		//sample child item
		$parent = array();
		$parent[__('Child', true)] = '/';
		$generalMenu[__('Parent', true)] = $parent;


		$user = $this->Session->read('Auth.User');

		
		$admin = array();
		$admin[__('Users',true)]='/users';
		$admin[__('Permissions',true)]='/permissions';
		$admin[__('Groups',true)]='/groups';

		$menus = array();
		$menus[__('General', true)] = $generalMenu;
		$menus[__('Administration',true)]=$admin;
		
		$menus[$this->Session->read('Auth.User.username')] = $userMenu;

		$this->Session->write('Menu.main', $menus);

	}
}
?>