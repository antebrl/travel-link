import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class ActivitiesFilterScreen extends StatefulWidget {
  const ActivitiesFilterScreen({super.key, required this.continent});
  final Continent continent;

  @override
  State<ActivitiesFilterScreen> createState() => _ActivitiesFilterScreenState();
}

class _ActivitiesFilterScreenState extends State<ActivitiesFilterScreen> {
  final TextEditingController _countryController = TextEditingController();

  List<String> countryList = [''];

  String countryName = '';
  @override
  void initState() {
    super.initState();
    countryList = setFilter(widget.continent);
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

  List<String> setFilter(Continent continent) {
    switch (continent.continentType) {
      case ContinentType.africa:
        return [
          'DZ',
          'AO',
          'BJ',
          'BW',
          'BF',
          'BI',
          'CV',
          'CM',
          'CF',
          'TD',
          'KM',
          'CG',
          'DJ',
          'EG',
          'GQ',
          'ER',
          'SZ',
          'ET',
          'GA',
          'GM',
          'GH',
          'GN',
          'GW',
          'CI',
          'KE',
          'LS',
          'LR',
          'LY',
          'MG',
          'MW',
          'ML',
          'MR',
          'MU',
          'MA',
          'MZ',
          'NA',
          'NE',
          'NG',
          'RW',
          'ST',
          'SN',
          'SC',
          'SL',
          'SO',
          'ZA',
          'SS',
          'SD',
          'TZ',
          'TG',
          'TN',
          'UG',
          'ZM',
          'ZW',
        ];
      case ContinentType.asia:
        return [
          'AF',
          'AM',
          'AZ',
          'BH',
          'BD',
          'BT',
          'BN',
          'KH',
          'CN',
          'CY',
          'GE',
          'IN',
          'ID',
          'IR',
          'IQ',
          'IL',
          'JP',
          'JO',
          'KZ',
          'KW',
          'KG',
          'LA',
          'LB',
          'MY',
          'MV',
          'MN',
          'MM',
          'NP',
          'KP',
          'OM',
          'PK',
          'PS',
          'PH',
          'QA',
          'SA',
          'SG',
          'KR',
          'LK',
          'SY',
          'TW',
          'TJ',
          'TH',
          'TL',
          'TR',
          'TM',
          'AE',
          'UZ',
          'VN',
          'YE',
        ];
      case ContinentType.europe:
        return [
          'AL',
          'AD',
          'AT',
          'BY',
          'BE',
          'BA',
          'BG',
          'HR',
          'CY',
          'CZ',
          'DK',
          'EE',
          'FI',
          'FR',
          'DE',
          'GR',
          'HU',
          'IS',
          'IE',
          'IT',
          'XK',
          'LV',
          'LI',
          'LT',
          'LU',
          'MT',
          'MD',
          'MC',
          'ME',
          'NL',
          'MK',
          'NO',
          'PL',
          'PT',
          'RO',
          'RU',
          'SM',
          'RS',
          'SK',
          'SI',
          'ES',
          'SE',
          'CH',
          'UA',
          'GB',
          'VA',
        ];
      case ContinentType.northAmerica:
        return [
          'US',
          'CA',
          'MX',
          'GT',
          'CU',
          'HT',
          'DO',
          'HN',
          'SV',
          'NI',
          'CR',
          'PA',
          'JM',
          'TT',
          'BS',
          'BZ',
          'BB',
          'LC',
          'VC',
          'GD',
          'AG',
          'KN',
          'DM',
          'MF',
          'SX',
          'KY',
          'TC',
          'BM',
          'AI',
          'VG',
          'VI',
          'GL',
          'PM',
          'FO',
        ];
      case ContinentType.southAmerica:
        return [
          'AR',
          'BO',
          'BR',
          'CL',
          'CO',
          'EC',
          'GY',
          'PY',
          'PE',
          'SR',
          'UY',
          'VE',
        ];
      case ContinentType.australia:
        return [
          'AU',
          'PG',
          'NZ',
          'FJ',
          'SB',
          'VU',
          'WS',
          'KI',
          'FM',
          'TO',
          'MH',
          'PW',
          'NR',
          'TV',
          'CK',
          'NU',
          'FM',
          'PF',
          'WF',
          'NC',
          'NF',
          'CX',
          'CC',
          'HM',
          'PN',
          'TL',
        ];
      case ContinentType.none:
        return [''];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                        color: Colors.white.withOpacity(0.3),
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
                              'Select country:',
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
                                  _countryController.clear();
                                  _categoryList.clear();
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(color: Colors.white),
                              ),
                              child: Text(
                                'Clear',
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
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: CustomColors.primary,
                                    ),
                            controller: _countryController,
                            readOnly: true,
                            decoration: InputDecoration(
                              fillColor: CustomColors.white,
                              filled: true,
                              hintText: 'Tap to pick a country',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: CustomColors.primary,
                                  ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                countryFilter: countryList,
                                onSelect: (Country country) {
                                  _countryController.text = country.name;
                                  countryName = country.name;
                                },
                                countryListTheme: CountryListThemeData(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  ),
                                  inputDecoration: InputDecoration(
                                    labelText: 'Search',
                                    hintText: 'Start typing to search',
                                    prefixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color(0xFF8C98A8)
                                            .withOpacity(0.2),
                                      ),
                                    ),
                                  ),
                                  searchTextStyle: const TextStyle(
                                    color: CustomColors.primary,
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            Text(
                              'Select categories:',
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
                              ),
                              child: Text(
                                _categoryList.length == activityTypes.length
                                    ? 'Unselect All'
                                    : 'Select All',
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
                        const SizedBox(height: 15),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 25,
                          runSpacing: 15,
                          children: activityTypes.map((type) {
                            return FilterChip(
                              side: const BorderSide(color: CustomColors.white),
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
                            if (countryName == 'World Wide' ||
                                countryName.isEmpty) {
                              countryName = '';
                            }
                            Navigator.of(context)
                                .pop([countryName.trim(), _categoryList]);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColors.white,
                            side: BorderSide.none,
                          ),
                          child: Text(
                            'Search',
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
          ),
        ),
      ),
    );
  }
}
