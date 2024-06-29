import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flag/flag.dart';
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toastification/toastification.dart';
import 'package:travel_link/src/common_widgets/boxed_content.dart';
import 'package:travel_link/src/common_widgets/profile_widgets.dart';
import 'package:travel_link/src/features/account/domain/user_account.dart';
import 'package:travel_link/src/features/account/presentation/account_controller.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/trip_overview/data/user_repository.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/theme/widget_themes/boxDecoration_theme.dart';

enum EditMode { none, language, interest }

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({
    required this.userAccount,
    super.key,
  });

  final UserAccount userAccount;

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
//   List<FlagsCode> languageData = [
//     FlagsCode.US,
//     FlagsCode.DE,
//     FlagsCode.FR,
//     FlagsCode.ES,
//     FlagsCode.IT,
//     FlagsCode.RU,
//     FlagsCode.CN,
//     FlagsCode.JP,
//     FlagsCode.KR,
//     FlagsCode.IN,
//   ];

//   List<Map<String, dynamic>> interestsData = [
//     {"icon": Icons.airplanemode_active, "label": "Travel"},
//     {"icon": Icons.book, "label": "Reading"},
//     {"icon": Icons.music_note, "label": "Music"},
//     {"icon": Icons.sports_soccer, "label": "Sports"},
//     {"icon": Icons.brush, "label": "Art"},
//     {"icon": Icons.computer, "label": "Technology"},
//     {"icon": Icons.fastfood, "label": "Food"},
//     {"icon": Icons.movie, "label": "Movies"},
//     {"icon": Icons.local_cafe, "label": "Coffee"},
//     {"icon": Icons.local_bar, "label": "Drinks"},
//   ];

  EditMode editMode = EditMode.none;

  late List<String> languageList = [];
  late List<String> interestsList = [];

  void saveProfileToDatabase() {
    final accountController = ref.read(accountControllerProvider.notifier);
    accountController.updateUserData(
      data: {
        'publicName': nameController.text,
        'description': aboutMeController.text,
        'city': cityController.text,
        'languages': languageList,
        'interests': interestsList,
      },
    );

    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      title: const Text("Profile updated"),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      closeButtonShowType: CloseButtonShowType.none,
    );
  }

  @override
  void initState() {
    super.initState();
    languageList = widget.userAccount.languages;
    interestsList = widget.userAccount.interests;
  }

  final defaultAboutMeText =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ";

  final defaultUsername = "John Doe";

  final defaultCity = "New York";

  final nameController = TextEditingController();

  final aboutMeController = TextEditingController();

  final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.userAccount.publicName ?? defaultUsername;
    aboutMeController.text =
        widget.userAccount.description ?? defaultAboutMeText;
    cityController.text = widget.userAccount.city ?? defaultCity;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        onPressed: () {
          // Save changes
          saveProfileToDatabase();
          Navigator.pop(context);
        },
        label: const Text('Save'),
        icon: const Icon(Icons.save),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();
                      final accountController =
                          ref.read(accountControllerProvider.notifier);
                      final XFile? image = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (image == null) return;
                      final Uint8List bytes = await image.readAsBytes();
                      await accountController.updateProfilePicture(
                          picture: bytes);
                    },
                    child: SizedBox(
                      height: 100,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: CachedNetworkImage(
                          imageUrl: widget.userAccount.pictureUrl ??
                              'https://picsum.photos/200/300',
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            radius: 50,
                            backgroundImage: imageProvider,
                          ),
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
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
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
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
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
                            if (editMode != EditMode.language)
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.add)),
                            const VerticalDivider(
                              color: CustomColors.grey,
                              thickness: 1,
                              endIndent: 25,
                              indent: 25,
                              width: 1,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (editMode != EditMode.language) {
                                    editMode = EditMode.language;
                                  } else {
                                    editMode = EditMode.none;
                                  }
                                });
                              },
                              icon: const Icon(Icons.edit),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              Wrap(
                                spacing: 10,
                                runSpacing: 4,
                                children: languageList.map((language) {
                                  return CustomChip(
                                    avatar: editMode == EditMode.language
                                        ? const Icon(Icons.close)
                                        : Flag.fromString(language),
                                    onPressed: () {
                                      setState(() {
                                        languageList.remove(language);
                                      });
                                    },
                                    label: language,
                                  );
                                }).toList(),
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
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
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
                            if (editMode != EditMode.interest)
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.add)),
                            const VerticalDivider(
                              color: CustomColors.grey,
                              thickness: 1,
                              endIndent: 25,
                              indent: 25,
                              width: 1,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (editMode != EditMode.interest) {
                                    editMode = EditMode.interest;
                                  } else {
                                    editMode = EditMode.none;
                                  }
                                });
                              },
                              icon: const Icon(Icons.edit),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              Wrap(
                                spacing: 4,
                                runSpacing: 4,
                                children: interestsList.map((interest) {
                                  final index = interestsList.indexOf(interest);
                                  return CustomChip(
                                    avatar: editMode == EditMode.interest
                                        ? const Icon(Icons.close)
                                        : const Icon(Icons.circle),
                                    onPressed: () {
                                      setState(() {
                                        interestsList.removeAt(index);
                                      });
                                    },
                                    label: interest,
                                  );
                                }).toList(),
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
      ),
    );
  }
}
