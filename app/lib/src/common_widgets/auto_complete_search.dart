import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_link/src/features/my_trips/domain/destination.dart';
import 'package:travel_link/src/utils/constants/api_constants.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

class AutoCompleteSearch extends StatefulWidget {
  const AutoCompleteSearch({
    required this.controller,
    super.key,
    this.filterByType,
    this.textStyle,
    this.horizontalPadding = 40,
    this.textFieldDecoration = const InputDecoration(
      labelText: 'Destination',
    ),
  });

  final DestinationController controller;
  final String? filterByType;

  final InputDecoration textFieldDecoration;
  final TextStyle? textStyle;

  final double horizontalPadding;

  @override
  State<AutoCompleteSearch> createState() => _AutoCompleteSearchState();
}

class _AutoCompleteSearchState extends State<AutoCompleteSearch> {
  //String? _queryDestination;
  late Iterable<Destination> _destinationSuggestions = <Destination>[];
  late final requestUrl = widget.filterByType != null
      ? '${CustomApiConstants.autocompleteBaseURL}?type=${widget.filterByType}&apiKey=${CustomApiConstants.geoapifySecretKey}&limit=3&format=json'
      : '${CustomApiConstants.autocompleteBaseURL}?apiKey=${CustomApiConstants.geoapifySecretKey}&limit=3&format=json';

  Future<Iterable<Destination>> getDestinationSuggestion(String input) async {
    // TODO: Request with language code
    final response = await http.get(Uri.parse('$requestUrl&text=$input'));

    if (response.statusCode == 200) {
      final destinations =
          json.decode(response.body)['results'] as List<dynamic>;

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
    return Autocomplete<Destination>(
      optionsBuilder: (TextEditingValue textEditingValue) async {
        widget.controller.queryDestination = textEditingValue.text;
        if (widget.controller.queryDestination == '') {
          return const Iterable<Destination>.empty();
        }
        final Iterable<Destination> options = await getDestinationSuggestion(
          widget.controller.queryDestination!,
        );

        if (widget.controller.queryDestination ==
            widget.controller.selectedDestination?.formatted) {
          return [];
        }

        // If the query has changed, don't update and wait for next options build
        if (widget.controller.queryDestination != textEditingValue.text) {
          return _destinationSuggestions;
        }
        _destinationSuggestions = options;
        return options;
      },
      displayStringForOption: (option) => option.formatted,
      onSelected: (destination) {
        widget.controller.selectedDestination = destination;
      },
      fieldViewBuilder: (
        BuildContext context,
        TextEditingController textEditingController,
        FocusNode focusNode,
        VoidCallback onFieldSubmitted,
      ) {
        widget.controller.textEditingController = textEditingController;
        return TextFormField(
          controller: textEditingController,
          focusNode: focusNode,
          onFieldSubmitted: (String value) {
            onFieldSubmitted();
          },
          decoration: widget.textFieldDecoration,
          style: widget.textStyle,
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
              width:
                  MediaQuery.of(context).size.width - widget.horizontalPadding,
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
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: CustomColors.black,
                                  ),
                        ),
                        onTap: () => widget.controller.onSelected != null
                            ? widget.controller.onSelected!(option)
                            : onSelected(option),
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
    );
  }
}

class DestinationController {
  DestinationController({this.onSelected});

  Destination? selectedDestination;
  String? queryDestination;
  TextEditingController textEditingController = TextEditingController();

  final void Function(Destination)? onSelected;
}
