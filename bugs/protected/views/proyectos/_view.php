<?php
/* @var $this ProyectosController */
/* @var $data Proyectos */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_pro')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id_pro), array('view', 'id'=>$data->id_pro)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nom_pro')); ?>:</b>
	<?php echo CHtml::encode($data->nom_pro); ?>
	<br />


</div>