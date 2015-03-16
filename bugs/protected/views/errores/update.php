<?php
/* @var $this ErroresController */
/* @var $model Errores */

$this->breadcrumbs=array(
	'Errores'=>array('index'),
	$model->id_err=>array('view','id'=>$model->id_err),
	'Update',
);

$this->menu=array(
	array('label'=>'List Errores', 'url'=>array('index')),
	array('label'=>'Create Errores', 'url'=>array('create')),
	array('label'=>'View Errores', 'url'=>array('view', 'id'=>$model->id_err)),
	array('label'=>'Manage Errores', 'url'=>array('admin')),
);
?>

<h1>Update Errores <?php echo $model->id_err; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>