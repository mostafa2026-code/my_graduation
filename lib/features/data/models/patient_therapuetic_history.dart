class PatientTherapueticHistory {
  String? id;
  String? name;
  String? doctorId;
  String? doctorName;
  List<String>? drugTherapy;
  List<String>? allergyToDrugs;
  List<String>? recentPrescribedDrugs;

  PatientTherapueticHistory({
    this.id,
    this.name,
    this.doctorId,
    this.doctorName,
    this.drugTherapy,
    this.allergyToDrugs,
    this.recentPrescribedDrugs,
  });
}
