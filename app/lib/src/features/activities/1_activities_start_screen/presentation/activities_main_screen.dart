import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_link/src/common_widgets/auto_complete_search.dart';
import 'package:travel_link/src/features/activities/1_activities_start_screen/presentation/items/container_with_searchbar.dart';
import 'package:travel_link/src/features/activities/1_activities_start_screen/presentation/items/container_with_worldmap.dart';
import 'package:travel_link/src/features/activities/1_activities_start_screen/presentation/items/horizontal_listview_Activities.dart';
import 'package:travel_link/src/features/activities/1_activities_start_screen/presentation/items/vertical_listview_Activities.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/data/activity_data.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/data/api_activities_repository.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/data/popular_activity_data.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';
import 'package:travel_link/src/features/activities/5_activities_details_screen/api_activities_details_screen.dart';
import 'package:travel_link/src/features/my_trips/domain/destination.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';
import 'package:travel_link/src/utils/helpers/helper_functions.dart';
import 'package:travel_link/src/utils/helpers/wikidata.dart';

class ActivitiesMainScreen extends StatefulWidget {
  const ActivitiesMainScreen({super.key});

  @override
  State<ActivitiesMainScreen> createState() => _ActivitiesMainScreenState();
}

class _ActivitiesMainScreenState extends State<ActivitiesMainScreen> {
  late DestinationController _controller;
  late Future<List<String>> _imageFuture;
  String formattedLink = '';
  ContinentType selectedContinent = ContinentType.none;
  List<ApiActivity> selectedActivities = [];

  @override
  void initState() {
    super.initState();
    _selectRandomContinent();
    _controller = DestinationController(onSelected: _handleDestinationSelected);
  }

  Future<void> _handleDestinationSelected(Destination destination) async {
    final placeId = destination.placeId;

    final ApiActivity? activity = await ApiActivitiesRepository()
        .getActivityDetailsById(placeId: placeId!);

    if (activity != null) {
      if (activity.wikidataUrl != null) {
        _imageFuture = _loadImageUrls(activity);
        await _imageFuture;
      } else {
        _imageFuture =
            Future.value([CustomImages.destinationImagePlaceholderUrl]);
        activity.imagePaths = [CustomImages.destinationImagePlaceholderUrl];
      }

      if (mounted) {
        await Navigator.of(context)
            .push(
          MaterialPageRoute<ApiActivitiesDetailsScreen>(
            builder: (context) =>
                ApiActivitiesDetailsScreen(activity: activity),
          ),
        )
            .then((_) {
          FocusScope.of(context).unfocus();
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            _controller.textEditingController.clear();
            _controller.selectedDestination = null;
          });
        });
      }
    }
  }

  Future<List<String>> _loadImageUrls(ApiActivity activity) async {
    final response = await http.get(Uri.parse(activity.wikidataUrl!));
    final Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;

    final wikidataId = activity.wikidataId!;
    final descriptions = data['entities'][wikidataId]['descriptions'];

    if (descriptions['en'] != null) {
      activity.description = descriptions['en']['value'] as String;
    }

    final imageUrls = WikidataParser.getImagesFromWikidataEntity(
        data: data, wikidataId: wikidataId);

    activity.imagePaths = imageUrls;

    return imageUrls;
  }

  void _selectRandomContinent() {
    final continents =
        ContinentType.values.where((c) => c != ContinentType.none).toList();
    final random = Random();
    setState(() {
      selectedContinent = continents[random.nextInt(continents.length)];
      selectedActivities = _getRandomActivities(selectedContinent, 20);
    });
  }

  List<ApiActivity> _getRandomActivities(ContinentType continent, int count) {
    final filteredActivities = activityData
        .where((activity) => activity.continentType == continent)
        .toList();
    filteredActivities.shuffle();
    return filteredActivities.take(count).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CurvedSearchContainer(controller: _controller),
          const SizedBox(height: 10),
          Text(
            'Explore top Activities from all continents:',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: CustomColors.primary,
                ),
          ),
          const SizedBox(height: 10),
          const CustomContainerWithWorldMap(),
          const SizedBox(height: 10),
          Text(
            'Activities in ${CustomHelperFunctions.getContinentDisplayName(selectedContinent)}:',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: CustomColors.primary,
                ),
          ),
          HorizontalActivityList(selectedActivities: selectedActivities),
          const SizedBox(height: 10),
          Text(
            'Most popular activities: ',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: CustomColors.primary,
                ),
            textAlign: TextAlign.center,
          ),
          VerticalActivityList(
            popularActivities: popularActivityData,
          ),
        ],
      ),
    );
  }
}
