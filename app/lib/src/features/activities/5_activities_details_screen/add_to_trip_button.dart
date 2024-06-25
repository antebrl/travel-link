import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/activities/5_activities_details_screen/add_activity_controller.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/routing/app_router.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';

class AddToTripButton extends ConsumerWidget {
  const AddToTripButton({
    required this.myTrips,
    required this.activity,
    required this.wasAddedToTrip,
    super.key,
  });
  final AsyncValue<List<Trip>> myTrips;
  final Activity activity;
  final bool wasAddedToTrip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (wasAddedToTrip == true) {
      return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.primary.withOpacity(0.7),
          side: BorderSide.none,
          padding: const EdgeInsets.all(5),
        ),
        child: Text(
          'Remove',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: CustomColors.white,
              ),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) => SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Select trip',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: CustomColors.primary,
                          fontSize: 20,
                        ),
                  ),
                  const SizedBox(height: 15),
                  myTrips.when(
                    data: (trips) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: trips.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(trips[index].name),
                            leading: CircleAvatar(
                              radius: 17,
                              backgroundImage: NetworkImage(
                                trips[index].images.isNotEmpty
                                    ? trips[index].images[0]
                                    : CustomImages
                                        .tripDestinationImagePlaceholderUrl,
                              ),
                            ),
                            onTap: () {
                              // Handle trip selection
                              final rep = ref
                                  .read(addActivityControllerProvider.notifier);
                              // ignore: cascade_invocations
                              rep.addActivityToTrip(
                                tripId: trips[index].tripId,
                                activity: activity,
                              );
                              context.goNamed(
                                TripRoutes.tripDetails.name,
                                pathParameters: {
                                  'tripId': trips[index].tripId,
                                },
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Center(
                                      child: Text('Successfully added')),
                                  backgroundColor: Colors.green[500],
                                  duration: const Duration(
                                      seconds: 1, milliseconds: 400),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (error, stackTrace) {
                      return const Center(
                        child: Text('Log In in order to see your trips!'),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.primary.withOpacity(0.7),
          side: BorderSide.none,
          padding: const EdgeInsets.all(5),
        ),
        child: Text(
          'Add to trip',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: CustomColors.white,
              ),
        ),
      );
    }
  }
}
