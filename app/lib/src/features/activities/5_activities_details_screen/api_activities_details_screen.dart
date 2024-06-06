import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ApiActivitiesDetailsScreen extends StatefulWidget {
  ApiActivitiesDetailsScreen({required this.activity, super.key});

  final ApiActivity activity;

  @override
  State<ApiActivitiesDetailsScreen> createState() =>
      _ApiActivitiesDetailsScreenState();
}

class _ApiActivitiesDetailsScreenState
    extends State<ApiActivitiesDetailsScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  FlutterMap _createMapOneTime(double latitude, double longitude) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(latitude, longitude),
        // interactionOptions: const InteractionOptions(
        //   flags: InteractiveFlag.none,
        // ),
        // Disable all user interactions
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
    // TODO: implement initState
    super.initState();
    if (widget.activity.imagePaths.isNotEmpty) {
      imageSliders = widget.activity.imagePaths
          .map((item) => Container(
                margin: const EdgeInsets.all(5),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item,
                            fit: BoxFit.fill, width: double.infinity),
                      ],
                    )),
              ))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    content = _createMapOneTime(
        widget.activity.location.lat, widget.activity.location.lon);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.activity.name,
        ),
      ),
      body: Stack(
        children: [
          // Bild oben auf der Seite
          Positioned(
            top: -3,
            left: 0,
            right: 0,
            height: 250, // Höhe des Bildes anpassen
            child: widget.activity.imagePaths.isEmpty
                ? Image.file(
                    widget.activity.image!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  )
                : widget.activity.imagePaths.length > 1
                    ? Stack(
                        children: [
                          Expanded(
                            child: CarouselSlider(
                              items: imageSliders,
                              carouselController: _controller,
                              options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  aspectRatio: 2,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  }),
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
                                        vertical: 8, horizontal: 4),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : CustomColors.primary)
                                          .withOpacity(_current == entry.key
                                              ? 0.9
                                              : 0.4),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      )
                    : Image.network(
                        widget.activity.imagePaths[0],
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
          ),

          // Weiße Fläche mit abgerundeten Ecken und Schatten
          Positioned(
            top: 200, // Startpunkt für die weiße Fläche
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
                              ],
                              const SizedBox(height: 10),
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
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Wrap(
                                  alignment: WrapAlignment.spaceAround,
                                  spacing: 10.0, // Abstand zwischen den Chips
                                  runSpacing:
                                      5.0, // Abstand zwischen den Zeilen
                                  children: widget.activity.categories
                                      .map((category) {
                                    return Chip(
                                      side: const BorderSide(
                                          color: CustomColors.primary),
                                      backgroundColor: CustomColors.white,
                                      labelStyle: const TextStyle(
                                          color: CustomColors.primary),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 12),
                                      label: Text(
                                        category,
                                        style: const TextStyle(
                                            color: CustomColors.primary),
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
