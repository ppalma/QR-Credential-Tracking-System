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
				//if(!empty(strstr(Router::url(),'edit'))) // TODO: Stylish please!!!!!!
				{
					foreach( $field as $key => $value ){

						if($value !== Security::hash($this->data[$this->name][ $compare_field ],null, true)) {
							return FALSE;
						} else {
							continue;
						}
					}
				
				return TRUE;
				}
			}
}
?>