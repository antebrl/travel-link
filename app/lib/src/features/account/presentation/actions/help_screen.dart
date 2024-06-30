import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountHelpScreen extends StatelessWidget {
  const AccountHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  const url =
                      'https://hcimo4x-grey-trapp-hci-trapp-hci-lab-studi-sose2-e6afe3a1eb2adc.h-da.io/docs/';
                  final _url = Uri.parse(url);
                  launchUrl(_url);
                },
                label: const Text('Documentation'),
                icon: const Icon(Icons.menu_book)),
            const SizedBox(height: 20),
            ElevatedButton.icon(
                onPressed: () {
                  const url = 'https://h-da.de/';
                  final _url = Uri.parse(url);
                  launchUrl(_url);
                },
                label: const Text('h_da Website'),
                icon: const Icon(Icons.public)),
          ],
        ),
      ),
    );
  }
}
