import 'package:flutter/material.dart';
import 'list_screen.dart'; // Import the ListScreen

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          // Detect swipe left
          if (details.primaryVelocity! < 0) {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const ListScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            );
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'), // thanks to https://app.haikei.app/
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Welcome User!',
                  style: TextStyle(
                    color: Color.fromARGB(255, 216, 65, 18),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/input');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 216, 65, 18),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadowColor: Colors.grey[800],
                  elevation: 3, // Set the shadow size here
                ),
                child: const Text(
                  'Go to text input',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(height: 10), // Add spacing between the buttons
              ElevatedButton(
                onPressed: () {
                  // Define the action for the second button here
                  Navigator.pushNamed(context, '/list');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 34, 150, 243), // Different color for differentiation
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadowColor: Colors.grey[800],
                  elevation: 3, // Set the shadow size here
                ),
                child: const Text(
                  'Go to list view',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
