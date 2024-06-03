import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:travel_link/src/common_widgets/auto_complete_search.dart';
import 'package:travel_link/src/common_widgets/calendar_popup_view.dart';
import 'package:travel_link/src/features/my_trips/data/my_trips_repository.dart';
import 'package:travel_link/src/features/my_trips/domain/destination.dart';
import 'package:travel_link/src/features/my_trips/presentation/my_trips_controller.dart';
import 'package:travel_link/src/utils/constants/api_constants.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

class CreateTripScreen extends ConsumerStatefulWidget {
  const CreateTripScreen({super.key});

  @override
  CreateTripScreenState createState() => CreateTripScreenState();
}

class CreateTripScreenState extends ConsumerState<CreateTripScreen> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _endDate;
  DateTime? _startDate;
  String? _name;
  String? _description;

  final DestinationController _controller = DestinationController();

  bool _isPublic = false;
  int? _maxParticipants;

  Future<Iterable<Destination>> getDestinationSuggestion(String input) async {
    //TODO (Ante): Request with language code
    final String request =
        '${CustomApiConstants.autocompleteBaseURL}?text=$input&apiKey=${CustomApiConstants.geoapifySecretKey}&limit=3&format=json';
    final response = await http.get(Uri.parse(request));

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

  bool _validateAndSaveForm() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if (!_validateAndSaveForm()) return;

    if (_controller.selectedDestination == null ||
        _controller.selectedDestination!.formatted != _controller.queryDestination) {
      _controller.selectedDestination = Destination(formatted: _controller.queryDestination ?? '');
    }

    final success =
        await ref.read(myTripsControllerProvider.notifier).createTrip(
              name: _name ?? '',
              description: _description,
              destination: _controller.selectedDestination!,
              start: _startDate,
              end: _endDate,
              isPublic: _isPublic,
              maxParticipants: _maxParticipants,
            );

    if (success && mounted) {
      // ignore: unused_result
      ref.refresh(fetchMyTripsProvider); //load new Trip into MyTrips List
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;
    final state = ref.watch(myTripsControllerProvider);
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.68,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text(
                  'Create a Trip',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: TextFormField(
                        onSaved: (value) => _name = value,
                        maxLength: 20,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        validator: (value) => (value ?? '').isNotEmpty
                            ? null
                            : "Name can't be empty",
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: TextFormField(
                        onSaved: (value) => _description = value,
                        maxLength: 70,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        validator: (value) => (value ?? '').isNotEmpty 
                            ? null
                            : _isPublic ? "Description can't be empty if the trip is public" : null,
                        decoration: const InputDecoration(
                          labelText: 'Description',
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: AutoCompleteSearch(
                        controller: _controller,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          showDialog<dynamic>(
                            context: context,
                            builder: (context) => CalendarPopupView(
                              minimumDate: DateTime.now(),
                              onApplyClick:
                                  (DateTime startData, DateTime endData) {
                                setState(() {
                                  _startDate = startData;
                                  _endDate = endData;
                                });
                              },
                              onCancelClick: () {},
                            ),
                          );
                        },
                        child: _startDate != null && _endDate != null
                            ? Row(
                                children: [
                                  Text(
                                    '${_startDate!.day}.${_startDate!.month}.${_startDate!.year} - ${_endDate!.day}.${_endDate!.month}.${_endDate!.year}',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Select Dates',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '(optional)',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Colors.grey,
                                        ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    if (_startDate != null)
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _startDate = _endDate = null;
                          });
                        },
                        icon: const Icon(Icons.clear),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Switch(
                      activeColor: Theme.of(context).primaryColor,
                      inactiveThumbColor: Colors.black.withOpacity(0.7),
                      value: _isPublic,
                      onChanged: (value) {
                        setState(() {
                          _isPublic = value;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _isPublic ? 'Public Trip' : 'Private Trip',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Expanded(child: Container()),
                    if (_isPublic)
                      Row(
                        children: [
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: 50,
                              maxHeight: 30,
                            ),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                hintText: '\u221e',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.zero,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ], // Only numbers can be entered
                              onChanged: (value) => setState(() {
                                _maxParticipants = int.tryParse(value);
                              }),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Max Particpants',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: state.isLoading ? null : _submit,
                  child: const Text('Create'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
