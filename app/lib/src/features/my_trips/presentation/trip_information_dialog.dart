import 'package:flutter/material.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/helpers/localization.dart';

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
                child: Text(
                  context.loc.tripPrivacyInformation,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.public,
                  color: Colors.blue,
                ),
                title: Text(
                  context.loc.public,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  context.loc.publicTripDescription,
                ),
              ),
              const SizedBox(height: 5),
              const Divider(
                height: 0,
                color: Colors.grey,
              ),
              ListTile(
                leading: const Icon(
                  Icons.lock_outline,
                  color: Colors.blue,
                ),
                title: Text(
                  context.loc.private,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  context.loc.privateTripDescription,
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
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 25,
                  icon: const Icon(
                    Icons.close,
                    weight: 150,
                    color: CustomColors.primary,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
