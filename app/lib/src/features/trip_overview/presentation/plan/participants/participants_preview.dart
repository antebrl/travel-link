import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/account/data/account_repository.dart';
import 'package:travel_link/src/features/trip_overview/presentation/plan/participants/participant_list_view.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';

class ParticipantsPreview extends ConsumerWidget {
  const ParticipantsPreview({
    required this.participants,
    required this.maxParticipants,
    super.key,
  });

  final List<String> participants;
  final int? maxParticipants;

  Future<List<String>> _fetchAvatars(WidgetRef ref, int maxImagesCount) async {
    final List<String> avatars = [];
    var imagesCount = 0;
    //only load the first 3 user avatars
    for (int i = 0;
        i < participants.length && imagesCount <= maxImagesCount;
        i++) {
      final user = await ref.read(FetchUserProvider(participants[i]).future);

      if (user?.pictureUrl != null) {
        avatars.add(user!.pictureUrl!);
        imagesCount++;
      } else {
        avatars.add(CustomImages.defaultProfilePictureUrl);
        imagesCount++;
      }
    }
    avatars.add('https://cdn-icons-png.flaticon.com/512/10233/10233645.png');
    return avatars;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //calculate approximately how many images will be shown
    final imagesCount = (MediaQuery.of(context).size.width - 100 / 60).floor();

    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) =>
              ParticipantListView(participants: participants),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Row(
          children: [
            FutureBuilder<List<String>>(
              future: _fetchAvatars(ref, imagesCount - 2),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting ||
                    snapshot.data == null ||
                    snapshot.data!.isEmpty) {
                  return FlutterImageStack(
                    imageList: List.generate(
                      participants.length,
                      (index) => CustomImages.defaultProfilePictureUrl,
                    ),
                    extraCountTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    itemRadius: 60,
                    totalCount: participants.length + 1,
                    showTotalCount: false,
                  );
                } else {
                  return FlutterImageStack(
                    imageList: snapshot.data!,
                    extraCountTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    totalCount: participants.length + 1,
                    showTotalCount: false,
                    itemRadius: 60,
                  );
                }
              },
            ),
            const Spacer(),
            if (maxParticipants != null)
              Row(
                children: [
                  const SizedBox(
                    height: 25,
                    child: VerticalDivider(
                      thickness: 1,
                      color: Colors.grey,
                      width: 10,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${participants.length} / ${maxParticipants!}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
