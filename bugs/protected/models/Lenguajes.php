<?php

/**
 * This is the model class for table "lenguajes".
 *
 * The followings are the available columns in table 'lenguajes':
 * @property integer $id_len
 * @property string $nom_len
 *
 * The followings are the available model relations:
 * @property LenguajesProyectos[] $lenguajesProyectoses
 */
class Lenguajes extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Lenguajes the static model class
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
		return 'lenguajes';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nom_len', 'required'),
			array('nom_len', 'length', 'max'=>50),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id_len, nom_len', 'safe', 'on'=>'search'),
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
			'lenguajesProyectoses' => array(self::HAS_MANY, 'LenguajesProyectos', 'id_len'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_len' => 'Id del lenguaje',
			'nom_len' => 'Nombre del  Lenguaje',
		);
	}

	public static function listLenguajes(){
		$datos = CHtml::listData(Lenguajes::model()
				->together()
				->findAll(),'id_len','nom_len');
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

		$criteria->compare('id_len',$this->id_len);
		$criteria->compare('nom_len',$this->nom_len,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}