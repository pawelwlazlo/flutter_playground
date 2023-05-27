import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
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
            Expanded(child: Center(child: Text("Drugi wiersz"))),
            Expanded(child: Center(child: Text("Trzeci wiersz"))),
          ]),
        ));
  }
}
