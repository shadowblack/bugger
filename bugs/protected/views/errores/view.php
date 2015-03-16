<?php
/* @var $this ErroresController */
/* @var $model Errores */
$this->breadcrumbs=array(
	'Errores'=>array('index'),
	$model->id_err,
);

$this->menu=array(
	array('label'=>'Listar Errores', 'url'=>array('index')),
	array('label'=>'Registrar Error', 'url'=>array('create')),
	array('label'=>'Actualizar Error', 'url'=>array('update', 'id'=>$model->id_err)),
	array('label'=>'Borrar Error', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id_err),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Administrar Errores', 'url'=>array('admin')),
);
?>

<h1>Ver Errores #<?php echo $model->id_err; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id_err',
		'des_err',		
		array(
				'name'=>'fec_reg',
				'value'=>Yii::app()->tiempo->fechaHoraSegundo($model->fec_reg),				
		),
		array(
				'name'=>'id_len_pro',
				'value'=>$model->idLenPro->idLen->nom_len." / ".$model->idLenPro->idPro->nom_pro,
		),		
	),
)); ?>


<?php 
Yii::app()->clientScript->registerScript('search', 
Yii::app()->mascaraEntrada->entrada('numeros',array('DetallesErrores[id_det_err]','DetallesErrores[num_inc]'))."
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('detalles-errores-grid', {		
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Administrar los detalles del error</h1>

<p>
Si lo desea, puede introducir un operador de comparación (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
ó <b>=</b>) al comienzo de cada uno de los valores de su búsqueda para especificar cómo la comparación debe hacerse.
</p>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<br />
<?php echo CHtml::link('Crear un detalle de error',array('/detallesErrores/create/'.$model->id_err)); ?>
<div class="search-form" style="display:none">
<?php 	
	$ruta = $this->renderPartial('/errores/_search_derrores',array(
	'model'=>$detalles_errores,
)); ?>
</div><!-- search-form -->

<?php 
	
	$this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'detalles-errores-grid',
	'dataProvider'=>$detalles_errores->search(),
	'filter'=>DetallesErrores::model(),
	'afterAjaxUpdate'=>'function(){'.Yii::app()->mascaraEntrada->entrada("numeros",array("'DetallesErrores[id_det_err]','DetallesErrores[num_inc]'")).'}',
	'columns'=>array(
		'id_det_err',
		'num_inc',		
		array(
				'type'=>'html',
				'name'=>'det_err',
				'value'=>'$data->det_err',				
		),
		array(
				'name'=>'fec_reg',
				'value'=>'Yii::app()->tiempo->fechaHoraSegundo($data->fec_reg)',			
				'filter'=>''
		),
		array(
				'name'=>'id_usu',
				'value'=>'$data->idUsu->User->username',
				'filter'=>DetallesErrores::listUsuarios()
		),
		array(
			'class'=>'CButtonColumn',
			'updateButtonUrl'=>'Yii::app()->createUrl("/detalleserrores/update/$data->id_det_err" )',
			'deleteButtonUrl'=>'Yii::app()->createUrl("/detalleserrores/delete/$data->id_det_err" )',
			'viewButtonUrl'=>'Yii::app()->createUrl("/detalleserrores/view/$data->id_det_err" )',
		),
	),
)); ?>
