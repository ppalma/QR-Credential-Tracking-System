<?php
class User extends AppModel {
	var $name = 'User';
	var $displayField = 'username';
	var $validate = array(
		'email_address' => array(
			'notempty' => array(
				'rule' => array('notempty'),
	//'message' => 'Your custom message here',
	//'allowEmpty' => false,
	//'required' => false,
	//'last' => false, // Stop validation after this rule
	//'on' => 'create', // Limit validation to 'create' or 'update' operations
	),
			'email_addressIsUnique' => array(
				'rule' => 'isUnique',
                'required' => true,
                'message' => 'The email addres has been ussed'
                ),
                ),
		'password' => array(
			'notempty' => array(
				'rule' => array('notempty'),
                //'message' => 'Your custom message here',
                //'allowEmpty' => false,
                //'required' => false,
                //'last' => false, // Stop validation after this rule
                //'on' => 'create', // Limit validation to 'create' or 'update' operations
                ),
			 'identicalFieldValues' => array( 
        		'rule' => array('identicalFieldValues', 'confirm_password' ), 
        		'message' => 'Please re-enter your password twice so that the values match' 
        		)
        		),
		'active' => array(
			'numeric' => array(
				'rule' => array('numeric'),
        		//'message' => 'Your custom message here',
        		//'allowEmpty' => false,
        		//'required' => false,
        		//'last' => false, // Stop validation after this rule
        		//'on' => 'create', // Limit validation to 'create' or 'update' operations
        		),
        		),
        		);
        		//The Associations below have been created with all possible keys, those that are not needed can be removed

        		var $hasAndBelongsToMany = array(
		'Group' => array(
			'className' => 'Group',
			'joinTable' => 'groups_users',
			'foreignKey' => 'user_id',
			'associationForeignKey' => 'group_id',
			'unique' => true,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'finderQuery' => '',
			'deleteQuery' => '',
			'insertQuery' => ''
			)
			);
			function identicalFieldValues( $field=array(), $compare_field=null )
			{
					
				foreach( $field as $key => $value ){
					//if(!empty(strstr(Router::url(),'edit'))) // TODO: Stylish please!!!!!!
					if($value !== Security::hash($this->data[$this->name][ $compare_field ],null, true)) {
						return FALSE;
					} else {
						continue;
					}
				}
				return TRUE;

			}
			function beforeSave() {
				/*
				 * Ensure that there is a value for the password,
				 * field it should be ignored if they are not
				 * providing a value (i.e. no update should take place)
				 */
				if (isset($this->data['User']['password']) && $this->data['User']['password'] <> '')
				{
					$this->data['User']['password'] = Security::hash($this->data['User']['password'], null, true);
					unset($this->data['User']['password']);
				}

				if (isset($this->data['User']['confirm_password']))
				{
					unset($this->data['User']['confirm_password']);
				}

				return true;
			}
}
?>