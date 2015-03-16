<?php

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
class UserIdentity extends CUserIdentity
{
	private $_id;
	/**
	 * Authenticates a user.
	 * The example implementation makes sure if the username and password
	 * are both 'demo'.
	 * In practical applications, this should be changed to authenticate
	 * against some persistent user identity storage (e.g. database).
	 * @return boolean whether authentication succeeds.
	 */
	public function authenticate()
	{
		/*$users=array(
			// username => password
			'demo'=>'demo',
			'admin'=>'admin',
		);
		if(!isset($users[$this->username]))
			$this->errorCode=self::ERROR_USERNAME_INVALID;
		else if($users[$this->username]!==$this->password)
			$this->errorCode=self::ERROR_PASSWORD_INVALID;
		else
			$this->errorCode=self::ERROR_NONE;
		return !$this->errorCode;*/	
				
		$usuario = Usuarios::model()->find("LOWER(login_usu) = ? ",array(strtolower($this->username)));		
		if ($usuario === null) {
			$this->errorCode=self::ERROR_USERNAME_INVALID;			
		} else if(!$usuario->validatePassword($this->password)){			
			$this->errorCode=self::ERROR_PASSWORD_INVALID;			
		} else {
			$this->_id = $usuario->id_usu;
			// echo Yii::app()->user->id_usu;
			// echo Yii::app()->user->getState('session_nombre');			
			$this->setState("sesion_nombre", $this->username);
			$this->setState("id_usu",$this->_id);
			$this->username = $usuario->login_usu;
			$this->errorCode = self::ERROR_NONE;			
		}
		
		// validando que no exista error para que se loguee, el codigo del error es igual al que no hay error
		return $this->errorCode==self::ERROR_NONE;
	}
	
	public function getId(){
		
		return $this->_id;
		
	}
}