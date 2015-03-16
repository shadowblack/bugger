<?php
/* @var $this DetallesErroresController */
/* @var $data DetallesErrores */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_det_err')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id_det_err), array('view', 'id'=>$data->id_det_err)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('num_inc')); ?>:</b>
	<?php echo CHtml::encode($data->num_inc); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tit_err')); ?>:</b>
	<?php echo CHtml::encode($data->tit_err); ?>
	<br />
	
	<b><?php echo CHtml::encode($data->getAttributeLabel('det_err')); ?>:</b>
	<?php echo CHtml::encode($data->det_err); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fec_reg')); ?>:</b>
	<?php echo CHtml::encode(Yii::app()->tiempo->fechaHoraSegundo($data->fec_reg)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_err')); ?>:</b>
	<?php echo CHtml::encode($data->id_err); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_usu')); ?>:</b>
	<?php echo CHtml::encode($data->idUsu->User->username); ?>
	<br />


</div>