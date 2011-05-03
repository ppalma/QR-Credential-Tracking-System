<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<?php echo $this->Html->charset(); ?>
	<title>
		<?php __('CakePHP: the rapid development php framework:'); ?>
		<?php echo $title_for_layout; ?>
	</title>
	<?php
		echo $this->Html->meta('icon');
		echo $this->Html->css('cake.generic');

	//	echo $this->Html->css('estilo');
		echo $this->Html->css('debug');

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

<div id="container">
<table border=1>
		<!-- <div id="header">-->
			<?php echo 'Sistema Ejemplo Escuela Ingeniería en Computación';?>			
		<!--</div>  -->
		
		<!-- <div> -->	
			<?php //echo $menu->render($session->read('Menu.main'));?>
		<!--</div> 
		<div id="content"> -->
		<?php echo $this->Html->tableCells(array(
			//echo $this->Session->flash()
			$content_for_layout
			));
			

		 ?>

			

		<!--</div>
		<div id="footer"> -->
			<p align="center">Módulo Desarrollo de Sistemas 2011</p>
		<!-- </div> -->
</table>
</div>

<?php echo $this->element('sql_dump'); ?>
</body>
</html>