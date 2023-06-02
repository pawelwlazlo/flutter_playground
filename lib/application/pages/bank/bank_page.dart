import 'package:flutter/material.dart';
import 'package:flutter_playground/application/core/services/theme_service.dart';
import 'package:flutter_playground/application/pages/bank/widgets/bottom_section.dart';
import 'package:flutter_playground/application/pages/bank/widgets/center_section.dart';
import 'package:provider/provider.dart';

class BankPage extends StatelessWidget {
  const BankPage({super.key});
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text("Easy Bank"),
          titleTextStyle: themeData.textTheme.displaySmall,
          actions: [
            Switch(
                value: Provider.of<ThemeService>(context).isDarkModeOn,
                onChanged: (_) {
                  Provider.of<ThemeService>(context, listen: false)
                      .toggleTheme();
                }),
          ],
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
