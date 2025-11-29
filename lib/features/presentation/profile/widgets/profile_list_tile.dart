import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: const Icon(Icons.settings),
      title: const Text('Settings ${1}'),
      trailing:const  Icon(Icons.arrow_forward_ios),
    );
  }
}
