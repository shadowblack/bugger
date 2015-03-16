<?php
/* @var $this DetallesErroresController */
/* @var $model DetallesErrores */

$this->breadcrumbs=array(
	'Detalles Errores'=>array('index'),
	$model->id_det_err=>array('view','id'=>$model->id_det_err),
	'Update',
);

$this->menu=array(
	array('label'=>'List DetallesErrores', 'url'=>array('index')),
	array('label'=>'Create DetallesErrores', 'url'=>array('create')),
	array('label'=>'View DetallesErrores', 'url'=>array('view', 'id'=>$model->id_det_err)),
	array('label'=>'Manage DetallesErrores', 'url'=>array('admin')),
);
?>

<h1>Update DetallesErrores <?php echo $model->id_det_err; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>