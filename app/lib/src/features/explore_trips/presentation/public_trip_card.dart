import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_link/src/features/account/data/account_repository.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/routing/app_router.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';

class PublicTripCard extends ConsumerWidget {
  const PublicTripCard({required this.trip, super.key});

  final Trip trip;

  Future<List<String>> _fetchAvatars(WidgetRef ref) async {
    final List<String> avatars = [];
    var imagesCount = 0;
    for (int i = 0; i < trip.participants.length && imagesCount < 4; i++) {
      final user =
          await ref.read(FetchUserProvider(trip.participants[i]).future);

      if (user?.pictureUrl != null) {
        avatars.add(user!.pictureUrl!);
        imagesCount++;
      }
    }
    return avatars;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Spacer(),
        GestureDetector(
          onTap: () {
            context.pushNamed(
              TripRoutes.tripDetails.name,
              pathParameters: {
                'tripId': trip.tripId,
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: 400,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          trip.name,
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (trip.startDate != null && trip.endDate != null)
                              Text(
                                '${trip.startDate?.day}/${trip.startDate?.month} - ${trip.endDate?.day}/${trip.endDate?.month}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[800],
                                  fontSize: 17,
                                ),
                              ),
                            FutureBuilder<List<String>>(
                              future: _fetchAvatars(ref),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.waiting ||
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
                                    totalCount: 3,
                                    itemRadius: 40,
                                  );
                                } else {
                                  return FlutterImageStack(
                                    imageList: snapshot.data!,
                                    extraCountTextStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    totalCount: trip.participants.length,
                                    itemRadius: 40,
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: RichText(
                        //Trip description
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                          ),
                          children: [
                            const TextSpan(
                              text: '„',
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            TextSpan(
                              text: trip.description,
                            ),
                            const TextSpan(
                              text: '”',
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: CachedNetworkImage(
                        imageUrl: trip.images.isEmpty
                            ? 'https://media.istockphoto.com/id/1998131648/de/foto/altstadt-von-burghausen-mit-burgberg.jpg?s=1024x1024&w=is&k=20&c=nvlz0e9DkNmf4_84ahASlYZVnGN-7NTKm9L3zppAOZI='
                            : trip.images[0],
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 375,
                            width: 300,
                            alignment: Alignment.bottomLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        imageBuilder: (context, imageProvider) => Container(
                          height: 375,
                          width: 300,
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.shade600.withOpacity(0.8),
                                spreadRadius: 0.1,
                                blurRadius: 20,
                                offset: const Offset(1, 8),
                              ),
                            ],
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 25,
                            ),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: const Color(0xFF4D5652).withOpacity(0.8),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 14,
                                ),
                                child: Text(
                                  trip.destination.formatted,
                                  style: GoogleFonts.adamina(
                                    color: Colors.white, // Textfarbe
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
