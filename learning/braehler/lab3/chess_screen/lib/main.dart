import 'package:chess_screen/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leadingWidth: 105,
          leading:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 15),
              SizedBox(height: 38,child: Image.asset('assets/appBar-top/profile.jpg')),
              const SizedBox(width: 15),
              SizedBox(height: 30,child: Image.asset('assets/appBar-top/leagues.jpg')),
            ],
          ),
          centerTitle: true,
          title: SizedBox(
              height: 40,
            child: Image.asset('assets/appBar-top/chessCom-logo.jpg')),
          actions: [
            SizedBox(height: 33,child: Image.asset('assets/appBar-top/friends-action.jpg')),
            const SizedBox(width: 20),
          ],
          backgroundColor: const Color(0xFF252422),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          backgroundColor: const Color(0xFF252422),
          showUnselectedLabels: true,
          unselectedItemColor:const Color(0xFF7D7C7A),
          selectedItemColor: const Color(0xFF739850),
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(height: 25, child: Image.asset('assets/navBar-bottom/startseite.jpg')),
              activeIcon: SizedBox(height: 25, child: Image.asset('assets/navBar-bottom/selected-startseite.png')),
              label: 'Startseite',
              backgroundColor: const Color(0xFF252422),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(height: 25, child: Image.asset('assets/navBar-bottom/taktikaufgaben.jpg')),
              label: 'Taktikaufgaben',
              backgroundColor: const Color(0xFF252422),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(height: 25, child: Image.asset('assets/navBar-bottom/lernen.jpg')),
              label: 'Lernen',
              backgroundColor: const Color(0xFF252422),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(height: 25, child: Image.asset('assets/navBar-bottom/anschauen.jpg')),
              label: 'Anschauen',
              backgroundColor: const Color(0xFF252422),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(height: 25, child: Image.asset('assets/navBar-bottom/mehr.jpg')),
              label: 'Mehr',
              backgroundColor: const Color(0xFF252422),
            ),
          ],
        ),
        body: Center(
          child: Homepage(),
        ),
      ),
    );
  }
}
