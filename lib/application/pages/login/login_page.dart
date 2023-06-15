import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/core/widgets/custom_app_bar.dart';
import 'package:flutter_playground/application/pages/bank/bank_page.dart';

import 'package:flutter_playground/injection.dart';
import 'package:flutter_playground/application/pages/bank/cubit/bank_cubit.dart';
import 'cubit/bank_login_cubit.dart';

class BankLoginWidgetProvider extends StatelessWidget {
  const BankLoginWidgetProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<BankLoginCubit>(), child: BankLoginWidget());
  }
}

class BankLoginWidget extends StatelessWidget {
  const BankLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider<BankLoginCubit>(
      create: (context) => BankLoginCubit(),
      child: BlocBuilder<BankLoginCubit, BankLoginState>(
        builder: (context, state) {
          if (state is BankLoginInitial || state is BankLoginError) {
            return LoginWidget(state: state, theme: theme);
          } else if (state is BankLoginSuccess) {
            return PinWidget(state: state, theme: theme);
          } else if (state is BankPinSuccess) {
            sl<BankCubit>().logIn(
                login: state.bankLoginStateModel.login!,
                fullName: state.bankLoginStateModel.fullName!,
                context: context);
            Future.delayed(const Duration(milliseconds: 500), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const BankPageWrapperProvider()),
              );
            });
          } else if (state is BankPinError) {
            return PinWidget(state: state, theme: theme);
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final BankLoginState state;
  final ThemeData theme;

  LoginWidget({super.key, required this.state, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _loginController,
              decoration: InputDecoration(
                labelText: 'Login',
                errorText:
                    state is BankLoginError ? 'Nieprawidłowy login' : null,
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Hasło',
                errorText:
                    state is BankLoginError ? 'Nieprawidłowe hasło' : null,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final String login = _loginController.text;
                final String password = _passwordController.text;
                context.read<BankLoginCubit>().logIn(login, password);
              },
              child: const Text('Zaloguj'),
            ),
          ],
        ),
      ),
    );
  }
}

class PinWidget extends StatelessWidget {
  const PinWidget({super.key, required this.state, required this.theme});

  final BankLoginState state;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _pinController = TextEditingController();
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _pinController,
              decoration: InputDecoration(
                labelText: 'PIN',
                errorText: state is BankLoginError ? 'Nieprawidłowy PIN' : null,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final String pin = _pinController.text;
                context.read<BankLoginCubit>().submitPin(pin);
              },
              child: const Text('Zaloguj'),
            ),
          ],
        ),
      ),
    );
  }
}
