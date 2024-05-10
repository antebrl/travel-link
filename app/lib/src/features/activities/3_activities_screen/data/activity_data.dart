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
        latitude: 0,
        longitude: 0),
  ),
  Activity(
    name: 'Grand Canyon',
    continentType: ContinentType.northAmerica,
    description:
        'Massive canyon carved by the Colorado River in the state of Arizona.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
        street: 'Arizona', city: '', country: 'USA', latitude: 0, longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
  ),
  Activity(
    name: 'Iguazu Falls',
    continentType: ContinentType.southAmerica,
    description:
        'Spectacular waterfalls on the border between Argentina, Brazil, and Paraguay.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
        street: 'Argentina / Brazil / Paraguay',
        city: '',
        country: 'Argentina, Brazil & Paraguay',
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
    name: 'Acropolis of Athens',
    continentType: ContinentType.europe,
    description:
        'An ancient citadel located on a rocky outcrop above the city of Athens.',
    imageAssetPath: 'assets/images/activities/camp-nou.jpg',
    location: PlaceLocation(
        street: 'Athens',
        city: 'Athens',
        country: 'Greece',
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
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
        latitude: 0,
        longitude: 0),
  ),
];
