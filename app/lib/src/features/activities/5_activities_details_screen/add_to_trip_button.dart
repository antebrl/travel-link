import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';

class AddToTripButton extends StatelessWidget {
  const AddToTripButton({
    required this.myTrips,
    super.key,
  });
  final AsyncValue<List<Trip>> myTrips;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
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
      child: const Text(
        'Add to trip',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
