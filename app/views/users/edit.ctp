<?php
echo $this->Html->css('jquery.asmselect');
echo $javascript->link('jquery');
echo $javascript->link('jquery.ui');
echo $javascript->link('jquery.asmselect');


echo $javascript->link('grupos');

?>

<div class="users form">
<?php echo $this->Form->create('User');?>
	<fieldset>
		<legend><?php __('Edit User'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('username');
		echo $this->Form->input('email_address');
		echo $this->Form->input('password', array('autocomplete'=>'off','value' => ''));
		echo $this->Form->input('confirm_password',array('type' => 'password', 'label' => 'Confirm Password','value' => '','autocomplete'=>'off') );
		
		echo $this->Form->input('active',array('type'=>'select','options'=>array(  '0'=>'No', '1'=>'Yes'  )));
		echo $this->Form->input('rut');
		echo $this->Form->input('name_user');
		echo $this->Form->input('institution');
		echo $this->Form->input('Group');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $this->Form->value('User.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $this->Form->value('User.id'))); ?></li>
		<li><?php echo $this->Html->link(__('List Users', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Groups', true), array('controller' => 'groups', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Group', true), array('controller' => 'groups', 'action' => 'add')); ?> </li>
	</ul>
</div>