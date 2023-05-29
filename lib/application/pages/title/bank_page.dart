import 'package:flutter/material.dart';
import 'package:flutter_playground/application/pages/title/widgets/bottom_section.dart';
import 'package:flutter_playground/application/pages/title/widgets/center_section.dart';

class BankPage extends StatelessWidget {
  const BankPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text("Easy Bank"),
        ),
        body: const Center(
          child: Column(children: <Widget>[
            Expanded(child: Center(child: Text("Pierwszy wiersz"))),
            Expanded(child: BankCenterSection()),
            Expanded(child: BankBottomSection()),
          ]),
        ));
  }
}
