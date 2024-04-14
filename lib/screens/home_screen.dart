import 'package:beproject/screens/ai_post_generation.dart';
import 'package:beproject/screens/analysis_screen.dart';
import 'package:beproject/screens/profile_screen.dart';
import 'package:beproject/screens/trends_screen.dart';
import 'package:beproject/screens/upload_post_screen.dart';
import 'package:beproject/widgets/bottom%20_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;
  final List<Widget> screens = [
    const AnalysisScreen(),
    const TrendsScreen(),
    const AiPostGeneration(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentTab],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(
                  milliseconds: 500), // Set your desired duration
              pageBuilder: (context, animation, secondaryAnimation) {
                return UploadPostScreen();
              },
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1), // Start from the bottom
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
            ),
          );
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBarWidget(
        currentTab: currentTab,
        onTabChanged: (index) {
          setState(() {
            currentTab = index;
          });
        },
      ),
    );
  }
}
