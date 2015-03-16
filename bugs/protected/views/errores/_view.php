<?php
/* @var $this ErroresController */
/* @var $data Errores */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_err')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id_err), array('view', 'id'=>$data->id_err)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('des_err')); ?>:</b>
	<?php echo CHtml::encode($data->des_err); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fec_reg')); ?>:</b>
	<?php echo CHtml::encode(Yii::app()->tiempo->fechaHoraSegundo($data->fec_reg)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_len_pro')); ?>:</b>
	<?php echo CHtml::encode($data->idLenPro->idLen->nom_len)." / ".CHtml::encode($data->idLenPro->idPro->nom_pro); ?>
	<br />
	
	
	<?php 
		foreach($data->detallesErrores as $objetos){
			?>
			<div class="view">						
					<?php echo CHtml::link('Ver Error', array('/detalleserrores/view', 'id'=>$objetos->id_det_err));?>
					<br />
				
					<b><?php echo CHtml::encode(DetallesErrores::model()->getAttributeLabel('num_inc')); ?>:</b>
					<?php echo CHtml::encode($objetos->num_inc); ?>
					<br />
				
					<b><?php echo CHtml::encode(DetallesErrores::model()->getAttributeLabel('det_err')); ?>:</b>
					<?php echo CHtml::encode($objetos->tit_err); ?>
					<br />
				
					<b><?php echo CHtml::encode(DetallesErrores::model()->getAttributeLabel('fec_reg')); ?>:</b>
					<?php echo CHtml::encode(Yii::app()->tiempo->fechaHoraSegundo($objetos->fec_reg)); ?>
					<br />
				
					<b><?php echo CHtml::encode(DetallesErrores::model()->getAttributeLabel('id_err')); ?>:</b>
					<?php echo CHtml::encode($objetos->id_err); ?>
					<br />
									
			</div><?php 
		}
	?>		
</div>