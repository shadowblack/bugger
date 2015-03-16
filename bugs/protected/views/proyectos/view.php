<?php
/* @var $this ProyectosController */
/* @var $model Proyectos */

$this->breadcrumbs=array(
	'Proyectoses'=>array('index'),
	$model->id_pro,
);

$this->menu=array(
	array('label'=>'List Proyectos', 'url'=>array('index')),
	array('label'=>'Create Proyectos', 'url'=>array('create')),
	array('label'=>'Update Proyectos', 'url'=>array('update', 'id'=>$model->id_pro)),
	array('label'=>'Delete Proyectos', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id_pro),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Proyectos', 'url'=>array('admin')),
);
?>

<h1>View Proyectos #<?php echo $model->id_pro; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id_pro',
		'nom_pro',
	),
)); ?>
