import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';

List<Activity> activityData = [
// North America
  Activity(
    name: 'Times Square',
    continentType: ContinentType.northAmerica,
    description:
        'A vibrant intersection and tourist destination in New York City.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: const PlaceLocation(
        latitude: 40.758896,
        longitude: -73.985130,
        street: 'Broadway',
        city: 'New York City',
        country: 'USA'),
  ),

  Activity(
    name: 'Niagara Falls',
    continentType: ContinentType.northAmerica,
    description:
        'Powerful waterfalls on the border between Canada and the United States.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: const PlaceLocation(
        latitude: 43.0790555,
        longitude: -79.0747579,
        street: 'Niagara Pkwy',
        city: 'Niagara Falls',
        country: 'Canada & USA'),
  ),

  Activity(
    name: 'Statue of Liberty',
    continentType: ContinentType.northAmerica,
    description:
        'Iconic symbol of freedom and democracy located in New York Harbor.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Liberty Island',
      city: 'New York Harbor',
      country: 'USA',
      latitude: 40.6892,
      longitude: -74.0445,
    ),
  ),
  Activity(
    name: 'Grand Canyon',
    continentType: ContinentType.northAmerica,
    description:
        'Massive canyon carved by the Colorado River in the state of Arizona.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Arizona',
      city: '',
      country: 'USA',
      latitude: 36.1069,
      longitude: -112.1129,
    ),
  ),
  Activity(
    name: 'Golden Gate Bridge',
    continentType: ContinentType.northAmerica,
    description:
        'Famous suspension bridge spanning the Golden Gate Strait in California.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'San Francisco',
      city: 'California',
      country: 'USA',
      latitude: 37.8199,
      longitude: -122.4783,
    ),
  ),
  Activity(
    name: 'Central Park',
    continentType: ContinentType.northAmerica,
    description: 'Iconic urban park in Manhattan, New York City.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Manhattan',
      city: 'New York City',
      country: 'USA',
      latitude: 40.7851,
      longitude: -73.9683,
    ),
  ),
  Activity(
    name: 'Disneyland',
    continentType: ContinentType.northAmerica,
    description: 'Famous theme park and resort located in California.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Anaheim',
      city: 'California',
      country: 'USA',
      latitude: 33.8121,
      longitude: -117.9190,
    ),
  ),
  Activity(
    name: 'Yellowstone National Park',
    continentType: ContinentType.northAmerica,
    description:
        'First national park in the world, known for its geothermal features and wildlife.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Wyoming, Montana & Idaho',
      city: '',
      country: 'USA',
      latitude: 44.4280,
      longitude: -110.5885,
    ),
  ),
  Activity(
    name: 'Hollywood Walk of Fame',
    continentType: ContinentType.northAmerica,
    description:
        'Sidewalk along Hollywood Boulevard with embedded stars honoring celebrities.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Hollywood Boulevard',
      city: 'Los Angeles',
      country: 'USA',
      latitude: 34.1014,
      longitude: -118.3410,
    ),
  ),
  Activity(
    name: 'Mount Rushmore National Memorial',
    continentType: ContinentType.northAmerica,
    description:
        'Iconic sculpture featuring the faces of four US presidents carved into the mountainside.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'South Dakota',
      city: '',
      country: 'USA',
      latitude: 43.8791,
      longitude: -103.4591,
    ),
  ),

// South America
  Activity(
    name: 'Machu Picchu',
    continentType: ContinentType.southAmerica,
    description: 'An ancient Inca citadel set high in the Andes mountains.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Cusco Region',
      city: '',
      country: 'Peru',
      latitude: -13.1631,
      longitude: -72.5450,
    ),
  ),
  Activity(
    name: 'Christ the Redeemer',
    continentType: ContinentType.southAmerica,
    description:
        'A colossal statue of Jesus Christ overlooking Rio de Janeiro.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Corcovado Mountain',
      city: 'Rio de Janeiro',
      country: 'Brazil',
      latitude: -22.9519,
      longitude: -43.2105,
    ),
  ),
  Activity(
    name: 'Iguazu Falls',
    continentType: ContinentType.southAmerica,
    description:
        'Spectacular waterfalls on the border between Argentina, Brazil, and Paraguay.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: '',
      city: '',
      country: 'Argentina, Brazil & Paraguay',
      latitude: -25.6953,
      longitude: -54.4367,
    ),
  ),
  Activity(
    name: 'Amazon Rainforest',
    continentType: ContinentType.southAmerica,
    description:
        'The world\'s largest tropical rainforest, home to diverse wildlife and ecosystems.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Various locations across South America',
      city: '',
      country: 'Various countries in South America',
      latitude: -3.4653,
      longitude: -62.2159,
    ),
  ),
  Activity(
    name: 'Salar de Uyuni',
    continentType: ContinentType.southAmerica,
    description:
        'The world\'s largest salt flat, creating a mesmerizing reflective surface.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Potosí & Oruro Departments',
      city: '',
      country: 'Bolivia',
      latitude: -20.1336,
      longitude: -67.4891,
    ),
  ),
  Activity(
    name: 'Galápagos Islands',
    continentType: ContinentType.southAmerica,
    description:
        'Archipelago of volcanic islands famous for their unique wildlife and role in Darwin\'s theory of evolution.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Pacific Ocean',
      city: 'Ecuador',
      country: 'Ecuador',
      latitude: -0.6132,
      longitude: -90.7295,
    ),
  ),
  Activity(
    name: 'Torres del Paine National Park',
    continentType: ContinentType.southAmerica,
    description:
        'Breathtaking national park known for its granite peaks, glaciers, and lakes.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Magallanes Region',
      city: 'Chile',
      country: 'Chile',
      latitude: -51.2594,
      longitude: -72.3452,
    ),
  ),
  Activity(
    name: 'Angel Falls',
    continentType: ContinentType.southAmerica,
    description:
        'The world\'s highest uninterrupted waterfall, cascading from Auyán-tepui in the Guiana Highlands.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Canaima National Park',
      city: '',
      country: 'Venezuela',
      latitude: 5.9675,
      longitude: -62.5357,
    ),
  ),
  Activity(
    name: 'Atacama Desert',
    continentType: ContinentType.southAmerica,
    description:
        'A surreal desert landscape with salt flats, geysers, and lunar-like terrain.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Various locations in Chile',
      city: '',
      country: 'Chile',
      latitude: -23.5880,
      longitude: -68.4152,
    ),
  ),
  Activity(
    name: 'Patagonia',
    continentType: ContinentType.southAmerica,
    description:
        'A sparsely populated region at the southern end of South America known for its stunning landscapes, including mountains, glaciers, and fjords.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Argentina & Chile',
      city: '',
      country: 'Argentina & Chile',
      latitude: -45.7733,
      longitude: -69.3295,
    ),
  ),

  // Africa
  Activity(
    name: 'Great Pyramids of Giza',
    continentType: ContinentType.africa,
    description: 'One of the Seven Wonders of the Ancient World.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Giza Necropolis',
      city: '',
      country: 'Egypt',
      latitude: 29.9792,
      longitude: 31.1342,
    ),
  ),
  Activity(
    name: 'Kruger National Park',
    continentType: ContinentType.africa,
    description: 'A large safari park known for its diverse wildlife.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Limpopo & Mpumalanga Provinces',
      city: '',
      country: 'South Africa',
      latitude: -23.9884,
      longitude: 31.5547,
    ),
  ),
  Activity(
    name: 'Victoria Falls',
    continentType: ContinentType.africa,
    description: 'One of the largest and most famous waterfalls in the world.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Zambia & Zimbabwe',
      city: '',
      country: 'Zambia & Zimbabwe',
      latitude: -17.9244,
      longitude: 25.8572,
    ),
  ),
  Activity(
    name: 'Serengeti National Park',
    continentType: ContinentType.africa,
    description:
        'Renowned for its annual migration of wildebeest and other animals.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Tanzania',
      city: '',
      country: 'Tanzania',
      latitude: -2.1540,
      longitude: 34.6857,
    ),
  ),
  Activity(
    name: 'Mount Kilimanjaro',
    continentType: ContinentType.africa,
    description: 'Africa\'s highest peak, a popular destination for climbers.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Kilimanjaro Region',
      city: '',
      country: 'Tanzania',
      latitude: -3.0674,
      longitude: 37.3556,
    ),
  ),
  Activity(
    name: 'Maasai Mara National Reserve',
    continentType: ContinentType.africa,
    description:
        'Famous for its population of lions, cheetahs, and annual wildebeest migration.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Narok County',
      city: '',
      country: 'Kenya',
      latitude: -1.5211,
      longitude: 35.3489,
    ),
  ),
  Activity(
    name: 'Pyramids of Meroe',
    continentType: ContinentType.africa,
    description:
        'Ancient Nubian pyramids located near the banks of the Nile River.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Nile River',
      city: '',
      country: 'Sudan',
      latitude: 16.9404,
      longitude: 33.7298,
    ),
  ),
  Activity(
    name: 'Table Mountain',
    continentType: ContinentType.africa,
    description:
        'Iconic flat-topped mountain offering stunning views of Cape Town.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Cape Town',
      city: '',
      country: 'South Africa',
      latitude: -33.9625,
      longitude: 18.4096,
    ),
  ),
  Activity(
    name: 'Okavango Delta',
    continentType: ContinentType.africa,
    description:
        'A unique inland delta in the middle of the Kalahari Desert, known for its rich wildlife.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Botswana',
      city: '',
      country: 'Botswana',
      latitude: -19.3000,
      longitude: 22.8167,
    ),
  ),
  Activity(
    name: 'Mount Kenya',
    continentType: ContinentType.africa,
    description:
        'Second-highest mountain in Africa, known for its glaciers and diverse ecosystems.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Eastern Province',
      city: '',
      country: 'Kenya',
      latitude: -0.1529,
      longitude: 37.3157,
    ),
  ),

  // Europe
  Activity(
    name: 'Colosseum',
    continentType: ContinentType.europe,
    description:
        'An ancient Roman amphitheater, once a site for gladiatorial contests.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
        street: 'Piazza del Colosseo',
        city: 'Rome',
        country: 'Italy',
        latitude: 0,
        longitude: 0),
  ),
  Activity(
    name: 'Eiffel Tower',
    continentType: ContinentType.europe,
    description: 'A wrought-iron lattice tower on the Champ de Mars in Paris.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
        street: 'Champ de Mars',
        city: 'Paris',
        country: 'France',
        latitude: 0,
        longitude: 0),
  ),
  Activity(
    name: 'Sagrada Familia',
    continentType: ContinentType.europe,
    description: 'A large unfinished Roman Catholic church in Barcelona.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
        street: 'Carrer de Mallorca, 401',
        city: 'Barcelona',
        country: 'Spain',
        latitude: 0,
        longitude: 0),
  ),
  Activity(
    name: 'Colosseum',
    continentType: ContinentType.europe,
    description:
        'An ancient Roman amphitheater, once a site for gladiatorial contests.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Piazza del Colosseo',
      city: 'Rome',
      country: 'Italy',
      latitude: 41.8902,
      longitude: 12.4922,
    ),
  ),
  Activity(
    name: 'Eiffel Tower',
    continentType: ContinentType.europe,
    description: 'A wrought-iron lattice tower on the Champ de Mars in Paris.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Champ de Mars',
      city: 'Paris',
      country: 'France',
      latitude: 48.8584,
      longitude: 2.2945,
    ),
  ),
  Activity(
    name: 'Sagrada Familia',
    continentType: ContinentType.europe,
    description: 'A large unfinished Roman Catholic church in Barcelona.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Carrer de Mallorca, 401',
      city: 'Barcelona',
      country: 'Spain',
      latitude: 41.4036,
      longitude: 2.1744,
    ),
  ),
  Activity(
    name: 'Acropolis of Athens',
    continentType: ContinentType.europe,
    description:
        'An ancient citadel located on a rocky outcrop above the city of Athens.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Athens',
      city: 'Athens',
      country: 'Greece',
      latitude: 37.9715,
      longitude: 23.7263,
    ),
  ),
  Activity(
    name: 'Brandenburg Gate',
    continentType: ContinentType.europe,
    description: 'An 18th-century neoclassical monument in Berlin.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Pariser Platz',
      city: 'Berlin',
      country: 'Germany',
      latitude: 52.5163,
      longitude: 13.3777,
    ),
  ),
  Activity(
    name: 'Tower Bridge',
    continentType: ContinentType.europe,
    description: 'A combined bascule and suspension bridge in London.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Tower Bridge Rd',
      city: 'London',
      country: 'United Kingdom',
      latitude: 51.5055,
      longitude: -0.0754,
    ),
  ),
  Activity(
    name: 'The Louvre',
    continentType: ContinentType.europe,
    description:
        'The world\'s largest art museum and a historic monument in Paris.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Rue de Rivoli',
      city: 'Paris',
      country: 'France',
      latitude: 48.8606,
      longitude: 2.3376,
    ),
  ),
  Activity(
    name: 'Neuschwanstein Castle',
    continentType: ContinentType.europe,
    description:
        'A 19th-century Romanesque Revival palace on a rugged hill above the village of Hohenschwangau near Füssen in southwest Bavaria.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Neuschwansteinstraße 20',
      city: 'Schwangau',
      country: 'Germany',
      latitude: 47.5576,
      longitude: 10.7498,
    ),
  ),
  Activity(
    name: 'Dubrovnik Old Town',
    continentType: ContinentType.europe,
    description: 'A well-preserved medieval walled city in Croatia.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Old Town',
      city: 'Dubrovnik',
      country: 'Croatia',
      latitude: 42.6407,
      longitude: 18.1100,
    ),
  ),
  Activity(
    name: 'Amsterdam Canals',
    continentType: ContinentType.europe,
    description:
        'A UNESCO World Heritage site consisting of a network of canals in Amsterdam.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Amsterdam',
      city: 'Amsterdam',
      country: 'Netherlands',
      latitude: 52.3676,
      longitude: 4.9041,
    ),
  ),

// Asia
  Activity(
    name: 'Great Wall of China',
    continentType: ContinentType.asia,
    description:
        'An ancient series of fortifications made of stone, brick, wood, and earth.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Various locations across China',
      city: 'China',
      country: 'China',
      latitude: 40.4319,
      longitude: 116.5704,
    ),
  ),
  Activity(
    name: 'Taj Mahal',
    continentType: ContinentType.asia,
    description:
        'An ivory-white marble mausoleum on the south bank of the Yamuna river.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Agra, Uttar Pradesh',
      city: 'Agra',
      country: 'India',
      latitude: 27.1751,
      longitude: 78.0421,
    ),
  ),
  Activity(
    name: 'Mount Everest',
    continentType: ContinentType.asia,
    description: 'The world\'s highest mountain, located in the Himalayas.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Himalayas',
      city: 'Nepal',
      country: 'Nepal',
      latitude: 27.9881,
      longitude: 86.9250,
    ),
  ),
  Activity(
    name: 'Petra',
    continentType: ContinentType.asia,
    description:
        'A historical and archaeological city famous for its rock-cut architecture.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Petra, Wadi Musa',
      city: 'Petra',
      country: 'Jordan',
      latitude: 30.3285,
      longitude: 35.4444,
    ),
  ),
  Activity(
    name: 'Angkor Wat',
    continentType: ContinentType.asia,
    description:
        'A temple complex and the largest religious monument in the world.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Krong Siem Reap',
      city: 'Siem Reap',
      country: 'Cambodia',
      latitude: 13.4125,
      longitude: 103.8660,
    ),
  ),
  Activity(
    name: 'The Forbidden City',
    continentType: ContinentType.asia,
    description: 'A palace complex in central Beijing, China.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: '4 Jingshan Front St, Dongcheng, Beijing',
      city: 'Beijing',
      country: 'China',
      latitude: 39.9163,
      longitude: 116.3972,
    ),
  ),
  Activity(
    name: 'The Maldives',
    continentType: ContinentType.asia,
    description:
        'A tropical paradise known for its beaches, blue lagoons, and extensive reefs.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'South Asia',
      city: 'Maldives',
      country: 'Maldives',
      latitude: 3.2028,
      longitude: 73.2207,
    ),
  ),
  Activity(
    name: 'Giant Panda Breeding Research Base',
    continentType: ContinentType.asia,
    description:
        'A facility dedicated to the conservation of the giant panda in Chengdu, China.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: '1375 Xiongmao Ave',
      city: 'Chengdu',
      country: 'China',
      latitude: 30.7398,
      longitude: 104.0395,
    ),
  ),
  Activity(
    name: 'Borobudur',
    continentType: ContinentType.asia,
    description:
        'A 9th-century Mahayana Buddhist temple in Magelang, Central Java, Indonesia.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Jl. Badrawati, Kw. Candi Borobudur',
      city: 'Magelang',
      country: 'Indonesia',
      latitude: -7.6079,
      longitude: 110.2036,
    ),
  ),
  Activity(
    name: 'Tokyo Skytree',
    continentType: ContinentType.asia,
    description:
        'A broadcasting and observation tower in Sumida, Tokyo, Japan.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: '1 Chome-1-2 Oshiage',
      city: 'Tokyo',
      country: 'Japan',
      latitude: 35.7101,
      longitude: 139.8107,
    ),
  ),
// Australia
  Activity(
    name: 'Great Barrier Reef',
    continentType: ContinentType.australia,
    description:
        'The world\'s largest coral reef system, located off the coast of Queensland.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Queensland',
      city: 'Queensland',
      country: 'Australia',
      latitude: -18.2871,
      longitude: 147.6992,
    ),
  ),
  Activity(
    name: 'Uluru',
    continentType: ContinentType.australia,
    description:
        'A large sandstone rock formation in the Northern Territory of Australia.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Uluru-Kata Tjuta National Park, Petermann NT 0872',
      city: 'Petermann',
      country: 'Australia',
      latitude: -25.3444,
      longitude: 131.0369,
    ),
  ),
  Activity(
    name: 'Sydney Harbour Bridge',
    continentType: ContinentType.australia,
    description: 'A steel through arch bridge across Sydney Harbour.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Sydney, New South Wales',
      city: 'Sydney',
      country: 'Australia',
      latitude: -33.8523,
      longitude: 151.2108,
    ),
  ),
  Activity(
    name: 'Bondi Beach',
    continentType: ContinentType.australia,
    description:
        'A popular beach and the name of the surrounding suburb in Sydney, New South Wales.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Bondi Beach, New South Wales',
      city: 'Sydney',
      country: 'Australia',
      latitude: -33.8918,
      longitude: 151.2767,
    ),
  ),
  Activity(
    name: 'Kakadu National Park',
    continentType: ContinentType.australia,
    description:
        'A protected area in the Northern Territory of Australia, known for its cultural and natural significance.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Jabiru NT 0886',
      city: 'Jabiru',
      country: 'Australia',
      latitude: -12.6828,
      longitude: 132.9159,
    ),
  ),
  Activity(
    name: 'Daintree Rainforest',
    continentType: ContinentType.australia,
    description:
        'A tropical rainforest region on the north east coast of Queensland.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Daintree QLD 4873',
      city: 'Daintree',
      country: 'Australia',
      latitude: -16.2500,
      longitude: 145.3333,
    ),
  ),
  Activity(
    name: 'Whitsunday Islands',
    continentType: ContinentType.australia,
    description:
        'A collection of continental islands off the coast of Queensland, Australia.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Queensland',
      city: 'Queensland',
      country: 'Australia',
      latitude: -20.3510,
      longitude: 148.9575,
    ),
  ),
  Activity(
    name: 'Blue Mountains National Park',
    continentType: ContinentType.australia,
    description:
        'A rugged region west of Sydney in New South Wales, known for its dramatic scenery.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'New South Wales',
      city: 'New South Wales',
      country: 'Australia',
      latitude: -33.6500,
      longitude: 150.3333,
    ),
  ),
  Activity(
    name: 'Melbourne Cricket Ground (MCG)',
    continentType: ContinentType.australia,
    description:
        'One of the largest stadiums in the world, located in Melbourne, Victoria.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
      street: 'Brunton Ave, Richmond VIC 3002',
      city: 'Melbourne',
      country: 'Australia',
      latitude: -37.8199,
      longitude: 144.9830,
    ),
  ),
];
