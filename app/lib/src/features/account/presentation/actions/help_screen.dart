import 'package:flutter/material.dart';
import 'package:travel_link/src/utils/helpers/localization.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountHelpScreen extends StatelessWidget {
  const AccountHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.accountHelp),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                const url =
                    'https://hcimo4x-grey-trapp-hci-trapp-hci-lab-studi-sose2-e6afe3a1eb2adc.h-da.io/docs/';
                final url0 = Uri.parse(url);
                launchUrl(url0);
              },
              label: Text(context.loc.accountHelpDocumentation),
              icon: const Icon(Icons.menu_book),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                const url = 'https://h-da.de/';
                final url0 = Uri.parse(url);
                launchUrl(url0);
              },
              label: Text(context.loc.accountHelpHdaWebsite),
              icon: const Icon(Icons.public),
            ),
          ],
        ),
      ),
    );
  }
}
