import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/activities/4_add_activity_screen/presentation/image_input.dart';
import 'package:travel_link/src/features/activities/4_add_activity_screen/presentation/location_input.dart';
import 'package:travel_link/src/features/activities/4_add_activity_screen/switch_continent.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class AddActivityScreen extends ConsumerStatefulWidget {
  const AddActivityScreen({super.key});

  @override
  ConsumerState<AddActivityScreen> createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends ConsumerState<AddActivityScreen> {
  final _formKey = GlobalKey<FormState>();

  //Attribute von Activity
  String _enteredName = 'testDaten';
  String _enteredDescription = 'testDaten';
  ContinentType _enteredcontinentType = ContinentType.northAmerica;
  File? _selectedImage;
  PlaceLocation? _selectedLocation;
  bool _isPublic = true;
  Set<ActivityType> _filters = <ActivityType>{};

  String? stringValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length <= 1 ||
        value.trim().length > 50) {
      return 'Must be between 1 and 50 characters.';
    }
    return null; //return null = korrekte Angabe, sonst nicht
  }

  void _saveActivity() {
    if (_formKey.currentState!.validate() &&
        _selectedImage != null &&
        _selectedLocation != null) {
      _formKey.currentState!.save();
      Navigator.of(context).pop(
        Activity(
          name: _enteredName,
          //continentType: _enteredcontinentType,
          continentType: getContinentFromCountry(_selectedLocation!.country),
          description: _enteredDescription,
          imagePath: '',
          image: _selectedImage,
          location: PlaceLocation(
            latitude: _selectedLocation!.latitude,
            longitude: _selectedLocation!.longitude,
            street: _selectedLocation!.street,
            city: _selectedLocation!.city,
            country: _selectedLocation!.country,
          ),
          isUserCreated: true,
          isPublic: _isPublic,
          types: _filters,
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
          //EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16), //Left top right bottom
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
                    const SizedBox(height: 40),
                    // DropdownButtonFormField(
                    //   value: _enteredcontinentType,
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .labelMedium!
                    //       .copyWith(fontWeight: FontWeight.bold),
                    //   onChanged: (newValue) {
                    //     setState(() {
                    //       _enteredcontinentType = newValue!;
                    //     });
                    //   },
                    //   items: const [
                    //     DropdownMenuItem(
                    //       value: ContinentType.northAmerica,
                    //       child: Text('North America'),
                    //     ),
                    //     DropdownMenuItem(
                    //       value: ContinentType.southAmerica,
                    //       child: Text('South America'),
                    //     ),
                    //     DropdownMenuItem(
                    //       value: ContinentType.africa,
                    //       child: Text('Africa'),
                    //     ),
                    //     DropdownMenuItem(
                    //       value: ContinentType.europe,
                    //       child: Text('Europe'),
                    //     ),
                    //     DropdownMenuItem(
                    //       value: ContinentType.asia,
                    //       child: Text('Asia'),
                    //     ),
                    //     DropdownMenuItem(
                    //       value: ContinentType.australia,
                    //       child: Text('Australia'),
                    //     ),
                    //   ],
                    //   decoration: const InputDecoration(
                    //     labelText: 'Continent',
                    //   ),
                    //   validator: (value) =>
                    //       value == null ? 'Please select a continent' : null,
                    //   onSaved: (value) {
                    //     _enteredcontinentType = value!;
                    //   },
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Image Input
                    ImageInput(
                      onPickImage: (image) {
                        _selectedImage = image;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LocationInput(
                      onSelectLocation: (location) {
                        _selectedLocation = location;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 5),
                        Switch(
                          activeColor: Theme.of(context).primaryColor,
                          inactiveThumbColor: Colors.black.withOpacity(0.7),
                          value: _isPublic,
                          onChanged: (value) {
                            setState(() {
                              print(_isPublic);
                              _isPublic = value;
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _isPublic ? 'Private Activity' : 'Public Activity',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      spacing: 40,
                      runSpacing: 10,
                      children: ActivityType.values.map((ActivityType type) {
                        return FilterChip(
                          selectedColor: CustomColors.primary,
                          backgroundColor: CustomColors.white,
                          side: const BorderSide(color: CustomColors.primary),
                          label: Text(
                            type.name,
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
                    const SizedBox(
                      height: 20,
                    ),
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
