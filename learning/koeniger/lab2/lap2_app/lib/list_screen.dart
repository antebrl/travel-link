import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontFamily: 'LibreFranklin', // Use Libre Franklin for large text
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontFamily: 'LibreFranklin', // Use Libre Franklin for medium text
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Investments',
            style: TextStyle(
              fontFamily: 'LibreFranklin', // Use Libre Franklin for the AppBar title
            ),
          ),
        ),
        body: _buildList(),
      ),
    );
  }

  Widget _buildList() {
  return ListView(
    children: [
      _tile('Core MSCI World', '2743,83€', 'assets/msci_world.png', true),
      _tile('Realty Income', '623,48€', 'assets/realty_income.png', false),
      _tile('Microsoft', '353,34€', 'assets/microsoft.png', true),
      _tile('Apple', '323,45€', 'assets/apple.jpg', false),
      _tile('3M', '243,34€', 'assets/3m.png', true),
      _tile('Unilever', '234,58€', 'assets/uniliever.png', false),
      _tile('Amazon', '167,37€', 'assets/amazon.png', true),
      _tile('Nike', '83,34€', 'assets/nike.png', false),
    ],
  );
}

ListTile _tile(String title, String subtitle, String imagePath, bool isGreen) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    subtitle: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Text(
          isGreen ? '+12.5%' : '-8.2%',
          style: TextStyle(
            color: isGreen ? Colors.green : Colors.red, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    leading: Image.asset(
      imagePath,
      width: 40,
      height: 40,
      fit: BoxFit.cover,
      ),
    );
  }
}
