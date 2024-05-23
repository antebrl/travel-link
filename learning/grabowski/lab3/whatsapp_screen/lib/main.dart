import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatelessWidget {
  const WhatsAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "WhatsApp",
            style: TextStyle(
              color: Color(0xFF1BA760),
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Color(0xFF191e24),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Color(0xFF191e24),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Color(0xFF191e24),
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: const ChatList(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {},
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'chat_icon.png',
                height: 70,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'aktuelles_icon.png',
                height: 70,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'communities_icon.png',
                height: 70,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'anrufe_icon.png',
                height: 70,
              ),
              label: '',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF21AA62),
          child: Image.asset(
            'chat2_icon.png',
            height: 32,
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      itemCount: 20,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    "profilepic.jpg",
                    height: 65,
                    width: 65,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Hello, how are you?',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "10:00",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF3A9666),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 23,
                      height: 23,
                      decoration: BoxDecoration(
                        color: const Color(0xFF20A961),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "1",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
