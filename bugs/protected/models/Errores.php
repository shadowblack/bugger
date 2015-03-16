<?php

/**
 * This is the model class for table "errores".
 *
 * The followings are the available columns in table 'errores':
 * @property integer $id_err
 * @property string $des_err
 * @property string $fec_reg
 * @property integer $id_len_pro
 *
 * The followings are the available model relations:
 * @property LenguajesProyectos $idLenPro
 * @property DetallesErrores[] $detallesErrores
 */
class Errores extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Errores the static model class
	 */
	
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
		return 'errores';
	}
	
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('des_err,id_len_pro', 'required'),
			array('fec_reg, id_len_pro','default','setOnEmpty'=>true),
			//array('fec_reg', 'date', 'format'=>'d/m/yyyy'),
			//array('fec_reg','type','type'=>'date', 'dateFormat'=>'dd/MM/yyyy'),
			//array('fec_reg_from', 'type','type'=>'date', 'dateFormat'=>'dd/MM/yyyy'),
			//array('fec_reg_to', 'type','type'=>'date', 'dateFormat'=>'dd/MM/yyyy'),
			array('id_len_pro', 'numerical'),
			array('des_err,id_err', 'length', 'max'=>300),				
			//array('id_err', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('fec_reg_from,fec_reg_to,id_err,des_err, fec_reg, id_len_pro', 'safe', 'on'=>'search'),
			//array('id_len_pro', 'allowEmpty'=>true, 'safe', 'on'=>'search'),
			//array('id_err', 'default', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'idLenPro' => array(self::BELONGS_TO, 'LenguajesProyectos', 'id_len_pro'),
			'detallesErrores' => array(self::HAS_MANY, 'DetallesErrores', 'id_err'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_err' => 'Id del error',
			'des_err' => 'Descripcion del error',
			'fec_reg' => 'Fecha de registro',
			'id_len_pro' => 'Lenguajes por proyectos',
			'fec_reg_from' => 'Fecha desde',
			'fec_reg_to' => 'Fecha hasta',
		);
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

		$criteria->compare('id_err',$this->id_err);
		$criteria->compare('des_err',$this->des_err,true);
		$criteria->compare('fec_reg',$this->fec_reg,true);
		$criteria->compare('id_len_pro',$this->id_len_pro);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}