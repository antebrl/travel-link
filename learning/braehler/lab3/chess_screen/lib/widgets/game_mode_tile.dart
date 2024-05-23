import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameModeTile extends StatelessWidget {
  const GameModeTile(
      {super.key,
      required this.title,
      required this.image,
      required this.description,
      required this.child,
      this.descriptionIcon});

  final Image image;
  final String title;
  final Icon? descriptionIcon;
  final String description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 18,
        ),
        SizedBox(height: 130, child: image),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 12,
            ),
            Text(
              title,
              style: GoogleFonts.montserratAlternates(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                if (descriptionIcon != null) descriptionIcon!,
                const SizedBox(
                  width: 5,
                ),
                Text(
                  description,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            child,
          ],
        ),
      ],
    );
  }
}
