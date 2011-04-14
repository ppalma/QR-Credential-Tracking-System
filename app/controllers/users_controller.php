<?php 

class UsersController extends AppController {
    var $name = 'Users';
    var $scaffold;
    function login(){}
    function logout(){
        $this->Session->del('Permissions');
        $this->redirect($this->Auth->logout());
    }
}
?>