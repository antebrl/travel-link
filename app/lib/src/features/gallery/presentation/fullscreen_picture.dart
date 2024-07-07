import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/utils.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/gallery/domain/picture_post.dart';
import 'package:travel_link/src/features/gallery/presentation/shared_gallery_controller.dart';
import 'package:travel_link/src/features/trip_overview/data/user_repository.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';
import 'package:travel_link/src/utils/formatters/formatter.dart';
import 'package:travel_link/src/utils/helpers/async_value.dart';
import 'package:travel_link/src/utils/helpers/localization.dart';

class FullscreenPicture extends ConsumerWidget {
  const FullscreenPicture(
      {required this.tripId, required this.picturePost, super.key});

  final PicturePost picturePost;
  final String tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      sharedGalleryControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );

    final author = ref.watch(fetchUserProvider(picturePost.uid));
    final currentUser = ref.read(firebaseAuthProvider).currentUser;

    final mediaQuery = MediaQuery.of(context);

    final BoxFit fitType = mediaQuery.orientation == Orientation.portrait
        ? BoxFit.fitWidth
        : BoxFit.fitHeight;

    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
          imageUrl: picturePost.picture,
          fit: fitType,
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black54,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 23,
                    backgroundImage: author.when(
                      data: (userAccount) => NetworkImage(
                        userAccount?.pictureUrl ??
                            CustomImages.defaultProfilePictureUrl,
                      ),
                      loading: () => const NetworkImage(
                        CustomImages.defaultProfilePictureUrl,
                      ),
                      error: (_, __) => const NetworkImage(
                        CustomImages.defaultProfilePictureUrl,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        author.when(
                          data: (userAccount) =>
                              userAccount?.displayName ??
                              context.loc.anonymousUser,
                          loading: () => context.loc.anonymousUser,
                          error: (_, __) => context.loc.anonymousUser,
                        ),
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: CustomColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                      Text(
                        CustomFormatter.formatDateChat(picturePost.timestamp),
                        style: context.textTheme.bodySmall?.copyWith(
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  picturePost.description,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 0, 0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: CustomColors.primary,
              iconSize: 50,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        if (currentUser != null && currentUser.uid == picturePost.uid)
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 20, 0, 0),
              child: PopupMenuButton(
                elevation: 3,
                iconSize: 50,
                iconColor: CustomColors.primary,
                position: PopupMenuPosition.under,
                padding: const EdgeInsets.all(3),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      height: 33,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            context.loc.delete,
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        showDialog<AlertDialog>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(context.loc.deletePicture),
                              content: Text(
                                context.loc.deletePictureConfirmation,
                              ),
                              actions: [
                                TextButton(
                                  child: Text(context.loc.cancel),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text(context.loc.delete),
                                  onPressed: () async {
                                    await ref
                                        .read(sharedGalleryControllerProvider
                                            .notifier)
                                        .deletePicture(
                                            pictureId: picturePost.id,
                                            tripId: tripId);

                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ];
                },
              ),
            ),
          ),
      ],
    );
  }
}
