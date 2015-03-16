<?php

/**
 * This is the model class for table "usuarios".
 *
 * The followings are the available columns in table 'usuarios':
 * @property integer $id_usu 
 * @property string $nom_usu
 * @property string $ape_usu
 * @property string $fec_reg
 * @property string $pas_usu
 *
 * The followings are the available model relations:
 * @property DetallesErrores[] $detallesErrores
 */
class Usuarios extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Usuarios the static model class
	 */
	 
	public $repeat_pass;
	public $fec_reg_from;
	public $fec_reg_to;	
	 
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'usuarios';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('iduser', 'unique'),
			array('nom_usu,iduser', 'required'),
			//array('login_usu, nom_usu, pas_usu,repeat_pass,session,iduser', 'required'),
			array('nom_usu, ape_usu', 'length', 'max'=>50),			
			//array('pas_usu,repeat_pass,session', 'length','min'=>3, 'max'=>150),
			//array('pas_usu', 'compare','compareAttribute'=>'repeat_pass'),
			array('fec_reg_from', 'type','type'=>'date', 'dateFormat'=>'dd/MM/yyyy'),
			array('fec_reg_to', 'type','type'=>'date', 'dateFormat'=>'dd/MM/yyyy'),
			//array('fec_reg', 'type','type'=>'date', 'dateFormat'=>'dd/MM/yyyy'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id_usu,  nom_usu, ape_usu, fec_reg', 'safe', 'on'=>'search'),
		);
	}
	
	/**
	 * Checks if the given password is correct.
	 * @param string the password to be validated
	 * @return boolean whether the password is valid
	 */
	public function validatePassword($password)
	{			
		return $this->hashPassword($password,$this->session)===$this->pas_usu;
	}
	
	/**
	 * Generates the password hash.
	 * @param string password
	 * @param string salt
	 * @return string hash
	 */
	public function hashPassword($password,$salt)
	{
		return md5($salt.$password);
	}
	
	/**
	 * Generates a salt that can be used to generate a password hash.
	 * @return string the salt
	 */
	public function generateSalt()
	{
		return uniqid('-0+**@101EncriPtando707-0+**@',true);
	}
	
	public function getFechaRegistro(){
		return $this->fec_reg."formato";
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'detallesErrores' => array(self::HAS_MANY, 'DetallesErrores', 'id_usu'),
			'User' => array(self::HAS_ONE, 'CrugeUserModel', 'iduser'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_usu' => 'Id del usuario',			
			'nom_usu' => 'Nombre del usuario',
			'ape_usu' => 'Apellido del usuario',
			'fec_reg' => 'Fecha de registro',
			//'pas_usu' => 'Contraseña',
			'repeat_pass' => 'Repetir contraseña',
			'fec_reg_from' => 'Fecha desde',
			'fec_reg_to' => 'Fecha hasta',
		);
	}
	
	public static function listUsuarios(){
		$datos = CHtml::listData(Usuarios::model()
				->with('User')
				->together()
				->findAll(),'id_usu','User.username');
		return $datos;
	}
	
	public static function listUser(){
	
		$with_condition = array(
				//'alias' => 'cu',
				//'select' => 'company_accounts.company,company_accounts.logo,company_accounts.logo_width,company_accounts.logo_height',
				//'on'=> 'cu.iduser<>df',
				//'joinType' => 'JOIN',
				//'on'=> 'cu.iduser<>df'
				'condition' => 'usuarioses.iduser is null',
		);
		
		
		$datos = CHtml::listData(CrugeUserModel::model()
		 ->with(array('usuarioses'=>$with_condition))
				->together()
				->findAll()				
				,'iduser','username');
		
		return $datos;
	}
	
	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;
		
		if(!empty($this->fec_reg_from) && !empty($this->fec_reg_to)){
			$criteria->condition="fec_reg BETWEEN ('$this->fec_reg_from'::timestamp) AND ('$this->fec_reg_to'::timestamp + '1 days')";
		}
		
		$criteria->compare('id_usu',$this->id_usu);
		$criteria->compare('id_usu',$this->id_usu);
		//$criteria->compare('login_usu',$this->login_usu,true);
		$criteria->compare('nom_usu',$this->nom_usu,true);
		$criteria->compare('ape_usu',$this->ape_usu,true);
		//$criteria->compare('fec_reg',$this->fec_reg,true);
		//$criteria->compare('fec_reg2',$this->fec_reg,true);
		//$criteria->compare('pas_usu',$this->pas_usu,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}