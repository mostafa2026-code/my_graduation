class QAndAModel {
  final String question;
  final String answer;

  QAndAModel({required this.question, required this.answer});
}

List<QAndAModel> drRecordQA = [
  QAndAModel(
    question: "How to add a new patient?",
    answer: "Go to 'Add Patient' screen, fill in the details, and click Save.",
  ),
  QAndAModel(
    question: "How to record a patient's diagnosis?",
    answer:
        "Open the patient's record, navigate to 'Diagnosis', enter details, and save.",
  ),
  QAndAModel(
    question: "How to schedule an appointment?",
    answer:
        "Open the 'Appointments' tab, select patient, choose date and time, and confirm.",
  ),
  QAndAModel(
    question: "How to generate a medical report?",
    answer:
        "Select the patient, go to 'Reports', choose report type, and click 'Generate'.",
  ),
  QAndAModel(
    question: "How to delete a patient record?",
    answer:
        "Open the patient's record, click 'Delete', and confirm the action.",
  ),
  QAndAModel(
    question: "How to search for a patient?",
    answer:
        "Use the search bar on the main screen, type the patient’s name, and select from results.",
  ),
  QAndAModel(
    question: "How to edit patient details?",
    answer: "Open patient record, click 'Edit', make changes, and save.",
  ),
  QAndAModel(
    question: "How to view all appointments?",
    answer: "Go to the 'Appointments' tab to see the full list.",
  ),
  QAndAModel(
    question: "How to backup patient data?",
    answer: "Go to Settings → Backup → Choose backup location → Confirm.",
  ),
  QAndAModel(
    question: "How to restore patient data from backup?",
    answer: "Go to Settings → Restore → Select backup file → Confirm.",
  ),
];
