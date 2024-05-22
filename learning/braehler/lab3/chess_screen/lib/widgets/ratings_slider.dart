import 'package:chess_screen/widgets/rating_tile.dart';
import 'package:flutter/material.dart';

class RatingsSlider extends StatelessWidget {
  const RatingsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 16),
          RatingTile(
              title: 'Blitz',
              rating: '360',
              image: Image.asset('assets/homepage/rating/blitz.jpg')),
          const SizedBox(width: 16),
          RatingTile(
              title: 'Schnellschach',
              rating: '810',
              image: Image.asset('assets/homepage/rating/rapid.jpg')),
          const SizedBox(width: 16),
          RatingTile(
              title: 'Bullet',
              rating: '515',
              image: Image.asset('assets/homepage/rating/bullet.jpg')),
          const SizedBox(width: 16),
          RatingTile(
              title: 'Täglich',
              rating: '911',
              image: Image.asset('assets/homepage/rating/sun.jpg')),
          const SizedBox(width: 16),
          RatingTile(
              title: 'Alle',
              rating: 'Statistiken',
              image: Image.asset('assets/homepage/rating/statistics.jpg')),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
