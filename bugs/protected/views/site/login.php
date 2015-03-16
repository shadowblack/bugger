<?php
/* @var $this SiteController */
/* @var $model LoginForm */
/* @var $form CActiveForm  */

/*$this->pageTitle='Acceso a la aplicación';
$this->breadcrumbs=array(
	'Login',
);*/
?>
<div class="logear">
	<h1 class="centrar">DATOS DEL ACCESO</h1>
	<p>Por favor complete el siguiente formulario con sus datos de acceso:</p>
	<div class="form">
	<?php $form=$this->beginWidget('CActiveForm', array(
		'id'=>'login-form',
		'enableClientValidation'=>false,
		'clientOptions'=>array(
			'validateOnSubmit'=>true,
		),
	)); ?>
	
		<p class="note">Las filas con <span class="required">*</span> son requeridas.</p>
	
		<div class="row">
			<?php echo $form->labelEx($model,'username'); ?>
			<?php echo $form->textField($model,'username'); ?>
			<?php echo $form->error($model,'username'); ?>
		</div>
	
		<div class="row">
			<?php echo $form->labelEx($model,'password'); ?>
			<?php echo $form->passwordField($model,'password'); ?>
			<?php echo $form->error($model,'password'); ?>
			<p class="hint">
				Ejemplo: <kbd>usuario@cadivi.gob.ve</kbd>.
			</p>
		</div>
		
		<?php
		// ...
		echo $this->renderPartial('captcha', array('model'=>$model,'form'=>$form));
		?>
				
		
	<!-- 
		<div class="row rememberMe">
			<?php #echo $form->checkBox($model,'rememberMe'); ?>
			<?php #echo $form->label($model,'rememberMe'); ?>
			<?php #echo $form->error($model,'rememberMe'); ?>
		</div>
	 -->
	
		<div class="row buttons centrar">
			<?php echo CHtml::submitButton('Acceder'); ?>
		</div>
	
	<?php $this->endWidget(); ?>	
	</div><!-- form -->
</div>

