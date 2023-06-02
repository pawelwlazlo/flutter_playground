import 'package:flutter/material.dart';

import 'custom_button.dart';

class Command extends StatelessWidget {
  final String buttonText;

  const Command({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(buttonText: buttonText),
        ],
      ),
    );
  }
}
