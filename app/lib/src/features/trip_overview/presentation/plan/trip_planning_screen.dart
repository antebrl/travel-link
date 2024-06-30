import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_link/src/features/checklists/presentation/checklists_screen.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/features/map/presentation/trip_map_screen.dart';
import 'package:travel_link/src/features/trip_overview/presentation/plan/activities/trip_activities_view.dart';
import 'package:travel_link/src/features/trip_overview/presentation/plan/checklist/checklist_items_preview.dart';
import 'package:travel_link/src/features/trip_overview/presentation/plan/participants/participant_list_view.dart';
import 'package:travel_link/src/features/trip_overview/presentation/plan/participants/participants_preview.dart';
import 'package:travel_link/src/features/trip_overview/presentation/plan/preview_tile.dart';
import 'package:travel_link/src/routing/app_router.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/formatters/formatter.dart';

class TripPlanningScreen extends StatefulWidget {
  const TripPlanningScreen({required this.trip, super.key});

  final Trip trip;

  @override
  State<TripPlanningScreen> createState() => _TripPlanningScreenState();
}

class _TripPlanningScreenState extends State<TripPlanningScreen> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // pictures of trip/destination
        buildImageSlider(),

        // Headings
        const SizedBox(height: 20),
        //Trip description
        RichText(
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
                text: widget.trip.description,
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
        const SizedBox(height: 10),
        PreviewTile(
          title: 'Participants',
          preview: ParticipantsPreview(
            participants: widget.trip.participants,
            maxParticipants: widget.trip.maxParticipants,
          ),
          detailsPageBuilder: (context) => ParticipantListView(
            trip: widget.trip,
          ),
          showAsModalSheet: true,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Activities',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: 3),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        context.goNamed(
                          TopLevelDestinations.activities.name,
                          queryParameters: {
                            'index': '1',
                          },
                        );
                      },
                      padding: EdgeInsets.zero,
                      iconSize: 32,
                      icon: const Icon(
                        Icons.add_outlined,
                        color: CustomColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              TripActivitiesView(trip: widget.trip),
            ],
          ),
        ),
        const SizedBox(height: 10),
        PreviewTile(
          title: 'Map',
          preview: const Placeholder(fallbackHeight: 100),
          detailsPageBuilder: (context) => TripMapScreen(participants: widget.trip.participants, destination: widget.trip.destination),
        ),
        const SizedBox(height: 10),
        PreviewTile(
          title: 'Map',
          preview: const Placeholder(fallbackHeight: 100),
          detailsPageBuilder: (context) => TripMapScreen(participants: widget.trip.participants, destination: widget.trip.destination),
        ),
        const SizedBox(height: 10),
        PreviewTile(
          title: 'Checklist',
          preview: ChecklistPreview(tripId: widget.trip.tripId, maxItems: 3),
          detailsPageBuilder: (context) => ChecklistsScreen(trip: widget.trip),
        ),
        const SizedBox(height: 10),
        PreviewTile(
          title: 'Costs',
          preview: const Placeholder(fallbackHeight: 100),
          detailsPageBuilder: (context) => const Placeholder(),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget buildImageSlider() {
    switch (widget.trip.images.length) {
      case 0:
        return Container(
          height: 180,
          color: Colors.grey[300],
          child: const Center(
            child: Text(
              'No images available',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
        );
      case 1:
        return Stack(
          children: [
            Image.network(
              widget.trip.images.first,
              fit: BoxFit.cover,
              height: 180,
              width: double.infinity,
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width - 20,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          widget.trip.destination.formatted,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.trip.startDate != null
                            ? CustomFormatter.formatDateRange(
                                startDate: widget.trip.startDate!,
                                endDate: widget.trip.endDate!,
                              )
                            : 'flexible Dates',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      default:
        return Stack(
          children: [
            CarouselSlider(
              items: widget.trip.images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      child: Image.network(
                        i,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
              carouselController: _carouselController,
              options: CarouselOptions(
                autoPlayInterval: const Duration(
                  seconds: 6,
                ),
                autoPlay: true,
                height: 180,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _currentIndex = index;
                    },
                  );
                },
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.trip.images.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _carouselController.animateToPage(entry.key),
                    child: Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 4,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : CustomColors.primary)
                            .withOpacity(
                          _currentIndex == entry.key ? 0.9 : 0.4,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Flexible(
                child: Container(
                  width: 280,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.trip.destination.formatted,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.trip.startDate != null
                            ? CustomFormatter.formatDateRange(
                                startDate: widget.trip.startDate!,
                                endDate: widget.trip.endDate!,
                              )
                            : 'flexible Dates',
                        style: const TextStyle(
                          fontSize: 14,
                          color: CustomColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
    }
  }
}
