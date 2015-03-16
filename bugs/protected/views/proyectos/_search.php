<?php
/* @var $this ProyectosController */
/* @var $model Proyectos */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id_pro'); ?>
		<?php echo $form->textField($model,'id_pro'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'nom_pro'); ?>
		<?php echo $form->textField($model,'nom_pro',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->