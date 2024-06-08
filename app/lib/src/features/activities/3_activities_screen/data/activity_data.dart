import 'package:travel_link/src/features/activities/2_continents_screen/domain/continent.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';

List<ApiActivity> activityData = [
  ApiActivity(
    imagePaths: [''],
    name: 'Times Square',
    categories: {'activity'}.toList(),
    continentType: ContinentType.northAmerica,
    description:
        'A vibrant intersection and tourist destination in New York City',
    location: const PlaceLocation(
      lat: 40.758896,
      lon: -73.985130,
      city: 'New York City',
      country: 'USA',
      formatted: 'Broadway, New York City, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Statue of Liberty',
    categories: {'tourism', 'education'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'Iconic symbol of freedom and democracy in New York Harbor',
    location: const PlaceLocation(
      lat: 40.689247,
      lon: -74.044502,
      city: 'New York City',
      country: 'USA',
      formatted: 'Liberty Island, New York City, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Grand Canyon',
    categories: {'natural', 'tourism'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'A breathtaking natural wonder in Arizona',
    location: const PlaceLocation(
      lat: 36.106965,
      lon: -112.112997,
      city: 'Arizona',
      country: 'USA',
      formatted: 'Grand Canyon National Park, Arizona, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Yellowstone National Park',
    categories: {'natural', 'leisure'}.toList(),
    continentType: ContinentType.northAmerica,
    description:
        'The first national park in the world, known for its wildlife and geothermal features',
    location: const PlaceLocation(
      lat: 44.4280,
      lon: -110.5885,
      city: 'Wyoming',
      country: 'USA',
      formatted: 'Yellowstone National Park, Wyoming, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Walt Disney World',
    categories: {'entertainment', 'tourism'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'The most visited vacation resort in the world',
    location: const PlaceLocation(
      lat: 28.385233,
      lon: -81.563874,
      city: 'Orlando',
      country: 'USA',
      formatted: 'Walt Disney World Resort, Orlando, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Niagara Falls',
    categories: {'natural', 'tourism'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'Famous waterfalls on the border between the USA and Canada',
    location: const PlaceLocation(
      lat: 43.096214,
      lon: -79.037739,
      city: 'Niagara Falls',
      country: 'USA/Canada',
      formatted: 'Niagara Falls, USA/Canada',
      countryCode: 'US/CA',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Golden Gate Bridge',
    categories: {'tourism', 'activity'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'Iconic suspension bridge in San Francisco',
    location: const PlaceLocation(
      lat: 37.819929,
      lon: -122.478255,
      city: 'San Francisco',
      country: 'USA',
      formatted: 'Golden Gate Bridge, San Francisco, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Yosemite National Park',
    categories: {'natural', 'leisure'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'Renowned for its stunning granite cliffs and waterfalls',
    location: const PlaceLocation(
      lat: 37.865101,
      lon: -119.538329,
      city: 'California',
      country: 'USA',
      formatted: 'Yosemite National Park, California, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Mount Rushmore',
    categories: {'tourism', 'education'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'Famous monument featuring the faces of four US presidents',
    location: const PlaceLocation(
      lat: 43.879102,
      lon: -103.459067,
      city: 'South Dakota',
      country: 'USA',
      formatted: 'Mount Rushmore, South Dakota, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Central Park',
    categories: {'leisure', 'natural'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'Urban park in the heart of New York City',
    location: const PlaceLocation(
      lat: 40.785091,
      lon: -73.968285,
      city: 'New York City',
      country: 'USA',
      formatted: 'Central Park, New York City, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Las Vegas Strip',
    categories: {'entertainment', 'tourism'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'Famous for its casinos, nightlife, and entertainment shows',
    location: const PlaceLocation(
      lat: 36.114647,
      lon: -115.172813,
      city: 'Las Vegas',
      country: 'USA',
      formatted: 'Las Vegas Strip, Las Vegas, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Hollywood Walk of Fame',
    categories: {'tourism', 'entertainment'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'Sidewalk stars honoring famous celebrities',
    location: const PlaceLocation(
      lat: 34.101558,
      lon: -118.326843,
      city: 'Los Angeles',
      country: 'USA',
      formatted: 'Hollywood Walk of Fame, Los Angeles, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'White House',
    categories: {'tourism', 'education'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'The official residence and workplace of the US president',
    location: const PlaceLocation(
      lat: 38.897957,
      lon: -77.036560,
      city: 'Washington D.C.',
      country: 'USA',
      formatted: 'White House, Washington D.C., USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Walt Disney Concert Hall',
    categories: {'entertainment', 'tourism'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'Famous concert hall with remarkable architecture',
    location: const PlaceLocation(
      lat: 34.055345,
      lon: -118.249845,
      city: 'Los Angeles',
      country: 'USA',
      formatted: 'Walt Disney Concert Hall, Los Angeles, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Rocky Mountains',
    categories: {'natural', 'leisure'}.toList(),
    continentType: ContinentType.northAmerica,
    description:
        'A major mountain range offering stunning vistas and outdoor activities',
    location: const PlaceLocation(
      lat: 39.739236,
      lon: -104.990251,
      city: 'Colorado',
      country: 'USA',
      formatted: 'Rocky Mountains, Colorado, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'National Museum of Natural History',
    categories: {'education', 'tourism'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'World-renowned museum housing millions of specimens',
    location: const PlaceLocation(
      lat: 38.891366,
      lon: -77.026785,
      city: 'Washington D.C.',
      country: 'USA',
      formatted:
          'Smithsonian National Museum of Natural History, Washington D.C., USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Empire State Building',
    categories: {'tourism', 'activity'}.toList(),
    continentType: ContinentType.northAmerica,
    description:
        'Iconic skyscraper with observatories offering panoramic views',
    location: const PlaceLocation(
      lat: 40.748817,
      lon: -73.985428,
      city: 'New York City',
      country: 'USA',
      formatted: 'Empire State Building, New York City, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Alcatraz Island',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'Infamous former prison located in San Francisco Bay',
    location: const PlaceLocation(
      lat: 37.826977,
      lon: -122.422955,
      city: 'San Francisco',
      country: 'USA',
      formatted: 'Alcatraz Island, San Francisco, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Kennedy Space Center',
    categories: {'tourism', 'education'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'NASA\'s primary launch center for human spaceflight',
    location: const PlaceLocation(
      lat: 28.573255,
      lon: -80.648018,
      city: 'Merritt Island',
      country: 'USA',
      formatted: 'Kennedy Space Center, Merritt Island, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Great Smoky Mountains National Park',
    categories: {'natural', 'leisure'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'Most visited national park in the United States',
    location: const PlaceLocation(
      lat: 35.6532,
      lon: -83.5070,
      city: 'North Carolina/Tennessee',
      country: 'USA',
      formatted: 'Great Smoky Mountains National Park, NC/TN, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Mount Rainier National Park',
    categories: {'natural', 'leisure'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'Iconic peak in the Cascade Range with diverse ecosystems',
    location: const PlaceLocation(
      lat: 46.8523,
      lon: -121.7603,
      city: 'Washington',
      country: 'USA',
      formatted: 'Mount Rainier National Park, Washington, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Universal Studios Hollywood',
    categories: {'entertainment', 'tourism'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'Film studio and theme park in Los Angeles',
    location: const PlaceLocation(
      lat: 34.1381,
      lon: -118.3534,
      city: 'Los Angeles',
      country: 'USA',
      formatted: 'Universal Studios Hollywood, Los Angeles, USA',
      countryCode: 'US',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Mount St. Helens',
    categories: {'natural', 'tourism'}.toList(),
    continentType: ContinentType.northAmerica,
    description: 'Active stratovolcano in the Cascade Range',
    location: const PlaceLocation(
      lat: 46.1915,
      lon: -122.1944,
      city: 'Washington',
      country: 'USA',
      formatted: 'Mount Saint Helens, Washington, USA',
      countryCode: 'US',
    ),
  ),

/////
  ApiActivity(
    imagePaths: [''],
    name: 'Machu Picchu',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.southAmerica,
    description: 'Inca citadel situated in the Andes Mountains of Peru',
    location: const PlaceLocation(
      lat: -13.1631,
      lon: -72.5450,
      city: 'Aguas Calientes',
      country: 'Peru',
      formatted: 'Machu Picchu, Aguas Calientes, Peru',
      countryCode: 'PE',
    ),
  ),

  ApiActivity(
    imagePaths: [''],
    name: 'Iguazu Falls',
    categories: {'natural', 'tourism'}.toList(),
    continentType: ContinentType.southAmerica,
    description: 'Waterfalls on the border between Brazil and Argentina',
    location: const PlaceLocation(
      lat: -25.6953,
      lon: -54.4367,
      city: 'Puerto Iguazu',
      country: 'Argentina/Brazil',
      formatted: 'Iguazu Falls, Puerto Iguazu, Argentina/Brazil',
      countryCode: 'AR/BR',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Amazon rainforest',
    categories: {'natural', 'tourism'}.toList(),
    continentType: ContinentType.southAmerica,
    description: 'Largest tropical rainforest in the world',
    location: const PlaceLocation(
      lat: -3.4653,
      lon: -62.2159,
      city: '',
      country: 'Multiple countries',
      formatted: 'Amazon Rainforest',
      countryCode: 'Multiple',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Galápagos Islands',
    categories: {'natural', 'tourism'}.toList(),
    continentType: ContinentType.southAmerica,
    description: 'Archipelago renowned for its unique wildlife',
    location: const PlaceLocation(
      lat: -0.8329,
      lon: -91.1374,
      city: '',
      country: 'Ecuador',
      formatted: 'Galapagos Islands, Ecuador',
      countryCode: 'EC',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Atacama Desert',
    categories: {'natural', 'tourism'}.toList(),
    continentType: ContinentType.southAmerica,
    description: 'Driest non-polar desert in the world',
    location: const PlaceLocation(
      lat: -23.9080,
      lon: -68.8751,
      city: '',
      country: 'Chile',
      formatted: 'Atacama Desert, Chile',
      countryCode: 'CL',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Easter Island',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.southAmerica,
    description: 'Remote island known for its massive stone statues',
    location: const PlaceLocation(
      lat: -27.1127,
      lon: -109.3497,
      city: '',
      country: 'Chile',
      formatted: 'Easter Island, Chile',
      countryCode: 'CL',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Salar de Uyuni',
    categories: {'natural', 'tourism'}.toList(),
    continentType: ContinentType.southAmerica,
    description: 'World\'s largest salt flat located in Bolivia',
    location: const PlaceLocation(
      lat: -20.1335,
      lon: -67.4891,
      city: '',
      country: 'Bolivia',
      formatted: 'Salar de Uyuni, Bolivia',
      countryCode: 'BO',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Angel Falls',
    categories: {'natural', 'tourism'}.toList(),
    continentType: ContinentType.southAmerica,
    description: 'World\'s highest uninterrupted waterfall in Venezuela',
    location: const PlaceLocation(
      lat: 5.9678,
      lon: -62.5356,
      city: 'Canaima',
      country: 'Venezuela',
      formatted: 'Angel Falls, Canaima, Venezuela',
      countryCode: 'VE',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Pantanal',
    categories: {'natural', 'tourism'}.toList(),
    continentType: ContinentType.southAmerica,
    description: 'World\'s largest tropical wetland area in Brazil',
    location: const PlaceLocation(
      lat: -17.8573,
      lon: -56.7131,
      city: '',
      country: 'Brazil',
      formatted: 'Pantanal, Brazil',
      countryCode: 'BR',
    ),
  ),

  ApiActivity(
    imagePaths: [''],
    name: 'Lake Titicaca',
    categories: {'natural', 'tourism'}.toList(),
    continentType: ContinentType.southAmerica,
    description: 'Highest navigable lake in the world, located in Peru/Bolivia',
    location: const PlaceLocation(
      lat: -15.9254,
      lon: -69.3352,
      city: '',
      country: 'Peru/Bolivia',
      formatted: 'Lake Titicaca, Peru/Bolivia',
      countryCode: 'PE/BO',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Torres del Paine National Park',
    categories: {'natural', 'tourism'}.toList(),
    continentType: ContinentType.southAmerica,
    description: 'National park known for its granite peaks and glaciers',
    location: const PlaceLocation(
      lat: -51.2594,
      lon: -72.3452,
      city: 'Magallanes Region',
      country: 'Chile',
      formatted: 'Torres del Paine National Park, Chile',
      countryCode: 'CL',
    ),
  ),

  ApiActivity(
    imagePaths: [''],
    name: 'Perito Moreno Glacier',
    categories: {'natural', 'tourism'}.toList(),
    continentType: ContinentType.southAmerica,
    description:
        'Glacier located in the Los Glaciares National Park in Argentina',
    location: const PlaceLocation(
      lat: -50.4966,
      lon: -73.1370,
      city: 'El Calafate',
      country: 'Argentina',
      formatted: 'Perito Moreno Glacier, El Calafate, Argentina',
      countryCode: 'AR',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Colca Canyon',
    categories: {'natural', 'tourism'}.toList(),
    continentType: ContinentType.southAmerica,
    description: 'Canyon located in southern Peru, known for its condors',
    location: const PlaceLocation(
      lat: -15.6254,
      lon: -71.9163,
      city: 'Chivay',
      country: 'Peru',
      formatted: 'Colca Canyon, Chivay, Peru',
      countryCode: 'PE',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Dalí Theatre and Museum',
    categories: {'art', 'tourism'}.toList(),
    continentType: ContinentType.southAmerica,
    description: 'Museum featuring the works of Salvador Dalí in Spain',
    location: const PlaceLocation(
      lat: 42.2654,
      lon: 2.9599,
      city: 'Figueres',
      country: 'Spain',
      formatted: 'Salvador Dalí Theatre-Museum, Figueres, Spain',
      countryCode: 'ES',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Valparaíso',
    categories: {'art', 'tourism'}.toList(),
    continentType: ContinentType.southAmerica,
    description: 'Colorful port city in Chile known for its street art',
    location: const PlaceLocation(
      lat: -33.0456,
      lon: -71.6206,
      city: 'Valparaiso',
      country: 'Chile',
      formatted: 'Valparaiso, Chile',
      countryCode: 'CL',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Cusco',
    categories: {'history', 'tourism'}.toList(),
    continentType: ContinentType.southAmerica,
    description: 'Historic city in Peru, once the capital of the Inca Empire',
    location: const PlaceLocation(
      lat: -13.5319,
      lon: -71.9675,
      city: 'Cusco',
      country: 'Peru',
      formatted: 'Cusco, Peru',
      countryCode: 'PE',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Ushuaia',
    categories: {'tourism', 'leisure'}.toList(),
    continentType: ContinentType.southAmerica,
    description: 'Southernmost city in the world, located in Argentina',
    location: const PlaceLocation(
      lat: -54.8019,
      lon: -68.3029,
      city: 'Ushuaia',
      country: 'Argentina',
      formatted: 'Ushuaia, Argentina',
      countryCode: 'AR',
    ),
  ),

  ///////
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
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Colosseum',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.europe,
    description: 'Ancient amphitheater and iconic symbol of Rome, Italy',
    location: const PlaceLocation(
      lat: 41.8902,
      lon: 12.4922,
      city: 'Rome',
      country: 'Italy',
      formatted: 'Colosseum, Rome, Italy',
      countryCode: 'IT',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Acropolis of Athens',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.europe,
    description:
        'Ancient citadel located on a rocky outcrop above Athens, Greece',
    location: const PlaceLocation(
      lat: 37.9715,
      lon: 23.7269,
      city: 'Athens',
      country: 'Greece',
      formatted: 'Acropolis of Athens, Athens, Greece',
      countryCode: 'GR',
    ),
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
      formatted: 'Sagrada Familia, Barcelona, Spain',
      countryCode: 'ES',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Louvre',
    categories: {'tourism', 'art'}.toList(),
    continentType: ContinentType.europe,
    description:
        'World\'s largest art museum and historic monument in Paris, France',
    location: const PlaceLocation(
      lat: 48.8606,
      lon: 2.3376,
      city: 'Paris',
      country: 'France',
      formatted: 'Louvre Museum, Paris, France',
      countryCode: 'FR',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Neuschwanstein Castle',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.europe,
    description: 'Fairytale castle perched on a hill in Bavaria, Germany',
    location: const PlaceLocation(
      lat: 47.5576,
      lon: 10.7498,
      city: 'Schwangau',
      country: 'Germany',
      formatted: 'Neuschwanstein Castle, Schwangau, Germany',
      countryCode: 'DE',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Alhambra',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.europe,
    description: 'Historic palace and fortress complex in Granada, Spain',
    location: const PlaceLocation(
      lat: 37.1773,
      lon: -3.5986,
      city: 'Granada',
      country: 'Spain',
      formatted: 'The Alhambra, Granada, Spain',
      countryCode: 'ES',
    ),
  ),

  ApiActivity(
    imagePaths: [''],
    name: 'Tower Bridge',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.europe,
    description: 'Iconic bascule and suspension bridge in London, England',
    location: const PlaceLocation(
      lat: 51.5055,
      lon: -0.0754,
      city: 'London',
      country: 'England',
      formatted: 'Tower Bridge, London, England',
      countryCode: 'GB',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Prague Castle',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.europe,
    description: 'Historic castle complex in Prague, Czech Republic',
    location: const PlaceLocation(
      lat: 50.0901,
      lon: 14.4005,
      city: 'Prague',
      country: 'Czech Republic',
      formatted: 'Prague Castle, Prague, Czech Republic',
      countryCode: 'CZ',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Vatican City',
    categories: {'tourism', 'religion'}.toList(),
    continentType: ContinentType.europe,
    description:
        'Smallest independent state and center of the Roman Catholic Church',
    location: const PlaceLocation(
      lat: 41.9029,
      lon: 12.4534,
      city: 'Vatican City',
      country: 'Vatican City',
      formatted: 'Vatican City',
      countryCode: 'VA',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Dubrovnik',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.europe,
    description: 'Medieval walled city on the Adriatic Sea coast of Croatia',
    location: const PlaceLocation(
      lat: 42.6507,
      lon: 18.0944,
      city: 'Dubrovnik',
      country: 'Croatia',
      formatted: 'Dubrovnik Old Town, Dubrovnik, Croatia',
      countryCode: 'HR',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Anne Frank House',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.europe,
    description:
        'Museum dedicated to Jewish wartime diarist Anne Frank in Amsterdam, Netherlands',
    location: const PlaceLocation(
      lat: 52.3752,
      lon: 4.8837,
      city: 'Amsterdam',
      country: 'Netherlands',
      formatted: 'Anne Frank House, Amsterdam, Netherlands',
      countryCode: 'NL',
    ),
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
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Colosseum',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.europe,
    description: 'Ancient amphitheater and iconic symbol of Rome, Italy',
    location: const PlaceLocation(
      lat: 41.8902,
      lon: 12.4922,
      city: 'Rome',
      country: 'Italy',
      formatted: 'Colosseum, Rome, Italy',
      countryCode: 'IT',
    ),
  ),
  ApiActivity(
    imagePaths: [''],
    name: 'Acropolis of Athens',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.europe,
    description:
        'Ancient citadel located on a rocky outcrop above Athens, Greece',
    location: const PlaceLocation(
      lat: 37.9715,
      lon: 23.7269,
      city: 'Athens',
      country: 'Greece',
      formatted: 'Acropolis of Athens, Athens, Greece',
      countryCode: 'GR',
    ),
  ),

//1
  ApiActivity(
    imagePaths: [''],
    name: 'Great Wall of China',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.asia,
    description:
        'Series of fortification systems along the historical northern borders of China',
    location: const PlaceLocation(
      lat: 40.4319,
      lon: 116.5704,
      city: '',
      country: 'China',
      formatted: 'Great Wall of China',
      countryCode: 'CN',
    ),
  ),
//2
  ApiActivity(
    imagePaths: [''],
    name: 'Taj Mahal',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.asia,
    description: 'Iconic ivory-white marble mausoleum in Agra, India',
    location: const PlaceLocation(
      lat: 27.1751,
      lon: 78.0421,
      city: 'Agra',
      country: 'India',
      formatted: 'Taj Mahal, Agra, India',
      countryCode: 'IN',
    ),
  ),
//3
  ApiActivity(
    imagePaths: [''],
    name: 'Petra',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.asia,
    description: 'Historical and archaeological city in southern Jordan',
    location: const PlaceLocation(
      lat: 30.3285,
      lon: 35.4444,
      city: '',
      country: 'Jordan',
      formatted: 'Petra, Jordan',
      countryCode: 'JO',
    ),
  ),
//4
  ApiActivity(
    imagePaths: [''],
    name: 'Mount Everest',
    categories: {'natural', 'tourism'}.toList(),
    continentType: ContinentType.asia,
    description: 'Highest mountain in the world, located in the Himalayas',
    location: const PlaceLocation(
      lat: 27.9881,
      lon: 86.9250,
      city: '',
      country: 'Nepal/China',
      formatted: 'Mount Everest',
      countryCode: 'NP/CN',
    ),
  ),
//5
  ApiActivity(
    imagePaths: [''],
    name: 'Angkor Wat',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.asia,
    description: 'Largest religious monument in the world, located in Cambodia',
    location: const PlaceLocation(
      lat: 13.4125,
      lon: 103.8660,
      city: 'Siem Reap',
      country: 'Cambodia',
      formatted: 'Angkor Wat, Siem Reap, Cambodia',
      countryCode: 'KH',
    ),
  ),
//6
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
  ),
//7
  ApiActivity(
    imagePaths: [''],
    name: 'Borobudur',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.asia,
    description:
        '9th-century Mahayana Buddhist temple in Magelang Regency, Indonesia',
    location: const PlaceLocation(
      lat: -7.6079,
      lon: 110.2038,
      city: 'Magelang',
      country: 'Indonesia',
      formatted: 'Borobudur, Magelang, Indonesia',
      countryCode: 'ID',
    ),
  ),
//8
  ApiActivity(
    imagePaths: [''],
    name: 'Dead Sea',
    categories: {'natural', 'tourism'}.toList(),
    continentType: ContinentType.asia,
    description:
        'Salt lake bordered by Jordan to the east and Israel and the West Bank to the west',
    location: const PlaceLocation(
      lat: 31.4962,
      lon: 35.1264,
      city: '',
      country: 'Israel/Jordan',
      formatted: 'The Dead Sea',
      countryCode: 'IL/JO',
    ),
  ),
//9
  ApiActivity(
    imagePaths: [''],
    name: 'Mount Fuji',
    categories: {'natural', 'tourism'}.toList(),
    continentType: ContinentType.asia,
    description: 'Highest volcano in Japan',
    location: const PlaceLocation(
      lat: 35.3606,
      lon: 138.7274,
      city: '',
      country: 'Japan',
      formatted: 'Mount Fuji',
      countryCode: 'JP',
    ),
  ),
//10
  ApiActivity(
    imagePaths: [''],
    name: 'Golden Temple',
    categories: {'tourism', 'religion'}.toList(),
    continentType: ContinentType.asia,
    description: 'Sikh gurdwara located in Amritsar, Punjab, India',
    location: const PlaceLocation(
      lat: 31.6200,
      lon: 74.8765,
      city: 'Amritsar',
      country: 'India',
      formatted: 'Golden Temple, Amritsar, India',
      countryCode: 'IN',
    ),
  ),
//11
  ApiActivity(
    imagePaths: [''],
    name: 'Jeju Island',
    categories: {'natural', 'tourism'}.toList(),
    continentType: ContinentType.asia,
    description: 'Volcanic island in South Korea, known for its natural beauty',
    location: const PlaceLocation(
      lat: 33.4890,
      lon: 126.4983,
      city: '',
      country: 'South Korea',
      formatted: 'Jeju Island, South Korea',
      countryCode: 'KR',
    ),
  ),
//12
  ApiActivity(
    imagePaths: [''],
    name: 'Shwedagon Pagoda',
    categories: {'tourism', 'religion'}.toList(),
    continentType: ContinentType.asia,
    description: 'Gilded stupa in Yangon, Myanmar',
    location: const PlaceLocation(
      lat: 16.7984,
      lon: 96.1497,
      city: 'Yangon',
      country: 'Myanmar',
      formatted: 'Shwedagon Pagoda, Yangon, Myanmar',
      countryCode: 'MM',
    ),
  ),
//13
  ApiActivity(
    imagePaths: [''],
    name: 'Gardens by the Bay',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.asia,
    description:
        'Nature park in Singapore, featuring the Supertree Grove and conservatories',
    location: const PlaceLocation(
      lat: 1.2815,
      lon: 103.8636,
      city: 'Singapore',
      country: 'Singapore',
      formatted: 'Gardens by the Bay, Singapore',
      countryCode: 'SG',
    ),
  ),
//14
  ApiActivity(
    imagePaths: [''],
    name: 'Potala Palace',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.asia,
    description:
        'Former winter residence of the Dalai Lama in Lhasa, Tibet Autonomous Region, China',
    location: const PlaceLocation(
      lat: 29.6579,
      lon: 91.1168,
      city: 'Lhasa',
      country: 'China',
      formatted: 'Potala Palace, Lhasa, China',
      countryCode: 'CN',
    ),
  ),
//15
  ApiActivity(
    imagePaths: [''],
    name: 'Gyeongbokgung',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.asia,
    description: 'Historic palace in Seoul, South Korea',
    location: const PlaceLocation(
      lat: 37.5779,
      lon: 126.9768,
      city: 'Seoul',
      country: 'South Korea',
      formatted: 'Gyeongbokgung Palace, Seoul, South Korea',
      countryCode: 'KR',
    ),
  ),
//16
  ApiActivity(
    imagePaths: [''],
    name: 'Persepolis',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.asia,
    description: 'Ancient capital of the Achaemenid Empire in Shiraz, Iran',
    location: const PlaceLocation(
      lat: 29.9356,
      lon: 52.8912,
      city: 'Shiraz',
      country: 'Iran',
      formatted: 'Persepolis, Shiraz, Iran',
      countryCode: 'IR',
    ),
  ),
//17
  ApiActivity(
    imagePaths: [''],
    name: 'Banaue Rice Terraces',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.asia,
    description: 'Terraced rice fields in the Philippines',
    location: const PlaceLocation(
      lat: 16.9124,
      lon: 121.0554,
      city: '',
      country: 'Philippines',
      formatted: 'Banaue Rice Terraces, Philippines',
      countryCode: 'PH',
    ),
  ),
//18
  ApiActivity(
    imagePaths: [''],
    name: 'Prambanan',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.asia,
    description: 'Hindu temple compound in Yogyakarta, Indonesia',
    location: const PlaceLocation(
      lat: -7.7520,
      lon: 110.4913,
      city: 'Yogyakarta',
      country: 'Indonesia',
      formatted: 'Prambanan Temple, Yogyakarta, Indonesia',
      countryCode: 'ID',
    ),
  ),
//19
  ApiActivity(
    imagePaths: [''],
    name: 'Mount Sinai',
    categories: {'natural', 'religious'}.toList(),
    continentType: ContinentType.asia,
    description: 'Sacred mountain in the Sinai Peninsula of Egypt',
    location: const PlaceLocation(
      lat: 28.5392,
      lon: 33.9756,
      city: '',
      country: 'Egypt',
      formatted: 'Mount Sinai, Egypt',
      countryCode: 'EG',
    ),
  ),
//20
  ApiActivity(
    imagePaths: [''],
    name: 'Bagan',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.asia,
    description: 'Ancient city located in the Mandalay Region of Myanmar',
    location: const PlaceLocation(
      lat: 21.1717,
      lon: 94.8585,
      city: '',
      country: 'Myanmar',
      formatted: 'Bagan, Myanmar',
      countryCode: 'MM',
    ),
  ),
//21
  ApiActivity(
    imagePaths: [''],
    name: 'Kinkaku-ji',
    categories: {'tourism', 'religion'}.toList(),
    continentType: ContinentType.asia,
    description: 'Zen Buddhist temple in Kyoto, Japan',
    location: const PlaceLocation(
      lat: 35.0394,
      lon: 135.7292,
      city: 'Kyoto',
      country: 'Japan',
      formatted: 'Kinkaku-ji (Golden Pavilion), Kyoto, Japan',
      countryCode: 'JP',
    ),
  ),
//22
  ApiActivity(
    imagePaths: [''],
    name: 'Hạ Long Bay',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.asia,
    description:
        'Scenic bay with thousands of limestone islands in northern Vietnam',
    location: const PlaceLocation(
      lat: 20.9101,
      lon: 107.1839,
      city: '',
      country: 'Vietnam',
      formatted: 'Halong Bay, Vietnam',
      countryCode: 'VN',
    ),
  ),

//24
  ApiActivity(
    imagePaths: [''],
    name: 'Merlion Park',
    categories: {'tourism'}.toList(),
    continentType: ContinentType.asia,
    description: 'Park in Singapore featuring the Merlion statue',
    location: const PlaceLocation(
      lat: 1.2869,
      lon: 103.8546,
      city: 'Singapore',
      country: 'Singapore',
      formatted: 'Merlion Park, Singapore',
      countryCode: 'SG',
    ),
  ),
//25
  ApiActivity(
    imagePaths: [''],
    name: 'Paro Taktsang',
    categories: {'tourism', 'religion'}.toList(),
    continentType: ContinentType.asia,
    description: 'Buddhist monastery perched on a cliff in Bhutan',
    location: const PlaceLocation(
      lat: 27.4914,
      lon: 89.3634,
      city: '',
      country: 'Bhutan',
      formatted: 'Tiger\'s Nest Monastery, Bhutan',
      countryCode: 'BT',
    ),
  ),
//26
  ApiActivity(
    imagePaths: [''],
    name: 'Burj Khalifa',
    categories: {'tourism', 'architecture'}.toList(),
    continentType: ContinentType.asia,
    description:
        'Tallest building in the world located in Dubai, United Arab Emirates',
    location: const PlaceLocation(
      lat: 25.2769,
      lon: 55.2963,
      city: 'Dubai',
      country: 'United Arab Emirates',
      formatted: 'Burj Khalifa, Dubai, UAE',
      countryCode: 'AE',
    ),
  ),

////////////
//1
  ApiActivity(
    imagePaths: [''],
    name: 'Giza pyramid complex',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.africa,
    description: 'Ancient pyramid complex located near Cairo, Egypt',
    location: const PlaceLocation(
      lat: 29.9792,
      lon: 31.1342,
      city: 'Cairo',
      country: 'Egypt',
      formatted: 'Pyramids of Giza, Cairo, Egypt',
      countryCode: 'EG',
    ),
  ),
//2
  ApiActivity(
    imagePaths: [''],
    name: 'Serengeti National Park',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.africa,
    description:
        'Iconic safari destination known for its annual migration of wildebeest and zebra',
    location: const PlaceLocation(
      lat: -2.3329,
      lon: 34.8888,
      city: '',
      country: 'Tanzania',
      formatted: 'Serengeti National Park, Tanzania',
      countryCode: 'TZ',
    ),
  ),
//3
  ApiActivity(
    imagePaths: [''],
    name: 'Victoria Falls',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.africa,
    description:
        'Waterfalls on the Zambezi River bordering Zimbabwe and Zambia',
    location: const PlaceLocation(
      lat: -17.9244,
      lon: 25.8567,
      city: '',
      country: 'Zimbabwe/Zambia',
      formatted: 'Victoria Falls, Zimbabwe/Zambia',
      countryCode: 'ZW/ZM',
    ),
  ),
//4
  ApiActivity(
    imagePaths: [''],
    name: 'Table Mountain',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.africa,
    description:
        'Iconic flat-topped mountain overlooking Cape Town, South Africa',
    location: const PlaceLocation(
      lat: -33.9628,
      lon: 18.4098,
      city: 'Cape Town',
      country: 'South Africa',
      formatted: 'Table Mountain, Cape Town, South Africa',
      countryCode: 'ZA',
    ),
  ),
//5
  ApiActivity(
    imagePaths: [''],
    name: 'Great Mosque of Djenné',
    categories: {'tourism', 'religion'}.toList(),
    continentType: ContinentType.africa,
    description:
        'Large adobe mosque in Djenné, Mali, one of the most famous landmarks in Africa',
    location: const PlaceLocation(
      lat: 13.9072,
      lon: -4.5529,
      city: 'Djenné',
      country: 'Mali',
      formatted: 'Great Mosque of Djenné, Djenné, Mali',
      countryCode: 'ML',
    ),
  ),
//6
  ApiActivity(
    imagePaths: [''],
    name: 'Kruger National Park',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.africa,
    description:
        'One of Africa\'s largest game reserves and a premier safari destination',
    location: const PlaceLocation(
      lat: -23.9884,
      lon: 31.5547,
      city: '',
      country: 'South Africa',
      formatted: 'Kruger National Park, South Africa',
      countryCode: 'ZA',
    ),
  ),
//7
  ApiActivity(
    imagePaths: [''],
    name: 'Mount Kilimanjaro',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.africa,
    description:
        'Africa\'s highest peak and a popular climbing destination in Tanzania',
    location: const PlaceLocation(
      lat: -3.0674,
      lon: 37.3556,
      city: '',
      country: 'Tanzania',
      formatted: 'Mount Kilimanjaro, Tanzania',
      countryCode: 'TZ',
    ),
  ),
//8
  ApiActivity(
    imagePaths: [''],
    name: 'Okavango Delta',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.africa,
    description: 'Largest inland delta in the world located in Botswana',
    location: const PlaceLocation(
      lat: -19.3080,
      lon: 22.8011,
      city: '',
      country: 'Botswana',
      formatted: 'Okavango Delta, Botswana',
      countryCode: 'BW',
    ),
  ),
//9
  ApiActivity(
    imagePaths: [''],
    name: 'Timbuktu',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.africa,
    description:
        'Ancient city in Mali known for its historical significance and as a center of learning',
    location: const PlaceLocation(
      lat: 16.7666,
      lon: -3.0026,
      city: 'Timbuktu',
      country: 'Mali',
      formatted: 'Timbuktu, Mali',
      countryCode: 'ML',
    ),
  ),
//10
  ApiActivity(
    imagePaths: [''],
    name: 'Valley of the Kings',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.africa,
    description: 'Necropolis in Egypt where many pharaohs were buried',
    location: const PlaceLocation(
      lat: 25.7405,
      lon: 32.6011,
      city: 'Luxor',
      country: 'Egypt',
      formatted: 'Valley of the Kings, Luxor, Egypt',
      countryCode: 'EG',
    ),
  ),
//11
  ApiActivity(
    imagePaths: [''],
    name: 'Stone Town',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.africa,
    description:
        'Historic town in Zanzibar known for its architecture and cultural heritage',
    location: const PlaceLocation(
      lat: -6.1659,
      lon: 39.2026,
      city: 'Zanzibar City',
      country: 'Tanzania',
      formatted: 'Stone Town, Zanzibar City, Tanzania',
      countryCode: 'TZ',
    ),
  ),
//12
  ApiActivity(
    imagePaths: [''],
    name: 'Jemaa el-Fnaa',
    categories: {'tourism', 'culture'}.toList(),
    continentType: ContinentType.africa,
    description:
        'Famous square and marketplace in Marrakesh, Morocco, known for its lively atmosphere',
    location: const PlaceLocation(
      lat: 31.6256,
      lon: -7.9891,
      city: 'Marrakesh',
      country: 'Morocco',
      formatted: 'Djemaa el Fna, Marrakesh, Morocco',
      countryCode: 'MA',
    ),
  ),
//13
  ApiActivity(
    imagePaths: [''],
    name: 'Fish River Canyon',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.africa,
    description: 'Large canyon carved by the Fish River in Namibia',
    location: const PlaceLocation(
      lat: -27.5864,
      lon: 17.5664,
      city: '',
      country: 'Namibia',
      formatted: 'Fish River Canyon, Namibia',
      countryCode: 'NA',
    ),
  ),
//14
  ApiActivity(
    imagePaths: [''],
    name: 'Mount Sinai',
    categories: {'tourism', 'religion'}.toList(),
    continentType: ContinentType.africa,
    description:
        'Sacred mountain in the Sinai Peninsula of Egypt, known for its religious significance',
    location: const PlaceLocation(
      lat: 28.5394,
      lon: 33.9750,
      city: '',
      country: 'Egypt',
      formatted: 'Mount Sinai, Egypt',
      countryCode: 'EG',
    ),
  ),
//15
  ApiActivity(
    imagePaths: [''],
    name: 'Djenné-Djenno',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.africa,
    description:
        'Ancient archaeological site and UNESCO World Heritage Site in Mali',
    location: const PlaceLocation(
      lat: 13.9069,
      lon: -4.5534,
      city: 'Djenné',
      country: 'Mali',
      formatted: 'Djenne-Djenno, Djenné, Mali',
      countryCode: 'ML',
    ),
  ),
//16
  ApiActivity(
    imagePaths: [''],
    name: 'Mount Kenya',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.africa,
    description: 'Second-highest mountain in Africa located in Kenya',
    location: const PlaceLocation(
      lat: -0.1526,
      lon: 37.3086,
      city: '',
      country: 'Kenya',
      formatted: 'Mount Kenya, Kenya',
      countryCode: 'KE',
    ),
  ),
//17
  ApiActivity(
    imagePaths: [''],
    name: 'Gorée',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.africa,
    description:
        'Island off the coast of Senegal known for its role in the Atlantic slave trade',
    location: const PlaceLocation(
      lat: 14.6664,
      lon: -17.3986,
      city: 'Dakar',
      country: 'Senegal',
      formatted: 'Gorée Island, Dakar, Senegal',
      countryCode: 'SN',
    ),
  ),
//18
  ApiActivity(
    imagePaths: [''],
    name: 'Mount Kilimanjaro',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.africa,
    description:
        'National park surrounding Africa\'s highest peak, Mount Kilimanjaro, in Tanzania',
    location: const PlaceLocation(
      lat: -3.0674,
      lon: 37.3556,
      city: '',
      country: 'Tanzania',
      formatted: 'Mount Kilimanjaro National Park, Tanzania',
      countryCode: 'TZ',
    ),
  ),
//19
  ApiActivity(
    imagePaths: [''],
    name: 'Tsingy de Bemaraha National Park',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.africa,
    description:
        'UNESCO World Heritage Site known for its unique geography and limestone formations in Madagascar',
    location: const PlaceLocation(
      lat: -19.1297,
      lon: 44.7569,
      city: 'Antsalova',
      country: 'Madagascar',
      formatted: 'Tsingy de Bemaraha National Park, Antsalova, Madagascar',
      countryCode: 'MG',
    ),
  ),
//20
  ApiActivity(
    imagePaths: [''],
    name: 'Karnak',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.africa,
    description:
        'Vast temple complex in Luxor, Egypt, dedicated to the god Amun',
    location: const PlaceLocation(
      lat: 25.7188,
      lon: 32.6573,
      city: 'Luxor',
      country: 'Egypt',
      formatted: 'Karnak Temple, Luxor, Egypt',
      countryCode: 'EG',
    ),
  ),
//21
  ApiActivity(
    imagePaths: [''],
    name: 'Virunga National Park',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.africa,
    description:
        'Africa\'s oldest national park, home to endangered mountain gorillas, located in the Democratic Republic of the Congo',
    location: const PlaceLocation(
      lat: -0.7587,
      lon: 29.3832,
      city: 'Goma',
      country: 'Democratic Republic of the Congo',
      formatted:
          'Virunga National Park, Goma, Democratic Republic of the Congo',
      countryCode: 'CD',
    ),
  ),
//22
  ApiActivity(
    imagePaths: [''],
    name: 'Robben Island',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.africa,
    description:
        'Island in Table Bay, Cape Town, South Africa, known for its prison where Nelson Mandela was incarcerated',
    location: const PlaceLocation(
      lat: -33.8061,
      lon: 18.3665,
      city: 'Cape Town',
      country: 'South Africa',
      formatted: 'Robben Island, Cape Town, South Africa',
      countryCode: 'ZA',
    ),
  ),
//23
  ApiActivity(
    imagePaths: [''],
    name: 'Mount Elgon',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.africa,
    description: 'Extinct shield volcano on the border of Uganda and Kenya',
    location: const PlaceLocation(
      lat: 1.1367,
      lon: 34.5599,
      city: '',
      country: 'Uganda/Kenya',
      formatted: 'Mount Elgon, Uganda/Kenya',
      countryCode: 'UG/KE',
    ),
  ),
//24
  ApiActivity(
    imagePaths: [''],
    name: 'Aïr and Ténéré National Nature Reserve',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.africa,
    description:
        'UNESCO World Heritage Site in Niger known for its desert landscapes and biodiversity',
    location: const PlaceLocation(
      lat: 18.9712,
      lon: 8.0909,
      city: 'Agadez',
      country: 'Niger',
      formatted: 'Aïr and Ténéré National Nature Reserve, Agadez, Niger',
      countryCode: 'NE',
    ),
  ),
//25
  ApiActivity(
    imagePaths: [''],
    name: 'Mount Meru',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.africa,
    description:
        'Stratovolcano located in Tanzania, often overshadowed by its neighbor Mount Kilimanjaro',
    location: const PlaceLocation(
      lat: -3.2500,
      lon: 36.7500,
      city: '',
      country: 'Tanzania',
      formatted: 'Mount Meru, Tanzania',
      countryCode: 'TZ',
    ),
  ),
//26
  ApiActivity(
    imagePaths: [''],
    name: 'Damaraland',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.africa,
    description:
        'Region in Namibia known for its stunning landscapes, desert-adapted wildlife, and ancient rock art',
    location: const PlaceLocation(
      lat: -20.6507,
      lon: 14.3926,
      city: '',
      country: 'Namibia',
      formatted: 'Damaraland, Namibia',
      countryCode: 'NA',
    ),
  ),
//27
  ApiActivity(
    imagePaths: [''],
    name: 'Blyde River Canyon',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.africa,
    description: 'Large canyon carved by the Blyde River in South Africa',
    location: const PlaceLocation(
      lat: -24.5591,
      lon: 30.8447,
      city: '',
      country: 'South Africa',
      formatted: 'Blyde River Canyon, South Africa',
      countryCode: 'ZA',
    ),
  ),
//28
  ApiActivity(
    imagePaths: [''],
    name: 'V&A Waterfront',
    categories: {'tourism', 'shopping'}.toList(),
    continentType: ContinentType.africa,
    description:
        'Popular tourist destination in Cape Town, South Africa, known for its shopping, dining, and entertainment options',
    location: const PlaceLocation(
      lat: -33.9036,
      lon: 18.4215,
      city: 'Cape Town',
      country: 'South Africa',
      formatted: 'Victoria and Alfred Waterfront, Cape Town, South Africa',
      countryCode: 'ZA',
    ),
  ),
//29
  ApiActivity(
    imagePaths: [''],
    name: 'Lake Malawi',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.africa,
    description:
        'Third-largest and second-deepest lake in Africa, known for its clear waters and diverse fish species',
    location: const PlaceLocation(
      lat: -12.2302,
      lon: 34.6150,
      city: '',
      country: 'Malawi',
      formatted: 'Lake Malawi, Malawi',
      countryCode: 'MW',
    ),
  ),
//30
  ApiActivity(
    imagePaths: [''],
    name: 'Volcanoes National Park',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.africa,
    description:
        'National park in Rwanda known for its mountain gorilla population and volcanic scenery',
    location: const PlaceLocation(
      lat: -1.4707,
      lon: 29.5297,
      city: 'Ruhengeri',
      country: 'Rwanda',
      formatted: 'Volcanoes National Park, Ruhengeri, Rwanda',
      countryCode: 'RW',
    ),
  ),

  /////
  //1
  ApiActivity(
    imagePaths: [''],
    name: 'Sydney Opera House',
    categories: {'tourism', 'culture'}.toList(),
    continentType: ContinentType.australia,
    description: 'Iconic performing arts center in Sydney, Australia',
    location: const PlaceLocation(
      lat: -33.8568,
      lon: 151.2153,
      city: 'Sydney',
      country: 'Australia',
      formatted: 'Sydney Opera House, Sydney, Australia',
      countryCode: 'AU',
    ),
  ),
//2
  ApiActivity(
    imagePaths: [''],
    name: 'Great Barrier Reef',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'World\'s largest coral reef system off the coast of Queensland, Australia',
    location: const PlaceLocation(
      lat: -18.2871,
      lon: 147.6992,
      city: '',
      country: 'Australia',
      formatted: 'Great Barrier Reef, Queensland, Australia',
      countryCode: 'AU',
    ),
  ),
//3
  ApiActivity(
    imagePaths: [''],
    name: 'Uluru',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Sacred sandstone rock formation in the Northern Territory, Australia',
    location: const PlaceLocation(
      lat: -25.3444,
      lon: 131.0369,
      city: 'Uluru',
      country: 'Australia',
      formatted: 'Uluru, Northern Territory, Australia',
      countryCode: 'AU',
    ),
  ),
//4
  ApiActivity(
    imagePaths: [''],
    name: 'Great Ocean Road',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Scenic coastal road in Victoria, Australia, known for its limestone stacks and stunning views',
    location: const PlaceLocation(
      lat: -38.6806,
      lon: 143.3910,
      city: 'Port Campbell',
      country: 'Australia',
      formatted: 'Great Ocean Road, Victoria, Australia',
      countryCode: 'AU',
    ),
  ),
//5
  ApiActivity(
    imagePaths: [''],
    name: 'Bondi Beach',
    categories: {'tourism', 'beach'}.toList(),
    continentType: ContinentType.australia,
    description: 'Popular beach and tourist destination in Sydney, Australia',
    location: const PlaceLocation(
      lat: -33.8915,
      lon: 151.2767,
      city: 'Sydney',
      country: 'Australia',
      formatted: 'Bondi Beach, Sydney, Australia',
      countryCode: 'AU',
    ),
  ),
//6
  ApiActivity(
    imagePaths: [''],
    name: 'Fraser Island',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'World\'s largest sand island located in Queensland, Australia',
    location: const PlaceLocation(
      lat: -25.2686,
      lon: 153.0719,
      city: '',
      country: 'Australia',
      formatted: 'Fraser Island, Queensland, Australia',
      countryCode: 'AU',
    ),
  ),
//7
  ApiActivity(
    imagePaths: [''],
    name: 'Kakadu National Park',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'UNESCO World Heritage Site in the Northern Territory, Australia, known for its biodiversity and Aboriginal rock art',
    location: const PlaceLocation(
      lat: -13.1903,
      lon: 132.5738,
      city: '',
      country: 'Australia',
      formatted: 'Kakadu National Park, Northern Territory, Australia',
      countryCode: 'AU',
    ),
  ),
//8
  ApiActivity(
    imagePaths: [''],
    name: 'Blue Mountains (New South Wales)',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Mountainous region and UNESCO World Heritage Site near Sydney, Australia',
    location: const PlaceLocation(
      lat: -33.7171,
      lon: 150.3281,
      city: 'Katoomba',
      country: 'Australia',
      formatted: 'Blue Mountains, New South Wales, Australia',
      countryCode: 'AU',
    ),
  ),
//9
  ApiActivity(
    imagePaths: [''],
    name: 'Melbourne Cricket Ground',
    categories: {'tourism', 'sport'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Iconic sports stadium in Melbourne, Australia, known for cricket and Australian rules football',
    location: const PlaceLocation(
      lat: -37.8199,
      lon: 144.9830,
      city: 'Melbourne',
      country: 'Australia',
      formatted: 'Melbourne Cricket Ground, Melbourne, Australia',
      countryCode: 'AU',
    ),
  ),
//10
  ApiActivity(
    imagePaths: [''],
    name: 'Daintree Rainforest',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'World\'s oldest tropical rainforest located in Queensland, Australia',
    location: const PlaceLocation(
      lat: -16.2791,
      lon: 145.4589,
      city: 'Mossman',
      country: 'Australia',
      formatted: 'Daintree Rainforest, Queensland, Australia',
      countryCode: 'AU',
    ),
  ),
//11
  ApiActivity(
    imagePaths: [''],
    name: 'Rottnest Island',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Island off the coast of Western Australia known for its sandy beaches and native quokkas',
    location: const PlaceLocation(
      lat: -32.0062,
      lon: 115.5133,
      city: '',
      country: 'Australia',
      formatted: 'Rottnest Island, Western Australia, Australia',
      countryCode: 'AU',
    ),
  ),
//12
  ApiActivity(
    imagePaths: [''],
    name: 'Whitsunday Islands',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Group of islands known for their white sandy beaches and coral reefs in Queensland, Australia',
    location: const PlaceLocation(
      lat: -20.3433,
      lon: 148.9529,
      city: '',
      country: 'Australia',
      formatted: 'Whitsunday Islands, Queensland, Australia',
      countryCode: 'AU',
    ),
  ),
//13
  ApiActivity(
    imagePaths: [''],
    name: 'Cradle Mountain-Lake St Clair National Park',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'National park in Tasmania, Australia, known for its alpine landscapes and hiking trails',
    location: const PlaceLocation(
      lat: -41.8120,
      lon: 145.9490,
      city: '',
      country: 'Australia',
      formatted:
          'Cradle Mountain-Lake St Clair National Park, Tasmania, Australia',
      countryCode: 'AU',
    ),
  ),
//14
  ApiActivity(
    imagePaths: [''],
    name: 'Kangaroo Island',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Island off the coast of South Australia known for its diverse wildlife and natural beauty',
    location: const PlaceLocation(
      lat: -35.7751,
      lon: 137.2143,
      city: '',
      country: 'Australia',
      formatted: 'Kangaroo Island, South Australia, Australia',
      countryCode: 'AU',
    ),
  ),
//15
  ApiActivity(
    imagePaths: [''],
    name: 'The Twelve Apostles (Victoria)',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Collection of limestone stacks off the shore of Port Campbell National Park in Victoria, Australia',
    location: const PlaceLocation(
      lat: -38.6650,
      lon: 143.1043,
      city: 'Princetown',
      country: 'Australia',
      formatted: 'The Twelve Apostles, Victoria, Australia',
      countryCode: 'AU',
    ),
  ),
//16
  ApiActivity(
    imagePaths: [''],
    name: 'Sydney Harbour Bridge',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Iconic steel through arch bridge in Sydney, Australia, connecting the city center to the North Shore',
    location: const PlaceLocation(
      lat: -33.8523,
      lon: 151.2108,
      city: 'Sydney',
      country: 'Australia',
      formatted: 'Sydney Harbour Bridge, Sydney, Australia',
      countryCode: 'AU',
    ),
  ),
//17
  ApiActivity(
    imagePaths: [''],
    name: 'Tasmanian Wilderness World Heritage Area',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'UNESCO World Heritage Site in Tasmania, Australia, known for its rugged terrain and unique flora and fauna',
    location: const PlaceLocation(
      lat: -42.0627,
      lon: 145.4240,
      city: '',
      country: 'Australia',
      formatted: 'Tasmanian Wilderness, Tasmania, Australia',
      countryCode: 'AU',
    ),
  ),
//18
  ApiActivity(
    imagePaths: [''],
    name: 'Australian War Memorial',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.australia,
    description:
        'National memorial and museum in Canberra, Australia, commemorating the sacrifice of Australians who served in war',
    location: const PlaceLocation(
      lat: -35.2819,
      lon: 149.1486,
      city: 'Canberra',
      country: 'Australia',
      formatted: 'Australian War Memorial, Canberra, Australia',
      countryCode: 'AU',
    ),
  ),
//19
  ApiActivity(
    imagePaths: [''],
    name: 'Barossa Valley',
    categories: {'tourism', 'culinary'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Wine-growing region in South Australia known for its vineyards and wine production',
    location: const PlaceLocation(
      lat: -34.5389,
      lon: 138.9371,
      city: 'Tanunda',
      country: 'Australia',
      formatted: 'Barossa Valley, South Australia, Australia',
      countryCode: 'AU',
    ),
  ),
//20
  ApiActivity(
    imagePaths: [''],
    name: 'Royal Botanic Gardens Victoria',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Botanic gardens in Melbourne and Cranbourne, Victoria, Australia, featuring a diverse collection of plants',
    location: const PlaceLocation(
      lat: -37.8304,
      lon: 144.9796,
      city: 'Melbourne',
      country: 'Australia',
      formatted:
          'Royal Botanic Gardens Victoria, Melbourne, Victoria, Australia',
      countryCode: 'AU',
    ),
  ),
//21
  ApiActivity(
    imagePaths: [''],
    name: 'Uluṟu-Kata Tjuṯa National Park',
    categories: {'tourism', 'culture'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Cultural center near Uluru in the Northern Territory, Australia, offering insights into Aboriginal history and culture',
    location: const PlaceLocation(
      lat: -25.3444,
      lon: 131.0369,
      city: 'Yulara',
      country: 'Australia',
      formatted:
          'Uluru-Kata Tjuta Cultural Centre, Yulara, Northern Territory, Australia',
      countryCode: 'AU',
    ),
  ),
//22
  ApiActivity(
    imagePaths: [''],
    name: 'Great Ocean Walk',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Long-distance coastal walking track in Victoria, Australia, offering stunning views of the coastline',
    location: const PlaceLocation(
      lat: -38.6707,
      lon: 143.1045,
      city: 'Princetown',
      country: 'Australia',
      formatted: 'Great Ocean Walk, Victoria, Australia',
      countryCode: 'AU',
    ),
  ),

//24
  ApiActivity(
    imagePaths: [''],
    name: 'Port Arthur, Tasmania',
    categories: {'tourism', 'history'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Historic convict settlement and UNESCO World Heritage Site in Tasmania, Australia',
    location: const PlaceLocation(
      lat: -43.1470,
      lon: 147.8500,
      city: 'Port Arthur',
      country: 'Australia',
      formatted: 'Port Arthur Historic Site, Tasmania, Australia',
      countryCode: 'AU',
    ),
  ),
//25
  ApiActivity(
    imagePaths: [''],
    name: 'Purnululu National Park',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'National park in Western Australia known for its striped sandstone domes called the Bungle Bungle Range',
    location: const PlaceLocation(
      lat: -17.4562,
      lon: 128.4178,
      city: '',
      country: 'Australia',
      formatted:
          'Purnululu National Park (Bungle Bungle Range), Western Australia, Australia',
      countryCode: 'AU',
    ),
  ),
//26
  ApiActivity(
    imagePaths: [''],
    name: 'Royal Botanic Garden, Sydney',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Botanic garden in Sydney, New South Wales, Australia, featuring a variety of plants and attractions',
    location: const PlaceLocation(
      lat: -33.8641,
      lon: 151.2190,
      city: 'Sydney',
      country: 'Australia',
      formatted:
          'Royal Botanic Garden Sydney, Sydney, New South Wales, Australia',
      countryCode: 'AU',
    ),
  ),
//27
  ApiActivity(
    imagePaths: [''],
    name: 'The Pinnacles (Western Australia)',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Limestone formations in Nambung National Park, Western Australia, Australia, resembling ancient ruins',
    location: const PlaceLocation(
      lat: -30.6393,
      lon: 115.1655,
      city: 'Cervantes',
      country: 'Australia',
      formatted:
          'The Pinnacles, Nambung National Park, Western Australia, Australia',
      countryCode: 'AU',
    ),
  ),
//28
  ApiActivity(
    imagePaths: [''],
    name: 'Cable Beach',
    categories: {'tourism', 'beach'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Beach near Broome in Western Australia, Australia, known for its white sand and camel rides',
    location: const PlaceLocation(
      lat: -17.9554,
      lon: 122.2006,
      city: 'Broome',
      country: 'Australia',
      formatted: 'Cable Beach, Broome, Western Australia, Australia',
      countryCode: 'AU',
    ),
  ),
//29
  ApiActivity(
    imagePaths: [''],
    name: 'Cottesloe Beach',
    categories: {'tourism', 'beach'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Popular beach in Perth, Western Australia, Australia, known for its clear waters and lively atmosphere',
    location: const PlaceLocation(
      lat: -31.9935,
      lon: 115.7507,
      city: 'Perth',
      country: 'Australia',
      formatted: 'Cottesloe Beach, Perth, Western Australia, Australia',
      countryCode: 'AU',
    ),
  ),
//30
  ApiActivity(
    imagePaths: [''],
    name: 'Dandenong Ranges National Park',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'National park near Melbourne, Victoria, Australia, known for its lush forests and scenic views',
    location: const PlaceLocation(
      lat: -37.8682,
      lon: 145.3163,
      city: 'Melbourne',
      country: 'Australia',
      formatted:
          'Dandenong Ranges National Park, Melbourne, Victoria, Australia',
      countryCode: 'AU',
    ),
  ),
//31
  ApiActivity(
    imagePaths: [''],
    name: 'Kings Park, Western Australia',
    categories: {'tourism', 'nature'}.toList(),
    continentType: ContinentType.australia,
    description:
        'Park in Perth, Western Australia, Australia, featuring botanic gardens, bushland, and views of the city',
    location: const PlaceLocation(
      lat: -31.9609,
      lon: 115.8328,
      city: 'Perth',
      country: 'Australia',
      formatted:
          'Kings Park and Botanic Garden, Perth, Western Australia, Australia',
      countryCode: 'AU',
    ),
  ),
];


// North America
//   Activity(
//     name: 'Times Square',
//     continentType: ContinentType.northAmerica,
//     description:
//         'A vibrant intersection and tourist destination in New York City.',
//     imagePath: '',
//     location: const PlaceLocation(
//         latitude: 40.758896,
//         longitude: -73.985130,
//         street: 'Broadway',
//         city: 'New York City',
//         country: 'USA'),
//     types: {'activity'}.toSet(),
//   ),

//   Activity(
//     name: 'Niagara Falls',
//     continentType: ContinentType.northAmerica,
//     description:
//         'Powerful waterfalls on the border between Canada and the United States.',
//     imagePath: '',
//     location: const PlaceLocation(
//         latitude: 43.0790555,
//         longitude: -79.0747579,
//         street: 'Niagara Pkwy',
//         city: 'Niagara Falls',
//         country: 'Canada & USA'),
//     types: {'natural'}.toSet(),
//   ),

//   Activity(
//     name: 'Statue of Liberty',
//     continentType: ContinentType.northAmerica,
//     description:
//         'Iconic symbol of freedom and democracy located in New York Harbor.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Liberty Island',
//       city: 'New York Harbor',
//       country: 'USA',
//       latitude: 40.6892,
//       longitude: -74.0445,
//     ),
//   ),
//   Activity(
//     name: 'Grand Canyon',
//     continentType: ContinentType.northAmerica,
//     description:
//         'Massive canyon carved by the Colorado River in the state of Arizona.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Arizona',
//       city: '',
//       country: 'USA',
//       latitude: 36.1069,
//       longitude: -112.1129,
//     ),
//   ),
//   Activity(
//     name: 'Golden Gate Bridge',
//     continentType: ContinentType.northAmerica,
//     description:
//         'Famous suspension bridge spanning the Golden Gate Strait in California.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'San Francisco',
//       city: 'California',
//       country: 'USA',
//       latitude: 37.8199,
//       longitude: -122.4783,
//     ),
//   ),
//   Activity(
//     name: 'Central Park',
//     continentType: ContinentType.northAmerica,
//     description: 'Iconic urban park in Manhattan, New York City.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Manhattan',
//       city: 'New York City',
//       country: 'USA',
//       latitude: 40.7851,
//       longitude: -73.9683,
//     ),
//   ),
//   Activity(
//     name: 'Disneyland',
//     continentType: ContinentType.northAmerica,
//     description: 'Famous theme park and resort located in California.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Anaheim',
//       city: 'California',
//       country: 'USA',
//       latitude: 33.8121,
//       longitude: -117.9190,
//     ),
//   ),
//   Activity(
//     name: 'Yellowstone National Park',
//     continentType: ContinentType.northAmerica,
//     description:
//         'First national park in the world, known for its geothermal features and wildlife.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Wyoming, Montana & Idaho',
//       city: '',
//       country: 'USA',
//       latitude: 44.4280,
//       longitude: -110.5885,
//     ),
//   ),
//   Activity(
//     name: 'Hollywood Walk of Fame',
//     continentType: ContinentType.northAmerica,
//     description:
//         'Sidewalk along Hollywood Boulevard with embedded stars honoring celebrities.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Hollywood Boulevard',
//       city: 'Los Angeles',
//       country: 'USA',
//       latitude: 34.1014,
//       longitude: -118.3410,
//     ),
//   ),

// // South America
//   Activity(
//     name: 'Machu Picchu',
//     continentType: ContinentType.southAmerica,
//     description: 'An ancient Inca citadel set high in the Andes mountains.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Cusco Region',
//       city: '',
//       country: 'Peru',
//       latitude: -13.1631,
//       longitude: -72.5450,
//     ),
//   ),

//   Activity(
//     name: 'Iguazu Falls',
//     continentType: ContinentType.southAmerica,
//     description:
//         'Spectacular waterfalls on the border between Argentina, Brazil, and Paraguay.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: '',
//       city: '',
//       country: 'Argentina, Brazil & Paraguay',
//       latitude: -25.6953,
//       longitude: -54.4367,
//     ),
//   ),
//   Activity(
//     name: 'Amazon rainforest',
//     continentType: ContinentType.southAmerica,
//     description:
//         'The world\'s largest tropical rainforest, home to diverse wildlife and ecosystems.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Various locations across South America',
//       city: '',
//       country: 'Various countries in South America',
//       latitude: -3.4653,
//       longitude: -62.2159,
//     ),
//   ),
//   Activity(
//     name: 'Salar de Uyuni',
//     continentType: ContinentType.southAmerica,
//     description:
//         'The world\'s largest salt flat, creating a mesmerizing reflective surface.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Potosí & Oruro Departments',
//       city: '',
//       country: 'Bolivia',
//       latitude: -20.1336,
//       longitude: -67.4891,
//     ),
//   ),
//   Activity(
//     name: 'Galápagos Islands',
//     continentType: ContinentType.southAmerica,
//     description:
//         'Archipelago of volcanic islands famous for their unique wildlife and role in Darwin\'s theory of evolution.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Pacific Ocean',
//       city: 'Ecuador',
//       country: 'Ecuador',
//       latitude: -0.6132,
//       longitude: -90.7295,
//     ),
//   ),
//   Activity(
//     name: 'Torres del Paine National Park',
//     continentType: ContinentType.southAmerica,
//     description:
//         'Breathtaking national park known for its granite peaks, glaciers, and lakes.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Magallanes Region',
//       city: 'Chile',
//       country: 'Chile',
//       latitude: -51.2594,
//       longitude: -72.3452,
//     ),
//   ),
//   Activity(
//     name: 'Angel Falls',
//     continentType: ContinentType.southAmerica,
//     description:
//         'The world\'s highest uninterrupted waterfall, cascading from Auyán-tepui in the Guiana Highlands.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Canaima National Park',
//       city: '',
//       country: 'Venezuela',
//       latitude: 5.9675,
//       longitude: -62.5357,
//     ),
//   ),
//   Activity(
//     name: 'Atacama Desert',
//     continentType: ContinentType.southAmerica,
//     description:
//         'A surreal desert landscape with salt flats, geysers, and lunar-like terrain.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Various locations in Chile',
//       city: '',
//       country: 'Chile',
//       latitude: -23.5880,
//       longitude: -68.4152,
//     ),
//   ),
//   Activity(
//     name: 'Patagonia',
//     continentType: ContinentType.southAmerica,
//     description:
//         'A sparsely populated region at the southern end of South America known for its stunning landscapes, including mountains, glaciers, and fjords.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Argentina & Chile',
//       city: '',
//       country: 'Argentina & Chile',
//       latitude: -45.7733,
//       longitude: -69.3295,
//     ),
//   ),

//   // Africa
//   Activity(
//     name: 'Great Pyramid of Giza',
//     continentType: ContinentType.africa,
//     description: 'One of the Seven Wonders of the Ancient World.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Giza Necropolis',
//       city: '',
//       country: 'Egypt',
//       latitude: 29.9792,
//       longitude: 31.1342,
//     ),
//   ),
//   Activity(
//     name: 'Kruger National Park',
//     continentType: ContinentType.africa,
//     description: 'A large safari park known for its diverse wildlife.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Limpopo & Mpumalanga Provinces',
//       city: '',
//       country: 'South Africa',
//       latitude: -23.9884,
//       longitude: 31.5547,
//     ),
//   ),
//   Activity(
//     name: 'Victoria Falls',
//     continentType: ContinentType.africa,
//     description: 'One of the largest and most famous waterfalls in the world.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Zambia & Zimbabwe',
//       city: '',
//       country: 'Zambia & Zimbabwe',
//       latitude: -17.9244,
//       longitude: 25.8572,
//     ),
//   ),
//   Activity(
//     name: 'Serengeti National Park',
//     continentType: ContinentType.africa,
//     description:
//         'Renowned for its annual migration of wildebeest and other animals.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Tanzania',
//       city: '',
//       country: 'Tanzania',
//       latitude: -2.1540,
//       longitude: 34.6857,
//     ),
//   ),
//   Activity(
//     name: 'Mount Kilimanjaro',
//     continentType: ContinentType.africa,
//     description: 'Africa\'s highest peak, a popular destination for climbers.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Kilimanjaro Region',
//       city: '',
//       country: 'Tanzania',
//       latitude: -3.0674,
//       longitude: 37.3556,
//     ),
//   ),
//   Activity(
//     name: 'Maasai Mara',
//     continentType: ContinentType.africa,
//     description:
//         'Famous for its population of lions, cheetahs, and annual wildebeest migration.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Narok County',
//       city: '',
//       country: 'Kenya',
//       latitude: -1.5211,
//       longitude: 35.3489,
//     ),
//   ),
//   Activity(
//     name: 'Pyramids of Meroë',
//     continentType: ContinentType.africa,
//     description:
//         'Ancient Nubian pyramids located near the banks of the Nile River.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Nile River',
//       city: '',
//       country: 'Sudan',
//       latitude: 16.9404,
//       longitude: 33.7298,
//     ),
//   ),
//   Activity(
//     name: 'Table Mountain',
//     continentType: ContinentType.africa,
//     description:
//         'Iconic flat-topped mountain offering stunning views of Cape Town.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Cape Town',
//       city: '',
//       country: 'South Africa',
//       latitude: -33.9625,
//       longitude: 18.4096,
//     ),
//   ),
//   Activity(
//     name: 'Okavango Delta',
//     continentType: ContinentType.africa,
//     description:
//         'A unique inland delta in the middle of the Kalahari Desert, known for its rich wildlife.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Botswana',
//       city: '',
//       country: 'Botswana',
//       latitude: -19.3000,
//       longitude: 22.8167,
//     ),
//   ),
//   Activity(
//     name: 'Mount Kenya',
//     continentType: ContinentType.africa,
//     description:
//         'Second-highest mountain in Africa, known for its glaciers and diverse ecosystems.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Eastern Province',
//       city: '',
//       country: 'Kenya',
//       latitude: -0.1529,
//       longitude: 37.3157,
//     ),
//   ),

//   // Europe
//   Activity(
//     name: 'Colosseum',
//     continentType: ContinentType.europe,
//     description:
//         'An ancient Roman amphitheater, once a site for gladiatorial contests.',
//     imagePath: '',
//     location: PlaceLocation(
//         street: 'Piazza del Colosseo',
//         city: 'Rome',
//         country: 'Italy',
//         latitude: 0,
//         longitude: 0),
//   ),
//   Activity(
//     name: 'Colosseum',
//     continentType: ContinentType.europe,
//     description:
//         'An ancient Roman amphitheater, once a site for gladiatorial contests.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Piazza del Colosseo',
//       city: 'Rome',
//       country: 'Italy',
//       latitude: 41.8902,
//       longitude: 12.4922,
//     ),
//   ),
//   Activity(
//     name: 'Eiffel Tower',
//     continentType: ContinentType.europe,
//     description: 'A wrought-iron lattice tower on the Champ de Mars in Paris.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Champ de Mars',
//       city: 'Paris',
//       country: 'France',
//       latitude: 48.8584,
//       longitude: 2.2945,
//     ),
//   ),
//   Activity(
//     name: 'Sagrada Família',
//     continentType: ContinentType.europe,
//     description: 'A large unfinished Roman Catholic church in Barcelona.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Carrer de Mallorca, 401',
//       city: 'Barcelona',
//       country: 'Spain',
//       latitude: 41.4036,
//       longitude: 2.1744,
//     ),
//   ),
//   Activity(
//     name: 'Acropolis of Athens',
//     continentType: ContinentType.europe,
//     description:
//         'An ancient citadel located on a rocky outcrop above the city of Athens.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Athens',
//       city: 'Athens',
//       country: 'Greece',
//       latitude: 37.9715,
//       longitude: 23.7263,
//     ),
//   ),
//   Activity(
//     name: 'Brandenburg Gate',
//     continentType: ContinentType.europe,
//     description: 'An 18th-century neoclassical monument in Berlin.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Pariser Platz',
//       city: 'Berlin',
//       country: 'Germany',
//       latitude: 52.5163,
//       longitude: 13.3777,
//     ),
//     types: {'culture'}.toSet(),
//   ),
//   Activity(
//     name: 'Tower Bridge',
//     continentType: ContinentType.europe,
//     description: 'A combined bascule and suspension bridge in London.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Tower Bridge Rd',
//       city: 'London',
//       country: 'United Kingdom',
//       latitude: 51.5055,
//       longitude: -0.0754,
//     ),
//   ),
//   Activity(
//     name: 'Louvre',
//     continentType: ContinentType.europe,
//     description:
//         'The world\'s largest art museum and a historic monument in Paris.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Rue de Rivoli',
//       city: 'Paris',
//       country: 'France',
//       latitude: 48.8606,
//       longitude: 2.3376,
//     ),
//   ),
//   Activity(
//     name: 'Neuschwanstein Castle',
//     continentType: ContinentType.europe,
//     description:
//         'A 19th-century Romanesque Revival palace on a rugged hill above the village of Hohenschwangau near Füssen in southwest Bavaria.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Neuschwansteinstraße 20',
//       city: 'Schwangau',
//       country: 'Germany',
//       latitude: 47.5576,
//       longitude: 10.7498,
//     ),
//     types: {'accomodation'}.toSet(),
//   ),
//   Activity(
//     name: 'Canals of Amsterdam',
//     continentType: ContinentType.europe,
//     description:
//         'A UNESCO World Heritage site consisting of a network of canals in Amsterdam.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Amsterdam',
//       city: 'Amsterdam',
//       country: 'Netherlands',
//       latitude: 52.3676,
//       longitude: 4.9041,
//     ),
//   ),

// // Asia
//   Activity(
//     name: 'Great Wall of China',
//     continentType: ContinentType.asia,
//     description:
//         'An ancient series of fortifications made of stone, brick, wood, and earth.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Various locations across China',
//       city: 'China',
//       country: 'China',
//       latitude: 40.4319,
//       longitude: 116.5704,
//     ),
//   ),
//   Activity(
//     name: 'Taj Mahal',
//     continentType: ContinentType.asia,
//     description:
//         'An ivory-white marble mausoleum on the south bank of the Yamuna river.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Agra, Uttar Pradesh',
//       city: 'Agra',
//       country: 'India',
//       latitude: 27.1751,
//       longitude: 78.0421,
//     ),
//   ),
//   Activity(
//     name: 'Mount Everest',
//     continentType: ContinentType.asia,
//     description: 'The world\'s highest mountain, located in the Himalayas.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Himalayas',
//       city: 'Nepal',
//       country: 'Nepal',
//       latitude: 27.9881,
//       longitude: 86.9250,
//     ),
//   ),
//   Activity(
//     name: 'Petra',
//     continentType: ContinentType.asia,
//     description:
//         'A historical and archaeological city famous for its rock-cut architecture.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Petra, Wadi Musa',
//       city: 'Petra',
//       country: 'Jordan',
//       latitude: 30.3285,
//       longitude: 35.4444,
//     ),
//   ),
//   Activity(
//     name: 'Angkor Wat',
//     continentType: ContinentType.asia,
//     description:
//         'A temple complex and the largest religious monument in the world.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Krong Siem Reap',
//       city: 'Siem Reap',
//       country: 'Cambodia',
//       latitude: 13.4125,
//       longitude: 103.8660,
//     ),
//   ),
//   Activity(
//     name: 'Forbidden City',
//     continentType: ContinentType.asia,
//     description: 'A palace complex in central Beijing, China.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: '4 Jingshan Front St, Dongcheng, Beijing',
//       city: 'Beijing',
//       country: 'China',
//       latitude: 39.9163,
//       longitude: 116.3972,
//     ),
//   ),
//   Activity(
//     name: 'Borobudur',
//     continentType: ContinentType.asia,
//     description:
//         'A 9th-century Mahayana Buddhist temple in Magelang, Central Java, Indonesia.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Jl. Badrawati, Kw. Candi Borobudur',
//       city: 'Magelang',
//       country: 'Indonesia',
//       latitude: -7.6079,
//       longitude: 110.2036,
//     ),
//   ),
//   Activity(
//     name: 'Tokyo Skytree',
//     continentType: ContinentType.asia,
//     description:
//         'A broadcasting and observation tower in Sumida, Tokyo, Japan.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: '1 Chome-1-2 Oshiage',
//       city: 'Tokyo',
//       country: 'Japan',
//       latitude: 35.7101,
//       longitude: 139.8107,
//     ),
//   ),
// // Australia
//   Activity(
//     name: 'Great Barrier Reef',
//     continentType: ContinentType.australia,
//     description:
//         'The world\'s largest coral reef system, located off the coast of Queensland.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Queensland',
//       city: 'Queensland',
//       country: 'Australia',
//       latitude: -18.2871,
//       longitude: 147.6992,
//     ),
//   ),
//   Activity(
//     name: 'Uluru',
//     continentType: ContinentType.australia,
//     description:
//         'A large sandstone rock formation in the Northern Territory of Australia.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Uluru-Kata Tjuta National Park, Petermann NT 0872',
//       city: 'Petermann',
//       country: 'Australia',
//       latitude: -25.3444,
//       longitude: 131.0369,
//     ),
//   ),
//   Activity(
//     name: 'Sydney Harbour Bridge',
//     continentType: ContinentType.australia,
//     description: 'A steel through arch bridge across Sydney Harbour.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Sydney, New South Wales',
//       city: 'Sydney',
//       country: 'Australia',
//       latitude: -33.8523,
//       longitude: 151.2108,
//     ),
//   ),
//   Activity(
//     name: 'Bondi Beach',
//     continentType: ContinentType.australia,
//     description:
//         'A popular beach and the name of the surrounding suburb in Sydney, New South Wales.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Bondi Beach, New South Wales',
//       city: 'Sydney',
//       country: 'Australia',
//       latitude: -33.8918,
//       longitude: 151.2767,
//     ),
//   ),
//   Activity(
//     name: 'Kakadu National Park',
//     continentType: ContinentType.australia,
//     description:
//         'A protected area in the Northern Territory of Australia, known for its cultural and natural significance.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Jabiru NT 0886',
//       city: 'Jabiru',
//       country: 'Australia',
//       latitude: -12.6828,
//       longitude: 132.9159,
//     ),
//   ),
//   Activity(
//     name: 'Daintree Rainforest',
//     continentType: ContinentType.australia,
//     description:
//         'A tropical rainforest region on the north east coast of Queensland.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Daintree QLD 4873',
//       city: 'Daintree',
//       country: 'Australia',
//       latitude: -16.2500,
//       longitude: 145.3333,
//     ),
//   ),
//   Activity(
//     name: 'Whitsunday Islands',
//     continentType: ContinentType.australia,
//     description:
//         'A collection of continental islands off the coast of Queensland, Australia.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Queensland',
//       city: 'Queensland',
//       country: 'Australia',
//       latitude: -20.3510,
//       longitude: 148.9575,
//     ),
//   ),
//   Activity(
//     name: 'Blue Mountains National Park',
//     continentType: ContinentType.australia,
//     description:
//         'A rugged region west of Sydney in New South Wales, known for its dramatic scenery.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'New South Wales',
//       city: 'New South Wales',
//       country: 'Australia',
//       latitude: -33.6500,
//       longitude: 150.3333,
//     ),
//   ),
//   Activity(
//     name: 'Melbourne Cricket Ground',
//     continentType: ContinentType.australia,
//     description:
//         'One of the largest stadiums in the world, located in Melbourne, Victoria.',
//     imagePath: '',
//     location: PlaceLocation(
//       street: 'Brunton Ave, Richmond VIC 3002',
//       city: 'Melbourne',
//       country: 'Australia',
//       latitude: -37.8199,
//       longitude: 144.9830,
//     ),
//   ),
// ];
