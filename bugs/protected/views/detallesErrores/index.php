<?php
/* @var $this DetallesErroresController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Detalles Errores',
);

$this->menu=array(
	array('label'=>'Create DetallesErrores', 'url'=>array('create')),
	array('label'=>'Manage DetallesErrores', 'url'=>array('admin')),
);
?>

<h1>Detalles Errores</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
