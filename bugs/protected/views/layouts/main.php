<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="es">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<?php echo Yii::app()->charset?>"  />
	<meta name="language" content="es" />

	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/screen.css" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/print.css" media="print" />
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/ie.css" media="screen, projection" />
	<![endif]-->

	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/cadivi/main.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css" />
	

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<body>		
	<div id="admin_container" style=""> 
		 
	    <div id="admin_header">
  			<a href="principal">
		    	<table border="1" cellpadding="0" cellspacing="0" style="margin: 0px; padding: 0px; width: 100%;">
		    		<tr>
		    			<td style="margin: 0px; padding: 0px;"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/cadivi/header/logo_mef.png" style="float: left"/></td>
		    			<td>&nbsp;</td>
		    			<td style="margin: 0px; padding: 0px;"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/cadivi/header/ahora_es_de_todos.png" style="float: right;"/></td>
		    		</tr>
		    	</table>
	  			<table border="0" cellpadding="0" cellspacing="0" style="margin: 0px; padding: 0px; width: 100%;">
	  				<tr>
	  					<td style="margin: 0px; padding: 0px;  background:url('<?php echo Yii::app()->request->baseUrl; ?>/images/cadivi/header/barra_portalsistemas2.gif') repeat-x"><img src="/bugger/bugs/images/cadivi/header/barra_portalsistemas1.gif" style="float: left;"/></td>
	  					<td style="margin: 0px; padding: 0px;  background:url('<?php echo Yii::app()->request->baseUrl; ?>/images/cadivi/header/barra_portalsistemas2.gif') repeat-x"><img src="/bugger/bugs/images/cadivi/header/barra_portalsistemas3.gif" style="float: right;"/></td>
	  				</tr>
	  			</table>
	  			<div class='title-style'><?php echo CHtml::encode(Yii::app()->name); ?></div>
	  			
	  			<table border="0" cellpadding="0" cellspacing="0" style="margin: 0px; padding: 0px; width: 100%;">
	  				<tr>
	  					<td style="margin: 0px; padding: 0px; padding-top: 4px;" colspan="3">
	  						<fieldset class="" style=" border: 0px;">
	            				<h2 align="right">
	            					<table cellpadding="0" cellspacing="0" border="0" style="background: #3B5984; width: 100%; margin: 0px; padding: 0px;">
	            						<tr  style="background: #3B5984;">
	            							<?php if (!Yii::app()->user->isGuest):?>
	            							<td  style="background: #3B5984; text-align: left; padding: 2px;width:250px"><?php echo "Bienvenido: '".Yii::app()->user->getState('nombre')."'"?></td>	            								            							            								            							
	            							<td  style="background: #3B5984; text-align: left; padding: 2px;"><?php echo "Nombre: '".Yii::app()->user->name."'"; ?></td>
	            							<?php endif?>
	            							<td  style="background: #3B5984; text-align: right; padding: 2px;"><?php echo date("d/m/Y"); ?></td>
	            						</tr>
	            					</table>
	            				</h2>
	            			</fieldset>
	  					</td>
	  				</tr>
	  			</table>
  			
  			</a>		
  			<?php if (!Yii::app()->user->isGuest):?>
	  			<div id="mainmenu">
				<?php $this->widget('zii.widgets.CMenu',array(
					'items'=>array(
						array('label'=>'Administrar Usuarios'
									, 'url'=>Yii::app()->user->ui->userManagementAdminUrl
									, 'visible'=>!Yii::app()->user->isGuest),
						array('label'=>'Login'
								, 'url'=>Yii::app()->user->ui->loginUrl
								, 'visible'=>Yii::app()->user->isGuest),						
						array('label'=>'Usuarios', 'url'=>array('/usuarios/admin')),
						array('label'=>'Errores', 'url'=>array('/errores/admin')),						
						array('label'=>'Lenguajes', 'url'=>array('/lenguajes/admin')),
						array('label'=>'Proyectos', 'url'=>array('/proyectos/admin')),
						array('label'=>'Lenguajes y Proyectos', 'url'=>array('/lenguajesProyectos/admin')),
						//array('label'=>'Logout ('.Yii::app()->user->name.')', 'url'=>array('/site/logout'), 'visible'=>!Yii::app()->user->isGuest),
						array('label'=>'Logout ('.Yii::app()->user->name.')'
								, 'url'=>Yii::app()->user->ui->logoutUrl
								, 'visible'=>!Yii::app()->user->isGuest),
					),
						
				/*
				 * array('label'=>'Home', 'url'=>array('/site/index')),
				array('label'=>'About', 'url'=>array('/site/page', 'view'=>'about')),
				array('label'=>'Contact', 'url'=>array('/site/contact')),
				array('label'=>'Login', 'url'=>array('/site/login'), 'visible'=>Yii::app()->user->isGuest),
				array('label'=>'Logout ('.Yii::app()->user->name.')', 'url'=>array('/site/logout'), 'visible'=>!Yii::app()->user->isGuest)
				 * */
				)); ?>
			
	</div><!-- mainmenu -->	
	<?php endif;?>    			
	    	<div id="indicator" style="display:none"></div>
		</div>
						
		<div id="include_content">
			<h1 align="center"><?php echo CHtml::encode($this->pageTitle); ?></h1>
			<?php if(isset($this->breadcrumbs)):?>
				<?php $this->widget('zii.widgets.CBreadcrumbs', array(
					'links'=>$this->breadcrumbs,
				)); ?><!-- breadcrumbs -->
			<?php endif?>	
			<?php echo Yii::app()->user->ui->displayErrorConsole(); ?>						
			<?php echo $content; ?>
		</div>
		
		<div id="admin_footer">
			<div class="admin_edit_help">
				<?php echo ('Comisión de Administración de Divisas') ?><br>
				<?php echo 'Ministerio del Poder Popular de Planificación y Finanzas' ?>
			</div>
		</div>
		 
	</div>		
</body>
</html>
