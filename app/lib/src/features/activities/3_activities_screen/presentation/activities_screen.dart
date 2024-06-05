import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';
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
  late List<ApiActivity> activitiesFromProvider; //TODO: Refactor
  late List<ApiActivity> filteredActivitiesByContinent;
  late List<ApiActivity> filteredActivitiesBySearch;
  List<ApiActivity> filteredActivitiesByFilters = [];

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
    List<ApiActivity> originalString;
    if (filteredActivitiesByFilters.isEmpty) {
      originalString = filteredActivitiesByContinent;
    } else {
      originalString = filteredActivitiesByFilters;
    }

    final suggestions = originalString.where((activity) {
      final activityName = activity.name.toLowerCase();
      final input = query.toLowerCase();
      return activityName.contains(input);
    }).toList();
    setState(() => filteredActivitiesBySearch = suggestions);
  }

  void filterActivitiesByFilters(String? country, Set<String> filters) {
    List<ApiActivity> activitiesFilteredByCountry = [];

    // Filtere Aktivitäten nach dem ausgewählten Land, wenn ein Land ausgewählt ist
    if (country != null && country.isNotEmpty) {
      activitiesFilteredByCountry = filteredActivitiesByContinent
          .where((activity) =>
              country.toLowerCase() == activity.location.country.toLowerCase())
          .toList();
    } else {
      activitiesFilteredByCountry = List.from(filteredActivitiesByContinent);
    }

    // Filtere Aktivitäten nach den ausgewählten Filtern, wenn Filter vorhanden sind
    if (filters.isNotEmpty) {
      filteredActivitiesByFilters = activitiesFilteredByCountry
          .where((activity) =>
              activity.categories != null &&
              filters.any((type) => activity.categories!.contains(type)))
          .toList();
    } else {
      // Wenn keine Filter ausgewählt sind, behalte die Aktivitäten nach dem Land unverändert
      filteredActivitiesByFilters = List.from(activitiesFilteredByCountry);
    }

    // Aktualisiere den Zustand, um die gefilterten Aktivitäten anzuzeigen
    setState(() => filteredActivitiesBySearch = filteredActivitiesByFilters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
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
                    if (result != null) {
                      final List<dynamic> filterResult =
                          result as List<dynamic>;
                      final String countryName = filterResult[0] as String;
                      final Set<String> filters =
                          filterResult[1] as Set<String>;
                      // Überprüfe, ob ein Ländername ausgewählt wurde
                      // if (countryName.trim().isEmpty || filters.isEmpty) {
                      //   filterActivitiesBySearch(countryName.trim());
                      //   // Wenn kein Ländername ausgewählt wurde, entferne alle Filter und filtere nach den ursprünglichen Kriterien
                      //   filteredActivitiesByFilters.clear();

                      // }
                      // Filtere die Aktivitäten basierend auf dem ausgewählten Land und den Filtern
                      filterActivitiesByFilters(countryName.trim(), filters);
                    }
                  },
                  //   if (result != null) {
                  //     final List<dynamic> filterResult =
                  //         result as List<dynamic>;
                  //     final String countryName = filterResult[0] as String;
                  //     final Set<ActivityType> filters =
                  //         filterResult[1] as Set<ActivityType>;

                  //     // Überprüfe, ob ein Ländername ausgewählt wurde
                  //     if (countryName.trim().isNotEmpty) {
                  //       filterActivitiesBySearch(countryName.trim());
                  //     } else {
                  //       // Wenn kein Ländername ausgewählt wurde, entferne alle Filter und filtere nach den ursprünglichen Kriterien
                  //       filteredActivitiesByFilters.clear();
                  //       filterActivitiesBySearch('');
                  //     }

                  //     // Filtere die Aktivitäten basierend auf den ausgewählten Filtern
                  //     filterActivitiesByFilters(countryName, filters);
                  //   }
                  // },
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
                key: UniqueKey(),
                activity: filteredActivitiesBySearch[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
