import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/common_widgets/auto_complete_search.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/activities_api_screen.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final DestinationController _controller = DestinationController();
  Set<String> _categoryList = {};
  void _toggleSelectAll() {
    setState(() {
      if (_categoryList.length == activityTypes.length) {
        _categoryList.clear();
      } else {
        _categoryList = activityTypes.toSet();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      Row(
                        children: [
                          const Text(
                            'Search Activities in: ',
                            style: TextStyle(
                              color: CustomColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(), // Hinzugefügt, um den Button ganz rechts zu platzieren
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                //clearInput(); // Eingabefeld leeren
                                _categoryList
                                    .clear(); // CategoryList zurücksetzen
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                side: const BorderSide(color: Colors.white)),
                            child: const Text(
                              'Clear',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      AutoCompleteSearch(
                        controller: _controller,
                        horizontalPadding: 95,
                        filterByType: 'city',
                        textFieldDecoration: InputDecoration(
                          hintText: 'City...',
                          fillColor: CustomColors.white,
                          filled: true,
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: CustomColors.white,
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color:
                                CustomColors.primary, // Farbe für den Labeltext
                          ),
                        ),
                        textStyle: const TextStyle(
                          color:
                              CustomColors.primary, // Farbe für den Eingabetext
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const Text(
                            'Select Categories: ',
                            style: TextStyle(
                              color: CustomColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          OutlinedButton(
                            onPressed: _toggleSelectAll,
                            style: ElevatedButton.styleFrom(
                                //backgroundColor: Colors.white,
                                side: BorderSide(color: Colors.white)),
                            child: Text(
                              _categoryList.length == activityTypes.length
                                  ? 'Unselect All'
                                  : 'Select All',
                              style: const TextStyle(
                                  color: CustomColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
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
                          ScaffoldMessenger.of(context).clearSnackBars();
                          if (_controller.selectedDestination == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please enter a valid city.',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          } else if (_categoryList.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please select at least one category.',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          } else {
                            Navigator.of(context).push(
                              MaterialPageRoute<APIActivitiesScreen>(
                                builder: (context) => APIActivitiesScreen(
                                  destination: _controller.selectedDestination!,
                                  categoryList: _categoryList,
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors
                              .white, // Hintergrundfarbe des Buttons
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
