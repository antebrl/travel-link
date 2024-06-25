import 'package:flutter/material.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/activities/5_activities_details_screen/api_activities_details_screen.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/constants/image_strings.dart';
import 'package:travel_link/src/utils/theme/widget_themes/text_theme.dart';

class TripActivityItem extends StatefulWidget {
  const TripActivityItem(
      {required this.activity, required this.tripId, super.key});
  final Activity activity;
  final String tripId;

  @override
  State<TripActivityItem> createState() => _TripActivityItemState();
}

class _TripActivityItemState extends State<TripActivityItem> {
  static final Map<String, String> _imageCache = {};

  @override
  void initState() {
    super.initState();
    if (_imageCache.containsKey(widget.activity.name)) {
      final imageName = _imageCache[widget.activity.name];
      if (imageName != null) {
        setState(() {
          widget.activity.imagePaths[0] = imageName;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<ApiActivitiesDetailsScreen>(
            builder: (BuildContext context) => ApiActivitiesDetailsScreen(
              activity: widget.activity,
              addedTrip: widget.tripId,
            ),
          ),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                widget.activity.imagePaths.isNotEmpty
                    ? widget.activity.imagePaths[0]
                    : CustomImages.tripDestinationImagePlaceholderUrl,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.activity.name,
                    style: CustomTextTheme.lightTextTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: CustomColors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${widget.activity.location.country}${widget.activity.location.city.isNotEmpty ? ' · ${widget.activity.location.city}' : ''}',
                    style: CustomTextTheme.lightTextTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
