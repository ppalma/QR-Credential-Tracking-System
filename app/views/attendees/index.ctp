<div class="attendees index">
	<h2><?php __('Attendees');?></h2>
	<table cellpadding="0" cellspacing="0">
	<tr>
			<th><?php echo $this->Paginator->sort('id');?></th>
			<th><?php echo $this->Paginator->sort('type_id');?></th>
			<th><?php echo $this->Paginator->sort('rut');?></th>
			<th><?php echo $this->Paginator->sort('name');?></th>
			<th><?php echo $this->Paginator->sort('user');?></th>
			<th><?php echo $this->Paginator->sort('status');?></th>
			<th class="actions"><?php __('Actions');?></th>
	</tr>
	<?php
	$i = 0;
	foreach ($attendees as $attendee):
		$class = null;
		if ($i++ % 2 == 0) {
			$class = ' class="altrow"';
		}
	?>
	<tr<?php echo $class;?>>
		<td><?php echo $attendee['Attendee']['id']; ?>&nbsp;</td>
		<td>
			<?php echo $this->Html->link($attendee['Type']['name'], array('controller' => 'types', 'action' => 'view', $attendee['Type']['id'])); ?>
		</td>
		<td><?php echo $attendee['Attendee']['rut']; ?>&nbsp;</td>
		<td><?php echo $attendee['Attendee']['name']; ?>&nbsp;</td>
		<td><?php echo $attendee['Attendee']['user']; ?>&nbsp;</td>
		<td><?php echo $attendee['Attendee']['status']; ?>&nbsp;</td>
		<td class="actions">
			<?php echo $this->Html->link(__('View', true), array('action' => 'view', $attendee['Attendee']['id'])); ?>
			<?php echo $this->Html->link(__('Edit', true), array('action' => 'edit', $attendee['Attendee']['id'])); ?>
			<?php echo $this->Html->link(__('Delete', true), array('action' => 'delete', $attendee['Attendee']['id']), null, sprintf(__('Are you sure you want to delete # %s?', true), $attendee['Attendee']['id'])); ?>
		</td>
	</tr>
<?php endforeach; ?>
	</table>
	<p>
	<?php
	echo $this->Paginator->counter(array(
	'format' => __('Page %page% of %pages%, showing %current% records out of %count% total, starting on record %start%, ending on %end%', true)
	));
	?>	</p>

	<div class="paging">
		<?php echo $this->Paginator->prev('<< ' . __('previous', true), array(), null, array('class'=>'disabled'));?>
	 | 	<?php echo $this->Paginator->numbers();?>
 |
		<?php echo $this->Paginator->next(__('next', true) . ' >>', array(), null, array('class' => 'disabled'));?>
	</div>
</div>
<div class="actions">
	<h3><?php __('Actions'); ?></h3>
	<ul>
		<li><?php echo $this->Html->link(__('New Attendee', true), array('action' => 'add')); ?></li>
		<li><?php echo $this->Html->link(__('List Types', true), array('controller' => 'types', 'action' => 'index')); ?> </li>
		<li><?php echo $this->Html->link(__('New Type', true), array('controller' => 'types', 'action' => 'add')); ?> </li>
	</ul>
</div>