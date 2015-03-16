<?php
/* @var $this LenguajesProyectosController */
/* @var $model LenguajesProyectos */

$this->breadcrumbs=array(
	'Lenguajes Proyectoses'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List LenguajesProyectos', 'url'=>array('index')),
	array('label'=>'Create LenguajesProyectos', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('lenguajes-proyectos-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Lenguajes Proyectoses</h1>

<p>
You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'lenguajes-proyectos-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id_len_pro',
		array(
				'name' => 'id_pro',
				'value'=> '$data->idPro->nom_pro',
				'filter'=>Proyectos::listProyectos(),
		),
		array(
				'name' => 'id_len',
				'value'=> '$data->idLen->nom_len',
				'filter'=> Lenguajes::listLenguajes()
		),
		//'id_pro',
		//'id_len',		
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
