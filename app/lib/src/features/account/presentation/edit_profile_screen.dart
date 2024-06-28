import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flag/flag.dart';
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_link/src/common_widgets/boxed_content.dart';
import 'package:travel_link/src/common_widgets/profile_widgets.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/theme/widget_themes/boxDecoration_theme.dart';

enum EditMode { language, interest }

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  List<FlagsCode> languageData = [
    FlagsCode.US,
    FlagsCode.DE,
    FlagsCode.FR,
    FlagsCode.ES,
    FlagsCode.IT,
    FlagsCode.RU,
    FlagsCode.CN,
    FlagsCode.JP,
    FlagsCode.KR,
    FlagsCode.IN,
  ];

  List<Map<String, dynamic>> interestsData = [
    {"icon": Icons.airplanemode_active, "label": "Travel"},
    {"icon": Icons.book, "label": "Reading"},
    {"icon": Icons.music_note, "label": "Music"},
    {"icon": Icons.sports_soccer, "label": "Sports"},
    {"icon": Icons.brush, "label": "Art"},
    {"icon": Icons.computer, "label": "Technology"},
    {"icon": Icons.fastfood, "label": "Food"},
    {"icon": Icons.movie, "label": "Movies"},
    {"icon": Icons.local_cafe, "label": "Coffee"},
    {"icon": Icons.local_bar, "label": "Drinks"},
  ];

  List<CustomChip> languageChipList = [];
  List<CustomChip> interestsChipList = [];

  List<Widget> _buildLanguageChipWidgets() {
    return languageData
        .map((entry) => CustomChip(
              avatar: _getAvatar(EditMode.language, Flag.fromCode(entry)),
              onPressed: () {},
              label: entry.toString().split('.').last,
            ))
        .toList();
  }

  List<Widget> _buildInterestsChipWidgets() {
    return interestsData
        .asMap()
        .entries
        .map((entry) => CustomChip(
              avatar: _getAvatar(
                  EditMode.interest, Icon(entry.value["icon"] as IconData)),
              onPressed: () {
                if (!getIsEditMode(EditMode.interest)) {
                  return;
                }
                removeInterest(entry.key);
              },
              label: entry.value["label"] as String,
            ))
        .toList();
  }

  void updateLanguageChips() {
    List<Widget> chips = _buildLanguageChipWidgets();
    setState(() {
      languageChipList = chips.cast<CustomChip>();
    });
  }

  void updateInterestsChips() {
    List<Widget> chips = _buildInterestsChipWidgets();
    setState(() {
      interestsChipList = chips.cast<CustomChip>();
    });
  }

  void removeLanguage(int index) {
    setState(() {
      languageChipList.removeAt(index);
    });
  }

  void removeInterest(int index) {
    if (interestsChipList.length == 0) {
      print(interestsChipList);
      return;
    }
    print('Removing interest at index: $index');
    print('Interest list length: ${interestsChipList.length}');
    setState(() {
      interestsChipList.removeAt(index);
    });
  }

  Widget _getAvatar(EditMode mode, Widget avatar) {
    if (mode == EditMode.language) {
      return _isLanguageEditMode ? const Icon(Icons.close) : avatar;
    } else {
      return _isInterestEditMode ? const Icon(Icons.close) : avatar;
    }
  }

  void handleChipTap() {
    setState(() {
      languageChipList.removeLast();
    });
  }

  @override
  void initState() {
    super.initState();
    updateLanguageChips(); // Initialize language chips
    updateInterestsChips(); // Initialize interests chips
  }

  bool _isLanguageEditMode = false;
  bool _isInterestEditMode = false;
  void enterLanguageEditingMode(EditMode mode) {
    setState(() {
      if (mode == EditMode.language) {
        _isLanguageEditMode = !_isLanguageEditMode;
      } else {
        _isInterestEditMode = !_isInterestEditMode;
      }
    });
  }

  bool getIsEditMode(EditMode mode) {
    if (mode == EditMode.language) {
      return _isLanguageEditMode;
    } else {
      return _isInterestEditMode;
    }
  }

  final aboutMeText =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ";

  final username = "John Doe";

  final city = "New York";

  final nameController = TextEditingController();

  final aboutMeController = TextEditingController();

  final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = username;
    aboutMeController.text = aboutMeText;
    cityController.text = city;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  height: 100,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: 'https://via.placeholder.com/150',
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              BoxedContent(
                boxDecoration: boxDecoration,
                content: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Personal Information",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(fontSize: 15),
                          hintStyle: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: cityController,
                        decoration: const InputDecoration(
                          labelText: 'City',
                          labelStyle: TextStyle(fontSize: 15),
                          hintStyle: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: aboutMeController,
                        maxLines: 3,
                        maxLength: 200,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: const InputDecoration(
                          labelText: 'About me',
                          labelStyle: TextStyle(fontSize: 15),
                          hintStyle: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              BoxedContent(
                boxDecoration: boxDecoration,
                content: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(
                          "Languages",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const Spacer(),
                        if (!_isLanguageEditMode)
                          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                        const VerticalDivider(
                          color: CustomColors.grey,
                          thickness: 1,
                          endIndent: 25,
                          indent: 25,
                          width: 1,
                        ),
                        IconButton(
                            onPressed: () =>
                                enterLanguageEditingMode(EditMode.language),
                            icon: Icon(Icons.edit)),
                      ]),
                      SizedBox(
                        height: 100,
                        child: ListView(
                          children: [
                            Wrap(
                              spacing: 10,
                              runSpacing: 4,
                              children: languageChipList,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              BoxedContent(
                boxDecoration: boxDecoration,
                content: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(
                          "Interests",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const Spacer(),
                        if (!_isInterestEditMode)
                          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                        const VerticalDivider(
                          color: CustomColors.grey,
                          thickness: 1,
                          endIndent: 25,
                          indent: 25,
                          width: 1,
                        ),
                        IconButton(
                            onPressed: () =>
                                enterLanguageEditingMode(EditMode.interest),
                            icon: Icon(Icons.edit)),
                      ]),
                      SizedBox(
                        height: 100,
                        child: ListView(
                          children: [
                            Wrap(
                              spacing: 4,
                              runSpacing: 4,
                              children: interestsChipList,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
