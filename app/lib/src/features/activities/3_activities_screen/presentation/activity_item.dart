import 'package:flutter/material.dart';
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/theme/widget_themes/text_theme.dart';

class ActivityItem extends StatefulWidget {
  const ActivityItem({required this.activity, super.key});
  final Activity activity;

  @override
  State<ActivityItem> createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      //onTap: () => context.pushNamed(ActivitiesRoutes.activityDetails.name,extra: widget.activity),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(left: 20, top: 5, bottom: 15, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: widget.activity.imageAssetPath.trim().isEmpty
                ? Image.file(
                    widget.activity.image!,
                    height: 125,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    widget.activity.imageAssetPath,
                    height: 125,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 6, bottom: 4, left: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.activity.name,
                          style: CustomTextTheme.lightTextTheme.headlineSmall,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              widget.activity.location.country,
                              style: CustomTextTheme.lightTextTheme.bodySmall,
                            ),
                            const SizedBox(width: 5),
                            if (widget.activity.location.city.isNotEmpty)
                              Text(
                                '·',
                                style:
                                    CustomTextTheme.lightTextTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
                              ),
                            const SizedBox(width: 5),
                            Text(widget.activity.location.city,
                                style:
                                    CustomTextTheme.lightTextTheme.bodySmall),
                          ],
                        )
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 18,
                    backgroundColor: CustomColors.primary,
                    foregroundColor: CustomColors.white,
                    child: Text('5.0'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


