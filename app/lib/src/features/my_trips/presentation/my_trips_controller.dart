import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:travel_link/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/features/my_trips/data/my_trips_repository.dart';
import 'package:travel_link/src/features/my_trips/domain/destination.dart';
import 'package:travel_link/src/utils/constants/api_constants.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';
import 'package:travel_link/src/utils/helpers/wikidata.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

part 'my_trips_controller.g.dart';

@riverpod
class MyTripsController extends _$MyTripsController {
  @override
  FutureOr<void> build() async {
    //
  }

  Future<List<String>> fetchImageOfDestination(String? placeId) async {
    if(placeId == null) return [CustomImages.destinationImagePlaceholderUrl];

    //Fetch image of destination from geoapify api and wikidata
    final String url =
        '${CustomApiConstants.placeDetailsBaseURL}?id=$placeId&features=details&apiKey=${CustomApiConstants.geoapifySecretKey}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final placeDetails =
          json.decode(response.body)['features'][0]['properties'] as Map<String, dynamic>;

      if (placeDetails.containsKey('wiki_and_media') &&
          (placeDetails['wiki_and_media'] as Map<String, dynamic>)
              .containsKey('wikidata')) {
        final wikidataId = placeDetails['wiki_and_media']['wikidata'] as String;
        final wikidataUrl =
            'https://www.wikidata.org/w/api.php?action=wbgetentities&ids=$wikidataId&format=json&props=claims&origin=*';

        //fetch wikidata to get ImageURLs
        final response = await http.get(Uri.parse(wikidataUrl));
        if(response.statusCode == 200) {
          final Map<String, dynamic> data =
            json.decode(response.body) as Map<String, dynamic>;

          return WikidataParser.getImagesFromWikidataEntity(data: data, wikidataId: wikidataId);        
        }
      }
      return [CustomImages.destinationImagePlaceholderUrl];
    } else {
      logger.e(
        'Failed to load and parse destination images',
        error: response.body,
      );
      return [CustomImages.destinationImagePlaceholderUrl];
    }
  }

  Future<bool> createTrip({
    required String name,
    required String? description,
    required DateTime? start,
    required DateTime? end,
    required Destination destination,
    required bool isPublic,
    int? maxParticipants,
  }) async {
    final currentUser = ref.read(firebaseAuthProvider).currentUser;

    //set state to loading
    state = const AsyncLoading();

    final images = await fetchImageOfDestination(destination.placeId);

    final repository = ref.read(myTripsRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.createTrip(
        uid: currentUser!.uid,
        name: name,
        description: description,
        start: start,
        end: end,
        destination: destination,
        images: images,
        isPublic: isPublic,
        maxParticipants: maxParticipants,
      ),
    );

    return state.hasError == false;
  }

  Future<void> joinTrip({required Trip trip}) async {
    final currentUser = ref.read(firebaseAuthProvider).currentUser;

    //set state to loading
    state = const AsyncLoading();

    final repository = ref.read(myTripsRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.joinTrip(uid: currentUser!.uid, trip: trip),
    );
  }

  Future<void> addToTrip({required Trip trip, required String uid}) async {

    //set state to loading
    state = const AsyncLoading();

    final repository = ref.read(myTripsRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.joinTrip(uid: uid, trip: trip),
    );
  }

  // Future<void> leaveTrip(String tripId) async {
  //   final currentUser = ref.read(firebaseAuthProvider).currentUser;

  //   //set state to loading
  //   state = const AsyncLoading();

  //   final repository = ref.read(myTripsRepositoryProvider);

  //   state = await AsyncValue.guard(
  //     () => repository.leaveTrip(uid: currentUser!.uid, tripId: tripId),
  //   );
  // }
}
