import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/activities/4_add_activity_screen/presentation/activities_controller.dart';
import 'package:travel_link/src/features/activities/4_add_activity_screen/presentation/image_input.dart';
import 'package:travel_link/src/features/activities/4_add_activity_screen/presentation/location_input.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class AddActivityScreen extends ConsumerStatefulWidget {
  const AddActivityScreen({super.key});

  @override
  ConsumerState<AddActivityScreen> createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends ConsumerState<AddActivityScreen> {
  final _formKey = GlobalKey<FormState>();

  String _enteredName = '';
  String _enteredDescription = '';

  File? _selectedImage;
  PlaceLocation? _selectedLocation;
  bool _isPublic = false;
  final Set<String> _filters = <String>{};
  User? _user;

  @override
  void initState() {
    super.initState();
    _checkUserAuthState();
  }

  void _checkUserAuthState() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      setState(() {
        _user = user;
        print(
          _user!.uid,
        );
      });
    });
  }

  String? stringValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().isEmpty ||
        value.trim().length > 50) {
      return 'Must be between 1 and 50 characters.';
    }
    return null;
  }

  Future<void> _saveActivity() async {
    if (_formKey.currentState!.validate() &&
        _selectedImage != null &&
        _selectedLocation != null &&
        _filters.isNotEmpty &&
        _user != null) {
      // Sicherstellen, dass der Benutzer eingeloggt ist
      _formKey.currentState!.save();

      var activity = Activity(
        name: _enteredName,
        categories: _filters.toList(),
        description: _enteredDescription,
        image: _selectedImage,
        isPublic: _isPublic,
        isUserCreated: true,
        creatorId: _user!.uid, // UID des Benutzers verwenden
        location: PlaceLocation(
          lat: _selectedLocation!.lat,
          lon: _selectedLocation!.lon,
          city: _selectedLocation!.city,
          country: _selectedLocation!.country,
          formatted: _selectedLocation!.formatted,
          countryCode: _selectedLocation!.countryCode,
        ),
      );

      final success = await ref
          .read(activitiesControllerProvider.notifier)
          .postActivity(activity: activity);

      if (success && mounted) {
        Navigator.of(context).pop(activity);
      }
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill out all required fields.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new activity'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      maxLength: 50,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                      validator: stringValidator,
                      onSaved: (value) {
                        _enteredName = value!;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                      validator: stringValidator,
                      onSaved: (value) {
                        _enteredDescription = value!;
                      },
                    ),
                    const SizedBox(height: 20),
                    ImageInput(
                      onPickImage: (image) {
                        _selectedImage = image;
                      },
                    ),
                    const SizedBox(height: 20),
                    LocationInput(
                      onSelectLocation: (location) {
                        _selectedLocation = location;
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Select Categories: ',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: CustomColors.primary,
                              ),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 5),
                        Switch(
                          activeColor: Theme.of(context).primaryColor,
                          inactiveThumbColor: Colors.black.withOpacity(0.7),
                          inactiveTrackColor: CustomColors.white,
                          trackOutlineColor:
                              WidgetStateProperty.all(CustomColors.primary),
                          value: _isPublic,
                          onChanged: (value) {
                            setState(() {
                              _isPublic = value;
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _isPublic ? 'Public Activity' : 'Private Activity',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      spacing: 40,
                      runSpacing: 10,
                      children: activityTypes.map((type) {
                        return FilterChip(
                          selectedColor: CustomColors.primary,
                          backgroundColor: CustomColors.white,
                          side: const BorderSide(color: CustomColors.primary),
                          label: Text(
                            type,
                            style: TextStyle(
                              color: _filters.contains(type)
                                  ? CustomColors.white
                                  : CustomColors.textPrimary,
                            ),
                          ),
                          selected: _filters.contains(type),
                          onSelected: (bool selected) {
                            setState(() {
                              if (selected) {
                                _filters.add(type);
                              } else {
                                _filters.remove(type);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _saveActivity,
                            child: const Text('Save'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
