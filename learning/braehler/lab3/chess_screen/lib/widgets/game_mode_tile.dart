import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameModeTile extends StatelessWidget {
  const GameModeTile({super.key, required this.title, required this.image, required this.description, required this.child});

  final Image image;
  final String title;
  final String description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height: 50, child: Image.asset('assets/homepage/premium.jpg')),
        const SizedBox(width: 11,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 15,),
            Text(title, style: GoogleFonts.montserratAlternates( textStyle: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),),
            Text(description, style: TextStyle(color: Colors.grey, fontSize: 14),),
            child,
          ],
        ),
      ],
    );
  }
}