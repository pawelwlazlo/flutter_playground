import 'package:flutter/material.dart';
import 'package:flutter_playground/application/pages/bank/bank_page.dart';
import 'package:flutter_playground/application/pages/login/login_page.dart';
import 'package:flutter_playground/theme.dart';
import 'package:provider/provider.dart';

import 'application/core/services/theme_service.dart';
import 'color_schemes.g.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                  builder: (context) => const BankLoginWidgetProvider());
            case '/bank':
              return MaterialPageRoute(
                  builder: (context) => const BankPageWrapperProvider());
            default:
              return MaterialPageRoute(
                  builder: (context) => const BankLoginWidgetProvider());
          }
        },
      );
    });
  }
}
