<?php
/* @var $this UsuariosController */
/* @var $model Usuarios */

$this->breadcrumbs=array(
	'Usuarioses'=>array('index'),
	$model->id_usu,
);

$this->menu=array(
	array('label'=>'List Usuarios', 'url'=>array('index')),
	array('label'=>'Create Usuarios', 'url'=>array('create')),
	array('label'=>'Update Usuarios', 'url'=>array('update', 'id'=>$model->id_usu)),
	array('label'=>'Delete Usuarios', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id_usu),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Usuarios', 'url'=>array('admin')),
);
?>

<h1>View Usuarios #<?php echo $model->id_usu; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id_usu',		
		'nom_usu',
		'ape_usu',
		array(
				'name'=>'fec_reg',
				'value'=>Yii::app()->tiempo->fechaHoraSegundo($model->fec_reg),				
		),
	),
)); ?>
