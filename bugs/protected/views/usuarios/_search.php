<?php
/* @var $this UsuariosController */
/* @var $model Usuarios */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'post',
));?>

	<div class="row">
		<?php echo $form->label($model,'id_usu'); ?>
		<?php echo $form->textField($model,'id_usu'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'nom_usu'); ?>
		<?php echo $form->textField($model,'nom_usu',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'ape_usu'); ?>
		<?php echo $form->textField($model,'ape_usu',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fec_reg_from'); ?>				
		<?php #echo $form->textField($model,'fec_reg_from'); 
				$this->widget('zii.widgets.jui.CJuiDatePicker', array(
					'model'=> $model,
					'attribute' => 'fec_reg_from',					
					'language' => 'es',					
					'htmlOptions' => array(
						'size' => '10',         // textField size
						'maxlength' => '10',    // textField maxlength
						'readonly'=>'readonly'
					),
				));
		?>
	</div>
	<div class="row">
		<?php echo $form->label($model,'fec_reg_to'); ?>				
		<?php #echo $form->textField($model,'fec_reg_to'); 
				$this->widget('zii.widgets.jui.CJuiDatePicker', array(
					'model'=> $model,
					'attribute' => 'fec_reg_to',					
					'language' => 'es',					
					'htmlOptions' => array(
						'size' => '10',         // textField size
						'maxlength' => '10',    // textField maxlength
						'readonly'=>'readonly'
					),
				));
		?>
	</div>	

	<div class="row buttons">
		<?php echo CHtml::submitButton('Buscar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->