import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/data/api_activities_repository.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

class DestinationActivitiesScreen extends ConsumerWidget {
  const DestinationActivitiesScreen({required this.placeId, super.key});

  final String? placeId;

  Future<String> fetchImage(String wikipediaUrl) async{
      final response = await http.get(Uri.parse(wikipediaUrl));
      final Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;
      final pages = data['query']['pages'];
      final pageId = pages.keys.first;
      return pages[pageId]['thumbnail']['source'] as String;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO: Refactor placeId hardcoded value
    final fetchedActivities = ref.watch(FetchActivitiesFromAPIProvider(placeId ?? '511640e7244ae52440599981caf8f7944940f00101f90115c9000000000000c0020b'));

    return fetchedActivities.when(data: (activities) => Scaffold(
      appBar: AppBar(
          title: const Text('Explore Activities'),
        ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
        final activity = activities[index];
        return Card(
          color: Colors.white,
          child: ListTile(
          title: Text(activity.formatted),
          leading: activity.wikipediaUrl != null ? FutureBuilder<String>(
              future: fetchImage(activity.wikipediaUrl!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Fehler: ${snapshot.error}');
                } else {return CircleAvatar(backgroundImage: NetworkImage(snapshot.data!),);}}) : null,
          subtitle: Text((activity.openingHours ?? '') +  activity.categories.join(', '),),
          ),
        );
        },
      ),
    ), 
    loading: () => Scaffold(
        appBar: AppBar(
          title: const Text('Explore Activities'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) {
        logger.e('Error loading activities', error: error, stackTrace: stackTrace);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Explore Activities'),
          ),
          body: const Center(
            child: Text('Error loading activities. Please try again later.'),
          ),
        );
      });
  }
}
