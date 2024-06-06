import 'package:flutter/material.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class TripPrivacyInformationDialog extends StatelessWidget {
  const TripPrivacyInformationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: CustomColors.primary.withOpacity(0.6),
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Who can join this trip?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.public,
                  color: Colors.blue,
                ),
                title: Text(
                  'Public',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Meet new people in a public trip. A public trip is visible to all users. Everybody can join if it is not full.',
                ),
              ),
              const SizedBox(height: 5),
              const Divider(
                height: 0,
                color: Colors.grey,
              ),
              const ListTile(
                leading: Icon(
                  Icons.lock_outline,
                  color: Colors.blue,
                ),
                title: Text(
                  'Private',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'A private trip is only accessible to invited participants. It is not visible to other users unless they are invited.',
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
          Positioned(
            top: -7,
            right: -7,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.close,
                  weight: 150,
                  size: 27,
                  color: CustomColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
