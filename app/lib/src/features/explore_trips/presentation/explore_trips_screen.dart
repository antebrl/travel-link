import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:travel_link/src/common_widgets/calendar_popup_view.dart';
import 'package:travel_link/src/features/explore_trips/data/trips_repository.dart';
import 'package:travel_link/src/features/explore_trips/presentation/public_trip_card.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/helpers/localization.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

class ExploreTripsScreen extends ConsumerStatefulWidget {
  const ExploreTripsScreen({super.key});

  @override
  ConsumerState<ExploreTripsScreen> createState() => _ExploreTripsScreenState();
}

class _ExploreTripsScreenState extends ConsumerState<ExploreTripsScreen> {
  CarouselController? carouselController = CarouselController();
  // ignore: unused_field
  // ignore: unused_field
  int _currentIndex = 0;

  DateTime? _startDate;
  DateTime? _endDate;

  String? _upcomingArchivedSelection;

  String? _selectedCountry;


  @override
  Widget build(BuildContext context) {
    //TODO: Filter trips by country
    final fetchedTrips = ref.watch(fetchPublicTripsProvider(
      startDate: _startDate,
      endDate: _endDate,
      archived: _upcomingArchivedSelection == context.loc.archivedTripSelection,
      country: _selectedCountry,
      worldWide: _selectedCountry == context.loc.countryWorldWide,
    ));

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        titleSpacing: 0,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              context.loc.exploreTripsTitle,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            DropdownButton<String>(
              value: _upcomingArchivedSelection ?? context.loc.upcomingTripsSelection,
              alignment: AlignmentDirectional.topCenter,
              focusColor: CustomColors.primaryBackground,
              dropdownColor: Colors.white,
              underline: Container(
                height: 0,
                color: CustomColors.primaryBackground,
              ),
              borderRadius: BorderRadius.circular(16),
              iconSize: 0,
              onChanged: (String? newValue) {
                setState(() {
                  _upcomingArchivedSelection = newValue!;
                });
              },
              items: <String>[context.loc.upcomingTripsSelection, context.loc.archivedTripSelection]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              selectedItemBuilder: (BuildContext context) {
                return <String>[context.loc.upcomingTripsSelection, context.loc.archivedTripSelection]
                    .map<Widget>((String value) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 3,
                          right: 1,
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 17,
                          color: Colors.grey[800],
                        ),
                      ),
                      Text(
                        value,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                }).toList();
              },
            ),
          ],
        ),
        backgroundColor: CustomColors.primaryBackground,
        elevation: 0,
        leadingWidth: 92,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 5, 0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: GestureDetector(
              onTap: () => showCountryPicker(
                context: context,
                onSelect: (Country country) {
                  setState(() {
                    if(country.name == 'World Wide') {
                      _selectedCountry = context.loc.countryWorldWide;
                    } else {
                      _selectedCountry = country.name;
                    }
                  });
                },
                showWorldWide: true,
                countryListTheme: CountryListThemeData(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  inputDecoration: InputDecoration(
                    labelText: context.loc.searchLabel,
                    hintText: context.loc.searchHint,
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
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.blueAccent[200],
                    size: 21,
                  ),
                  Text(
                    _selectedCountry ?? context.loc.countryWorldWide,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 15, 10, 0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  showDialog<dynamic>(
                    context: context,
                    builder: (context) => CalendarPopupView(
                      minimumDate: DateTime.now(),
                      onApplyClick: (DateTime? startData, DateTime? endData) {
                        setState(() {
                          _startDate = startData;
                          _endDate = endData;
                        });
                      },
                      onCancelClick: () {},
                    ),
                  );
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.calendar_month_rounded,
                      color: Colors.blueAccent[200],
                      size: 24,
                    ),
                    Text(
                      _startDate != null
                          ? '${DateFormat('dd/MM').format(_startDate!)} - ${DateFormat('dd/MM').format(_endDate!)}'
                          : context.loc.flexibleLabel,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: fetchedTrips.when(
        data: (tripsList) {
          if (tripsList.isNotEmpty) {
            return CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                viewportFraction: 0.83,
                enlargeFactor: 0.25,
                enlargeCenterPage: true,
                height: 650,
                onPageChanged: (index, reason) {
                  _currentIndex = index;
                  setState(() {});
                },
              ),
              items: tripsList.map((i) {
                return PublicTripCard(
                  trip: i,
                );
              }).toList(),
            );
          } else {
            return Center(
              child: Text(
                context.loc.noTripsFound,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          }
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) {
          logger.e('Error loading trips', error: error, stackTrace: stackTrace);
          return Center(
            child: Text(context.loc.errorLoadingTrips),
          );
        },
      ),
    );
  }
}
