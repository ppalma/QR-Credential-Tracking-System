<?php 
class User extends AppModel {
    var $displayField = 'email_address';
    var $name = 'User';

    
    var $validate = array(
        'email_address' => array('email'),
        'password' => array('alphaNumeric'),
        'active' => array('numeric')
    );
    var $hasAndBelongsToMany = array(
            'Group' => array('className' => 'Group',
                        'joinTable' => 'groups_users',
                        'foreignKey' => 'user_id',
                        'associationForeignKey' => 'group_id',
                        'unique' => true
            )
    );
    /**
         * Creates an activation hash for the current user.
         *
         *      @param Void
         *      @return String activation hash.
        */ 
 function getActivationHash()
        {
                if (!isset($this->id)) {
                        return false;
                }
                return substr(Security::hash(Configure::read('Security.salt').
                $this->field('created') . date('dmY')), 0, 8);
        }
}
?>