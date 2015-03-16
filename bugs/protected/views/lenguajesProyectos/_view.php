<?php
/* @var $this LenguajesProyectosController */
/* @var $data LenguajesProyectos */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_len_pro')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id_len_pro), array('view', 'id'=>$data->id_len_pro)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_pro')); ?>:</b>
	<?php echo CHtml::encode($data->id_pro); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_len')); ?>:</b>
	<?php echo CHtml::encode($data->id_len); ?>
	<br />


</div>