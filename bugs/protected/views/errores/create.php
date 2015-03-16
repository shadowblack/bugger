<?php
/* @var $this ErroresController */
/* @var $model Errores */
$this->pageTitle = 'Registrar Error';
$this->breadcrumbs=array(
	'Errores'=>array('index'),
	'Registrar',
);

$this->menu=array(
	array('label'=>'Listar Errores', 'url'=>array('index')),
	array('label'=>'Administrar Errores', 'url'=>array('admin')),
);
?>

<h1>Registrar Error</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>