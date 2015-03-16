<?php
/* @var $this DetallesErroresController */
/* @var $model DetallesErrores */
/* @var $form CActiveForm */
?>

<div class="wide form">
<?php 
//echo $ruta;

?>
<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
	'enableAjaxValidation'=>true,
		
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id_det_err'); ?>
		<?php echo $form->textField($model,'id_det_err'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'num_inc'); ?>
		<?php echo $form->textField($model,'num_inc'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'det_err'); ?>
		<?php echo $form->textArea($model,'det_err',array('rows'=>6, 'cols'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fec_reg'); ?>
		<?php echo $form->textField($model,'fec_reg'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'id_err'); ?>
		<?php echo $form->textField($model,'id_err'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'id_usu'); ?>
		<?php echo $form->textField($model,'id_usu'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->