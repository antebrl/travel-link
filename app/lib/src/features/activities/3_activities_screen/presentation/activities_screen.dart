import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/activity_item.dart';
import 'package:travel_link/src/features/activities/4_add_activity_screen/presentation/add_activity_screen.dart';
import 'package:travel_link/src/features/activities/6_activities_filter_screen/activities_filter_screen.dart';
import 'package:travel_link/src/features/activities/providers/activities_provider.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class ActivitiesScreen extends ConsumerStatefulWidget {
  ActivitiesScreen({
    required this.continent,
    super.key,
  }) {
    title = continent.name;
  }

  final Continent continent;
  late final String title;

  @override
  ConsumerState<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends ConsumerState<ActivitiesScreen> {
  late List<Activity> activitiesFromProvider;
  late List<Activity> filteredActivitiesByContinent;
  late List<Activity> filteredActivitiesBySearch;
  List<Activity> filteredActivitiesByFilters = [];

  @override
  void initState() {
    super.initState();
    filterActivitiesByContinent();
  }

  void filterActivitiesByContinent() {
    activitiesFromProvider = ref.read(activitiesProvider);
    filteredActivitiesByContinent = activitiesFromProvider
        .where((activity) =>
            activity.continentType == widget.continent.continentType)
        .toList();

    filteredActivitiesBySearch = filteredActivitiesByContinent;
  }

  void filterActivitiesBySearch(String query) {
    // setState(() {
    // filteredActivities = widget.activities.where((activity) =>
    //     activity.name.toLowerCase().startsWith(query.toLowerCase())).toList();

    print(filteredActivitiesByFilters);
    print(filteredActivitiesByFilters.length);

    List<Activity> originalString;
    if (filteredActivitiesByFilters.isEmpty) {
      originalString = filteredActivitiesByContinent;
    } else {
      originalString = filteredActivitiesByFilters!;
      print(filteredActivitiesByFilters);
      print(filteredActivitiesByFilters.length);
    }

    final suggestions = originalString.where((activity) {
      final activityName = activity.name.toLowerCase();
      final input = query.toLowerCase();
      return activityName.contains(input);
    }).toList();
    setState(() => filteredActivitiesBySearch = suggestions);
  }

  void filterActivitiesByFilters(String country) {
    filteredActivitiesByFilters = filteredActivitiesByContinent
        .where((activity) =>
            country.toLowerCase() == activity.location.country.toLowerCase())
        .toList();

    setState(() => filteredActivitiesBySearch = filteredActivitiesByFilters);
  }

  Future<void> addActivity() async {
    final newActivity = await Navigator.of(context).push<Activity>(
      MaterialPageRoute(
        builder: (ctx) => const AddActivityScreen(),
      ),
    );
    if (newActivity == null) return;

    setState(() {
      ref.watch(activitiesProvider.notifier).addActivity(newActivity);
      filterActivitiesByContinent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        actions: [
          IconButton(
            onPressed: addActivity,
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    onChanged: filterActivitiesBySearch,
                    decoration: const InputDecoration(
                      labelText: 'Search activities...',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ActivitiesFilterScreen(
                          continent: widget.continent,
                        ),
                      ),
                    );
                    if (result.toString().trim().isNotEmpty) {
                      filterActivitiesByFilters(result as String);
                    } else {
                      filteredActivitiesByFilters.clear();
                      filterActivitiesBySearch('');
                    }
                  },
                  icon: const Icon(
                    Icons.filter_alt,
                    size: 40,
                    color: CustomColors.primary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredActivitiesBySearch.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => ActivityItem(
                activity: filteredActivitiesBySearch[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
