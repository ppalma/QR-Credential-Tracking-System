<?php
class Attendee extends AppModel {
	var $name = 'Attendee';
	var $validate = array(
		'rut' => array(
			//	'required' => true,
			
			//	'length' => array( 'rule' => 'validateLength', 'min'=> 5, 'max' => 100 ),
	 			'validRut' => array('rule'=>'validateRut',	'message' => 'Invalid Rut',),
				'rutIsUnique' => array(
						'rule' => 'isUnique',
                		'required' => true,
                		'message' => 'The current RUT has been ussed'
                	),
				),
		'type_id' => array(
				'notempty' => array(
					'rule' => array('notempty'),
					'message' => 'Your custom message here',
					//'allowEmpty' => false,
					//'required' => false,
					//'last' => false, // Stop validation after this rule
					//'on' => 'create', // Limit validation to 'create' or 'update' operations
					),
				),
	);
	//The Associations below have been created with all possible keys, those that are not needed can be removed

	var $belongsTo = array(
		'Type' => array(
			'className' => 'Type',
			'foreignKey' => 'type_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
			),
			'User' => array(
			'className' => 'User',
			'foreignKey' => 'user_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
			)
			);
		
			function validateRut($value){

	
				$rut   =  str_replace(".", "", $value['rut']);
				
				list($a, $dv)   =  explode("-",$rut);

				// Valido el RUT
				if($this->dv($a)!=$dv){

					$valid = false;
				}else{
					$valid= true;
				}
				return $valid;
	
			}

			function dv($r){
				$s=1;for($m=0;$r!=0;$r/=10)$s=($s+$r%10*(9-$m++%6))%11;
				return chr($s?$s+47:75);
			}
}
?>