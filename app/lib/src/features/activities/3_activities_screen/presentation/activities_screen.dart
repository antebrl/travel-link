import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/items/activity_item.dart';
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
        .where(
          (activity) =>
              activity.continentType == widget.continent.continentType,
        )
        .toList();

    filteredActivitiesBySearch = filteredActivitiesByContinent;
  }

  void filterActivitiesBySearch(String query) {
    List<Activity> originalString;
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
    List<Activity> activitiesFilteredByCountry = [];

    if (country != null && country.isNotEmpty) {
      activitiesFilteredByCountry = filteredActivitiesByContinent
          .where(
            (activity) =>
                country.toLowerCase() ==
                activity.location.country.toLowerCase(),
          )
          .toList();
    } else {
      activitiesFilteredByCountry = List.from(filteredActivitiesByContinent);
    }

    if (filters.isNotEmpty) {
      filteredActivitiesByFilters = activitiesFilteredByCountry
          .where(
            (activity) => filters.any(
              (type) => activity.categories.contains(type),
            ),
          )
          .toList();
    } else {
      filteredActivitiesByFilters = List.from(activitiesFilteredByCountry);
    }

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
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    onChanged: filterActivitiesBySearch,
                    decoration: InputDecoration(
                      labelText: 'Search activities...',
                      labelStyle:
                          Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: CustomColors.primary,
                              ),
                      floatingLabelStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: CustomColors.primary,
                              ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: CustomColors.primary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: CustomColors.primary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: CustomColors.primary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: CustomColors.primary,
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: CustomColors.primary,
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
                      filterActivitiesByFilters(countryName.trim(), filters);
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
