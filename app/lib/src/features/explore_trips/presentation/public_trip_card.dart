import 'package:flutter/material.dart';

class PublicTripCard extends StatelessWidget {
  const PublicTripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bevorstehend',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.network(
                            'https://placehold.co/600x400/EEE/31343C', // Hier die richtige Bild-URL einfügen
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            color: Colors.white,
                            child: Text(
                              'Tokyo Trip',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tokyo, Japan',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://placehold.co/600x400/EEE/31343C'),
                                radius: 12,
                              ),
                              SizedBox(width: 4),
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://placehold.co/600x400/EEE/31343C'),
                                radius: 12,
                              ),
                              SizedBox(width: 4),
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://placehold.co/600x400/EEE/31343C'),
                                radius: 12,
                              ),
                              SizedBox(width: 4),
                              Text('3/16'),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Eine spannende Reise nach Japan. Tretet bei 🗾🎏🏯🍣',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  SizedBox(width: 4),
                                  Text('4.5'),
                                ],
                              ),
                              Text('Coeurdes Alpes'),
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
        );
  }
}