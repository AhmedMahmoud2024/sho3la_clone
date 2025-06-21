import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/splash_screen.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<String> skills = ['Math', 'Memory', 'Language', 'Problem Solving'];
  final List<String> types = ['Child', 'Teen', 'Adult'];
  List<String> selectedSkills = [];
  String? selectedType;
  int? age;

  void _submit() async {
    if (selectedSkills.isEmpty || selectedType == null || age == null) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('skills', selectedSkills);
    await prefs.setString('type', selectedType!);
    await prefs.setInt('age', age!);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            const Text('Select skills you want to improve:', style: TextStyle(fontSize: 18)),
            Wrap(
              spacing: 8,
              children: skills.map((skill) => FilterChip(
                label: Text(skill),
                selected: selectedSkills.contains(skill),
                onSelected: (selected) {
                  setState(() {
                    selected
                        ? selectedSkills.add(skill)
                        : selectedSkills.remove(skill);
                  });
                },
              )).toList(),
            ),
            const SizedBox(height: 24),
            const Text('Select your type:', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: selectedType,
              hint: const Text('Choose type'),
              items: types.map((type) => DropdownMenuItem(
                value: type,
                child: Text(type),
              )).toList(),
              onChanged: (val) => setState(() => selectedType = val),
            ),
            const SizedBox(height: 24),
            const Text('Enter your age:', style: TextStyle(fontSize: 18)),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (val) => setState(() => age = int.tryParse(val)),
              decoration: const InputDecoration(hintText: 'Age'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}