import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  const CustomButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return InkResponse(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          elevation: 20,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(100)),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 40),
                    child: Text(buttonText),
              )),
        ),
      ),
    );
  }
}
