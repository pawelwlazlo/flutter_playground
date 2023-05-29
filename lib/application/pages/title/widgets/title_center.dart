import 'package:flutter/material.dart';

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
