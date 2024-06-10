import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_link/src/features/activities/3_activities_screen/domain/api_activity.dart';
import 'package:travel_link/src/features/activities/5_activities_details_screen/api_activities_details_screen.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/theme/widget_themes/text_theme.dart';

class SmallActivityItem extends StatefulWidget {
  const SmallActivityItem({required this.activity, super.key});
  final ApiActivity activity;

  @override
  State<SmallActivityItem> createState() => _SmallActivityItemState();
}

class _SmallActivityItemState extends State<SmallActivityItem> {
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
        'https://en.wikipedia.org/w/api.php?action=query&titles=$formattedName&prop=pageimages&format=json&pithumbsize=1000';
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
            if (widget.activity.imagePaths.isEmpty ||
                widget.activity.imagePaths[0].isEmpty)
              FutureBuilder<String>(
                future: _imageFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                      height: 100,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (snapshot.hasError) {
                    return const SizedBox(
                      height: 100,
                      child: Center(child: Icon(Icons.error)),
                    );
                  } else {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.network(
                        snapshot.data!,
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  }
                },
              )
            else
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  widget.activity.imagePaths[0],
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.activity.name,
                    style: CustomTextTheme.lightTextTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold, color: CustomColors.black),
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
