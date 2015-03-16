<?php
/* @var $this LenguajesProyectosController */
/* @var $model LenguajesProyectos */

$this->breadcrumbs=array(
	'Lenguajes Proyectoses'=>array('index'),
	$model->id_len_pro=>array('view','id'=>$model->id_len_pro),
	'Update',
);

$this->menu=array(
	array('label'=>'List LenguajesProyectos', 'url'=>array('index')),
	array('label'=>'Create LenguajesProyectos', 'url'=>array('create')),
	array('label'=>'View LenguajesProyectos', 'url'=>array('view', 'id'=>$model->id_len_pro)),
	array('label'=>'Manage LenguajesProyectos', 'url'=>array('admin')),
);
?>

<h1>Update LenguajesProyectos <?php echo $model->id_len_pro; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>