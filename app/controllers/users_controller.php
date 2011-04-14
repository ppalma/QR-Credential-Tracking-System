<?php 

class UsersController extends AppController {
    var $name = 'Users';
    var $scaffold;
  //  var $components = array('Auth','Session');
   // var $helpers = array('Html', 'Form');//, 'Menu');
   // var $components = array('Session');
    function login(){}
    function logout(){

        $this->Session->delete('Permissions');
        $this->redirect($this->Auth->logout());
    }
}
?>