import 'package:flutter/material.dart';
import 'package:flutter_playground/application/pages/title/widgets/command.dart';

class BankBottomSection extends StatelessWidget {
  const BankBottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const <Widget>[
        Command(buttonText:"BLIK"),
        Command(buttonText: "dwa",)
      ],
    );
  }
}
