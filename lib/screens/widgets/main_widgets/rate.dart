 // import 'package:flutter/material.dart';

//class RatePage extends StatelessWidget {
//  const RatePage({super.key});

//  @override
//  Widget build(BuildContext context) {
//    return const Scaffold();
//  }
//}
import 'package:flutter/material.dart';

// Reusable row widget for parameter rating
class ParameterRateRow extends StatelessWidget {
  final String parameter;
  final double percentage; // 0.0 - 1.0
  final String rate;

  const ParameterRateRow({
    Key? key,
    required this.parameter,
    required this.percentage,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              parameter,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            flex: 3,
            child: LinearProgressIndicator(
              value: percentage,
              minHeight: 8,
              backgroundColor: Colors.grey[300],
              color: Colors.purple,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            rate,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class RatePage extends StatefulWidget {
  const RatePage({Key? key}) : super(key: key);

  @override
  State<RatePage> createState() => _RateScreenState();
}

class _RateScreenState extends State<RatePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top left text
              const Text(
                'Rate',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Tab bar
              TabBar(
                controller: _tabController,
                labelColor: Colors.purple,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.purple,
                tabs: const [
                  Tab(text: 'Performance'),
                  Tab(text: 'Progress'),
                ],
              ),
              const SizedBox(height: 20),
              // Tab bar views
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Performance Tab
                    Column(
                      children: [
                        // My Rate text centered between two dashes
                        Row(
                          children: const [
                            Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'My Rate',
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
                        // Parameter rows
                        ParameterRateRow(
                          parameter: 'Total Rate',
                          percentage: 0.85,
                          rate: 'Excellent',
                        ),
                        ParameterRateRow(
                          parameter: 'Speed',
                          percentage: 0.7,
                          rate: 'Good',
                        ),
                        ParameterRateRow(
                          parameter: 'Memory',
                          percentage: 0.6,
                          rate: 'Average',
                        ),
                        ParameterRateRow(
                          parameter: 'Flexibility',
                          percentage: 0.8,
                          rate: 'Very Good',
                        ),
                        ParameterRateRow(
                          parameter: 'Language',
                          percentage: 0.9,
                          rate: 'Excellent',
                        ),
                        ParameterRateRow(
                          parameter: 'Math',
                          percentage: 0.75,
                          rate: 'Good',
                        ),
                        ParameterRateRow(
                          parameter: 'Problem Solving',
                          percentage: 0.65,
                          rate: 'Average',
                        ),
                      ],
                    ),
                    // Progress Tab (Graph placeholder)
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.show_chart, size: 80, color: Colors.purple),
                          const SizedBox(height: 16),
                          const Text(
                            'Progress Graph Coming Soon',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ],
                      ),
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
