import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/common_widgets/boxed_content.dart';
import 'package:travel_link/src/features/my_trips/data/my_trips_repository.dart';
import 'package:travel_link/src/features/my_trips/presentation/my_trips_controller.dart';
import 'package:travel_link/src/features/trip_overview/data/user_repository.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';
import 'package:travel_link/src/utils/helpers/localization.dart';
import 'package:travel_link/src/utils/theme/widget_themes/boxDecoration_theme.dart';

import '../../common_widgets/profile_widgets.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({required this.targetuid, super.key});

  final String targetuid;

  @override
  ConsumerState<UserProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    const listTilePadding = EdgeInsets.only(left: 10, right: 10, top: 10);
    final userData = ref.watch(fetchUserProvider(widget.targetuid));

    final defaultDescription = context.loc.accountLabelUnknown;
    final defaultName = context.loc.accountLabelUnknown;
    final publicName = userData.when(
      data: (userAccount) => userAccount?.publicName ?? defaultName,
      loading: () => context.loc.accountLabelLoading,
      error: (_, __) => context.loc.accountLabelError,
    );
    final userName = userData.when(
      data: (userAccount) => userAccount?.displayName ?? defaultName,
      loading: () => context.loc.accountLabelLoading,
      error: (_, __) => context.loc.accountLabelError,
    );
    final userDescription = userData.when(
      data: (userAccount) => userAccount?.description ?? defaultDescription,
      loading: () => context.loc.accountLabelLoading,
      error: (_, __) => context.loc.accountLabelError,
    );
    final userCity = userData.when(
      data: (userAccount) =>
          userAccount?.city ?? context.loc.accountLabelUnknown,
      loading: () => context.loc.accountLabelLoading,
      error: (_, __) => context.loc.accountLabelError,
    );
    final userProfilePicture = userData.when(
      data: (userAccount) => CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(
          userAccount?.pictureUrl ?? CustomImages.defaultProfilePictureUrl,
        ),
      ),
      loading: () => const CircularProgressIndicator(),
      error: (_, __) => Text(context.loc.accountLabelError),
    );
    final List<String> languageList = userData.when(
      data: (userAccount) => userAccount?.languages ?? [],
      loading: () => [],
      error: (_, __) => [],
    );
    final List<String> interestList = userData.when(
      data: (userAccount) => userAccount?.interests ?? [],
      loading: () => [],
      error: (_, __) => [],
    );
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(userName)),
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
                                publicName,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                                overflow: TextOverflow.fade,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                userCity,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            final myTrips = ref.watch(fetchMyTripsProvider);
                            showModalBottomSheet<void>(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) =>
                                  SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                      context.loc.publicProfileAddToTrip,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            color: CustomColors.primary,
                                            fontSize: 20,
                                          ),
                                    ),
                                    const SizedBox(height: 15),
                                    myTrips.when(
                                      data: (trips) {
                                        trips
                                            .where(
                                              (trip) => trip.participants
                                                  .contains(widget.targetuid),
                                            )
                                            .toList()
                                            .forEach((trip) {
                                          trips.remove(trip);
                                        });
                                        if (trips.isEmpty) {
                                          return Center(
                                            child: Text(
                                              context.loc
                                                  .publicProfileNoTripsAvailable,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    color: CustomColors.primary,
                                                    fontSize: 20,
                                                  ),
                                            ),
                                          );
                                        }
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount: trips.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              title: Text(trips[index].name),
                                              leading: CircleAvatar(
                                                radius: 17,
                                                backgroundImage: NetworkImage(
                                                  trips[index].images.isNotEmpty
                                                      ? trips[index].images[0]
                                                      : CustomImages
                                                          .tripDestinationImagePlaceholderUrl,
                                                ),
                                              ),
                                              onTap: () {
                                                // Handle trip selection
                                                final mytripsController =
                                                    ref.read(
                                                  myTripsControllerProvider
                                                      .notifier,
                                                );
                                                // ignore: cascade_invocations
                                                mytripsController.addToTrip(
                                                  trip: trips[index],
                                                  uid: widget.targetuid,
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Center(
                                                      child: Text(
                                                        context.loc
                                                            .successfullyAdded,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                      seconds: 1,
                                                      milliseconds: 400,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                      loading: () => const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      error: (error, stackTrace) {
                                        return Center(
                                          child:
                                              Text(context.loc.loginToSeeTrips),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
            BoxedContentBigHeadline(
              boxDecoration: boxDecoration,
              headline: context.loc.editProfileAboutMe,
              content: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 20,
                            bottom: 5,
                          ),
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              Wrap(
                                children: [
                                  Text(
                                    userDescription,
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
            BoxedContentBigHeadline(
              boxDecoration: boxDecoration,
              headline: context.loc.editProfileLanguages,
              content: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 10, right: 20, bottom: 10),
                    child: Wrap(
                      children: languageList.map((language) {
                        return CustomChip(
                          avatar: Flag.fromString(language),
                          onPressed: () {},
                          label: language,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            // Interests
            BoxedContentBigHeadline(
              boxDecoration: boxDecoration,
              headline: context.loc.editProfileInterests,
              content: Container(
                padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
                child: Wrap(
                  children: interestList.map((interest) {
                    return CustomChip(
                      avatar: const Icon(Icons.circle),
                      onPressed: () {},
                      label: interest,
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
