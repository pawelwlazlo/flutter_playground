import 'package:flutter/material.dart';


class Command extends StatelessWidget {
  final String buttonText;

  const Command({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text(buttonText),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(54),
            ),
          ),
        ],
      ),
    );
  }
}
