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
  final _settings = {
    'privateProfile': false,
    'receiveNotifications': false,
    'receiveNewsletter': false,
  };
  @override
  Widget build(BuildContext context) {
    final settingsLabels = {
      'privateProfile': context.loc.accountSettingsPrivateProfile,
      'receiveNotifications': context.loc.accountSettingsReceiveNotifications,
      'receiveNewsletter': context.loc.accountSettingsReceiveNewsletter,
    };

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
              children: _settings.keys
                  .map(
                    (key) => SwitchListTile(
                      title: Text(settingsLabels[key]!),
                      value: _settings[key]!,
                      onChanged: (value) {
                        setState(() {
                          _settings[key] = value;
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
