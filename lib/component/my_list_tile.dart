import 'package:flutter/material.dart';
import 'package:my_graduation/core/utils/my_text_styles.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? ontap;
  final Widget trailing;
  const MyListTile({
    super.key,
    required this.title,
    required this.icon,
    this.ontap,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: MyTextStyles.listTileTitle),
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      onTap: ontap,
      trailing: trailing,
    );
  }
}
