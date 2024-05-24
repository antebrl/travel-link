import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class ActivitiesFilterScreen extends StatefulWidget {
  const ActivitiesFilterScreen({super.key, required this.continent});
  final Continent continent;

  @override
  _ActivitiesFilterScreenState createState() => _ActivitiesFilterScreenState();
}

class _ActivitiesFilterScreenState extends State<ActivitiesFilterScreen> {
  final TextEditingController _countryController = TextEditingController();

  List<String> countryList = [''];

  String countryName = '';
  Set<ActivityType> filters = <ActivityType>{};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryList = setFilter(widget.continent);
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
          'ZW'
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
          'YE'
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
          'VA'
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
          'FO'
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
          'VE'
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
          'TL'
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 35),
            const Text(
              'Select country: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: CustomColors.primary,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _countryController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Selected Country',
                  hintText: 'Tap to pick a country',
                  border: OutlineInputBorder(),
                ),
                onTap: () {
                  showCountryPicker(
                    showWorldWide: true,
                    context: context,
                    countryFilter: countryList,
                    onSelect: (Country country) {
                      _countryController.text = country.name;
                      countryName = country.name;
                    },
                    moveAlongWithKeyboard: false,
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
                            color: const Color(0xFF8C98A8).withOpacity(0.2),
                          ),
                        ),
                      ),
                      searchTextStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Select categories: ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: CustomColors.primary),
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
                      color: filters.contains(type)
                          ? CustomColors.white
                          : CustomColors.textPrimary,
                    ),
                  ),
                  selected: filters.contains(type),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        filters.add(type);
                      } else {
                        filters.remove(type);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              child: const Text('Search'),
              onPressed: () {
                print(countryName);
                if (countryName == 'World Wide' || countryName.isEmpty) {
                  countryName = '';
                }
                Navigator.of(context).pop([countryName.trim(), filters]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
