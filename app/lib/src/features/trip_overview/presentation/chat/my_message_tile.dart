import 'package:flutter/material.dart';
import 'package:travel_link/src/utils/formatters/formatter.dart';

class MyMessageTile extends StatelessWidget {
  const MyMessageTile.first({
    required this.message,
    required this.timestamp,
    super.key,
  }) : isFirstInSequence = true;

  const MyMessageTile.next({
    required this.message,
    required this.timestamp,
    super.key,
  }) : isFirstInSequence = false;

  final String message;
  final DateTime? timestamp;
  final bool isFirstInSequence;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              message,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        if (timestamp != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 2),
            child: Text(
              CustomFormatter.formatDate(timestamp!),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
