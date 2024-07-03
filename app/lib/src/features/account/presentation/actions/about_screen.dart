import 'package:flutter/material.dart';

class AccountAboutScreen extends StatelessWidget {
  const AccountAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/design/travellink_logo.png',
              width: 100,
              height: 100,
            ),
            Text(
              'TraveLink',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Made with ❤️ by the TraveLink team',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Version 1.0.0',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Image.asset(
              'assets/images/design/hochschule_da-eut__logo.png',
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
