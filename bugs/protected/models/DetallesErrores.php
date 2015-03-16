<?php

/**
 * This is the model class for table "detalles_errores".
 *
 * The followings are the available columns in table 'detalles_errores':
 * @property integer $id_det_err
 * @property integer $num_inc
 * @property string $det_err
 * @property string $fec_reg
 * @property integer $id_err
 * @property integer $id_usu
 *
 * The followings are the available model relations:
 * @property Errores $idErr
 * @property Usuarios $idUsu
 */
class DetallesErrores extends CActiveRecord
{
	
	public $fec_reg_from;
	public $fec_reg_to;
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return DetallesErrores the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'detalles_errores';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('det_err, id_err, id_usu, tit_err', 'required'),
			array('num_inc, id_err, id_usu', 'numerical', 'integerOnly'=>true),
			//array('fec_reg', 'date', 'format'=>'d/m/yyyy'),
			array('fec_reg_from', 'date', 'format'=>'d/m/yyyy'),
			array('fec_reg_to', 'date', 'format'=>'d/m/yyyy'),
			//http://www.yiiframework.com/wiki/10/
			array('fec_reg', 'default', 'value'=>new CDbExpression('NOW()')),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id_det_err, num_inc, det_err, fec_reg, id_err, id_usu', 'safe', 'on'=>'search'),
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
			'idErr' => array(self::BELONGS_TO, 'Errores', 'id_err'),
			'idUsu' => array(self::BELONGS_TO, 'Usuarios', 'id_usu'),
		);
	}
	
	public static function listUsuarios(){
		$datos = CHtml::listData(Usuarios::model()
				->with('User')
				->together()
				->findAll(),'id_usu','User.username');
		return $datos;
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_det_err' => 'Identificacion del error',
			'num_inc' => 'Numero de Incidencia',
			'det_err' => 'Descripcion del error',
			'fec_reg' => 'Fecha de registros',
			'id_err' => 'Id del error',
			'id_usu' => 'Id del usuario',
			'tit_err' => 'Titulo del error',
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

		$criteria->compare('id_det_err',$this->id_det_err);
		$criteria->compare('num_inc',$this->num_inc);
		$criteria->compare('det_err',$this->det_err,true);
		$criteria->compare('fec_reg',$this->fec_reg,true);
		$criteria->compare('id_err',$this->id_err);
		$criteria->compare('id_usu',$this->id_usu);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}