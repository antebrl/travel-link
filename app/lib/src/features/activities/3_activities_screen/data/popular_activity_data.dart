// ignore_for_file: lines_longer_than_80_chars

import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';

List<ApiActivity> popularActivityData = [
  ApiActivity(
    imagePaths: [''],
    name: 'Forbidden City',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.asia,
    description: 'Imperial palace complex in Beijing, China',
    location: const PlaceLocation(
      lat: 39.9163,
      lon: 116.3972,
      city: 'Beijing',
      country: 'China',
      formatted: 'The Forbidden City, Beijing, China',
      countryCode: 'CN',
    ),
    amountVisitors: '17,000,000',
  ),
  ApiActivity(
    imagePaths: [''],
    name: "St. Peter's Basilica",
    categories: {'tourism', 'religion'}.toList(),
    continentType: ContinentType.europe,
    description:
        'Catholic basilica in Vatican City, the papal enclave within Rome, Italy',
    location: const PlaceLocation(
      lat: 41.9022,
      lon: 12.4535,
      city: 'Vatican City',
      country: 'Vatican City',
      formatted: "St. Peter's Basilica, Vatican City",
      countryCode: 'VA',
    ),
    amountVisitors: '11,000,000',
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Palace of Versailles',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.europe,
    description: 'Historical palace located in Versailles, France',
    location: const PlaceLocation(
      lat: 48.8048,
      lon: 2.1204,
      city: 'Versailles',
      country: 'France',
      formatted: 'Palace of Versailles, Versailles, France',
      countryCode: 'FR',
    ),
    amountVisitors: '8,100,000',
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Lincoln Memorial',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.northAmerica,
    description:
        'Memorial built to honor Abraham Lincoln, the 16th President of the United States',
    location: const PlaceLocation(
      lat: 38.8893,
      lon: -77.0502,
      city: 'Washington, D.C.',
      country: 'USA',
      formatted: 'Lincoln Memorial, Washington, D.C., USA',
      countryCode: 'US',
    ),
    amountVisitors: '7,804,683',
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Colosseum',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.europe,
    description:
        'Historical circuit in Rome, Italy, including the Colosseum, Forum, and Palatine Hill',
    location: const PlaceLocation(
      lat: 41.8902,
      lon: 12.4922,
      city: 'Rome',
      country: 'Italy',
      formatted: 'Colosseum-Forum-Palatine Hill Circuit, Rome, Italy',
      countryCode: 'IT',
    ),
    amountVisitors: '7,650,519',
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Parthenon',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.europe,
    description:
        'Ancient citadel located in Athens, Greece, with the Parthenon as its most famous landmark',
    location: const PlaceLocation(
      lat: 37.9715,
      lon: 23.7269,
      city: 'Athens',
      country: 'Greece',
      formatted: 'Parthenon-Acropolis, Athens, Greece',
      countryCode: 'GR',
    ),
    amountVisitors: '7,200,000',
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Eiffel Tower',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.europe,
    description: 'Iconic landmark and symbol of Paris, France',
    location: const PlaceLocation(
      lat: 48.8584,
      lon: 2.2945,
      city: 'Paris',
      country: 'France',
      formatted: 'Eiffel Tower, Paris, France',
      countryCode: 'FR',
    ),
    amountVisitors: '7,000,000',
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Taj Mahal',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.asia,
    description:
        'Ivory-white marble mausoleum on the right bank of the river Yamuna in the Indian city of Agra',
    location: const PlaceLocation(
      lat: 27.1751,
      lon: 78.0421,
      city: 'Agra',
      country: 'India',
      formatted: 'Taj Mahal, Agra, India',
      countryCode: 'IN',
    ),
    amountVisitors: '6,532,366',
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Cologne Cathedral',
    categories: {'tourism', 'religion'}.toList(),
    continentType: ContinentType.europe,
    description: 'Catholic cathedral in Cologne, Germany',
    location: const PlaceLocation(
      lat: 50.9413,
      lon: 6.958,
      city: 'Cologne',
      country: 'Germany',
      formatted: 'Cologne Cathedral, Cologne, Germany',
      countryCode: 'DE',
    ),
    amountVisitors: '6,000,000',
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Peterhof Palace',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.europe,
    description: 'Palace complex in Saint Petersburg, Russia',
    location: const PlaceLocation(
      lat: 59.8882,
      lon: 29.9034,
      city: 'Saint Petersburg',
      country: 'Russia',
      formatted: 'Peterhof Palace, Saint Petersburg, Russia',
      countryCode: 'RU',
    ),
    amountVisitors: '5,245,900',
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Palace on the Isle',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.europe,
    description: 'Palace complex in Warsaw, Poland',
    location: const PlaceLocation(
      lat: 52.2142,
      lon: 21.0351,
      city: 'Warsaw',
      country: 'Poland',
      formatted: 'Łazienki Palace, Warsaw, Poland',
      countryCode: 'PL',
    ),
    amountVisitors: '4,966,858',
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Vietnam Veterans Memorial',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.northAmerica,
    description:
        'Memorial in Washington, D.C., USA, honoring U.S. service members of the Vietnam War',
    location: const PlaceLocation(
      lat: 38.8913,
      lon: -77.0477,
      city: 'Washington, D.C.',
      country: 'USA',
      formatted: 'Vietnam Veterans Memorial, Washington, D.C., USA',
      countryCode: 'US',
    ),
    amountVisitors: '4,719,148',
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'World War II Memorial',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.northAmerica,
    description:
        'Memorial in Washington, D.C., USA, dedicated to Americans who served in World War II',
    location: const PlaceLocation(
      lat: 38.8895,
      lon: -77.0407,
      city: 'Washington, D.C.',
      country: 'USA',
      formatted: 'World War II Memorial, Washington, D.C., USA',
      countryCode: 'US',
    ),
    amountVisitors: '4,652,865',
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Independence National Historical Park',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.northAmerica,
    description:
        'Historic area in Philadelphia, USA, preserving several sites associated with the American Revolution',
    location: const PlaceLocation(
      lat: 39.9489,
      lon: -75.1503,
      city: 'Philadelphia',
      country: 'USA',
      formatted: 'Independence National Historical Park, Philadelphia, USA',
      countryCode: 'US',
    ),
    amountVisitors: '4,576,436',
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Sagrada Família',
    categories: {'tourism', 'religion'}.toList(),
    continentType: ContinentType.europe,
    description:
        'Basilica and iconic masterpiece of Antoni Gaudí in Barcelona, Spain',
    location: const PlaceLocation(
      lat: 41.4036,
      lon: 2.1744,
      city: 'Barcelona',
      country: 'Spain',
      formatted: 'Sagrada Família, Barcelona, Spain',
      countryCode: 'ES',
    ),
    amountVisitors: '4,500,000',
  ),
];
