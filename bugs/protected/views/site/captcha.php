<?php //http://stackoverflow.com/questions/6168451/how-to-refresh-captcha-image-on-page-refresh-load 
		if(CCaptcha::checkRequirements()): ?>
			<div class="row">
				<?php echo $form->labelEx($model,'verifyCode'); ?>
				<div>
				<?php $this->widget('CCaptcha'); ?>
				<?php echo $form->textField($model,'verifyCode'); ?>
				</div>
				<div class="hint">Please enter the letters as they are shown in the image above.
				<br/>Letters are not case-sensitive.</div>
				<?php echo $form->error($model,'verifyCode'); ?>
			</div>					
		<?php endif; ?>		