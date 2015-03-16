<?php
/* @var $this LenguajesController */
/* @var $model Lenguajes */

$this->breadcrumbs=array(
	'Lenguajes'=>array('index'),
	$model->id_len=>array('view','id'=>$model->id_len),
	'Update',
);

$this->menu=array(
	array('label'=>'List Lenguajes', 'url'=>array('index')),
	array('label'=>'Create Lenguajes', 'url'=>array('create')),
	array('label'=>'View Lenguajes', 'url'=>array('view', 'id'=>$model->id_len)),
	array('label'=>'Manage Lenguajes', 'url'=>array('admin')),
);
?>

<h1>Update Lenguajes <?php echo $model->id_len; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>