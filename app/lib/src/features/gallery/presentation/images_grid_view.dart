import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travel_link/src/features/gallery/domain/picture_post.dart';
import 'package:travel_link/src/features/gallery/presentation/fullscreen_picture.dart';

class ImagesGridView extends StatelessWidget {
  const ImagesGridView({super.key, required this.images});

  final List<PicturePost> images;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: MasonryGridView.count(
        crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(seconds: 2),
            child: SlideAnimation(
              child: FadeInAnimation(
                child: GestureDetector(
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<FullscreenPicture>(
                          builder: (context) => FullscreenPicture(
                            picturePost: images[index],
                          ),
                        ),
                      );
                    },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: images[index].picture,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
