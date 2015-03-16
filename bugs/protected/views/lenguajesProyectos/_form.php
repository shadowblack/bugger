<?php
/* @var $this LenguajesProyectosController */
/* @var $model LenguajesProyectos */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'lenguajes-proyectos-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'id_pro'); ?>		
		<?php  echo $form->dropDownList($model,'id_pro',Proyectos::listProyectos(),array('empty'=>'-Seleccionar-'));?>
		<?php echo $form->error($model,'id_pro'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'id_len'); ?>		
		<?php  echo $form->dropDownList($model,'id_len',Lenguajes::listLenguajes(),array('empty'=>'-Seleccionar-'));?>
		<?php echo $form->error($model,'id_len'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->