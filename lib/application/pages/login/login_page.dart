import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/application/core/widgets/custom_app_bar.dart';
import 'package:flutter_playground/application/pages/bank/bank_page.dart';
import 'package:flutter_playground/application/pages/bank/cubit/bank_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'cubit/bank_login_cubit.dart';

class BankLoginWidget extends StatelessWidget {
  const BankLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<BankLoginCubit, BankLoginState>(
      listener: (context, state) {
        final status = state.status;
        if (status == BankLoginStateEnum.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Nieprawidłowy login lub hasło'),
              backgroundColor: theme.colorScheme.error,
            ),
          );
        } else if (status == BankLoginStateEnum.pinError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Nieprawidłowy PIN'),
              backgroundColor: theme.colorScheme.error,
            ),
          );
        } else if (status == BankLoginStateEnum.pinSuccess) {

          Provider.of<BankCubit>(context, listen: false).logIn(
            userId: state.id!,
            login: state.login!,
            fullName: state.fullName!,
          );


          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const BankPage()),
          );
        }
      },
      builder: (context, state) {
        final status = state.status;

        if (status == BankLoginStateEnum.initial ||
            status == BankLoginStateEnum.error) {
          return LoginWidget(state: state, theme: theme);
        } else if (status == BankLoginStateEnum.success) {
          return PinWidget(state: state, theme: theme);
        } else if (status == BankLoginStateEnum.pinError) {
          return PinWidget(state: state, theme: theme);
        }
        return const SizedBox();
      },
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
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const CustomAppBar(
        title: 'Easy Bank Login',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SvgPicture.asset(
                'assets/eb.svg',
                fit: BoxFit.fitWidth,
                width: 1200,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  TextField(
                    controller: _loginController,
                    decoration: const InputDecoration(
                      labelText: 'Login',
                    ),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Hasło',
                    ),
                    obscureText: true,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      final String login = _loginController.text;
                      final String password = _passwordController.text;
                      context.read<BankLoginCubit>().logIn(login, password);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(
                          side: BorderSide(
                              color: theme.colorScheme.primary, width: 4)),
                      padding: const EdgeInsets.all(54),
                    ),
                    child: const Text('Zaloguj'),
                  ),
                ],
              ),
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
    final TextEditingController pinController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: 'Easy Bank Login',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Text("Witaj ${state.fullName}")),
            Expanded(
              child: Column(
                children: [
                  TextField(
                    controller: pinController,
                    decoration: InputDecoration(
                      labelText: 'PIN',
                      errorText: state.status == BankLoginStateEnum.pinError
                          ? 'Nieprawidłowy PIN'
                          : null,
                    ),
                    obscureText: true,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(
                          side: BorderSide(
                              color: theme.colorScheme.primary, width: 4)),
                      padding: const EdgeInsets.all(54),
                    ),
                    onPressed: () {
                      final String pin = pinController.text;
                      context.read<BankLoginCubit>().submitPin(pin);
                    },
                    child: const Text('Zaloguj'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
