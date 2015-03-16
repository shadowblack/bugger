<?php

/**
 * This is the model class for table "lenguajes_proyectos".
 *
 * The followings are the available columns in table 'lenguajes_proyectos':
 * @property integer $id_pro
 * @property integer $id_len
 * @property integer $id_len_pro
 *
 * The followings are the available model relations:
 * @property Errores[] $errores
 * @property Lenguajes $idLen
 * @property Proyectos $idPro
 */
class LenguajesProyectos extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return LenguajesProyectos the static model class
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
		return 'lenguajes_proyectos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_len', 'UniqueAttributesValidator', 'with'=>'id_pro'),			
			array('id_pro, id_len', 'required'),
			array('id_pro, id_len', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id_pro, id_len, id_len_pro', 'safe', 'on'=>'search'),
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
			'errores' => array(self::HAS_MANY, 'Errores', 'id_len_pro'),
			'idLen' => array(self::BELONGS_TO, 'Lenguajes', 'id_len'),
			'idPro' => array(self::BELONGS_TO, 'Proyectos', 'id_pro'),			
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_pro' => 'Id Proyecto',
			'id_len' => 'Id Lenguaje',
			'id_len_pro' => 'Id Lenguaje del Proyecto',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
		
	public static function listLenguejesProyectos(){		
		$datos = CHtml::listData(LenguajesProyectos::model()
				->with('idPro',
						'idLen')
				->together()
				->findAll(),'id_len_pro','idPro.nom_pro','idLen.nom_len');
		return $datos;
	}
	
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id_pro',$this->id_pro);
		$criteria->compare('id_len',$this->id_len);
		$criteria->compare('id_len_pro',$this->id_len_pro);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}