// ignore_for_file: inference_failure_on_function_invocation

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/my_trips/data/my_trips_repository.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';

class ApiActivitiesDetailsScreen extends ConsumerStatefulWidget {
  const ApiActivitiesDetailsScreen({required this.activity, super.key});

  final Activity activity;

  @override
  ConsumerState<ApiActivitiesDetailsScreen> createState() =>
      _ApiActivitiesDetailsScreenState();
}

class _ApiActivitiesDetailsScreenState
    extends ConsumerState<ApiActivitiesDetailsScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  FlutterMap _createMapOneTime(double latitude, double longitude) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(latitude, longitude),
      ),
      children: [
        openStreetMapTileLater,
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(latitude, longitude),
              child: const Icon(
                Icons.location_pin,
                size: 40,
                color: CustomColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  TileLayer get openStreetMapTileLater => TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'dev.fleaflet.flutter_map.exaple',
      );

  List<Widget> imageSliders = [];

  @override
  void initState() {
    super.initState();

    if (widget.activity.imagePaths.isNotEmpty) {
      imageSliders = widget.activity.imagePaths.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 220,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: Image.network(
                          i,
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                },
                child: Image.network(
                  i,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList();
    } else {
      if (widget.activity.image == null) {
        widget.activity.imagePaths = [
          CustomImages.destinationImagePlaceholderUrl,
        ];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    content = _createMapOneTime(
      widget.activity.location.lat,
      widget.activity.location.lon,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.activity.name,
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: -3,
            left: 0,
            right: 0,
            height: 250,
            child: widget.activity.image != null
                ? GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Image.file(
                              widget.activity.image!,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    },
                    child: Image.file(
                      widget.activity.image!,
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                : widget.activity.imagePaths.length > 1
                    ? Stack(
                        children: [
                          CarouselSlider(
                            items: imageSliders,
                            carouselController: _controller,
                            options: CarouselOptions(
                              autoPlayInterval: const Duration(seconds: 6),
                              autoPlay: true,
                              height: 220,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              },
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: widget.activity.imagePaths
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                return GestureDetector(
                                  onTap: () =>
                                      _controller.animateToPage(entry.key),
                                  child: Container(
                                    width: 12,
                                    height: 12,
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : CustomColors.primary)
                                          .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      )
                    : GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                child: Image.network(
                                  widget.activity.imagePaths[0],
                                  fit: BoxFit.contain,
                                ),
                              );
                            },
                          );
                        },
                        child: Image.network(
                          widget.activity.imagePaths[0],
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: ElevatedButton(
              onPressed: () {
                final myTrips = ref.read(fetchMyTripsProvider);
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) => Column(
                    children: [
                      Text(
                        'Select trip',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: CustomColors.primary, fontSize: 20),
                      ),
                      myTrips.when(
                      
                      data: (trips) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: trips.length,
                          itemBuilder: (context, index) {
                            //TODO: Design ListTile
                            return ListTile(
                              title: Text(trips[index].name),
                            );
                          },
                        );
                      },
                      loading: () => 
        const Center(
          child: CircularProgressIndicator(),
        ),
                     
      error: (error, stackTrace) {
        return 
          const Center(
            child: Text('Log In in order to see your trips!'),
          );
      },),
                    ],
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
            ),
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Explore: ${widget.activity.name}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: CustomColors.primary,
                                        fontSize: 20,
                                      ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              if (widget.activity.description.isNotEmpty) ...[
                                Text(
                                  'Description: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: CustomColors.primary),
                                ),
                                Text(
                                  widget.activity.description,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                              const SizedBox(height: 10),
                              if (widget.activity.openingHours != null) ...[
                                Text(
                                  'Opening hours: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: CustomColors.primary),
                                ),
                                Text(
                                  widget.activity.openingHours!,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(height: 10),
                              ],
                              Text(
                                'Location: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: CustomColors.primary),
                              ),
                              Text(
                                widget.activity.location.formatted,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 250,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 5,
                                    color:
                                        CustomColors.primary.withOpacity(0.5),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: content,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Categories: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: CustomColors.primary),
                              ),
                              if (widget.activity.isPublic == false) ...{
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Chip(
                                    side: const BorderSide(
                                      color: CustomColors.primary,
                                    ),
                                    backgroundColor: CustomColors.white,
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          color: CustomColors.primary,
                                        ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 12,
                                    ),
                                    label: Text(
                                      'private',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: CustomColors.primary,
                                          ),
                                    ),
                                  ),
                                ),
                              },
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Wrap(
                                  alignment: WrapAlignment.spaceAround,
                                  spacing: 10,
                                  runSpacing: 5,
                                  children: widget.activity.categories
                                      .map((category) {
                                    return Chip(
                                      side: const BorderSide(
                                        color: CustomColors.primary,
                                      ),
                                      backgroundColor: CustomColors.white,
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: CustomColors.primary,
                                          ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 12,
                                      ),
                                      label: Text(
                                        category,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: CustomColors.primary,
                                            ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
