import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/core/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

import '../../../injection.dart';
import '../../core/services/theme_service.dart';
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
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return BlocProvider<BankLoginCubit>(
      create: (context) => BankLoginCubit(),
      child: BlocBuilder<BankLoginCubit, BankLoginState>(
        builder: (context, state) {
          if (state is BankLoginInitial || state is BankLoginError) {
            return Scaffold(
              backgroundColor: Colors.blue,
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
                        errorText: state is BankLoginError
                            ? 'Nieprawidłowy login'
                            : null,
                      ),
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Hasło',
                        errorText: state is BankLoginError
                            ? 'Nieprawidłowe hasło'
                            : null,
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
          } else if (state is BankLoginSuccess) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Wpisz PIN'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _pinController,
                      decoration: InputDecoration(
                        labelText: 'PIN',
                        errorText: state is BankLoginError
                            ? 'Nieprawidłowy PIN'
                            : null,
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        final String pin = _pinController.text;
                        context.read<BankLoginCubit>().submitPin(pin);
                      },
                      child: Text('Zaloguj'),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
