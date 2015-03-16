<?php
/* @var $this ErroresController */
/* @var $model Errores */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'errores-form',
	//'enableAjaxValidation'=>true,
)); ?>

	<p class="note">Las filas con <span class="required">*</span> son requeridas.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'des_err'); ?>
		<?php echo $form->textField($model,'des_err',array('size'=>60,'maxlength'=>300)); ?>
		<?php echo $form->error($model,'des_err'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($model,'id_len_pro'); ?>
		<?php  echo $form->dropDownList($model,'id_len_pro',LenguajesProyectos::listLenguejesProyectos(),array('empty'=>'-Seleccionar-'));?>
		<?php echo $form->error($model,'id_len_pro'); ?>
	</div>

	<!-- 
	<div class="row">
		<?php #echo $form->labelEx($model,'fec_reg'); ?>
		<?php #echo $form->textField($model,'fec_reg'); ?>
		<?php #echo $form->error($model,'fec_reg'); ?>
	</div>

	<div class="row">
		<?php #echo $form->labelEx($model,'id_len_pro'); ?>
		<?php #echo $form->textField($model,'id_len_pro'); ?>
		<?php #echo $form->error($model,'id_len_pro'); ?>
	</div>
	 -->

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Registrar' : 'Modificar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->