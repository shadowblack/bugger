<?php
/* @var $this DetallesErroresController */
/* @var $model DetallesErrores */

$this->breadcrumbs=array(
	'Errores'=>array('/errores/admin'),
	'Detalles Errores'=>array('index'),
	$model->id_det_err,
);

$this->menu=array(
	array('label'=>'List DetallesErrores', 'url'=>array('index')),
	array('label'=>'Create DetallesErrores', 'url'=>array('/detallesErrores/create/'.$model->id_err)),
	array('label'=>'Update DetallesErrores', 'url'=>array('update', 'id'=>$model->id_det_err)),
	array('label'=>'Delete DetallesErrores', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id_det_err),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage DetallesErrores', 'url'=>array('admin')),
);
?>

<h1>View DetallesErrores #<?php echo $model->id_det_err; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id_det_err',
		'num_inc',
		'tit_err',		
		array(
				'type'=>'html',
				'name'=>'det_err',
				'value'=>$model->det_err
		),
		array(
			'name'=>'fec_reg',
			'value'=>Yii::app()->tiempo->fechaHoraSegundo($model->fec_reg)
		),
		'id_err',
		array(
				'name'=>'id_usu',
				'value'=>$model->idUsu->User->username
		),
	),
)); ?>
