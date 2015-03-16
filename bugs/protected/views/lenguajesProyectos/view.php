<?php
/* @var $this LenguajesProyectosController */
/* @var $model LenguajesProyectos */

$this->breadcrumbs=array(
	'Lenguajes Proyectoses'=>array('index'),
	$model->id_len_pro,
);

$this->menu=array(
	array('label'=>'List LenguajesProyectos', 'url'=>array('index')),
	array('label'=>'Create LenguajesProyectos', 'url'=>array('create')),
	array('label'=>'Update LenguajesProyectos', 'url'=>array('update', 'id'=>$model->id_len_pro)),
	array('label'=>'Delete LenguajesProyectos', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id_len_pro),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage LenguajesProyectos', 'url'=>array('admin')),
);
?>

<h1>View LenguajesProyectos #<?php echo $model->id_len_pro; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(		
		array(
				'name' => 'id_pro',
				'value'=> $model->idPro->nom_pro,
		),
		array(
				'name' => 'id_len',
				'value'=> $model->idLen->nom_len,
		),		
		'id_len_pro',
	),
)); ?>
