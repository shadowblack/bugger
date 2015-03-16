<?php
/* @var $this DetallesErroresController */
/* @var $model DetallesErrores */

$this->breadcrumbs=array(
	'Detalles Errores'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List DetallesErrores', 'url'=>array('index')),
	array('label'=>'Manage DetallesErrores', 'url'=>array('admin')),
);
?>

<h1>Create DetallesErrores</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>