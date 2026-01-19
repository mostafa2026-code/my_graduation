import 'package:flutter/material.dart';

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
    return ListTile(title: Text(title), leading: Icon(icon), onTap: ontap);
  }
}
