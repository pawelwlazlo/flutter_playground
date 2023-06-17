import 'package:flutter/material.dart';

import '../../core/widgets/custom_app_bar.dart';

class BankTrasferPage extends StatelessWidget {
  const BankTrasferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Bank transfer',
      ),
      body: Center(
        child: Text('Bank transfer page'),
      )
    );
  }
}
