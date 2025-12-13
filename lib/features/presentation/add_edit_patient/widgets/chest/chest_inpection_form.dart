import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_chip.dart';
import 'package:my_graduation/component/my_main_botton.dart';
import 'package:my_graduation/core/enums/chest_enums.dart';
import 'package:my_graduation/features/data/models/chest/chest_isnpection_model.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';

class ChestInpectionForm extends StatefulWidget {
  const ChestInpectionForm({
    super.key,
    required this.cubit,
    required this.model,
  });
  final PatientModel model;
  final AddEditPatientCubit cubit;

  @override
  State<ChestInpectionForm> createState() => _ChestInpectionFormState();
}

class _ChestInpectionFormState extends State<ChestInpectionForm> {
  bool isEqual = false;
  bool isSymmetrical = false;
  bool isNormalShaped = false;
  Map<String, dynamic>? respiratoryMovement;
  bool? isNoramalShap;
  Map<String, dynamic>? assymetricalAbnormality;
  SymetricalAbnormality? symetricalAbnormality;
  VisiblePulsation? visiblePulsation;
  BreathingType? breathingType;
  VertebralColumn? vertebralColumn;
  SkinChanges? skinChanges;

  ChestInspectionModel? chestInspectionModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Chest Inpection"),
              const Gap(16),
              Text("Respraitory Movement"),
              const Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: Text("Equal in both sides"),
                      value: isEqual,
                      onChanged: (val) {
                        setState(() => isEqual = val!);
                      },
                    ),
                  ),
                ],
              ),
              if (!isEqual)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Side of Diminshed Movement"),
                    MyChip(
                      label: "left",
                      onselected: () {
                        respiratoryMovement!["type"] = "diminshed";
                        respiratoryMovement!["side"] = ChestSide.left;
                      },
                    ),
                    MyChip(
                      label: "right",
                      onselected: () {
                        respiratoryMovement!["type"] = "diminshed";
                        respiratoryMovement!["side"] = ChestSide.right;
                      },
                    ),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: Text("is Normal Shaped"),
                      value: isNormalShaped,
                      onChanged: (val) {
                        setState(() => isNormalShaped = val!);
                        isNoramalShap = val;
                      },
                    ),
                  ),
                ],
              ),
              if (!isNormalShaped)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        title: Text("Is symmetrical"),
                        value: isSymmetrical,
                        onChanged: (val) {
                          setState(() => isSymmetrical = val!);
                        },
                      ),
                    ),
                  ],
                ),
              if (isSymmetrical)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Type of abnormality"),
                    Wrap(
                      children: [
                        MyChip(
                          label: "Barrel Chest",
                          onselected: () {
                            symetricalAbnormality =
                                SymetricalAbnormality.barrel;
                          },
                        ),
                        MyChip(
                          label: "Pectus excavatum",
                          onselected: () {
                            symetricalAbnormality =
                                SymetricalAbnormality.pectusExcavatum;
                          },
                        ),
                        MyChip(
                          label: "Pectus carinatum",
                          onselected: () {
                            symetricalAbnormality =
                                SymetricalAbnormality.pectusCarinatum;
                          },
                        ),
                        MyChip(
                          label: "Flat",
                          onselected: () {
                            symetricalAbnormality = SymetricalAbnormality.flat;
                          },
                        ),
                      ],
                    ),
                  ],
                ),

              if (!isSymmetrical)
                // asymetrical shap
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Type of abnormality"),
                        MyChip(
                          label: "Retraction",
                          onselected: () {
                            assymetricalAbnormality!["type"] =
                                ASymetricalAbnormality.retration;
                          },
                        ),
                        MyChip(
                          label: "Bulging",
                          onselected: () {
                            assymetricalAbnormality!["type"] =
                                ASymetricalAbnormality.bulging;
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Side"),
                        MyChip(
                          label: "left",
                          onselected: () {
                            assymetricalAbnormality!["side"] = ChestSide.left;
                          },
                        ),
                        MyChip(
                          label: "right",
                          onselected: () {
                            assymetricalAbnormality!["side"] = ChestSide.right;
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Region"),
                        MyChip(
                          label: "SubClavicular",
                          onselected: () {
                            assymetricalAbnormality!["region"] =
                                ChestRegions.subclavicular;
                          },
                        ),
                        MyChip(
                          label: "Mammary",
                          onselected: () {
                            assymetricalAbnormality!["region"] =
                                ChestRegions.mammary;
                          },
                        ),
                        MyChip(
                          label: "Supramammary",
                          onselected: () {
                            assymetricalAbnormality!["region"] =
                                ChestRegions.supramammary;
                          },
                        ),
                        MyChip(
                          label: "InfraMammary",
                          onselected: () {
                            assymetricalAbnormality!["region"] =
                                ChestRegions.infraMammary;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              Divider(),
              Text("Visible Pulsation"),
              Wrap(
                children: [
                  MyChip(
                    label: "EpiGatric Pulsation",
                    onselected: () {
                      visiblePulsation = VisiblePulsation.epigastricPulsation;
                    },
                  ),
                  MyChip(
                    label: "SupraStenal Pulsation",
                    onselected: () {
                      visiblePulsation = VisiblePulsation.suprasternalPulsation;
                    },
                  ),
                  MyChip(
                    label: "Left ParaSternal Pulsation",
                    onselected: () {
                      visiblePulsation =
                          VisiblePulsation.ltParasternalPulsation;
                    },
                  ),
                  MyChip(
                    label: "Right ParaSternal Pulsation",
                    onselected: () {
                      visiblePulsation =
                          VisiblePulsation.rtParasternalPulsation;
                    },
                  ),
                  MyChip(
                    label: "Left 2nd Space Pulsation",
                    onselected: () {
                      visiblePulsation = VisiblePulsation.left2ndSpacePulsation;
                    },
                  ),
                  MyChip(
                    label: "Right 2nd Space Pulsation",
                    onselected: () {
                      visiblePulsation =
                          VisiblePulsation.right2ndSpacePulsation;
                    },
                  ),
                  MyChip(
                    label: "Apical Pulsation",
                    onselected: () {
                      visiblePulsation = VisiblePulsation.apicalPulsation;
                    },
                  ),
                ],
              ),
              const Divider(),
              Text("Skin"),
              Wrap(
                children: [
                  MyChip(
                    label: "Normal",
                    onselected: () {
                      skinChanges = SkinChanges.noChanges;
                    },
                  ),
                  MyChip(
                    label: "Pigmentation",
                    onselected: () {
                      skinChanges = SkinChanges.pigmentation;
                    },
                  ),
                  MyChip(
                    label: "Nodules",
                    onselected: () {
                      skinChanges = SkinChanges.nodules;
                    },
                  ),
                  MyChip(
                    label: "Dilated veins",
                    onselected: () {
                      skinChanges = SkinChanges.dilatedVeins;
                    },
                  ),
                  MyChip(
                    label: "Scars",
                    onselected: () {
                      skinChanges = SkinChanges.scar;
                    },
                  ),
                ],
              ),
              const Divider(),
              Text("Type of Breathing"),
              Wrap(
                children: [
                  MyChip(
                    label: "Thoracic",
                    onselected: () {
                      breathingType = BreathingType.thoracic;
                    },
                  ),
                  MyChip(
                    label: "Abdominal",
                    onselected: () {
                      breathingType = BreathingType.abdominal;
                    },
                  ),
                ],
              ),
              const Divider(),
              Text("Vertebral Column"),
              Wrap(
                children: [
                  MyChip(
                    label: "Normal",
                    onselected: () {
                      vertebralColumn = VertebralColumn.normal;
                    },
                  ),
                  MyChip(
                    label: "Kyphosis",
                    onselected: () {
                      vertebralColumn = VertebralColumn.kyphosis;
                    },
                  ),
                  MyChip(
                    label: "Scoliosis",
                    onselected: () {
                      vertebralColumn = VertebralColumn.scoliosis;
                    },
                  ),
                  MyChip(
                    label: "Kyphoscoliosis",
                    onselected: () {
                      vertebralColumn = VertebralColumn.kyphoscoliosis;
                    },
                  ),
                ],
              ),

              MyMainBotton(
                title: "Save",
                onTap: () {
                  chestInspectionModel = ChestInspectionModel(
                    isNoramalShap: isNormalShaped,
                    breathingType: breathingType,
                    respiratoryMovement: respiratoryMovement,
                    symetricalAbnormality: symetricalAbnormality,
                    assymetricalAbnormality: assymetricalAbnormality,
                    skinChanges: skinChanges,
                    visiblePulsation: visiblePulsation,
                    vertebralColumn: vertebralColumn,
                  );

                  widget.cubit.updateChestInspection(
                    chestInspectionModel!.toMap(),
                  );
                  widget.cubit.updatePatient();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
