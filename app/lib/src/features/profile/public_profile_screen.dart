import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_link/src/features/account/data/account_repository.dart';
import 'package:travel_link/src/features/trip_overview/data/user_repository.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';
import 'package:travel_link/src/utils/theme/widget_themes/boxDecoration_theme.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  UserProfileScreen({super.key, required this.targetuid});

  final String targetuid;

  @override
  ConsumerState<UserProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    const listTilePadding = EdgeInsets.only(left: 10, right: 10, top: 10);
    var userData = ref.watch(fetchUserProvider(widget.targetuid));

    var defaultDescription = 'No description';
    var defaultName = 'No name';
    final user_name = userData.when(
      data: (userAccount) => userAccount?.displayName ?? defaultName,
      loading: () => 'Loading...',
      error: (_, __) => 'Error',
    );
    final user_description = userData.when(
      data: (userAccount) => userAccount?.description ?? defaultDescription,
      loading: () => 'Loading...',
      error: (_, __) => 'Error',
    );
    final userProfilePicture = userData.when(
      data: (userAccount) => CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(
          userAccount?.pictureUrl ?? CustomImages.defaultProfilePictureUrl,
        ),
      ),
      loading: () => const CircularProgressIndicator(),
      error: (_, __) => const Text('Error'),
    );
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(user_name)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: listTilePadding,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Ink(
                  decoration: boxDecoration,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: userProfilePicture,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user_name,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                                overflow: TextOverflow.fade,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                user_description,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.group_add,
                            color: CustomColors.buttonPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // About me
            BoxedListTile(
              boxDecoration: boxDecoration,
              headline: 'About me',
              content: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 200,
                          padding: const EdgeInsets.only(
                              left: 30, right: 20, bottom: 5),
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            children: const [
                              Wrap(
                                children: [
                                  Text(
                                    'Hi there! \n\nI am a software engineer with a passion for mobile development. I have been working in the industry for 5 years and I am always looking for new challenges. I am a team player and I love to work in a multicultural environment',
                                    overflow: TextOverflow.fade,
                                  ),
                                ],
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
            // Languages
            BoxedListTile(
              boxDecoration: boxDecoration,
              headline: 'Languages',
              content: Column(
                children: [
                  Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 10, right: 20),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return LanguageChip(
                          flag: Flag.fromCode(FlagsCode.DE),
                          language: "Test",
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Interests
            BoxedListTile(
              boxDecoration: boxDecoration,
              headline: 'Interests',
              content: Container(
                height: 100,
                padding: EdgeInsets.only(left: 10, right: 20),
                child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InterestsChip(
                        icon: Icon(Icons.sports_basketball),
                        label: "Basketball");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BoxedListTile extends StatelessWidget {
  const BoxedListTile({
    super.key,
    required this.boxDecoration,
    required this.headline,
    required this.content,
    this.padding,
    this.onTap,
  });

  final BoxDecoration boxDecoration;
  final String headline;
  final Widget content;
  final EdgeInsets? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: InkWell(
        onTap: onTap ?? () {},
        child: Ink(
          decoration: boxDecoration,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  headline,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const Divider(
                indent: 50,
                endIndent: 50,
              ),
              content,
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageChip extends StatelessWidget {
  const LanguageChip({
    required this.flag,
    required this.language,
    Key? key,
  }) : super(key: key);

  final Widget flag;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ActionChip(
        avatar: flag,
        label: Text(language),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          print('Language chip pressed');
        },
      ),
    );
  }
}

class InterestsChip extends StatelessWidget {
  const InterestsChip({
    required this.icon,
    required this.label,
    Key? key,
  }) : super(key: key);

  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ActionChip(
        avatar: icon,
        label: Text(label),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          print('Interests chip pressed');
        },
      ),
    );
  }
}
