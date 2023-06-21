import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_bank/application/pages/bank/bank_page.dart';
import 'package:easy_bank/application/pages/bank/cubit/bank_cubit.dart';
import 'package:easy_bank/application/pages/bank_transfer/cubit/bank_transfer_cubit.dart';
import 'package:easy_bank/application/pages/login/cubit/bank_login_cubit.dart';
import 'package:easy_bank/application/pages/login/login_page.dart';
import 'package:easy_bank/theme.dart';
import 'package:provider/provider.dart';

import 'application/core/services/theme_service.dart';
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
    final theme = Theme.of(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(lazy: false, create: (context) => BankTransferCubit()),
          BlocProvider(
              lazy: false,
              create: (context) => BankCubit(
                  getBankAccountsUseCase: di.sl(),
                  bankTransferCubit:
                      BlocProvider.of<BankTransferCubit>(context))),
          BlocProvider(
              lazy: false,
              create: (context) => BankLoginCubit(
                  getUserUseCase: di.sl(), checkUserPinUseCase: di.sl())),
        ],
        child: Consumer<ThemeService>(builder: (context, themeService, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode:
                themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            initialRoute: '/',
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/':
                  return MaterialPageRoute(
                      builder: (context) => const BankLoginWidget());
                case '/bank':
                  return MaterialPageRoute(
                      builder: (context) => const BankPage());
                default:
                  return MaterialPageRoute(
                      builder: (context) => const BankLoginWidget());
              }
            },
          );
        }));
  }
}
