import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final String imagePath;
  final String gameName;

  const GameCard({
    Key? key,
    required this.imagePath,
    required this.gameName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          // Circular Image
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Game Name
          Text(
            gameName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}


class WeekGamesSection extends StatelessWidget {
  const WeekGamesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Week Games',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                GameCard(
                  imagePath: 'assets/logic-game.png',
                  gameName: 'logic Game',
                ),
                GameCard(
                  imagePath: 'assets/organizing.png',
                  gameName: 'organizing',
                ),
                GameCard(
                  imagePath: 'assets/puzzle-game.png',
                  gameName: 'puzzle Game',
                ),
                GameCard(
                  imagePath: 'assets/chess.png',
                  gameName: 'chess',
                ),
                // Add more GameCards as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}