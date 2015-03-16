<?php
/* @var $this LenguajesController */
/* @var $model Lenguajes */

$this->breadcrumbs=array(
	'Lenguajes'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Lenguajes', 'url'=>array('index')),
	array('label'=>'Manage Lenguajes', 'url'=>array('admin')),
);
?>

<h1>Create Lenguajes</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>