<?php /* @var $this Controller */ ?>
<?php $this->beginContent('//layouts/main'); ?>
<div class="span-19">
	<div id="content">
		<?php echo $content; ?>
	</div><!-- content -->
</div>
<div class="span-5 last">
	<div id="sidebar">
	<?php
		$this->beginWidget('zii.widgets.CPortlet', array(
			'title'=>'Operaciones',
		));
		$this->widget('zii.widgets.CMenu', array(
			'items'=>$this->menu,
			'htmlOptions'=>array('class'=>'operations'),
		));
		$this->endWidget();
		
		/*$this->widget('zii.widgets.grid.CGridView', array(
				'id'=>'agents-grid',
				'dataProvider'=>Yii::app()->user->um->searchUsersByAuthItem('agent'),
				'columns'=>array(
						array('name'=>'username'),
						array('name'=>'email'),
						array('name'=>'userdescription'),    // este "magic" method esta descrito en el commit #f0a6268
				),
		));*/
	?>
	</div><!-- sidebar -->
</div>
<?php $this->endContent(); ?>