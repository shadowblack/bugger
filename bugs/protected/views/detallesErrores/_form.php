<?php
/* @var $this DetallesErroresController */
/* @var $model DetallesErrores */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'detalles-errores-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php
	$model->id_usu = Yii::app()->user->getState('id_usu'); 
	echo $form->errorSummary($model); 
	?>

	<div class="row">
		<?php echo $form->labelEx($model,'num_inc'); ?>
		<?php echo $form->textField($model,'num_inc'); ?>
		<?php echo $form->error($model,'num_inc'); ?>
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($model,'tit_err'); ?>
		<?php echo $form->textField($model,'tit_err'); ?>
		<?php echo $form->error($model,'tit_err'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'det_err'); ?>
		<?php //echo $form->textArea($model,'det_err',array('rows'=>6, 'cols'=>50)); 
			$this->widget('application.extensions.cleditor.ECLEditor', array(
					'model'=>$model,					
					'attribute'=>'det_err',
					'options'=>array(
							'width'=>'800',
							'height'=>'300',
							'useCSS'=>true,
					),
			));
		?>
		<?php echo $form->error($model,'det_err'); ?>
	</div>

	<?php echo $form->hiddenField($model,'id_err'); ?>

	<?php echo $form->hiddenField($model,'id_usu'); ?>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Crear' : 'Guardar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->