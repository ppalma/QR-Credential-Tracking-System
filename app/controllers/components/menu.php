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

		$allcontrollers = $this-> get();
			//debug($generalMenu);
			//debug($allcontrollers);
		//menus arra
		$menus = array();
		$menus[__('General', true)] = $generalMenu;
		$menus[__('Controllers',true)]= $allcontrollers;
		$menus[$this->Session->read('Auth.User.username')] = $userMenu;
 
		$this->Session->write('Menu.main', $menus);
 
	}


  public function get() {
        $controllerClasses = App::objects('controller');

        foreach($controllerClasses as $controller) { 
            if ($controller != 'App') { 
                App::import('Controller', $controller);
                $className = $controller . 'Controller';
                $actions = get_class_methods($className);
                foreach($actions as $k => $v) {
                	if ($v{0} == '_') {
                        unset($actions[$k]);
                    }
                    
                    
                }
                $parentActions = get_class_methods('AppController');
				array_flip($actions);
				
				$diff = array_diff($actions, $parentActions);
				foreach ($diff as $k => $v)
				{
					unset($diff[$k]);
					$diff[$v] = $v;
				}
                $controllers[$controller] = $diff; 
                //debug($controllers);
                	
                //break;
            }
        }
        
             return $controllers;  
    }
}
?>