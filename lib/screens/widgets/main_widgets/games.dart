
import 'package:flutter/material.dart';

// Reusable game card (as before)
class GameCategoryCard extends StatelessWidget {
  final String imagePath;
  final String gameName;

  const GameCategoryCard({
    Key? key,
    required this.imagePath,
    required this.gameName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Center(
            child: Text(
              gameName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black54,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

// Grid view of 4 games
class Games extends StatelessWidget {
  const Games({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1,
          children: const [
            GameCategoryCard(
              imagePath: 'assets/maths.png',
              gameName: 'Memory Master',
            ),
            GameCategoryCard(
              imagePath: 'assets/maths.png',
              gameName: 'Speed Runner',
            ),
            GameCategoryCard(
              imagePath: 'assets/maths.png',
              gameName: 'Math Genius',
            ),
            GameCategoryCard(
              imagePath: 'assets/maths.png',
              gameName: 'Language Pro',
            ),
          ],
        ),
      ),
    );
  }
}
/*
import 'package:flutter/material.dart';

// Reusable game category card
class GameCategoryCard extends StatelessWidget {
  final String imagePath;
  final String gameName;

  const GameCategoryCard({
    Key? key,
    required this.imagePath,
    required this.gameName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background image
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Overlay with game name
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.black.withOpacity(0.35),
            ),
          ),
          Center(
            child: Text(
              gameName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black54,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Games screen
class Games extends StatelessWidget {
  const Games({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top text
              const Text(
                'Game',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              // Game category title with dashes
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Game Category',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 24),
              // Four game category cards
              Expanded(
                child: ListView(
                  children: const [
                    GameCategoryCard(
                      imagePath: 'assets/maths.png',
                      gameName: 'Memory Master',
                    ),
                    GameCategoryCard(
                      imagePath: 'assets/organizing.png',
                      gameName: 'Speed Runner',
                    ),
                    GameCategoryCard(
                      imagePath: 'assets/maths.png',
                      gameName: 'Math Genius',
                    ),
                    GameCategoryCard(
                      imagePath: 'assets/maths.png',
                      gameName: 'Language Pro',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/