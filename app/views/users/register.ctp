<div class="users form">
<h2>Create an Account</h2>
<?php
echo $form->create('User', array('action' => 'register'));
echo $form->input('username');
echo $this->Form->input('email_address', array('between' => 'We need to send you a confirmation email to check you are human.'));
		echo $this->Form->input('password');
		
// Force the FormHelper to render a password field, and change the label.
/**

echo $form->input('group_id', array('type' => 'hidden', 'value' => 'Insert-Default-Value'));
echo $form->input('passwrd', array('type' => 'password', 'label' => 'Password'));
echo $form->input('email_address', array('between' => 'We need to send you a confirmation email to check you are human.'));

*/
echo $form->submit('Create Account');


echo $form->end();
?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('List Users', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Groups', true), array('controller' => 'groups', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Group', true), array('controller' => 'groups', 'action' => 'add')); ?> </li>
	</ul>
</div>