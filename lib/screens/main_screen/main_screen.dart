import 'package:flutter/material.dart';

import '../widgets/main_widgets/cubits.dart';
import '../widgets/main_widgets/exercise.dart';
import '../widgets/main_widgets/games.dart';
import '../widgets/main_widgets/my_account.dart';
import '../widgets/main_widgets/rate.dart';

class MainScreen extends StatefulWidget {
    const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController=PageController();
  int _selectedIndex=0;
  final List<Widget> _pages=[
    const ExercisePage(),
    const RatePage(),
    const Games(),
    const Cubits(),
    const MyAccountPage()

  ];

@override
  void dispose() {
   _pageController.dispose();
    super.dispose();
  }

void _onPageChanged(int index){
setState(() {
  _selectedIndex=index;
});
}

void _onItemTapped(int index){
  setState(() {
    _selectedIndex=index;
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  });
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Exercise',
            backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rate),
            label: 'Rate',
               backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games),
            label: 'Games',
               backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration_rounded),
            label: 'Cubits',
               backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'My Account',
               backgroundColor: Colors.black
          ),
        ],
      ),
    ) ;
  }
}