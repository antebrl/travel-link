import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/activities/5_activities_details_screen/api_activities_details_screen.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/theme/widget_themes/text_theme.dart';

class HorizontalActivityItem extends StatefulWidget {
  const HorizontalActivityItem({required this.activity, super.key});
  final Activity activity;

  @override
  State<HorizontalActivityItem> createState() => _HorizontalActivityItemState();
}

class _HorizontalActivityItemState extends State<HorizontalActivityItem> {
  late Future<String> _imageFuture;
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
      _imageFuture = Future.value(imageName);
    } else {
      _imageFuture = fetchImage(widget.activity.name);
    }
  }

  Future<String> fetchImage(String activityName) async {
    final formattedName = activityName.replaceAll(' ', '_');
    final formattedLink =
        'https://en.wikipedia.org/w/api.php?action=query&titles=$formattedName&prop=pageimages&format=json&pithumbsize=1000&origin=*';
    final response = await http.get(Uri.parse(formattedLink));
    final Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    final pages = data['query']['pages'];
    final pageId = pages.keys.first;
    final imageUrl = pages[pageId]['thumbnail']['source'] as String;

    _imageCache[activityName] = imageUrl;

    setState(() {
      widget.activity.imagePaths[0] = imageUrl;
    });

    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<ApiActivitiesDetailsScreen>(
            builder: (BuildContext context) =>
                ApiActivitiesDetailsScreen(activity: widget.activity),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: FutureBuilder<String>(
                future: _imageFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (snapshot.hasError) {
                    return const SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(child: Icon(Icons.error)),
                    );
                  } else {
                    return Image.network(
                      snapshot.data!,
                      height: 100,
                      width: 120,
                      fit: BoxFit.cover,
                    );
                  }
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    widget.activity.name,
                    style: CustomTextTheme.lightTextTheme.bodyMedium!.copyWith(
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
                  const SizedBox(height: 4),
                  Text(
                    'Visitiors last year: ',
                    style: CustomTextTheme.lightTextTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    widget.activity.amountVisitors.toString(),
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
