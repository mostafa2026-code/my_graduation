import 'package:my_graduation/core/enums/chest_enums.dart';

class PalpationModel {
  // A. Local Tenderness
  final bool isTendernessPresent;

  // B. Confirmation of Inspection
  // Respiratory Movement
  final UpperChestMovement? upperChestMovement;
  final LowerChestMovement? lowerChestMovement;
  final ChestSide?
  restrictedSide; // Only relevant if lowerChestMovement is restricted

  // Pulsations
  // Using a Set or List of enums for present pulsations is cleaner than individual bools
  final List<VisiblePulsation> presentPulsations;

  // Dilated Veins
  final bool isDilatedVeinsPresent;
  final VenousFillingDirection?
  venousFillingDirection; // Only if veins are present

  // C. Position of the Trachea
  final TracheaPosition? tracheaPosition;

  // D. Tactile Vocal Fremitus (TVF)
  final TVFState? tvfState;
  final String? tvfLocation; // Only if TVF is Decreased or Increased

  // E. Palpable Adventitious Sounds
  final bool isPalpableRhonchiPresent;
  final bool isPalpablePleuralRubPresent;
  final bool isPalpableCrepitusPresent;

  PalpationModel({
    this.isTendernessPresent = false,
    this.upperChestMovement,
    this.lowerChestMovement,
    this.restrictedSide,
    this.presentPulsations = const [],
    this.isDilatedVeinsPresent = false,
    this.venousFillingDirection,
    this.tracheaPosition,
    this.tvfState,
    this.tvfLocation,
    this.isPalpableRhonchiPresent = false,
    this.isPalpablePleuralRubPresent = false,
    this.isPalpableCrepitusPresent = false,
  });

  PalpationModel copyWith({
    bool? isTendernessPresent,
    UpperChestMovement? upperChestMovement,
    LowerChestMovement? lowerChestMovement,
    ChestSide? restrictedSide,
    List<VisiblePulsation>? presentPulsations,
    bool? isDilatedVeinsPresent,
    VenousFillingDirection? venousFillingDirection,
    TracheaPosition? tracheaPosition,
    TVFState? tvfState,
    String? tvfLocation,
    bool? isPalpableRhonchiPresent,
    bool? isPalpablePleuralRubPresent,
    bool? isPalpableCrepitusPresent,
  }) {
    return PalpationModel(
      isTendernessPresent: isTendernessPresent ?? this.isTendernessPresent,
      upperChestMovement: upperChestMovement ?? this.upperChestMovement,
      lowerChestMovement: lowerChestMovement ?? this.lowerChestMovement,
      restrictedSide: restrictedSide ?? this.restrictedSide,
      presentPulsations: presentPulsations ?? this.presentPulsations,
      isDilatedVeinsPresent:
          isDilatedVeinsPresent ?? this.isDilatedVeinsPresent,
      venousFillingDirection:
          venousFillingDirection ?? this.venousFillingDirection,
      tracheaPosition: tracheaPosition ?? this.tracheaPosition,
      tvfState: tvfState ?? this.tvfState,
      tvfLocation: tvfLocation ?? this.tvfLocation,
      isPalpableRhonchiPresent:
          isPalpableRhonchiPresent ?? this.isPalpableRhonchiPresent,
      isPalpablePleuralRubPresent:
          isPalpablePleuralRubPresent ?? this.isPalpablePleuralRubPresent,
      isPalpableCrepitusPresent:
          isPalpableCrepitusPresent ?? this.isPalpableCrepitusPresent,
    );
  }

  @override
  String toString() {
    return 'PalpationModel(isTendernessPresent: $isTendernessPresent, upperChestMovement: $upperChestMovement, lowerChestMovement: $lowerChestMovement, restrictedSide: $restrictedSide, presentPulsations: $presentPulsations, isDilatedVeinsPresent: $isDilatedVeinsPresent, venousFillingDirection: $venousFillingDirection, tracheaPosition: $tracheaPosition, tvfState: $tvfState, tvfLocation: $tvfLocation, isPalpableRhonchiPresent: $isPalpableRhonchiPresent, isPalpablePleuralRubPresent: $isPalpablePleuralRubPresent, isPalpableCrepitusPresent: $isPalpableCrepitusPresent)';
  }
}
