import 'package:chess_screen/widgets/game_mode_tile.dart';
import 'package:chess_screen/widgets/premium_box_widget.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        const PremiumBoxWidget(),
        const SizedBox(height: 16),
        Expanded(
          child: ListView(
            children: [
              GameModeTile(title: 'Online spielen', image: Image.asset('assets/homepage/standard-board.jpg'), description: '10 Min gegen Zufallsgegner', 
            child: Row(
              children: [
                const SizedBox(width: 7),
                SizedBox(height: 32,child: Image.asset('assets/homepage/victory.jpg'),),
                const SizedBox(width: 9),
                const Text('#14', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900),),
              ],
            )
          ),
          const SizedBox(height: 14,),
          GameModeTile(title: 'Rätsel lösen', image: Image.asset('assets/homepage/puzzle-board.jpg'), description: 'Beginn deine Reise!', 
            child: Row(
              children: [
                const SizedBox(width: 4),
                SizedBox(height: 42,child: Image.asset('assets/homepage/solved-puzzles.jpg'),),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('0', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900),),
                        SizedBox(width: 90,),
                        SizedBox(height: 25,child: Image.asset('assets/homepage/next-puzzles.jpg'),),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Container(
                      height: 15,
                      width: 128,
                      decoration: BoxDecoration(
                  color: const Color(0xFF464241),
                  borderRadius: BorderRadius.circular(12),
                ),
                    )
                  ],
                ),
              ],
            )
          ),
          const SizedBox(height: 14,),
          GameModeTile(title: 'Tägliches Rätsel', image: Image.asset('assets/homepage/daily-puzzle-board.jpg'), description: 'Gelöst von 1.087.004', descriptionIcon: const Icon(Icons.people_alt, color: Colors.grey, size: 20,),
            child: Row(
              children: [
                const SizedBox(width: 4),
                SizedBox(height: 41, child: Image.asset('assets/homepage/calendar.jpg'),),
              ],
            )
          ),
          const SizedBox(height: 14,),
          GameModeTile(title: 'Gegen den Computer spielen', image: Image.asset('assets/homepage/standard-board.jpg'), description: 'Scanner - Freundschaftspartie', 
            child: Row(
              children: [
                const SizedBox(width: 4),
                SizedBox(height: 43, child: Image.asset('assets/homepage/computer.jpg'),),
              ],
            )
          ),
          const SizedBox(height: 14,),
          GameModeTile(title: 'Unterricht nehmen', image: Image.asset('assets/homepage/empty-board.jpg'), description: 'Lerne etwas neues!', 
            child: Row(
              children: [
                const SizedBox(width: 4),
                SizedBox(height: 43, child: Image.asset('assets/homepage/study.jpg'),),
              ],
            )
          ),
          const SizedBox(height: 14,),
            ],
          ),
        ),
      ],
    );
  }
}