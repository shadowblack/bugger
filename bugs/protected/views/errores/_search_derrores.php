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
	//'action'=>'/errores/view',
		'action'=>Yii::app()->createUrl($this->route)."/".$model->id_err,
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
	
	<?php echo $form->hiddenField($model,'id_err'); ?>

	<div class="row">
		<?php echo $form->label($model,'id_usu'); ?>		
		<?php  echo $form->dropDownList($model,'id_usu',DetallesErrores::listUsuarios(),array('empty'=>'-Seleccionar-'));?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Buscar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->