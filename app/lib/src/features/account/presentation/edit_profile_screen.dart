import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flag/flag.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toastification/toastification.dart';
import 'package:travel_link/src/common_widgets/boxed_content.dart';
import 'package:travel_link/src/common_widgets/profile_widgets.dart';
import 'package:travel_link/src/features/account/domain/user_account.dart';
import 'package:travel_link/src/features/account/presentation/account_controller.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/helpers/localization.dart';
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
  EditMode editMode = EditMode.none;

  late List<String> languageList = [];
  late List<String> interestsList = [];

  Future<void> saveProfileToDatabase() async {
    final accountController = ref.read(accountControllerProvider.notifier);
    accountController.updateProfilePicture(
      picture: profilePicture!,
    );
    accountController.updateUserData(
      data: {
        'publicName': nameController.text,
        'description': aboutMeController.text,
        'city': cityController.text,
        'languages': languageList,
        'interests': interestsList,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    languageList = widget.userAccount.languages;
    interestsList = widget.userAccount.interests;
  }

  final defaultAboutMeText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ';

  final defaultUsername = 'John Doe';

  final defaultCity = 'New York';

  Uint8List? profilePicture;

  final nameController = TextEditingController();

  final aboutMeController = TextEditingController();

  final cityController = TextEditingController();

  final newLanguageController = TextEditingController();
  final newInterestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.userAccount.publicName ?? defaultUsername;
    aboutMeController.text =
        widget.userAccount.description ?? defaultAboutMeText;
    cityController.text = widget.userAccount.city ?? defaultCity;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.editProfileHeading),
      ),
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        onPressed: () async {
          // Save changes
          await saveProfileToDatabase();
          Navigator.pop(context);
          toastification.show(
            context: context,
            type: ToastificationType.success,
            style: ToastificationStyle.flat,
            title: Text(context.loc.accountNotificationProfileSaved),
            alignment: Alignment.topCenter,
            autoCloseDuration: const Duration(seconds: 3),
            closeButtonShowType: CloseButtonShowType.none,
          );
        },
        label: Text(context.loc.editProfileSave),
        icon: const Icon(Icons.save),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                const SizedBox(
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
                      setState(() {
                        profilePicture = bytes;
                      });
                    },
                    child: SizedBox(
                      height: 100,
                      child: FittedBox(
                        child: CachedNetworkImage(
                          imageUrl: widget.userAccount.pictureUrl ??
                              'https://picsum.photos/200/300',
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            radius: 50,
                            backgroundImage: profilePicture != null
                                ? MemoryImage(profilePicture!)
                                : imageProvider,
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
                const SizedBox(
                  height: 5,
                ),
                BoxedContent(
                  boxDecoration: boxDecoration,
                  content: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.loc.editProfilePersonalInformation,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: context.loc.editProfileName,
                            labelStyle: const TextStyle(fontSize: 15),
                            hintStyle: const TextStyle(fontSize: 15),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: cityController,
                          decoration: InputDecoration(
                            labelText: context.loc.editProfileOrigin,
                            labelStyle: const TextStyle(fontSize: 15),
                            hintStyle: const TextStyle(fontSize: 15),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: aboutMeController,
                          maxLines: 3,
                          maxLength: 200,
                          style: Theme.of(context).textTheme.bodyMedium,
                          decoration: InputDecoration(
                            labelText: context.loc.editProfileAboutMe,
                            labelStyle: const TextStyle(fontSize: 15),
                            hintStyle: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
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
                              context.loc.editProfileLanguages,
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
                                onPressed: () => showCountryPicker(
                                  context: context,
                                  onSelect: (Country country) {
                                    setState(() {
                                      languageList.add(country.countryCode);
                                    });
                                  },
                                  countryListTheme: CountryListThemeData(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40),
                                    ),
                                    inputDecoration: InputDecoration(
                                      labelText: context
                                          .loc.editProfileLanguagesSearch,
                                      hintText: context
                                          .loc.editProfileLanguagesSearch,
                                      prefixIcon: const Icon(Icons.search),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xFF8C98A8)
                                              .withOpacity(0.2),
                                        ),
                                      ),
                                    ),
                                    searchTextStyle: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                icon: const Icon(Icons.add),
                              ),
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
                const SizedBox(height: 10),
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
                              context.loc.editProfileInterests,
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
                                onPressed: () => showDialog<AlertDialog>(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(context
                                          .loc.editProfileInterestsAddInterest),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            controller: newInterestController,
                                            decoration: InputDecoration(
                                              labelText: context.loc
                                                  .editProfileInterestsAddInterestPlaceholder,
                                              labelStyle:
                                                  const TextStyle(fontSize: 15),
                                              hintStyle:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    interestsList.add(
                                                      newInterestController
                                                          .text,
                                                    );
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Text(context.loc
                                                    .editProfileInterestsAddInterestConfirm),
                                              ),
                                              const Spacer(),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(context.loc
                                                    .editProfileInterestsAddInterestCancel),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                icon: const Icon(Icons.add),
                              ),
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
