import 'package:flutter/material.dart';

class BankBottomSection extends StatelessWidget {
  const BankBottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        const Center(
          child: Text("Drugi wiersz"),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Przycisk"),
          ),
        ),
      ],
    );
  }
}
