import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/features/trip_overview/data/gallery/shared_gallery_repository.dart';
import 'package:travel_link/src/features/trip_overview/presentation/gallery/add_picture_screen.dart';
import 'package:travel_link/src/features/trip_overview/presentation/gallery/fullscreen_picture.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

class SharedGalleryScreen extends ConsumerWidget {
  const SharedGalleryScreen({required this.trip, super.key});

  final Trip trip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchedPictures = ref.watch(fetchPicturePostsProvider(trip.tripId));

    return fetchedPictures.when(
      data: (images) {
        return Scaffold(
          body: RefreshIndicator(
            displacement: 5,
            backgroundColor: CustomColors.primaryBackground,
            color: CustomColors.primary,
            strokeWidth: 3,
            onRefresh: () async {
              // ignore: unused_result
              ref.refresh(fetchPicturePostsProvider(trip.tripId));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 9 / 16,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<FullscreenPicture>(
                          builder: (context) => FullscreenPicture(
                            picturePost: images[index],
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: images[index].picture,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<AddPictureScreen>(
                  builder: (context) => AddPictureScreen(trip: trip),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) {
        logger.e('Error loading images', error: error, stackTrace: stackTrace);
        return const Center(
          child: Text('Error loading images. Please try again later.'),
        );
      },
    );
  }
}
