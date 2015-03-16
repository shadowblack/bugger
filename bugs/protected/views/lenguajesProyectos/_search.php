<?php
/* @var $this LenguajesProyectosController */
/* @var $model LenguajesProyectos */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id_pro'); ?>
		<?php  echo $form->dropDownList($model,'id_pro',Proyectos::listProyectos(),array('empty'=>'-Seleccionar-'));?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'id_len'); ?>
		<?php  echo $form->dropDownList($model,'id_len',Lenguajes::listLenguajes(),array('empty'=>'-Seleccionar-'));?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'id_len_pro'); ?>
		<?php echo $form->textField($model,'id_len_pro'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->