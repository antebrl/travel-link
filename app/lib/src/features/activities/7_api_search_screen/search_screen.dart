import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:travel_link/src/common_widgets/calendar_popup_view.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/activities_api_screen.dart';
import 'package:travel_link/src/features/my_trips/data/my_trips_repository.dart';
import 'package:travel_link/src/features/my_trips/domain/destination.dart';
import 'package:travel_link/src/features/my_trips/presentation/my_trips_controller.dart';
import 'package:travel_link/src/utils/constants/api_constants.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  String? _queryDestination;
  late Iterable<Destination> _destinationSuggestions = <Destination>[];
  Destination? _selectedDestination;
  Set<String> _categoryList = {};

  Future<Iterable<Destination>> getDestinationSuggestion(String input) async {
    // TODO: Request with language code
    final String request =
        '${CustomApiConstants.autocompleteBaseURL}?type=city&text=$input&apiKey=${CustomApiConstants.geoapifySecretKey}&limit=3&format=json';
    final response = await http.get(Uri.parse(request));

    if (response.statusCode == 200) {
      final destinations =
          (json.decode(response.body)['results'] as List<dynamic>);

      return destinations.map((destination) =>
          Destination.fromMap(destination as Map<dynamic, dynamic>));
    } else {
      logger.e(
        'Failed to load and parse destination suggestions',
        error: response.body,
      );
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final state = ref.watch(myTripsControllerProvider);

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            right: 30,
            left: 30,
            bottom: 15,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: CustomColors.primary.withOpacity(0.7),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -50,
                  right: -50,
                  child: Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                          .withOpacity(0.3), // Fast durchsichtige weiße Farbe
                    ),
                  ),
                ),
                Positioned(
                  bottom: -50,
                  left: -50,
                  child: Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                          .withOpacity(0.2), // Fast durchsichtige weiße Farbe
                    ),
                  ),
                ),
                Positioned(
                  bottom: 200,
                  left: 50,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                          .withOpacity(0.2), // Fast durchsichtige weiße Farbe
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Search Activities in: ',
                        style: TextStyle(
                          color: CustomColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Autocomplete<Destination>(
                        optionsBuilder:
                            (TextEditingValue textEditingValue) async {

                          _queryDestination = textEditingValue.text;
                          if (_queryDestination == '') {
                            return const Iterable<Destination>.empty();
                          }
                          final Iterable<Destination> options =
                              await getDestinationSuggestion(
                            _queryDestination!,
                          );

                          if(_queryDestination == _selectedDestination?.formatted) 
                            return [];
                  
                          // If the query has changed, don't update and wait for next options build
                          if (_queryDestination != textEditingValue.text) {
                            return _destinationSuggestions;
                          }
                          _destinationSuggestions = options;
                          return options;
                        },
                        displayStringForOption: (option) => option.formatted,
                        onSelected: (destination) {
                          _selectedDestination = destination;
                        },
                        fieldViewBuilder: (
                          BuildContext context,
                          TextEditingController textEditingController,
                          FocusNode focusNode,
                          VoidCallback onFieldSubmitted,
                        ) {
                          return TextFormField(
                            controller: textEditingController,
                            focusNode: focusNode,
                            onFieldSubmitted: (String value) {
                              onFieldSubmitted();
                            },
                            decoration: InputDecoration(
                              hintText:
                                  'City...', // Nutze hintText statt labelText
                              fillColor: CustomColors.white,
                              filled: true,
                              border: InputBorder.none,
                  
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: CustomColors.white,
                                ),
                              ),
                              labelStyle: const TextStyle(
                                color: CustomColors
                                    .primary, // Farbe für den Labeltext
                              ),
                            ),
                            style: const TextStyle(
                              color: CustomColors
                                  .primary, // Farbe für den Eingabetext
                            ),
                          );
                        },
                        optionsViewBuilder: (
                          BuildContext context,
                          AutocompleteOnSelected<Destination> onSelected,
                          Iterable<Destination> options,
                        ) {
                          final List<Destination> items = options.toList();
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Material(
                              color: CustomColors.primaryBackground,
                              elevation: 4,
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                height: 52.0 * items.length,
                                width: MediaQuery.of(context).size.width - 95,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: items.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final Destination option = items[index];
                                    return Column(
                                      children: [
                                        ListTile(
                                          leading: const Icon(
                                            Icons.location_on,
                                            color: CustomColors.primary,
                                          ),
                                          title: Text(
                                            option.formatted,
                                            style: textTheme.bodySmall?.copyWith(
                                              color: CustomColors.black,
                                            ),
                                          ),
                                          onTap: () {
                                            onSelected(option);
                                          },
                                        ),
                                        if (index != items.length - 1)
                                          const Divider(
                                            endIndent: 10,
                                            indent: 10,
                                            thickness: 1,
                                            height: 1,
                                          ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Select Categories: ',
                        style: TextStyle(
                          color: CustomColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 25,
                        runSpacing: 15,
                        children: activityTypes.map((type) {
                          return FilterChip(
                            side: const BorderSide(color: CustomColors.white),
                            disabledColor: CustomColors.white,
                            labelStyle:
                                const TextStyle(color: CustomColors.primary),
                            selectedColor: CustomColors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            checkmarkColor: CustomColors.primary,
                            label: Text(
                              type,
                              style: TextStyle(
                                color: _categoryList.contains(type)
                                    ? CustomColors.primary
                                    : CustomColors.primary,
                              ),
                            ),
                            selected: _categoryList.contains(type),
                            onSelected: (bool selected) {
                              setState(() {
                                if (selected) {
                                  _categoryList.add(type);
                                } else {
                                  _categoryList.remove(type);
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          if (_selectedDestination != null) {
                            Navigator.of(context).push(
                              MaterialPageRoute<APIActivitiesScreen>(
                                builder: (context) => APIActivitiesScreen(
                                  destination: _selectedDestination!,
                                  categoryList: _categoryList,
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              CustomColors.white, // Hintergrundfarbe des Buttons
                          side: BorderSide.none, // Keine Seitenlinie
                        ),
                        child: const Text(
                          'Search',
                          style: TextStyle(
                            color: CustomColors.primary, // Farbe des Texts
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
