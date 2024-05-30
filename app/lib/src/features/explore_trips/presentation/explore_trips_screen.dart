import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/explore_trips/data/trips_repository.dart';
import 'package:travel_link/src/features/explore_trips/presentation/public_trip_card.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

class ExploreTripsScreen extends ConsumerStatefulWidget {
  const ExploreTripsScreen({super.key});

  @override
  ConsumerState<ExploreTripsScreen> createState() => _ExploreTripsScreenState();
}

class _ExploreTripsScreenState extends ConsumerState<ExploreTripsScreen> {
  CarouselController? carouselController = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //TODO: Filter trips by country
    final fetchedTrips = ref.watch(fetchPublicTripsProvider);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text('Entdecke Reisen',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 17,
                  color: Colors.grey[800],
                ),
                const Text('Bevorstehend',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        backgroundColor: CustomColors.primaryBackground,
        elevation: 0,
        leadingWidth: 90,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: GestureDetector(
              onTap: () => print('Location Picker'),
              child: Column(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.blueAccent[200],
                    size: 21,
                  ),
                  Expanded(
                      child: Text(
                    'Germany',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                        fontSize: 14),
                  ),),
                ],
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 10, 0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () => print('Date Picker'),
                child: Column(
                  children: [
                    Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.blueAccent[200],
                      size: 24,
                    ),
                    Text(
                      '15/12 - 30/12',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                          fontSize: 12,),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: fetchedTrips.when(
        data: (tripsList) => CarouselSlider(
          carouselController: carouselController,
          options: CarouselOptions(
              viewportFraction: 0.8,
              enlargeFactor: 0.25,
              enlargeCenterPage: true,
              height: 700,
              onPageChanged: (index, reason) {
                _currentIndex = index;
                setState(() {});
              }),
          items: tripsList.map((i) {
            return PublicTripCard(
              onTap: () {},
              trip: i,
            );
          }).toList(),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) {
          logger.e('Error loading trips', error: error, stackTrace: stackTrace);
          return const Center(
            child: Text('Error loading trips. Please try again later.'),
          );
        },
      ),
    );
  }
}
