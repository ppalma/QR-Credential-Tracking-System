<?php 

class UsersController extends AppController {
    var $name = 'Users';
    var $scaffold;

    function login(){}
    function logout(){

        $this->Session->delete('Permissions');
        $this->redirect($this->Auth->logout());
    }
    public function register() {
$this->SignMeUp->register();
}

public function activate() {
$this->SignMeUp->activate();
}
}
?>