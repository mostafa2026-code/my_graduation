import 'package:my_graduation/core/enums/chest_enums.dart';

class ChestInspectionModel {
  Map<String, dynamic>? respiratoryMovement;
  bool? isNoramalShap;
  Map<String, dynamic> ?assymetricalAbnormality;
  SymetricalAbnormality ?symetricalAbnormality;
  VisiblePulsation? visiblePulsation;
  BreathingType ?breathingType;
  VertebralColumn ?vertebralColumn;
  SkinChanges? skinChanges;


  //constructor
  ChestInspectionModel({
    this.respiratoryMovement,
    this.isNoramalShap,
    this.assymetricalAbnormality,
    this.symetricalAbnormality,
    this.visiblePulsation,
    this.breathingType,
    this.vertebralColumn,
    this.skinChanges,
  });


  //to map /to json 

  Map<String, dynamic> toMap() {
    return {
      'respiratoryMovement': respiratoryMovement,
      'isNoramalShap': isNoramalShap,
      'assymetricalAbnormality': assymetricalAbnormality,
      'symetricalAbnormality': symetricalAbnormality,
      'visiblePulsation': visiblePulsation,
      'breathingType': breathingType,
      'vertebralColumn': vertebralColumn,
      'skinChanges': skinChanges,
    };
  }



  //from json

  factory ChestInspectionModel.fromMap(Map<String, dynamic> map) {
    return ChestInspectionModel(
      respiratoryMovement: map['respiratoryMovement'],
      isNoramalShap: map['isNoramalShap'],
      assymetricalAbnormality: map['assymetricalAbnormality'],
      symetricalAbnormality: map['symetricalAbnormality'],
      visiblePulsation: map['visiblePulsation'],
      breathingType: map['breathingType'],
      vertebralColumn: map['vertebralColumn'],
      skinChanges: map['skinChanges'],
    );
  }





  //copyWith
  ChestInspectionModel copyWith({
    Map<String, dynamic>? respiratoryMovement,
    bool? isNoramalShap,
    Map<String, dynamic>? assymetricalAbnormality,
    SymetricalAbnormality? symetricalAbnormality,
    VisiblePulsation? visiblePulsation,
    BreathingType? breathingType,
    VertebralColumn? vertebralColumn,
    SkinChanges? skinChanges,
  }) {
    return ChestInspectionModel(
      respiratoryMovement: respiratoryMovement ?? this.respiratoryMovement,
      isNoramalShap: isNoramalShap ?? this.isNoramalShap,
      assymetricalAbnormality: assymetricalAbnormality ?? this.assymetricalAbnormality,
      symetricalAbnormality: symetricalAbnormality ?? this.symetricalAbnormality,
      visiblePulsation: visiblePulsation ?? this.visiblePulsation,
      breathingType: breathingType ?? this.breathingType,
      vertebralColumn: vertebralColumn ?? this.vertebralColumn,
      skinChanges: skinChanges ?? this.skinChanges,
    );
  }
  
}
