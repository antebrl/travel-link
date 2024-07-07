import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/activities/4_add_activity_screen/presentation/activities_controller.dart';
import 'package:travel_link/src/features/activities/4_add_activity_screen/presentation/image_input.dart';
import 'package:travel_link/src/features/activities/4_add_activity_screen/presentation/location_input.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/helpers/async_value.dart';
import 'package:travel_link/src/utils/helpers/localization.dart';

class AddActivityScreen extends ConsumerStatefulWidget {
  const AddActivityScreen({super.key});

  @override
  ConsumerState<AddActivityScreen> createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends ConsumerState<AddActivityScreen> {
  final _formKey = GlobalKey<FormState>();

  String _enteredName = '';
  String _enteredDescription = '';

  Uint8List? _selectedImage;
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
      });
    });
  }

  String? stringValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().isEmpty ||
        value.trim().length > 50) {
      return context.loc.characterLengthRange;
    }
    return null;
  }

  Future<void> _saveActivity() async {
    if (_formKey.currentState!.validate() &&
        _selectedImage != null &&
        _selectedLocation != null &&
        _filters.isNotEmpty &&
        _user != null) {
      _formKey.currentState!.save();
      final activity = Activity(
        name: _enteredName,
        categories: _filters.toList(),
        description: _enteredDescription,
        imageBytes: _selectedImage,
        isPublic: _isPublic,
        isUserCreated: true,
        creatorId: _user!.uid,
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
        SnackBar(
          content: Text(context.loc.fillOutRequiredFields),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      activitiesControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );
    if (_user == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(context.loc.addActivity),
        ),
        body: Center(
          child: Text(context.loc.loginToAddActivity),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.addActivity),
      ),
      body: SingleChildScrollView(
        child: ColoredBox(
          color: CustomColors.white,
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
                        decoration: InputDecoration(
                          labelText: context.loc.name,
                        ),
                        validator: stringValidator,
                        onSaved: (value) {
                          _enteredName = value!;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: context.loc.description,
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
                        context.loc.selectCategories,
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
                            _isPublic
                                ? context.loc.publicActivity
                                : context.loc.privateActivity,
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
                              child: Text(context.loc.save),
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
      ),
    );
  }
}
