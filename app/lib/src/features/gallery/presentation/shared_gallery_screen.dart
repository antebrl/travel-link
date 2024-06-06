import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/features/gallery/data/shared_gallery_repository.dart';
import 'package:travel_link/src/features/gallery/presentation/add_picture_screen.dart';
import 'package:travel_link/src/features/gallery/presentation/images_grid_view.dart';
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
              child: ImagesGridView(images: images),
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
