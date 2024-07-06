import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/trip_overview/data/user_repository.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';
import 'package:travel_link/src/utils/formatters/formatter.dart';
import 'package:travel_link/src/utils/helpers/localization.dart';

class ReplyMessageTile extends ConsumerWidget {
  const ReplyMessageTile.first({
    //required this.userImage,
    required this.uid,
    required this.message,
    required this.timestamp,
    this.authorColor = Colors.blue,
    super.key,
  }) : isFirstInSequence = true;

  const ReplyMessageTile.next({
    required this.message,
    required this.timestamp,
    this.authorColor = Colors.blue,
    super.key,
  })  : isFirstInSequence = false,
        //userImage = null,
        uid = null;

  final String? uid;
  final String message;
  final DateTime? timestamp;
  final bool isFirstInSequence;
  final Color authorColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final author =
        isFirstInSequence ? ref.watch(fetchUserProvider(uid!)) : null;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isFirstInSequence)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: author!.when(
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
          )
        else
          const SizedBox(width: 48),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isFirstInSequence)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        10,
                        10,
                        14,
                        5,
                      ),
                      child: author!.when(
                        data: (userAccount) => Text(
                          userAccount?.displayName ?? context.loc.unknown,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: authorColor,
                          ),
                        ),
                        loading: () => const CircularProgressIndicator(),
                        error: (_, __) => Text(context.loc.error),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      15,
                      isFirstInSequence ? 0 : 12,
                      15,
                      12,
                    ),
                    child: Text(
                      message,
                      softWrap: true, // Allow text to wrap
                    ),
                  ),
                ],
              ),
            ),
            if (timestamp != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 2),
                child: Text(
                  CustomFormatter.formatDateChat(timestamp!),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
