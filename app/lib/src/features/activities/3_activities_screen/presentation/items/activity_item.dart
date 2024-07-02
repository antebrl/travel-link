import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_link/src/features/activities/3_activities_screen/domain/activity.dart';
import 'package:travel_link/src/features/activities/5_activities_details_screen/api_activities_details_screen.dart';
import 'package:travel_link/src/utils/constants/colors.dart';
import 'package:travel_link/src/utils/helpers/localization.dart';
import 'package:travel_link/src/utils/theme/widget_themes/text_theme.dart';

class ActivityItem extends StatefulWidget {
  const ActivityItem({required this.activity, super.key});
  final Activity activity;

  @override
  State<ActivityItem> createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {
  late Future<String> _imageFuture;
  String formattedLink = '';
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
            if (widget.activity.image == null)
              FutureBuilder<String>(
                future: _imageFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('${context.loc.error} ${snapshot.error}');
                  } else {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.network(
                        snapshot.data!,
                        height: 125,
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
                child: Image.file(
                  widget.activity.image!,
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
                                style: CustomTextTheme.lightTextTheme.bodySmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            const SizedBox(width: 5),
                            Text(
                              widget.activity.location.city,
                              style: CustomTextTheme.lightTextTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
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
