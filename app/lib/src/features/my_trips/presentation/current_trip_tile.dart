import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_link/src/common_widgets/participants_avatar_stack.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/routing/app_router.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';

class CurrentTripTile extends StatelessWidget {
  const CurrentTripTile({required this.trip, super.key});

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
      child: GestureDetector(
        onTap: () => context.pushNamed(
          TripRoutes.tripDetails.name,
          pathParameters: {
            'tripId': trip.tripId,
          },
        ),
        child: Center(
          child: CachedNetworkImage(
            width: 1000,
            height: 300,
            imageUrl: trip.images.isEmpty
                ? CustomImages.tripDestinationImagePlaceholderUrl
                : trip.images[0],
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
              ),
            ),
            imageBuilder: (context, imageProvider) => Container(
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade600.withOpacity(0.4),
                    spreadRadius: 0.02,
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          trip.name,
                          style: GoogleFonts.adamina(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 4),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 14),
                        Flexible(
                          child: ParticipantsAvatarStack(
                            participants: trip.participants,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0xFF4D5652).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 14,
                        ),
                        child: SizedBox(
                          width: 280,
                          child: Text(
                            trip.destination.formatted,
                            style: GoogleFonts.adamina(
                              color: Colors.white, // Textfarbe
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 4,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
