<?php
/* @var $this ProyectosController */
/* @var $model Proyectos */

$this->breadcrumbs=array(
	'Proyectoses'=>array('index'),
	$model->id_pro=>array('view','id'=>$model->id_pro),
	'Update',
);

$this->menu=array(
	array('label'=>'List Proyectos', 'url'=>array('index')),
	array('label'=>'Create Proyectos', 'url'=>array('create')),
	array('label'=>'View Proyectos', 'url'=>array('view', 'id'=>$model->id_pro)),
	array('label'=>'Manage Proyectos', 'url'=>array('admin')),
);
?>

<h1>Update Proyectos <?php echo $model->id_pro; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>