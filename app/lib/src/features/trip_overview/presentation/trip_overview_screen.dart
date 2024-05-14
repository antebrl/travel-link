import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/explore_trips/data/trips_repository.dart';
import 'package:travel_link/src/features/my_trips/data/my_trips_repository.dart';
import 'package:travel_link/src/features/my_trips/presentation/my_trips_controller.dart';
import 'package:travel_link/src/features/trip_overview/presentation/chat/group_chat_screen.dart';
import 'package:travel_link/src/features/trip_overview/presentation/gallery/shared_gallery.dart';
import 'package:travel_link/src/features/trip_overview/presentation/plan/trip_planning_screen.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

class TripOverviewScreen extends ConsumerStatefulWidget {
  const TripOverviewScreen({required this.tripId, super.key});

  final String tripId;

  @override
  ConsumerState<TripOverviewScreen> createState() => _TripOverviewScreenState();
}

class _TripOverviewScreenState extends ConsumerState<TripOverviewScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fetchedTrip = ref.watch(tripStreamProvider(widget.tripId));

    final userId = ref.watch(firebaseAuthProvider).currentUser?.uid;

    return fetchedTrip.when(
      data: (trip) {
        return Scaffold(
          appBar: AppBar(
            title: Text(trip.name),
          ),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(27, 10, 27, 15),
                width: 356,
                height: 50,
                child: TabBar(
                  dividerColor: Colors.transparent,
                  controller: _tabController,
                  labelColor: Colors.black.withOpacity(0.73),
                  labelStyle: const TextStyle(
                    fontSize: 17.3,
                    fontWeight: FontWeight.w600,
                  ),
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: const Color(0xffB7B7B7),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color.fromARGB(255, 65, 169, 227)
                        .withOpacity(0.3),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 65, 169, 240)
                            .withOpacity(0.3),
                        blurRadius: 6,
                        spreadRadius: 0.2,
                        offset: const Offset(2, 3),
                      ),
                    ],
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          // color: Color(0xffFFFFFF)
                        ),
                        child: const Center(
                          child: Text(
                            'Plan',
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          // color: Color(0xffFFFFFF),
                        ),
                        child: const Center(
                          child: Text(
                            'Chat',
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          // color: Color(0xffFFFFFF),
                        ),
                        child: const Center(
                          child: Text(
                            'Gallery',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    TripPlanningScreen(trip: trip,),
                    GroupChatScreen(trip: trip,),
                    SharedGalleryScreen(trip: trip,),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton:
              userId != null && !trip.participants.contains(userId)
                  ? FloatingActionButton(
                      onPressed: () async {
                        if (trip.participants.length >=
                            (trip.maxParticipants ?? double.infinity)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Trip is full'),
                            ),
                          );
                          return;
                        }
                        // join Trip
                        await ref
                            .read(myTripsControllerProvider.notifier)
                            .joinTrip(trip: trip);

                        // ignore: unused_result
                        ref.refresh(fetchMyTripsProvider);
                      },
                      child: const Text('Join'),
                    )
                  : null,
        );
      },
      loading: () => Scaffold(
        appBar: AppBar(
          title: const Text('Loading Trip...'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) {
        logger.e('Error loading trip', error: error, stackTrace: stackTrace);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Trip Overview'),
          ),
          body: const Center(
            child: Text('Error loading trip. Please try again later.'),
          ),
        );
      },
    );
  }
}
