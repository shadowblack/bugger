<?php
/* @var $this ErroresController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Errores',
);

$this->menu=array(	
	array('label'=>'Registrar Error', 'url'=>array('create')),
	array('label'=>'Administrar Errores', 'url'=>array('admin')),
);
?>

<h1>Errores</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
