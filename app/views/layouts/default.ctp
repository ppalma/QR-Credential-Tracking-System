<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<?php echo $html->charset('ISO-8859-1'); 
echo $this->Html->css('estilo'); ?>
<body>

<div id="container">
		<div id="header">
			<h1 align="center">Sistema Ejemplo Escuela Ingeniería en Computación</h1>
		</div>
		<div id="content">

			<?php echo $this->Session->flash(); ?>

			<?php echo $content_for_layout; ?>

		</div>
		<div id="footer">
			<p align="center">Módulo Desarrollo de Sistemas 2011</p>
		</div>
</div>




</body>
</html>