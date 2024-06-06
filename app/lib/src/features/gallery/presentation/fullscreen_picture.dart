import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/utils.dart';
import 'package:travel_link/src/features/account/data/account_repository.dart';
import 'package:travel_link/src/features/gallery/domain/picture_post.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';
import 'package:travel_link/src/utils/formatters/formatter.dart';

class FullscreenPicture extends ConsumerWidget {
  const FullscreenPicture({required this.picturePost, super.key});

  final PicturePost picturePost;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final author = ref.watch(fetchUserProvider(picturePost.uid));

    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
          imageUrl: picturePost.picture,
          fit: BoxFit.cover,
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
                              userAccount?.displayName ?? 'Anonym User',
                          loading: () => 'Anonym User',
                          error: (_, __) => 'Anonym User',
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
            padding: const EdgeInsets.fromLTRB(8, 30, 0, 0),
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
      ],
    );
  }
}
