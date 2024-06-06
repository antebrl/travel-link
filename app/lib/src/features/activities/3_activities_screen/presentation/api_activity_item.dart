import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';
import 'package:travel_link/src/features/activities/5_activities_details_screen/api_activities_details_screen.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';
import 'package:travel_link/src/utils/helpers/wikidata.dart';
import 'package:travel_link/src/utils/theme/widget_themes/text_theme.dart';

class APIActivityItem extends StatefulWidget {
  const APIActivityItem({required this.activity, super.key});
  final ApiActivity activity;

  @override
  State<APIActivityItem> createState() => _APIActivityItemState();
}

class _APIActivityItemState extends State<APIActivityItem> {
  late Future<List<String>?> _imageFuture;
  String formattedLink = '';
  static final Map<String, List<String>> _imageCache = {}; // Cache für Bilder
  @override
  void initState() {
    super.initState();
    // Überprüfe, ob das Bild im Cache vorhanden ist
    if (_imageCache.containsKey(widget.activity.name)) {
      final imageName = _imageCache[widget.activity.name];
      if (imageName != null) {
        widget.activity.imagePaths = imageName;
      }
      _imageFuture =
          Future.value(imageName); // Verwende den Bildnamen für die Future
    } else {
      // Load a placeholder image for places without a wikipedia link
      _imageFuture = widget.activity.wikidataUrl != null
          ? fetchImageAndDescription(widget.activity.wikidataUrl!,
              widget.activity.name, widget.activity.wikidataId!)
          : Future.value([
              CustomImages.destinationImagePlaceholderUrl,
            ]);
    }
  }

  Future<List<String>?> fetchImageAndDescription(
      String formattedLink, String activityName, String wikidataId) async {
    final response = await http.get(Uri.parse(formattedLink));
    final Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;

    final descriptions = data['entities'][wikidataId]['descriptions'];
    //TODO: Check if description is available in other languages
    if (descriptions['en'] != null) {
      widget.activity.description = descriptions['en']['value'] as String;
    }

    final imageUrls = WikidataParser.getImagesFromWikidataEntity(
        data: data, wikidataId: wikidataId);

    // Store image name in cache
    _imageCache[activityName] = imageUrls;

    // Aktualisiere den Bildnamen in der Activity-Instanz
    widget.activity.imagePaths = imageUrls;

    return imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // => context.pushNamed(
        //   ActivitiesRoutes.ApiActivitiesDetailsScreen.name,
        //   extra: widget.activity,
        Navigator.of(context).push(
          MaterialPageRoute<ApiActivitiesDetailsScreen>(
            builder: (BuildContext context) =>
                ApiActivitiesDetailsScreen(activity: widget.activity),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(left: 20, top: 5, bottom: 15, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder<List<String>?>(
              future: _imageFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(
                    color: CustomColors.primary,
                  );
                } else if (snapshot.hasError) {
                  return Text('Fehler: ${snapshot.error}');
                } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return Image.network(
                    //Wikipedia entry but no picture
                    CustomImages.destinationImagePlaceholderUrl,
                    height: 125,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                } else {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.network(
                          snapshot.data![0],
                          height: 125,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 6, bottom: 4, left: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.activity.name,
                          style: CustomTextTheme.lightTextTheme.headlineSmall,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              widget.activity.location.country,
                              style: CustomTextTheme.lightTextTheme.bodySmall,
                            ),
                            const SizedBox(width: 5),
                            if (widget.activity.location.city.isNotEmpty)
                              Text(
                                '·',
                                style: CustomTextTheme.lightTextTheme.bodySmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            const SizedBox(width: 5),
                            Text(widget.activity.location.city,
                                style:
                                    CustomTextTheme.lightTextTheme.bodySmall),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//   late Future<String> _imageFuture;
//   String formattedLink = '';

//   Future<String> fetchImage(String activityName) async {
//     final formattedName = activityName.replaceAll(' ', '_');
//     final formattedLink =
//         'https://corsproxy.io/?https://en.wikipedia.org/w/api.php?action=query&titles=$formattedName&prop=pageimages&format=json&pithumbsize=1000';
//     final response = await http.get(Uri.parse(formattedLink));
//     final Map<String, dynamic> data =
//         json.decode(response.body) as Map<String, dynamic>;
//     final pages = data['query']['pages'];
//     final pageId = pages.keys.first;
//     final imageUrl = pages[pageId]['thumbnail']['source'] as String;

//     return imageUrl;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => context.pushNamed(ActivitiesRoutes.activityDetails.name,
//           extra: widget.activity),
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         margin: const EdgeInsets.only(left: 20, top: 5, bottom: 15, right: 20),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: CustomColors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 3,
//               blurRadius: 10,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             FutureBuilder<String>(
//               future: _imageFuture,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const CircularProgressIndicator();
//                 } else if (snapshot.hasError) {
//                   return Text('Fehler: ${snapshot.error}');
//                 } else {
//                   return Stack(
//                     children: [
//                       ClipRRect(
//                         borderRadius: const BorderRadius.only(
//                           topLeft: Radius.circular(10),
//                           topRight: Radius.circular(10),
//                         ),
//                         child: Image.network(
//                           snapshot.data!,
//                           height: 125,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(top: 6, bottom: 4, left: 20, right: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     widget.activity.name,
//                                     style: CustomTextTheme.lightTextTheme.headlineSmall,
//                                   ),
//                                   Row(
//                                     children: <Widget>[
//                                       Text(
//                                         widget.activity.country,
//                                         style: CustomTextTheme.lightTextTheme.bodySmall,
//                                       ),
//                                       const SizedBox(width: 5),
//                                       if (widget.activity.city.isNotEmpty)
//                                         Text(
//                                           '·',
//                                           style: CustomTextTheme.lightTextTheme.bodySmall!
//                                               .copyWith(fontWeight: FontWeight.bold),
//                                         ),
//                                       const SizedBox(width: 5),
//                                       Text(
//                                         widget.activity.city,
//                                         style: CustomTextTheme.lightTextTheme.bodySmall,
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const CircleAvatar(
//                               radius: 18,
//                               backgroundColor: CustomColors.primary,
//                               foregroundColor: CustomColors.white,
//                               child: Text('5.0'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
