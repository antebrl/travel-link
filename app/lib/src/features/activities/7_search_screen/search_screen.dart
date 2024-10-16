import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/common_widgets/auto_complete_search.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/presentation/activities_api_screen.dart';
import 'package:travel_link/src/features/activities/4_add_activity_screen/presentation/add_activity_screen.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/helpers/localization.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final DestinationController _controller = DestinationController();

  Future<void> addActivity() async {
    final newActivity = await Navigator.of(context).push<Activity>(
      MaterialPageRoute(
        builder: (ctx) => const AddActivityScreen(),
      ),
    );

    if (newActivity == null) return;
  }

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
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            right: 15,
            left: 15,
            bottom: 15,
          ),
          child: Column(
            children: [
              Container(
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
                          color: Colors.white.withOpacity(0.2),
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
                          color: Colors.white.withOpacity(0.2),
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
                          color: Colors.white.withOpacity(0.2),
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
                              Text(
                                context.loc.searchActivitiesIn,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      color: CustomColors.white,
                                    ),
                              ),
                              const Spacer(),
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    _controller.textEditingController.clear();
                                    _controller.selectedDestination = null;
                                    _categoryList.clear();
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(color: Colors.white),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                ),
                                child: Text(
                                  context.loc.clear,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: CustomColors.white,
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
                              hintText: context.loc.city,
                              fillColor: CustomColors.white,
                              filled: true,
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: CustomColors.white,
                                ),
                              ),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: CustomColors.primary,
                                  ),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: CustomColors.primary,
                                  ),
                            ),
                            textStyle:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: CustomColors.primary,
                                    ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                context.loc.selectCategories,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      color: CustomColors.white,
                                    ),
                              ),
                              const Spacer(),
                              OutlinedButton(
                                onPressed: _toggleSelectAll,
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(color: Colors.white),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                ),
                                child: Text(
                                  _categoryList.length == activityTypes.length
                                      ? context.loc.unselectAll
                                      : context.loc.selectAll,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: CustomColors.white,
                                      ),
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
                                side:
                                    const BorderSide(color: CustomColors.white),
                                disabledColor: CustomColors.white,
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: CustomColors.primary,
                                    ),
                                selectedColor: CustomColors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 12,
                                ),
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
                                  SnackBar(
                                    content: Text(
                                      context.loc.validCityError,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              } else if (_categoryList.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      context.loc.selectCategoryError,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              } else {
                                Navigator.of(context)
                                    .push(
                                  MaterialPageRoute<APIActivitiesScreen>(
                                    builder: (context) => APIActivitiesScreen(
                                      destination:
                                          _controller.selectedDestination!,
                                      categoryList: _categoryList,
                                    ),
                                  ),
                                )
                                    .then((_) {
                                  FocusScope.of(context).unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  setState(() {
                                    _controller.textEditingController.clear();
                                    _controller.selectedDestination = null;
                                    _categoryList.clear();
                                  });
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.white,
                              side: BorderSide.none,
                            ),
                            child: Text(
                              context.loc.search,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    color: CustomColors.primary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: addActivity,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.primary.withOpacity(0.7),
                        side: BorderSide.none,
                      ),
                      child: Text(
                        context.loc.addActivity,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: CustomColors.white,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
