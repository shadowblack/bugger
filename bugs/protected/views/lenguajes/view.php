<?php
/* @var $this LenguajesController */
/* @var $model Lenguajes */

$this->breadcrumbs=array(
	'Lenguajes'=>array('index'),
	$model->id_len,
);

$this->menu=array(
	array('label'=>'List Lenguajes', 'url'=>array('index')),
	array('label'=>'Create Lenguajes', 'url'=>array('create')),
	array('label'=>'Update Lenguajes', 'url'=>array('update', 'id'=>$model->id_len)),
	array('label'=>'Delete Lenguajes', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id_len),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Lenguajes', 'url'=>array('admin')),
);
?>

<h1>View Lenguajes #<?php echo $model->id_len; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id_len',
		'nom_len',
	),
)); ?>
