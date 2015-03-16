<?php
/* @var $this ErroresController */
/* @var $model Errores */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	//'enableClientValidation'=>false,		
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id_err'); ?>
		<?php echo $form->textField($model,'id_err'); ?>
		<?php echo $form->error($model,'id_err'); ?>
		
	</div>

	<div class="row">
		<?php echo $form->label($model,'des_err'); ?>
		<?php echo $form->textField($model,'des_err',array('size'=>60,'maxlength'=>300)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fec_reg_from'); ?>
		<?php  
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
		<?php  
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

	<div class="row">
		<?php echo $form->label($model,'id_len_pro'); ?>		
		<?php  echo $form->dropDownList($model,'id_len_pro',LenguajesProyectos::listLenguejesProyectos(),array('empty'=>'-Seleccionar-'));?>
		<?php echo $form->error($model,'id_len_pro'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Buscar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->