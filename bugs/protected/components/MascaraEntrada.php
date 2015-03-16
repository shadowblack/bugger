<?php
/*
 * @author: Luis Marin
 * @date 06/04/2013
 * @descripcion: Mascara de insercion, para validar que datos deben entrar en los campos
 * */
	class MascaraEntrada extends CApplicationComponent{
				
		public function init(){
			
		}
		public function entrada($tipo,$selects=array()){
			$i=0;			
			foreach ($selects as $value){
				$i++;
				$selects[$i] = "[name='$value']";
			}			
			
			// event.keyCode 13 y 8: 13->enter, 8->borrar, 46->del
			
			if ($tipo == "numeros"){				
				//Yii::app()->clientScript->registerScript('mascaraentrada',
					return '					
			        jQuery("'.implode(",",$selects).'").keydown(function(event){
			        	console.debug(event.keyCode);						
				        if((event.keyCode < 48 || event.keyCode > 57 ) 
				        	&& (event.keyCode !=  13 && event.keyCode != 8 && event.keyCode !=  46)
				        	&& !(event.keyCode >= 96 && event.keyCode <= 105)
				        ){
				            return false;
				        }
				    });
					
					';
			    //',CClientScript::POS_READY); 
			}
		}
	}
?>