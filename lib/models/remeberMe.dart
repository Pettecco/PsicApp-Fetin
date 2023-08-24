import 'package:flutter/material.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({super.key});

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
