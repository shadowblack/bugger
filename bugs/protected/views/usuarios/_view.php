<?php
/* @var $this UsuariosController */
/* @var $data Usuarios */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_usu')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id_usu), array('view', 'id'=>$data->id_usu)); ?>
	<br />	

	<b><?php echo CHtml::encode($data->getAttributeLabel('nom_usu')); ?>:</b>
	<?php echo CHtml::encode($data->nom_usu); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ape_usu')); ?>:</b>
	<?php echo CHtml::encode($data->ape_usu); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fec_reg')); ?>:</b>
	<?php echo CHtml::encode($data->getFechaRegistro()); ?>
	<br />	


</div>