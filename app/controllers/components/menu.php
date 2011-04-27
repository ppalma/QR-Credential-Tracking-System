<?php
class MenuComponent extends Object {
	var $components = array('Session','Auth');



	/**
	 * Enter description here ...
	 */
	/*
	 function getPermissionsArray()
	 {
	 $permissions = array();
	 //everyone gets permission to logout
	 $permissions[]='users:logout';
	 //Import the User Model so we can build up the permission cache
	 App::import('Model', 'User');
	 $thisUser = new User;
	 //Now bring in the current users full record along with groups
	 $thisGroups = $thisUser->find(array('User.id'=>$this->Auth->user('id')));
	 $permissionsArray = array();
	 if(!empty($thisGroups))
	 {
	 $thisGroups = $thisGroups['Group'];
	 foreach($thisGroups as $thisGroup){
	 $thisPermissions = $thisUser->Group->find(array('Group.id'=>$thisGroup['id']));
	 $thisPermissions = $thisPermissions['Permission'];
	 foreach($thisPermissions as $thisPermission){
	 $permissions[]=$thisPermission['name'];
	 }
	 }

	 foreach($permissions as $permission){

	 if($permission == '*')
	 {
	 $permissionsArray = array();
	 break;
	 }
	 $links = explode(":",$permission);
	 //debug($links);
	 //$permissionsArray = array($links[0] => array($links[1] => "/".$links[0]."/".$links[1])) ;
	 $permissionsArray = array($links[0] = arr($links[1])) ;

	 }

	 debug($permissionsArray);
	 return $permissionsArray;
	 }
	 }
	 */
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

		

		//debug($generalMenu);
		//$user = $this->Session->read('Auth.User');


		//	$admin = array();
		//	$admin[__('Users',true)]='/users';
		//	$admin[__('Permissions',true)]='/permissions';
		//	$admin[__('Groups',true)]='/groups';

		$menus = array();

		$menus[__('General', true)] = $generalMenu;

		$menus[$this->Session->read('Auth.User.username')] = $userMenu;

		//	debug($admin);
		$this->Session->write('Menu.main', $menus);

	}
}
?>