import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  var menuItems_1 = <Map<String, dynamic>>[
    {'label': 'WLAN', 'icon': Icons.wifi, 'color': Colors.blue},
    {'label': 'Bluetooth', 'icon': Icons.bluetooth, 'color': Colors.blue},
    {
      'label': 'Mobilfunknetz',
      'icon': Icons.signal_cellular_alt,
      'color': Colors.green
    },
    {
      'label': 'Device+',
      'icon': Icons.control_point_duplicate_rounded,
      'color': Colors.blue
    },
    {
      'label': 'Weitere Verbindungen',
      'icon': Icons.link,
      'color': Colors.orange
    },
  ];

  var menuItems_2 = <Map<String, dynamic>>[
    {
      'label': 'Startbildschirm & Hintergrund',
      'icon': Icons.image,
      'color': Colors.green
    },
    {
      'label': 'Anzeige & Helligkeit',
      'icon': Icons.remove_red_eye,
      'color': Colors.green
    },
  ];

  var menuItems_3 = <Map<String, dynamic>>[
    {
      'label': 'Töne & Vibration',
      'icon': Icons.volume_up,
      'color': Colors.purple
    },
    {
      'label': 'Anzeige & Helligkeit',
      'icon': Icons.remove_red_eye,
      'color': Colors.orange
    },
  ];

  var menuItems_4 = <Map<String, dynamic>>[
    {'label': 'Biometrie & Passwort', 'icon': Icons.key, 'color': Colors.cyan},
    {'label': 'Apps', 'icon': Icons.apps, 'color': Colors.orange},
    {'label': 'Akku', 'icon': Icons.battery_full, 'color': Colors.green},
    {'label': 'Speicher', 'icon': Icons.sd_storage, 'color': Colors.blue},
    {'label': 'Sicherheit', 'icon': Icons.security, 'color': Colors.cyan},
    {'label': 'Datenschutz', 'icon': Icons.privacy_tip, 'color': Colors.cyan},
    {
      'label': 'Standortzugriff',
      'icon': Icons.location_on,
      'color': Colors.cyan
    },
  ];

  var menuItems_5 = <Map<String, dynamic>>[
    {
      'label': 'Digital Balance',
      'icon': Icons.watch_later_outlined,
      'color': Colors.green
    },
    {
      'label': 'Bedienungshilfen',
      'icon': Icons.touch_app,
      'color': Colors.orange
    },
  ];

  var menuItems_6 = <Map<String, dynamic>>[
    {'label': 'Nutzer & Konten', 'icon': Icons.person, 'color': Colors.red},
    {'label': 'HMS Core', 'icon': Icons.touch_app, 'color': Colors.red},
    {'label': 'Google', 'icon': Icons.person, 'color': Colors.green},
    {
      'label': 'System & Aktualisierungen',
      'icon': Icons.settings,
      'color': Colors.blue
    },
    {
      'label': 'Über das Telefon',
      'icon': Icons.info_outline,
      'color': Colors.grey
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text('Einstellungen'),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Suchen',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.grey[850],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ProfileCard(
                    profilePictureUrl: "https://picsum.photos/200",
                  ),
                  const SizedBox(height: 20),
                  MenuItemGroup(
                    textTheme: Theme.of(context).textTheme,
                    menuItems: menuItems_1,
                  ),
                  const SizedBox(height: 20),
                  MenuItemGroup(
                    textTheme: Theme.of(context).textTheme,
                    menuItems: menuItems_2,
                  ),
                  const SizedBox(height: 20),
                  MenuItemGroup(
                    textTheme: Theme.of(context).textTheme,
                    menuItems: menuItems_3,
                  ),
                  const SizedBox(height: 20),
                  MenuItemGroup(
                    textTheme: Theme.of(context).textTheme,
                    menuItems: menuItems_4,
                  ),
                  const SizedBox(height: 20),
                  MenuItemGroup(
                    textTheme: Theme.of(context).textTheme,
                    menuItems: menuItems_5,
                  ),
                  const SizedBox(height: 20),
                  MenuItemGroup(
                    textTheme: Theme.of(context).textTheme,
                    menuItems: menuItems_6,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class ProfileCard extends StatelessWidget {
  ProfileCard({
    super.key,
    required this.profilePictureUrl,
  });

  final String profilePictureUrl;

  final boxDecoration = BoxDecoration(
    color: Colors.grey[850],
    borderRadius: BorderRadius.circular(10),
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: Ink(
        decoration: boxDecoration,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                height: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: FittedBox(
                    child: CachedNetworkImage(
                      imageUrl: profilePictureUrl,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error, color: Colors.red),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Funnyuser0815',
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.fade,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'HUAWEI ID, Zahlungen und Käufe, Cloud und mehr',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItemGroup extends StatelessWidget {
  var menuItems;

  MenuItemGroup({
    super.key,
    required this.textTheme,
    required this.menuItems,
  });

  final TextTheme textTheme;

  final boxDecoration = BoxDecoration(
    color: Colors.grey[850],
    borderRadius: BorderRadius.circular(13),
  );

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: boxDecoration,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          for (var i = 0; i < menuItems.length; i++) ...[
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    horizontalTitleGap: 20,
                    title: Text(
                      menuItems[i]['label'] as String,
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                    leading: Container(
                      decoration: BoxDecoration(
                        color: menuItems[i]['color'] as Color?,
                        shape: BoxShape.circle,
                      ),
                      child: SizedBox(
                        width: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Icon(
                              menuItems[i]['icon'] as IconData?,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (i != menuItems.length - 1)
                    Divider(
                      endIndent: 10,
                      indent: 50,
                      thickness: 1,
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
