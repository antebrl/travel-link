import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/account/data/account_repository.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';

class ParticipantsPreview extends ConsumerWidget {
  const ParticipantsPreview(this.participants, {super.key});

  final List<String> participants;

  Future<List<String>> _fetchAvatars(WidgetRef ref, int maxImagesCount) async {
    final List<String> avatars = [];
    var imagesCount = 0;
    //only load the first 3 user avatars
    for (int i = 0; i < participants.length && imagesCount <= maxImagesCount; i++) {
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
    //calculate approximately how many images will be shown
    final imagesCount = (MediaQuery.of(context).size.width / 60).floor();

    return GestureDetector(
      onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const Placeholder(),
                ),
              );
            },
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: FutureBuilder<List<String>>(
          future: _fetchAvatars(ref, imagesCount-2),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.data == null ||
                snapshot.data!.isEmpty) {
              return FlutterImageStack(
                imageList: List.generate(participants.length, (index) => CustomImages.defaultProfilePictureUrl),
                extraCountTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                totalCount: participants.length,
                itemRadius: 60,
                itemCount: imagesCount-2,
              );
            } else {
              return FlutterImageStack(
                imageList: snapshot.data!,
                extraCountTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                totalCount: participants.length,
                itemRadius: 60,
              );
            }
          },
        ),
      ),
    );
  }
}
