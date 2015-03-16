<?php
/* @var $this LenguajesProyectosController */
/* @var $model LenguajesProyectos */

$this->breadcrumbs=array(
	'Lenguajes Proyectoses'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List LenguajesProyectos', 'url'=>array('index')),
	array('label'=>'Manage LenguajesProyectos', 'url'=>array('admin')),
);
?>

<h1>Create LenguajesProyectos</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>