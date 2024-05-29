import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_link/src/features/explore_trips/presentation/public_trip_card.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class ExploreTripsScreen extends StatelessWidget {
  const ExploreTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            titleSpacing: 0,
            centerTitle: true,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 15,),
                const Text('Entdecke Reisen', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.keyboard_arrow_down_sharp, size: 17, color: Colors.grey[800],),
                    const Text('Bevorstehend', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          backgroundColor: CustomColors.primaryBackground,
          elevation: 0,
          leadingWidth: 130,
          leading: Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 5, 0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  children: [
                    Icon(Icons.location_on, color: Colors.blueAccent[200], size: 22,),
                    Expanded(child: Text('Germany', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[800],fontSize: 15),)),
                  ],
                ),
              ),
            ),
          actions: [
            SizedBox(
              width: 130,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 8, 10, 0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    children: [
                      Icon(Icons.calendar_month_rounded, color: Colors.blueAccent[200], size: 25,),
                      Text('15/12 - 30/12', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800], fontSize: 13),),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        body: PublicTripCard(),
    );
  }
}
