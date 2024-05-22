import 'package:flutter/material.dart';

class RatingTile extends StatelessWidget {
  const RatingTile({super.key, required this.title, required this.rating, required this.image});

  final String title;
  final String rating;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 85,
                decoration: BoxDecoration(
                  color: const Color(0xFF252422),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14),),
                      const SizedBox(height: 8,),
                      SizedBox(height: 25, child: image),
                      const SizedBox(height: 8,),
                      Text(rating, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                      const SizedBox(width: 55,),
                    ],
                  ),
                ),);
  }
}