<?php
/* @var $this LenguajesController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Lenguajes',
);

$this->menu=array(
	array('label'=>'Create Lenguajes', 'url'=>array('create')),
	array('label'=>'Manage Lenguajes', 'url'=>array('admin')),
);
?>

<h1>Lenguajes</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
