<?php
class MenuComponent extends Object {
	var $components = array('Session','Auth');

	function startup() {

		
		$generalMenu = array();

		$generalMenu[__('Home', true)] = '/';
		//sample child item
			$parent = array();
			$parent[__('Child', true)] = '/';
		$generalMenu[__('Parent', true)] = $parent;
		
		
		$userMenu = array();		
		if(!$this->Session->check('Auth.User')) {
			$userMenu[__('Register', true)] = '/users/register';
			$userMenu[__('Login', true)] = '/users/login';
		}
		else {
			$userMenu[__('Logout', true)] = '/users/logout';
		}

		$menus = array();
		$menus[__('General', true)] = $generalMenu;
		$menus[$this->Session->read('Auth.User.username')] = $userMenu;


		$this->Session->write('Menu.main', $menus);

	}
}
?>