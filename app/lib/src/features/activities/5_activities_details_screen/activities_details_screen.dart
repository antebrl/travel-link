// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
// import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';
// import 'package:travel_link/src/utils/constants/colors.dart';

// class ActivitiesDetailsScreen extends StatelessWidget {
//   const ActivitiesDetailsScreen({required this.activity, super.key});

//   final ApiActivity activity;

//   FlutterMap _createMap(double latitude, double longitude) {
//     return FlutterMap(
//       key: UniqueKey(),
//       options: MapOptions(
//         initialCenter: LatLng(latitude, longitude),
//         // Disable all user interactions
//       ),
//       children: [
//         openStreetMapTileLater,
//         MarkerLayer(
//           markers: [
//             Marker(
//               point: LatLng(latitude, longitude),
//               child: const Icon(
//                 Icons.location_pin,
//                 size: 40,
//                 color: CustomColors.primary,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   TileLayer get openStreetMapTileLater => TileLayer(
//         urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//         userAgentPackageName: 'dev.fleaflet.flutter_map.exaple',
//       );

//   @override
//   Widget build(BuildContext context) {
//     Widget content;

//     content = _createMap(activity.location.lat, activity.location.lon);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           activity.name,
//         ),
//       ),
//       body: Stack(
//         children: [
//           // Bild oben auf der Seite
//           Positioned(
//             top: -3,
//             left: 0,
//             right: 0,
//             height: 250, // Höhe des Bildes anpassen
//             child: activity.imagePaths.isEmpty
//                 ? Image.file(
//                     activity.image!,
//                     height: 200,
//                     width: double.infinity,
//                     fit: BoxFit.fill,
//                   )
//                 : Image.network(
//                     activity.imagePaths[0],
//                     height: 200,
//                     width: double.infinity,
//                     fit: BoxFit.fill,
//                   ),
//           ),
//           // if (activity.isUserCreated)
//           //   Positioned(
//           //     top: 10,
//           //     right: 10,
//           //     child: Container(
//           //       padding: const EdgeInsets.all(5),
//           //       decoration: BoxDecoration(
//           //         color: CustomColors.black.withOpacity(0.5),
//           //         borderRadius: BorderRadius.circular(5),
//           //       ),
//           //       child: const Text(
//           //         'Created by User',
//           //         style: TextStyle(
//           //           color: CustomColors.white,
//           //           fontSize: 14,
//           //         ),
//           //       ),
//           //     ),
//           //   ),

//           // Weiße Fläche mit abgerundeten Ecken und Schatten
//           Positioned(
//             top: 200, // Startpunkt für die weiße Fläche
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: const BorderRadius.vertical(
//                   top: Radius.circular(20),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Center(
//                           child: Text(
//                             'Explore: ${activity.name}',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headlineSmall!
//                                 .copyWith(
//                                   color: CustomColors.primary,
//                                   fontSize: 20,
//                                 ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         Text(
//                           'Description: ',
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyLarge!
//                               .copyWith(color: CustomColors.primary),
//                         ),
//                         Text(activity.description),
//                         const SizedBox(height: 10),
//                         Text(
//                           'Location: ',
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyLarge!
//                               .copyWith(color: CustomColors.primary),
//                         ),
//                         Text(
//                           '${activity.location.formatted}',
//                           style: Theme.of(context).textTheme.bodyLarge,
//                         ),
//                         const SizedBox(height: 10),
//                         Container(
//                           height: 250,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               width: 5,
//                               color: CustomColors.primary.withOpacity(0.5),
//                             ),
//                           ),
//                           alignment: Alignment.center,
//                           child: content,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
