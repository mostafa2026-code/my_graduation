import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/core/navigation/my_routes.dart';
import 'package:my_graduation/core/services/shared_prefrences/shared_helper.dart';
import 'package:my_graduation/core/utils/my_colors.dart';
import 'package:my_graduation/core/utils/my_text_styles.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/features/data/models/doctors_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final DoctorsModel? doctor = SharedHelper.getUserInfo();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              if (doctor != null) {
                await mypush(context, MyRoutes.editProfile, doctor);
                _refresh();
              }
            },
            icon: const Icon(Icons.edit, color: Colors.white),
          ),
        ],
        title: Text(
          "My Profile",
          style: MyTextStyles.titleLarge.copyWith(color: Colors.white),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Dr. ${doctor?.name ?? 'Unknown'}",
                          style: MyTextStyles.headlineSmall,
                        ),
                        Text(
                          doctor?.speciality ?? 'General Practitioner',
                          style: MyTextStyles.bodyMedium.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(30),
                  _buildSectionTitle("Personal Information"),
                  const Gap(15),
                  _buildInfoCard(context, [
                    _buildInfoRow(
                      context,
                      Icons.email_outlined,
                      "Email",
                      doctor?.email ?? 'N/A',
                    ),
                    _buildInfoRow(
                      context,
                      Icons.phone_android_outlined,
                      "Phone",
                      (doctor?.phone?.isNotEmpty == true)
                          ? doctor!.phone!
                          : 'N/A',
                    ),
                    _buildInfoRow(
                      context,
                      Icons.location_on_outlined,
                      "Address",
                      doctor?.address ?? 'N/A',
                    ),
                  ]),
                  const Gap(25),
                  _buildSectionTitle("Professional Details"),
                  const Gap(15),
                  _buildInfoCard(context, [
                    _buildInfoRow(
                      context,
                      Icons.work_outline,
                      "Position",
                      doctor?.position ?? 'N/A',
                    ),
                    _buildInfoRow(
                      context,
                      Icons.school_outlined,
                      "Qualification",
                      (doctor?.qualification?.isNotEmpty == true)
                          ? doctor!.qualification!
                          : 'N/A',
                    ),
                    _buildInfoRow(
                      context,
                      Icons.badge_outlined,
                      "ID",
                      doctor?.id ?? 'N/A',
                    ),
                  ]),
                  const Gap(25),
                  _buildSectionTitle("About"),
                  const Gap(15),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Text(
                      doctor?.about ?? "No information provided.",
                      style: MyTextStyles.bodyLarge,
                    ),
                  ),
                  const Gap(40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: MyTextStyles.titleMedium.copyWith(
        fontWeight: FontWeight.bold,
        color: MyColors.primary,
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: children.asMap().entries.map((entry) {
          int idx = entry.key;
          Widget child = entry.value;
          if (idx == children.length - 1) return child;
          return Column(
            children: [
              child,
              Divider(
                height: 1,
                // ignore: deprecated_member_use
                color: Colors.grey.withOpacity(0.2),
                indent: 50,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 22, color: Theme.of(context).primaryColor),
          const Gap(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: MyTextStyles.labelSmall.copyWith(color: Colors.grey),
              ),
              Text(
                value,
                style: MyTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
