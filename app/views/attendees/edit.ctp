<div class="attendees form">
<?php echo $this->Form->create('Attendee');?>
	<fieldset>
		<legend><?php __('Edit Attendee'); ?></legend>
	<?php
		echo $this->Form->input('id');
		echo $this->Form->input('type_id');
		echo $this->Form->input('rut');
		echo $this->Form->input('name');
		echo $this->Form->input('user');
		echo $this->Form->input('status');
	?>
	</fieldset>
<?php echo $this->Form->end(__('Submit', true));?>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>

		<li><?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $this->Form->value('Attendee.id')), null, sprintf(__('Are you sure you want to delete # %s?', true), $this->Form->value('Attendee.id'))); ?></li>
		<li><?php echo $this->Html->link(__('List Attendees', true), array('action' => 'index'));?></li>
		<li><?php echo $this->Html->link(__('List Types', true), array('controller' => 'types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Type', true), array('controller' => 'types', 'action' => 'add')); ?> </li>
	</ul>
</div>