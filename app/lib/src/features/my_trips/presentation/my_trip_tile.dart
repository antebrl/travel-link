import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_link/src/common_widgets/participants_avatar_stack.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/routing/app_router.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';

class MyTripTile extends ConsumerWidget {
  const MyTripTile({
    required this.trip,
    required this.cardWidth,
    this.daysToGo,
    super.key,
  });

  final Trip trip;
  final int? daysToGo;

  final double cardWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pictureWidth = cardWidth /
        3; //pictureWidth scale regarding cardWith, screenWidth / 3.4

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () => context.pushNamed(
          TripRoutes.tripDetails.name,
          pathParameters: {
            'tripId': trip.tripId,
          },
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 25,
            ),
            SizedBox(
              width: cardWidth,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    if (daysToGo != null)
                      Positioned(
                        right: 9,
                        top: 9,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[800]!.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'In $daysToGo Days',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        pictureWidth - 15,
                        16,
                        10,
                        30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          SizedBox(
                            width: trip.endDate != null
                                ? cardWidth - pictureWidth - 82
                                : cardWidth - pictureWidth,
                            child: Text(
                              trip.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  trip.destination.formatted,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 19,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          ParticipantsAvatarStack(
                            participants: trip.participants,
                          ),
                          const SizedBox(height: 15),
                          FittedBox(
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFC3DEED),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    trip.startDate != null
                                        ? DateFormat('dd/MM/yyyy')
                                            .format(trip.startDate!)
                                        : 'Flexible Dates',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(width: cardWidth / 50),
                                if (trip.endDate != null)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFC3DEED),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      DateFormat('dd/MM/yyyy')
                                          .format(trip.endDate!),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (trip.images.isNotEmpty)
                      Positioned(
                        left: -25,
                        top: 16,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.shade600.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(1, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: trip.images.isNotEmpty
                                  ? trip.images[0]
                                  : CustomImages
                                      .tripDestinationImagePlaceholderUrl,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 170,
                                  width: pictureWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 170,
                                width: pictureWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
