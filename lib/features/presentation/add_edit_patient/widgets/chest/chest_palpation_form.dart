// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:my_graduation/core/enums/chest_enums.dart';
// import 'package:my_graduation/features/data/models/chest/chest_palpation_model.dart';
// // import 'package:my_graduation/component/my_chip.dart'; // Assuming this exists based on inspection form, but sticking to standard widgets for "Material UI" requirement unless needed.

// class PalpationForm extends StatefulWidget {
//   final Function(PalpationModel) onModelChanged;

//   const PalpationForm({super.key, required this.onModelChanged});

//   @override
//   State<PalpationForm> createState() => _PalpationFormState();
// }

// class _PalpationFormState extends State<PalpationForm> {
//   late PalpationModel _model;

//   @override
//   void initState() {
//     super.initState();
//     _model = PalpationModel();
//   }

//   void _updateModel(PalpationModel newModel) {
//     setState(() {
//       _model = newModel;
//     });
//     widget.onModelChanged(_model);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildSectionTitle("A. Local Tenderness"),
//           _buildTendernessSection(),
//           const Gap(24),
//           _buildSectionTitle("B. Confirmation of Inspection"),
//           _buildRespiratoryMovementSection(),
//           const Gap(16),
//           _buildPulsationsSection(),
//           const Gap(16),
//           _buildDilatedVeinsSection(),
//           const Gap(24),
//           _buildSectionTitle("C. Position of the Trachea"),
//           _buildTracheaSection(),
//           const Gap(24),
//           _buildSectionTitle("D. Tactile Vocal Fremitus (TVF)"),
//           _buildTVFSection(),
//           const Gap(24),
//           _buildSectionTitle("E. Palpable Adventitious Sounds"),
//           _buildAdventitiousSoundsSection(),
//         ],
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: const TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.bold,
//         color: Colors.blueAccent,
//       ),
//     );
//   }

//   // A. Local Tenderness
//   Widget _buildTendernessSection() {
//     return Card(
//       child: Column(
//         children: [
//           RadioListTile<bool>(
//             title: const Text("Absent"),
//             value: false,
//             groupValue: _model.isTendernessPresent,
//             onChanged: (val) {
//               _updateModel(_model.copyWith(isTendernessPresent: val));
//             },
//           ),
//           RadioListTile<bool>(
//             title: const Text("Present"),
//             value: true,
//             groupValue: _model.isTendernessPresent,
//             onChanged: (val) {
//               _updateModel(_model.copyWith(isTendernessPresent: val));
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   // B. Respiratory Movement
//   Widget _buildRespiratoryMovementSection() {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Respiratory Movement",
//               style: TextStyle(fontWeight: FontWeight.w600),
//             ),
//             const Divider(),
//             const Text("Upper Part:"),
//             Row(
//               children: [
//                 Expanded(
//                   child: RadioListTile<UpperChestMovement>(
//                     title: const Text("Normal"),
//                     value: UpperChestMovement.normal,
//                     groupValue: _model.upperChestMovement,
//                     onChanged: (val) {
//                       _updateModel(_model.copyWith(upperChestMovement: val));
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   child: RadioListTile<UpperChestMovement>(
//                     title: const Text("Reduced"),
//                     value: UpperChestMovement.reduced,
//                     groupValue: _model.upperChestMovement,
//                     onChanged: (val) {
//                       _updateModel(_model.copyWith(upperChestMovement: val));
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             const Gap(8),
//             const Text("Lower Part:"),
//             Row(
//               children: [
//                 Expanded(
//                   child: RadioListTile<LowerChestMovement>(
//                     title: const Text("Equal"),
//                     value: LowerChestMovement.equal,
//                     groupValue: _model.lowerChestMovement,
//                     onChanged: (val) {
//                       _updateModel(
//                         _model.copyWith(
//                           lowerChestMovement: val,
//                           restrictedSide: null,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   child: RadioListTile<LowerChestMovement>(
//                     title: const Text("Restricted"),
//                     value: LowerChestMovement.restricted,
//                     groupValue: _model.lowerChestMovement,
//                     onChanged: (val) {
//                       _updateModel(_model.copyWith(lowerChestMovement: val));
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             if (_model.lowerChestMovement == LowerChestMovement.restricted) ...[
//               const Padding(
//                 padding: EdgeInsets.only(left: 16.0, top: 4.0),
//                 child: Text("Side of Restriction:"),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: RadioListTile<Side>(
//                       title: const Text("Left"),
//                       value: Side.left,
//                       groupValue: _model.restrictedSide,
//                       onChanged: (val) {
//                         _updateModel(_model.copyWith(restrictedSide: val));
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: RadioListTile<Side>(
//                       title: const Text("Right"),
//                       value: Side.right,
//                       groupValue: _model.restrictedSide,
//                       onChanged: (val) {
//                         _updateModel(_model.copyWith(restrictedSide: val));
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   // Pulsations
//   Widget _buildPulsationsSection() {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Pulsations",
//               style: TextStyle(fontWeight: FontWeight.w600),
//             ),
//             const Divider(),
//             ...VisiblePulsation.values.map((pulsation) {
//               return CheckboxListTile(
//                 title: Text(_formatEnumName(pulsation.name)),
//                 value: _model.presentPulsations.contains(pulsation),
//                 onChanged: (val) {
//                   final currentList = List<VisiblePulsation>.from(
//                     _model.presentPulsations,
//                   );
//                   if (val == true) {
//                     currentList.add(pulsation);
//                   } else {
//                     currentList.remove(pulsation);
//                   }
//                   _updateModel(_model.copyWith(presentPulsations: currentList));
//                 },
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }

//   // Dilated Veins
//   Widget _buildDilatedVeinsSection() {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CheckboxListTile(
//               title: const Text(
//                 "Dilated Veins Present",
//                 style: TextStyle(fontWeight: FontWeight.w600),
//               ),
//               value: _model.isDilatedVeinsPresent,
//               onChanged: (val) {
//                 _updateModel(
//                   _model.copyWith(
//                     isDilatedVeinsPresent: val,
//                     venousFillingDirection: val == false
//                         ? null
//                         : _model.venousFillingDirection,
//                   ),
//                 );
//               },
//             ),
//             if (_model.isDilatedVeinsPresent) ...[
//               const Divider(),
//               const Text("Direction of Venous Filling:"),
//               RadioListTile<VenousFillingDirection>(
//                 title: const Text("From Above"),
//                 value: VenousFillingDirection.fromAbove,
//                 groupValue: _model.venousFillingDirection,
//                 onChanged: (val) {
//                   _updateModel(_model.copyWith(venousFillingDirection: val));
//                 },
//               ),
//               RadioListTile<VenousFillingDirection>(
//                 title: const Text("From Below"),
//                 value: VenousFillingDirection.fromBelow,
//                 groupValue: _model.venousFillingDirection,
//                 onChanged: (val) {
//                   _updateModel(_model.copyWith(venousFillingDirection: val));
//                 },
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   // C. Trachea Position
//   Widget _buildTracheaSection() {
//     return Card(
//       child: Column(
//         children: [
//           RadioListTile<TracheaPosition>(
//             title: const Text("Central"),
//             value: TracheaPosition.central,
//             groupValue: _model.tracheaPosition,
//             onChanged: (val) {
//               _updateModel(_model.copyWith(tracheaPosition: val));
//             },
//           ),
//           RadioListTile<TracheaPosition>(
//             title: const Text("Shifted to Right"),
//             value: TracheaPosition.shiftedRight,
//             groupValue: _model.tracheaPosition,
//             onChanged: (val) {
//               _updateModel(_model.copyWith(tracheaPosition: val));
//             },
//           ),
//           RadioListTile<TracheaPosition>(
//             title: const Text("Shifted to Left"),
//             value: TracheaPosition.shiftedLeft,
//             groupValue: _model.tracheaPosition,
//             onChanged: (val) {
//               _updateModel(_model.copyWith(tracheaPosition: val));
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   // D. TVF
//   Widget _buildTVFSection() {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             RadioListTile<TVFState>(
//               title: const Text("Equal"),
//               value: TVFState.equal,
//               groupValue: _model.tvfState,
//               onChanged: (val) {
//                 _updateModel(_model.copyWith(tvfState: val, tvfLocation: null));
//               },
//             ),
//             RadioListTile<TVFState>(
//               title: const Text("Decreased"),
//               value: TVFState.decreased,
//               groupValue: _model.tvfState,
//               onChanged: (val) {
//                 _updateModel(_model.copyWith(tvfState: val));
//               },
//             ),
//             RadioListTile<TVFState>(
//               title: const Text("Increased"),
//               value: TVFState.increased,
//               groupValue: _model.tvfState,
//               onChanged: (val) {
//                 _updateModel(_model.copyWith(tvfState: val));
//               },
//             ),
//             if (_model.tvfState == TVFState.decreased ||
//                 _model.tvfState == TVFState.increased)
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: TextField(
//                   decoration: const InputDecoration(
//                     labelText: "Location",
//                     border: OutlineInputBorder(),
//                   ),
//                   onChanged: (val) {
//                     _model = _model.copyWith(tvfLocation: val);
//                     // Not calling setState here to avoid rebuild on every character,
//                     // but we need to update parent. calling widget.onModelChanged would be better
//                     // done via controller or debouncing, but for now let's just update model ref
//                     // and callback.
//                     widget.onModelChanged(_model);
//                   },
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   // E. Adventitious Sounds
//   Widget _buildAdventitiousSoundsSection() {
//     return Card(
//       child: Column(
//         children: [
//           CheckboxListTile(
//             title: const Text("Palpable Rhonchi"),
//             value: _model.isPalpableRhonchiPresent,
//             onChanged: (val) {
//               _updateModel(_model.copyWith(isPalpableRhonchiPresent: val));
//             },
//           ),
//           CheckboxListTile(
//             title: const Text("Palpable Pleural Rub"),
//             value: _model.isPalpablePleuralRubPresent,
//             onChanged: (val) {
//               _updateModel(_model.copyWith(isPalpablePleuralRubPresent: val));
//             },
//           ),
//           CheckboxListTile(
//             title: const Text("Palpable Crepitus"),
//             value: _model.isPalpableCrepitusPresent,
//             onChanged: (val) {
//               _updateModel(_model.copyWith(isPalpableCrepitusPresent: val));
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   String _formatEnumName(String name) {
//     // Basic CamelCase splitting or just returning text.
//     // e.g. epigastricPulsation -> Epigastric Pulsation
//     final buffer = StringBuffer();
//     for (int i = 0; i < name.length; i++) {
//       if (i == 0) {
//         buffer.write(name[i].toUpperCase());
//       } else if (name[i].toUpperCase() == name[i] && // is upper
//           name[i - 1].toUpperCase() != name[i - 1]) {
//         // prev was lower
//         buffer.write(' ${name[i]}');
//       } else {
//         buffer.write(name[i]);
//       }
//     }
//     return buffer.toString();
//   }
// }
