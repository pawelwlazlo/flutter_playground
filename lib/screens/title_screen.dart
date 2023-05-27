import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});
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

class TitleDown extends StatelessWidget {
  const TitleDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class TitleCenter extends StatelessWidget {
  const TitleCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const <Widget>[
        Center(
          child: Text("Drugi wiersz"),
        ),
        Center(
          child: Text("Trzeci wiersz"),
        ),
      ],
    );
  }
}
