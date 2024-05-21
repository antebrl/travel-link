import 'package:chess_screen/widgets/premium_box_widget.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const PremiumBoxWidget(),
        const SizedBox(height: 16),
      ],
    );
  }
}