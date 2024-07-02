import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

PlaceOfWarshipDatasheet tottenham =
    PlaceOfWarshipDatasheet('Tottenham', 3, const LatLng(51.517950, -0.131340));

PlaceOfWarshipDatasheet croydon =
    PlaceOfWarshipDatasheet('Croydon', 4, const LatLng(51.375200, -0.097170));

PlaceOfWarshipDatasheet bromley =
    PlaceOfWarshipDatasheet('Bromley', 4, const LatLng(51.402770, 0.017240));

PlaceOfWarshipDatasheet knightsbridge = PlaceOfWarshipDatasheet(
    'Knightsbridge', 5, const LatLng(51.514110, 0.583410));

List<PlaceOfWarshipDatasheet> placesOfWarship = [
  tottenham,
  croydon,
  bromley,
  knightsbridge
];

class PlaceOfWarshipDatasheet {
  String placeName;
  int rating;
  LatLng coordinates;

  PlaceOfWarshipDatasheet(this.placeName, this.rating, this.coordinates);
}

List<Marker> createAllMarkers() {
  List<Marker> listOfMarkers = [];
  for (int i = 0; i < placesOfWarship.length; i++) {
    Marker newMarker = Marker(
      point: placesOfWarship[i].coordinates,
      child: Icon(
        Icons.location_on,
        color: Color.fromARGB(208, 106, 8, 123),
        size: 24.0,
        semanticLabel: placesOfWarship[i].placeName,
      ),
    );
    listOfMarkers.add(newMarker);
  }
  return listOfMarkers;
}

class MapPage extends StatefulWidget {
  MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late List<Marker> listOfAllMarkers;

  @override
  void initState() {
    super.initState();
    listOfAllMarkers = createAllMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 219, 226),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 204, 219, 226),
        //title: Text('Places of Worship for the God Emperor'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1, // Reduce this flex to allocate less space to the list
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: placesOfWarship.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.list),
                        title: Text(placesOfWarship[index].placeName),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(placesOfWarship[index].placeName),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                        'Rating: ${placesOfWarship[index].rating}'),
                                    SizedBox(height: 10),
                                    Text(
                                        'Coordinates: ${placesOfWarship[index].coordinates.latitude}, ${placesOfWarship[index].coordinates.longitude}'),
                                  ],
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Close'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CreateWorshipPopUp();
                        },
                      ).then((_) {
                        setState(() {
                          // Call createAllMarkers again to update the markers
                          listOfAllMarkers = createAllMarkers();
                          print(listOfAllMarkers.length);
                        });
                      });
                    },
                    child: Text('Add a place of Worship'),
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(
            width: 1,
            color: const Color.fromARGB(255, 204, 219, 226),
          ),
          Expanded(
            flex: 3, // Increase this flex to allocate more space to the map
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(51.5, -0.09),
                initialZoom: 13.0,
              ),
              nonRotatedChildren: [
                RichAttributionWidget(
                  attributions: [
                    TextSourceAttribution(
                      'OpenStreetMap contributors',
                      onTap: () => launchUrl(
                        Uri.parse('https://www.openstreetmap.org/copyright'),
                      ),
                    )
                  ],
                )
              ],
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(markers: listOfAllMarkers)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreateWorshipPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController textFieldController1 = TextEditingController();
    TextEditingController textFieldController2 = TextEditingController();
    TextEditingController textFieldController3 = TextEditingController();
    TextEditingController textFieldController4 = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 219, 226),
      appBar: AppBar(
        title: Text('Popup Enter a Place of Worship into our Databanks'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Popup Title'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: textFieldController1,
                        decoration: const InputDecoration(
                            labelText:
                                'Please Enter the longitude of your place of Worship'),
                      ),
                      TextField(
                        controller: textFieldController2,
                        decoration: const InputDecoration(
                            labelText:
                                'Please enter the latitude of your place of Worship'),
                      ),
                      TextField(
                        controller: textFieldController3,
                        decoration: const InputDecoration(
                            labelText: 'Your rating of the place of Worship'),
                      ),
                      TextField(
                        controller: textFieldController4,
                        decoration: const InputDecoration(
                            labelText: 'Name of the Place of Worship'),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        LatLng coordinates = LatLng(
                            double.parse(textFieldController1.text),
                            double.parse(textFieldController2.text));

                        int placeRating = int.parse(textFieldController3.text);
                        String placeName = textFieldController4.text;
                        var userPlaceOfWorship = PlaceOfWarshipDatasheet(
                            placeName, placeRating, coordinates);
                        placesOfWarship.add(userPlaceOfWorship);
                        Navigator.of(context).pop();
                      },
                      child: Text('Confirm'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Open Popup'),
        ),
      ),
    );
  }
}
