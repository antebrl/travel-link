import 'package:flutter/material.dart';
import 'package:travel_link/src/common_widgets/boxed_content.dart';
import 'package:travel_link/src/utils/helpers/localization.dart';
import 'package:travel_link/src/utils/theme/widget_themes/boxDecoration_theme.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _options = [
      {'option': context.loc.accountSettingsPrivateProfile, 'value': false},
      {
        'option': context.loc.accountSettingsReceiveNotifications,
        'value': false
      },
      {'option': context.loc.accountSettingsReceiveNewsletter, 'value': false},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.accountSettings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BoxedContent(
          boxDecoration: boxDecoration,
          padding: const EdgeInsets.all(10),
          content: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _options.map((option) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(option['option'] as String),
                    Switch(
                      value: option['value'] as bool,
                      onChanged: (value) {
                        setState(() {
                          option['value'] = value;
                        });
                      },
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
