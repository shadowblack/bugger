<?php
/* @var $this LenguajesController */
/* @var $data Lenguajes */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_len')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id_len), array('view', 'id'=>$data->id_len)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nom_len')); ?>:</b>
	<?php echo CHtml::encode($data->nom_len); ?>
	<br />


</div>