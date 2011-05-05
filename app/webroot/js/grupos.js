$(document).ready(function() {

				$("#GroupGroup ").asmSelect({
addItemTarget: 'bottom',
animate: true,
highlight: true,
sortable: true

}).after($("<a href='#'>Seleccionar todos</a>").click(function() {
				$("#GroupGroup").children().attr("selected", "selected").end().change();
				return false;
				})); 


				}); 


