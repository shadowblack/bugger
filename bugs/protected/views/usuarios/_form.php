<?php
/* @var $this UsuariosController */
/* @var $model Usuarios */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'usuarios-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>
	<!-- 
	<div class="row">
		<?php #echo $form->labelEx($model,'login_usu'); ?>
		<?php #echo $form->textField($model,'login_usu',array('size'=>50,'maxlength'=>50)); ?>
		<?php #echo $form->error($model,'login_usu'); ?>
	</div>
	 -->

	<div class="row">
		<?php echo $form->labelEx($model,'nom_usu'); ?>
		<?php echo $form->textField($model,'nom_usu',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'nom_usu'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'ape_usu'); ?>
		<?php echo $form->textField($model,'ape_usu',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'ape_usu'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($model,'id_usu'); ?>
		<?php  echo $form->dropDownList($model,'iduser',Usuarios::listUser(),array('empty'=>'-Seleccionar-'));?>
		<?php echo $form->error($model,'id_usu'); ?>
	</div>	
	
	<!--
	<div class="row">
		<?php #echo $form->labelEx($model,'fec_reg'); ?>
		<?php #echo $form->textField($model,'fec_reg'); 
			/*$this->widget('zii.widgets.jui.CJuiDatePicker', array(
				'name' => 'fec_reg',
				'language' => 'es',
				//'value' => $fromDateValue,
				'htmlOptions' => array(
					'size' => '10',         // textField size
					'maxlength' => '10',    // textField maxlength
				),
			));*/
		?>
		<?php #echo $form->error($model,'fec_reg'); ?>
	</div>
	
	<div class="row">
		<?php #echo $form->labelEx($model,'pas_usu'); ?>
		<?php #echo $form->passwordField($model,'pas_usu',array('size'=>60,'maxlength'=>150)); ?>		
		<?php #echo $form->error($model,'pas_usu'); ?>
	</div>
	
	<div class="row">
		<?php #echo $form->labelEx($model,'repeat_pass'); ?>		
		<?php #echo $form->passwordField($model,'repeat_pass',array('size'=>60,'maxlength'=>150)); ?>
		<?php #echo $form->error($model,'repeat_pass'); ?>
	</div>
	-->
	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->