<?php
/* @var $this LenguajesController */
/* @var $model Lenguajes */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id_len'); ?>
		<?php echo $form->textField($model,'id_len'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'nom_len'); ?>
		<?php echo $form->textField($model,'nom_len',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->