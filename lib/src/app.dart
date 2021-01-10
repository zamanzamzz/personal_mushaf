import 'package:flutter/material.dart';
import 'package:personal_mushaf/src/screens/navigation_pager_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Mushaf',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.white,
      ),
      home: NavigationPagerScreen(),
    );
  }
}

