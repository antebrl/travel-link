import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/account/data/account_repository.dart';
import 'package:travel_link/src/features/explore_trips/domain/trip.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/theme/widget_themes/boxDecoration_theme.dart';

class PublicTripCard extends ConsumerWidget {
  const PublicTripCard({super.key, required this.onTap, required this.trip});

  final VoidCallback onTap;
  final Trip trip;

  // Future<List<String>> _fetchAvatars(WidgetRef ref) async {
  //   final List<String> avatars = [];
  //   var imagesCount = 0;
  //   for (int i=0; i<trip.participants.length && imagesCount < 4; i++) {
  //     final user = ref.watch(FetchUserProvider(trip.participants[i]));
  //     if(user?.pictureUrl != null) {
  //       avatars.add(user!.pictureUrl!);
  //       imagesCount++;
  //     }
  //   }
  //   return avatars;
  // }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        trip.name,
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                          '15/12 - 30/12',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800],
                              fontSize: 17,
                              ),
                                              ),
                          FlutterImageStack(
                                      imageList: [
                          'https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
                          'https://images.unsplash.com/photo-1612594305265-86300a9a5b5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
                          'https://images.unsplash.com/photo-1612626256634-991e6e977fc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1712&q=80',
                          'https://images.unsplash.com/photo-1593642702749-b7d2a804fbcf?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80'
                            ],
                                      extraCountTextStyle: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                      showTotalCount: true,
                                      totalCount: 4,
                                      itemRadius: 40, 
                                      itemCount: 3, //max images to be shown in stack. imageList can contain more or less
                                    ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    //Trip description
                    text: TextSpan(style: 
                    TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                    ),
                    children: const [
                      TextSpan(text: '„', style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.blue),),
                      TextSpan(
                        text: 'Eine spannende Reise nach Japan oder. Tretet bei 👺🗾🏯🍣',
                      ),
                      TextSpan(text: '”', style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.blue)),
                    ],),
                    maxLines: 4,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Container(
                      height: 375,
                      width: 300,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.shade600.withOpacity(0.8),
                          spreadRadius: 0.1,
                          blurRadius: 20,
                          offset: const Offset(1, 5),
                        ),
                      ],
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://media.istockphoto.com/id/1998131648/de/foto/altstadt-von-burghausen-mit-burgberg.jpg?s=1024x1024&w=is&k=20&c=nvlz0e9DkNmf4_84ahASlYZVnGN-7NTKm9L3zppAOZI='),
                        fit: BoxFit.cover,
                      ),
                      ),
                    ),     
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
