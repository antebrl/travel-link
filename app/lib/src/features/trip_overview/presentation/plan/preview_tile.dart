import 'package:flutter/material.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class PreviewTile extends StatelessWidget {
  const PreviewTile({
    required this.title,
    required this.preview,
    required this.detailsPageBuilder,
    this.showAsModalSheet = false,
    super.key,
  });

  final String title;
  final Widget preview;
  final WidgetBuilder detailsPageBuilder;
  final bool showAsModalSheet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: () {
                if (showAsModalSheet) {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: detailsPageBuilder,
                  );
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: detailsPageBuilder,
                  ),
                );
              },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(width: 3),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColors.primary,
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: 5),
            preview,
          ],
        ),
      ),
    );
  }
}
