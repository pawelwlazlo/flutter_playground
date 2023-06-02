import 'package:flutter/material.dart';


class Command extends StatelessWidget {
  final String buttonText;

  const Command({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(
                side: BorderSide(
                  color: Colors.black54,
                  width: 4
                )
              ),
              padding: const EdgeInsets.all(54),
            ),
            child: Text(buttonText, style: TextStyle(
              color: Colors.black54, fontSize: themeData.textTheme.displayLarge?.fontSize
            ),),
          ),
        ],
      ),
    );
  }
}
