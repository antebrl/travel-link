import 'package:flutter/material.dart';

class PreviewTile extends StatelessWidget {
  const PreviewTile({required this.title, required this.preview, required this.detailsPageBuilder, super.key});

  final String title;
  final Widget preview;
  final WidgetBuilder detailsPageBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: detailsPageBuilder,
              ),
            );
          },
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 16,
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        preview,
      ],
    );
  }
}
