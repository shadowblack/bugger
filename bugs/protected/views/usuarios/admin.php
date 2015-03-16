<?php
/* @var $this UsuariosController */
/* @var $model Usuarios */

$this->breadcrumbs=array(
	'Usuarios'=>array('index'),
	'Administrar',
);

$this->menu=array(
	array('label'=>'List Usuarios', 'url'=>array('index')),
	array('label'=>'Create Usuarios', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search',
Yii::app()->mascaraEntrada->entrada("numeros",array("Usuarios[id_usu]")). 
"
$('.search-button').click(function(){		
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){	
	$.fn.yiiGridView.update('usuarios-grid', {
		data: $(this).serialize(),
		type: 'POST'
	});
	return false;
});
");
?>

<h1>Administrar Usuarios</h1>

<p>
Si lo desea, puede introducir un operador de comparación (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
ó <b>=</b>) al comienzo de cada uno de los valores de su búsqueda para especificar cómo la comparación debe hacerse.
</p>

<?php echo CHtml::link('Búsqueda avanzada','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'usuarios-grid',
	'afterAjaxUpdate'=>'function(){'.Yii::app()->mascaraEntrada->entrada("numeros",array("Usuarios[id_usu]")).'}',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id_usu',		
		'nom_usu',
		'ape_usu',
		//'fec_reg',
		Array(
			'name'=>'fec_reg',
			'header'=>'Fecha Creación',
			'value'=>'Yii::app()->tiempo->fechaHoraSegundo($data->fec_reg)',
			'filter'=>''
		),
		//'pas_usu',
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
