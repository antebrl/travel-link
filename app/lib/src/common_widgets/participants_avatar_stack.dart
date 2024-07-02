import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/trip_overview/data/user_repository.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';

class ParticipantsAvatarStack extends ConsumerWidget {
  const ParticipantsAvatarStack({required this.participants, super.key});

  final List<String> participants;

  Future<List<String>> _fetchAvatars(
      WidgetRef ref, List<String> participants) async {
    final List<String> avatars = [];
    var imagesCount = 0;
    //only load the first 3 user avatars
    for (int i = 0; i < participants.length && imagesCount < 4; i++) {
      final user = await ref.read(FetchUserProvider(participants[i]).future);

      if (user?.pictureUrl != null) {
        avatars.add(user!.pictureUrl!);
        imagesCount++;
      }
    }
    return avatars;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<String>>(
      future: _fetchAvatars(ref, participants),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.data == null ||
            snapshot.data!.isEmpty) {
          return FlutterImageStack(
            imageList: const [
              CustomImages.defaultProfilePictureUrl,
              CustomImages.defaultProfilePictureUrl,
              CustomImages.defaultProfilePictureUrl,
            ],
            extraCountTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            totalCount: participants.length,
            itemRadius: 40,
            itemCount: participants.length > 3 || participants.isEmpty ? 3 : participants.length,
          );
        } else {
          return FlutterImageStack(
            imageList: snapshot.data!,
            extraCountTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            totalCount: participants.length,
            itemRadius: 40,
            itemBorderWidth: 1.5,
          );
        }
      },
    );
  }
}
