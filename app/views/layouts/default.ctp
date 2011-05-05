<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<?php echo $this->Html->charset(); ?>
<title><?php __('CakePHP: the rapid development php framework:'); ?> <?php echo $title_for_layout; ?>
</title>
<?php
echo $this->Html->meta('icon');
//	echo $this->Html->css('cake.generic');

echo $this->Html->css('contented4');

echo $this->Html->css('menu');
echo $scripts_for_layout;
?>
</head>


<!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html> -->
<?php
//echo $html->charset('ISO-8859-1');
//echo $this->Html->css('estilo');
?>
<body>
	<table border="2">
		<tr>
			<td colspan="3">
				<div id="header">
					<h1>
					<?php echo "QR-Credential-Tracking-System";?>
					</h1>
				</div> <?php echo $menu->render($session->read('Menu.main'));?>
			</td>
		</tr>

		<tr>
			<td>Some info</td>
			<td>
				<div id="content">
				<?php echo $this->Session->flash(); ?>
				<?php echo  $content_for_layout; ?>
				</div>
			</td>
			<td>More info</td>
		</tr>

		<tr>
			<td colspan="3">
				<div id="footer">
				<?php echo $this->Html->link(
				$this->Html->image('cake.power.gif', array('alt'=> __('CakePHP: the rapid development php framework', true), 'border' => '0')),
					'http://www.cakephp.org/',
				array('target' => '_blank', 'escape' => false)
				);
				?>
				</div>
			</td>
		</tr>
	</table>
	<?php echo $this->element('sql_dump'); ?>
</body>
</html>
