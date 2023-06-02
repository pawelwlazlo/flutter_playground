import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return InkResponse(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          elevation: 20,
          borderRadius: const BorderRadius.all(Radius.circular(150)),
          child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(100)),
              ),
              child: const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10, vertical: 15),
                    child: Text('Blik'),
              )),
        ),
      ),
    );
  }
}
