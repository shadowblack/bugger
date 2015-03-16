<?php
/*
 * @author: Luis Marin
 * @date 06/04/2013
 * @descripcion: Formatea los tiempo
 * */
	class Tiempo extends CApplicationComponent{
				
		public function init(){
			
		}
		public function fechaHoraSegundo($date){
			return date("d/m/Y H:i:s a",strtotime($date));
		}
	}
?>