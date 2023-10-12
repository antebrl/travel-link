import 'package:flutter/material.dart';

import '../constants/breakpoint.dart';

class TwoPanelWidget extends StatelessWidget {
  const TwoPanelWidget({
    required this.firstPanel,
    required this.secondPanel,
    super.key,
  });
  final Widget firstPanel;
  final Widget secondPanel;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isWideScreen = screenSize.width > Breakpoint.tablet;

    if (isWideScreen) {
      // Display master and detail side by side
      return Row(
        children: [
          Expanded(
            flex: 2,
            child: firstPanel,
          ),
          Expanded(
            flex: 2,
            child: secondPanel,
          ),
        ],
      );
    } else {
      // Display master and detail vertically
      return Column(
        children: [
          Expanded(
            flex: 2,
            child: firstPanel,
          ),
          Expanded(
            flex: 2,
            child: secondPanel,
          ),
        ], // Display the first item initially
      );
    }
  }
}
