import 'package:flutter/material.dart';
import 'package:travel_link/src/utils/formatters/formatter.dart';

class ReplyMessageTile extends StatelessWidget {
  const ReplyMessageTile.first({
    //required this.userImage,
    required this.username,
    required this.message,
    required this.timestamp,
    this.authorColor = Colors.blue,
    super.key,
  }) : isFirstInSequence = true;

  const ReplyMessageTile.next({
    required this.message,
    required this.timestamp,
    this.authorColor = Colors.blue,
    super.key,
  })  : isFirstInSequence = false,
        //userImage = null,
        username = null;

  final String? username;
  final String message;
  final DateTime? timestamp;
  final bool isFirstInSequence;
  final Color authorColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isFirstInSequence)
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
              ),
            ),
          )
        else
          const SizedBox(width: 48),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isFirstInSequence)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        10,
                        10,
                        14,
                        5,
                      ),
                      child: Text(
                        username!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: authorColor,
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      16,
                      isFirstInSequence ? 0 : 16,
                      16,
                      16,
                    ),
                    child: Text(
                      message,
                      softWrap: true, // Allow text to wrap
                    ),
                  ),
                ],
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
              )
          ],
        ),
      ],
    );
  }
}
