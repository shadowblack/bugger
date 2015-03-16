<?php
/* @var $this ErroresController */
/* @var $model Errores */
$this->pageTitle = Yii::app()->name." Vista Errores";
$this->breadcrumbs=array(
	'Errores'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'Listar Errores', 'url'=>array('index')),
	array('label'=>'Crear Errores', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', 
	Yii::app()->mascaraEntrada->entrada('numeros',array('Errores[id_err]','Errores[id_len_pro]')).
"						
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
		
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('errores-grid', {		
		data: $(this).serialize(),
		//success:function(data,status){alert('hola')}
	});
	return false;
});
");
?>

<h1>Administrar Errores</h1>

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

<?php
	//http://help.discretelogix.com/php/yii/replace-text-box-with-drop-down-list-in-filter-of-cgridview.htm 
	//botones
	//http://www.internetria.com/blog/2013/01/22/cgridview-yii-framework/
	$this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'errores-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	//'filter'=>Errores::model(),
	'afterAjaxUpdate'=>'function(){'.Yii::app()->mascaraEntrada->entrada("numeros",array("Errores[id_err]","Errores[id_len_pro]")).'}',
	'columns'=>array(
		//'id_err',
		array(
		'name'=>'id_err',
				'type'=>'raw'
		//'filter'=>CHtml::listData(Post::model()->id_err, 'id', 'name')
		),
		'des_err',
		/*'fec_reg',*/
		array(
			'name'=>'fec_reg',
			//'header'=>'Fecha',
			'filter'=>'',
			'value'=>'Yii::app()->tiempo->fechaHoraSegundo($data->fec_reg)'			
		),
		array(
			'name'=>'id_len_pro',
			'value'=>'"(".$data->idLenPro->idLen->nom_len.") ".$data->idLenPro->idPro->nom_pro',
			'filter'=>LenguajesProyectos::listLenguejesProyectos()
		),
		array(
			'class'=>'CButtonColumn',			
		),		
	),	
)); ?>
