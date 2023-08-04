import 'package:flutter/material.dart';

class EmotionCheck extends StatefulWidget {
  const EmotionCheck({super.key});

  @override
  State<EmotionCheck> createState() => _EmotionCheckState();
}

class _EmotionCheckState extends State<EmotionCheck> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 14,
        width: 14,
        child: ColoredBox(
            color: const Color(0xFFFFBFA8),
            child: Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor:  const Color.fromARGB(255, 141, 141, 141),
              ),
              child: Checkbox(
                  checkColor: Colors.white,
                  value: isChecked,
                  shape: const CircleBorder(side: BorderSide.none),
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  }),
            )));
  }
}
