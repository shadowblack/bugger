<?php

/**
 * LoginForm class.
 * LoginForm is the data structure for keeping
 * user login form data. It is used by the 'login' action of 'SiteController'.
 */
class LoginForm extends CFormModel
{
	public $username;
	public $password;
	public $rememberMe;
	public $verifyCode;	
	
	//http://www.yiiframework.com/wiki/339/show-captcha-after-n-unsuccessfull-attempts/
	private $_identity;

	/**
	 * Declares the validation rules.
	 * The rules state that username and password are required,
	 * and password needs to be authenticated.
	 */
	public function rules()
	{
		return array(
			// username and password are required
			array('username, password', 'required'),
			// rememberMe needs to be a boolean
			array('rememberMe', 'boolean'),
			// password needs to be authenticated
			array('password', 'authenticate'),
				
			///array('verifyCode', 'captcha', 'allowEmpty'=>!CCaptcha::checkRequirements()),
			array('username,password,verifyCode','required','on'=>'captchaRequired'),
			//array('verifyCode', 'captcha', 'allowEmpty'=>!CCaptcha::checkRequirements()),
			array('verifyCode', 'captcha', 'allowEmpty'=>!extension_loaded('gd')),
		);
	}

	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels()
	{
		return array(
			'rememberMe'=>'Recordar Sesion',
			'username'	=> 'Cuenta del usuario',
			'password ' => 'Contrasena del usuario',
			'verifyCode' => 'Codigo de Verificacion',			
		);
	}

	/**
	 * Authenticates the password.
	 * This is the 'authenticate' validator as declared in rules().
	 */
	public function authenticate($attribute,$params)
	{
		if(!$this->hasErrors())
		{
			//$this->_identity=new UserIdentity($this->username,$this->password);
			$this->_identity=new CrugeUser ($this->username,$this->password);
			if(!$this->_identity->authenticate())
				$this->addError('password','Nombre de usuario o contrasena invalida.');
			else{
				$usuario = Usuarios::model()->find("iduser = ? ",array($this->_identity->id));								 
				Yii::app()->user->setState("nombre",$usuario->nom_usu." ".$usuario->ape_usu);
				Yii::app()->user->setState("id_usu",$usuario->id_usu);
			}
		}
	}

	/**
	 * Logs in the user using the given username and password in the model.
	 * @return boolean whether login is successful
	 */
	public function login()
	{
		if($this->_identity===null)
		{
			$this->_identity=new UserIdentity($this->username,$this->password);
			$this->_identity->authenticate();
		}
		if($this->_identity->errorCode===UserIdentity::ERROR_NONE)
		{
			$duration=$this->rememberMe ? 3600*24*30 : 0; // 30 days
			Yii::app()->user->login($this->_identity,$duration);
			return true;
		}
		else
			return false;
	}
}
