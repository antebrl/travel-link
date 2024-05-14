import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:travel_link/src/features/trip_overview/domain/picture_post.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/formatters/formatter.dart';

class FullscreenPicture extends StatelessWidget {
  const FullscreenPicture({required this.picturePost, super.key});

  final PicturePost picturePost;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
          imageUrl: picturePost.picture,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black54,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 23,
                    backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        picturePost.username ?? 'Anonym User',
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: CustomColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                      Text(
                        CustomFormatter.formatDate(picturePost.timestamp),
                        style: context.textTheme.bodySmall?.copyWith(
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  picturePost.description,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 30, 0, 0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: CustomColors.primary,
              iconSize: 50,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ],
    );
  }
}
