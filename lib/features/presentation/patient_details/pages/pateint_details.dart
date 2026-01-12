import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/core/const/my_images.dart';
import 'package:my_graduation/core/utils/my_colors.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';

class PateintDetails extends StatelessWidget {
  const PateintDetails({super.key, required this.model});

  final PatientModel? model;

  @override
  Widget build(BuildContext context) {
    if (model == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Patient Details")),
        body: const Center(child: Text("No patient data available")),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Patient Details")),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const Gap(24),
            _buildSectionTitle("Contact Info"),
            _buildContactInfo(),
            const Gap(16),
            _buildExpandableSection(
              title: "Personal History",
              data: model?.personalHistory,
              icon: Icons.person_outline,
            ),
            const Gap(10),
            _buildExpandableSection(
              title: "Analysis of Complains",
              data: model?.analysisofcomplains,
              icon: Icons.sick_outlined,
            ),
            const Gap(10),
            _buildExpandableSection(
              title: "Past Medical History",
              data: model?.pastMedicalHistory,
              icon: Icons.history_edu,
            ),
            const Gap(10),
            _buildExpandableSection(
              title: "Therapeutic History",
              data: model?.theraputicHistory,
              icon: Icons.medication_outlined,
            ),
            const Gap(10),
            _buildExpandableSection(
              title: "Chest Inspection",
              data: model?.chestInspection,
              icon: Icons.monitor_heart_outlined,
            ),
            const Gap(10),
            if (model?.diagnosis != null && model!.diagnosis!.isNotEmpty)
              _buildDiagnosisCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: MyColors.primaryLight,
            child: CircleAvatar(
              radius: 46,
              backgroundColor: Colors.white,
              child: Image.asset(
                MyImages.heartFailure,
                height: 60,
                fit: BoxFit.contain,
              ), // Fallback or placeholder
            ),
          ),
          const Gap(16),
          Text(
            model?.personalHistory?['name'] ?? "Unknown Name",
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Gap(8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: MyColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: MyColors.primary),
            ),
            child: Text(
              "ID: ${model?.id ?? 'N/A'}",
              style: TextStyle(
                color: MyColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoRow(Icons.email_outlined, "Email", model?.email ?? "N/A"),
            const Divider(),
            _buildInfoRow(Icons.phone_outlined, "Phone", model?.phone ?? "N/A"),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: MyColors.primary, size: 20),
        const Gap(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required Map<String, dynamic>? data,
    required IconData icon,
  }) {
    if (data == null || data.isEmpty) {
      return const SizedBox.shrink(); // Hide if no data
    }
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Icon(icon, color: MyColors.primary),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          childrenPadding: const EdgeInsets.all(16),
          children: data.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      _formatKey(entry.key),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "${entry.value}",
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildDiagnosisCard() {
    return Card(
      color: Colors.red.shade50,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.red.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: Colors.red),
                Gap(8),
                Text(
                  "Diagnosis",
                  style: TextStyle(
                    color: Colors.red.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Gap(8),
            Text(
              model?.diagnosis ?? "",
              style: TextStyle(color: Colors.red.shade900, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  String _formatKey(String key) {
    // CamelCase to Normal String (Simple heuristic)
    final result = key.replaceAllMapped(RegExp(r'([A-Z])'), (match) {
      return ' ${match.group(0)}';
    });
    return (result[0].toUpperCase() + result.substring(1)).trim();
  }
}
