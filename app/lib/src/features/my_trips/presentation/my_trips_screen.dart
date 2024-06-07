import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_link/src/features/my_trips/data/my_trips_repository.dart';
import 'package:travel_link/src/features/my_trips/presentation/create_trip_screen.dart';
import 'package:travel_link/src/features/my_trips/presentation/my_trip_tile.dart';
import 'package:travel_link/src/utils/logging/logger.dart';

class MyTripsScreen extends ConsumerWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchedTrips = ref.watch(fetchMyTripsProvider);

            return Container(
      width: 360,
      height: 640,
      decoration: BoxDecoration(
          color : Color.fromRGBO(242, 245, 247, 1),
  ),
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 589,
        left: 0,
        child: Container(
      width: 360,
      height: 51,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 360,
        height: 51,
        decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
  )
      )
      ),Positioned(
        top: 9,
        left: 0,
        child: Container(
      decoration: BoxDecoration(
          
  ),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          Container(
      width: 39,
      height: 34,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 18,
        left: 0,
        child: Text('Home', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 8,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 0,
        left: 11,
        child: Container(
      width: 17,
      height: 17,
      decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
  ),
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Placeholder(),
      ),Positioned(
        top: 2.125,
        left: 1.4167004823684692,
        child: Placeholder(),
      ),
        ]
      )
    )
      ),
        ]
      )
    ), SizedBox(width : 50),
Container(
      width: 39,
      height: 34,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 18,
        left: 0,
        child: Text('Home', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 8,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 0,
        left: 11,
        child: Container(
      width: 17,
      height: 17,
      decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
  ),
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Placeholder(),
      ),Positioned(
        top: 2.125,
        left: 1.4167004823684692,
        child: Placeholder(),
      ),
        ]
      )
    )
      ),
        ]
      )
    ), SizedBox(width : 50),
Container(
      width: 39,
      height: 34,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 18,
        left: 0,
        child: Text('Home', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 8,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 0,
        left: 11,
        child: Container(
      width: 17,
      height: 17,
      decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
  ),
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Placeholder(),
      ),Positioned(
        top: 2.125,
        left: 1.4167004823684692,
        child: Placeholder(),
      ),
        ]
      )
    )
      ),
        ]
      )
    ), SizedBox(width : 50),
Container(
      width: 39,
      height: 34,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 18,
        left: 0,
        child: Text('Home', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 8,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 0,
        left: 11,
        child: Container(
      width: 17,
      height: 17,
      decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
  ),
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Placeholder(),
      ),Positioned(
        top: 2.125,
        left: 1.4167004823684692,
        child: Placeholder(),
      ),
        ]
      )
    )
      ),
        ]
      )
    ),

        ],
      ),
    )
      ),
        ]
      )
    )
      ),Positioned(
        top: 278,
        left: 35,
        child: Container(
      width: 292,
      height: 136,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 14,
        child: Container(
        width: 278,
        height: 136,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
      color : Color.fromRGBO(255, 255, 255, 1),
  )
      )
      ),Positioned(
        top: 11,
        left: 0,
        child: Container(
        width: 91,
        height: 114,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
      boxShadow : [BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.20000000298023224),
          offset: Offset(2,3),
          blurRadius: 4
      )],
      image : DecorationImage(
          image: AssetImage('assets/activities/camp-nou.jpg'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),Positioned(
        top: 7,
        left: 110,
        child: Container(
      width: 111,
      height: 48,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 25,
        left: 12,
        child: Text('Tokyo, Japan', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 0.699999988079071),
        fontFamily: 'Poppins',
        fontSize: 15,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 0,
        left: 0,
        child: Text('Tokyo Trip', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(54, 53, 53, 1),
        fontFamily: 'Poppins',
        fontSize: 19,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),
        ]
      )
    )
      ),Positioned(
        top: 65,
        left: 106,
        child: Container(
        width: 109,
        height: 30,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/activities/camp-nou.jpg'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),Positioned(
        top: 104,
        left: 110,
        child: Container(
      width: 62,
      height: 22,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 62,
        height: 22,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
      color : Color.fromRGBO(194, 221, 237, 0.7900000214576721),
  )
      )
      ),Positioned(
        top: 1.047619104385376,
        left: 13,
        child: Text('13/06', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 13,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),
        ]
      )
    )
      ),Positioned(
        top: 105,
        left: 184,
        child: Container(
      width: 62,
      height: 21,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 62,
        height: 21,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
      color : Color.fromRGBO(194, 221, 237, 0.7900000214576721),
  )
      )
      ),Positioned(
        top: 1,
        left: 13,
        child: Text('17/06', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 13,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),
        ]
      )
    )
      ),Positioned(
        top: 31,
        left: 106,
        child: Container(
        width: 16,
        height: 23,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/activities/camp-nou.jpg'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),
        ]
      )
    )
      ),Positioned(
        top: 238,
        left: 19,
        child: Text('Geplante Reisen', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(65, 169, 227, 1),
        fontFamily: 'Inter',
        fontSize: 24,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 449,
        left: 19,
        child: Text('Vergangene Reisen', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(65, 169, 227, 1),
        fontFamily: 'Inter',
        fontSize: 24,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 511,
        left: 304,
        child: Container(
      width: 49,
      height: 64,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 16,
        left: 0,
        child: Container(
        width: 49,
        height: 48,
        decoration: BoxDecoration(
          color : Color.fromRGBO(65, 169, 227, 1),
      borderRadius : BorderRadius.all(Radius.elliptical(49, 48)),
  )
      )
      ),Positioned(
        top: 0,
        left: 5,
        child: Text('+', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'Inter',
        fontSize: 60,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),
        ]
      )
    )
      ),Positioned(
        top: 492,
        left: -76,
        child: Text('keine vergangenen Reisen', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(51, 49, 49, 0.25999999046325684),
        fontFamily: 'Inter',
        fontSize: 20,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 71,
        left: -33,
        child: Container(
      width: 371.73944091796875,
      height: 159,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 53,
        child: Container(
        width: 318.73944091796875,
        height: 159,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
      image : DecorationImage(
          image: AssetImage('assets/activities/camp-nou.jpg'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),Positioned(
        top: 4,
        left: 0,
        child: Text('Japan Trip booys', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'Inter',
        fontSize: 24,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),Positioned(
        top: 122,
        left: 64,
        child: Container(
      decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(66.84574127197266),
            topRight: Radius.circular(66.84574127197266),
            bottomLeft: Radius.circular(66.84574127197266),
            bottomRight: Radius.circular(66.84574127197266),
          ),
      color : Color.fromRGBO(76, 86, 82, 1),
  ),
      padding: EdgeInsets.symmetric(horizontal: 13.595744132995605, vertical: 4.531914710998535),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        
        children: <Widget>[
          Text('Tokyo, Japan', textAlign: TextAlign.left, style: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'Adamina',
        fontSize: 13,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),),

        ],
      ),
    )
      ),
        ]
      )
    )
      ),Positioned(
        top: 263.9929504394531,
        left: -246.91555786132812,
        child: Placeholder(),
      ),Positioned(
        top: 199,
        left: 248,
        child: Container(
        width: 79,
        height: 26,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/activities/camp-nou.jpg'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),Positioned(
        top: 0,
        left: 290,
        child: Container(
        width: 66,
        height: 66,
        decoration: BoxDecoration(
          image : DecorationImage(
          image: AssetImage('assets/activities/camp-nou.jpg'),
          fit: BoxFit.fitWidth
      ),
  )
      )
      ),Positioned(
        top: 271,
        left: 270,
        child: Container(
      width: 67,
      height: 22,
      
      child: Stack(
        children: <Widget>[
          Positioned(
        top: 0,
        left: 0,
        child: Container(
        width: 67,
        height: 22,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
      color : Color.fromRGBO(34, 40, 71, 0.7300000190734863),
  )
      )
      ),Positioned(
        top: 2,
        left: 6,
        child: Text('3 Days left', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'Poppins',
        fontSize: 11,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),
        ]
      )
    )
      ),Positioned(
        top: 11,
        left: 85,
        child: Text('Meine Reisen', textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Poppins',
        fontSize: 29,
        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.normal,
        height: 1
      ),)
      ),
        ]
      )
    );
        
    
  //   return fetchedTrips.when(
  //     data: (trips) {
  //       return Scaffold(
  //         appBar: AppBar(
  //           title: const Text('My Trips'),
  //         ),
  //         body: ListView.builder(
  //           itemCount: trips.length,
  //           itemBuilder: (context, index) {
  //             final trip = trips[index];
  //             return MyTripTile(
  //               trip: trip,
  //             );
  //           },
  //         ),
  //         floatingActionButton: FloatingActionButton(
  //           onPressed: () {
  //             showModalBottomSheet<void>( //specifies type of information the bottom sheet will return
  //               context: context,
  //               isScrollControlled: true,
  //               builder: (context) => const CreateTripScreen(),
  //             );
  //           },
  //           child: const Icon(Icons.add),
  //         ),
  //       );
  //     },
  //     loading: () => Scaffold(
  //       appBar: AppBar(
  //         title: const Text('My Trips'),
  //       ),
  //       body: const Center(
  //         child: CircularProgressIndicator(),
  //       ),
  //     ),
  //     error: (error, stackTrace) {
  //       logger.e('Error loading trips', error: error, stackTrace: stackTrace);
  //       return Scaffold(
  //         appBar: AppBar(
  //           title: const Text('My Trips'),
  //         ),
  //         body: const Center(
  //           child: Text('Error loading trips. Please try again later.'),
  //         ),
  //       );
  //     }
  //   );
  // }
}
}
