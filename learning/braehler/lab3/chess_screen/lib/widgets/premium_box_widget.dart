import 'package:chess_screen/widgets/cutout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumBoxWidget extends StatelessWidget {
  const PremiumBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 370,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: 365,
              decoration: BoxDecoration(
                color: const Color(0xFF0096C5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    SizedBox(
                        height: 50,
                        child: Image.asset('assets/homepage/premium.jpg')),
                    const SizedBox(
                      width: 11,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Premium testen',
                          style: GoogleFonts.montserratAlternates(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Text(
                          'Spiele dein bestes Schach!',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Align(
                alignment: Alignment.topRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Cutout(
                    color: Colors.white.withOpacity(0.7),
                    child: const Icon(Icons.close,
                        weight: 150, size: 19, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
