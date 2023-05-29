import 'package:flutter/material.dart';
import 'package:flutter_playground/application/pages/title/widgets/title_center.dart';
import 'package:flutter_playground/application/pages/title/widgets/title_down.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({super.key});
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
            Expanded(child: TitleCenter()),
            Expanded(child: TitleDown()),
          ]),
        ));
  }
}
