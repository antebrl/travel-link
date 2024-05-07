import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_link/src/common_widgets/calendar_popup_view.dart';
import 'package:travel_link/src/features/my_trips/data/my_trips_repository.dart';
import 'package:travel_link/src/features/my_trips/presentation/my_trips_controller.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

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
  String? _destination;

  bool _isPublic = false;
  int? _maxParticipants;

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

    final success =
        await ref.read(myTripsControllerProvider.notifier).createTrip(
              name: _name ?? '',
              destination: _destination ?? '',
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
    final state = ref.watch(myTripsControllerProvider);
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.62,
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
                        maxLength: 30,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        validator: (value) => (value ?? '').isNotEmpty
                            ? null
                            : "Name can't be empty",
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: TextFormField(
                        onSaved: (value) => _destination = value,
                        validator: (value) => (value ?? '').isNotEmpty
                            ? null
                            : "Destination can't be empty",
                        decoration: const InputDecoration(
                          labelText: 'Destination',
                        ),
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
                                    color: Colors.black.withOpacity(0.8),
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
