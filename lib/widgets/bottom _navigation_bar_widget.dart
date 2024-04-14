import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentTab;
  final Function(int) onTabChanged;

  const BottomNavigationBarWidget({
    super.key,
    required this.currentTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavBarItem(0, Icons.home, "Home", context),
            buildNavBarItem(1, Icons.trending_up_sharp, "Trends", context),
            buildNavBarItem(
                2, Icons.smart_display_outlined, "AI Post", context),
            buildNavBarItem(3, Icons.person, "Profile", context),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarItem(
      int index, IconData icon, String label, BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {
          onTabChanged(index);
        },
        child: Column(
          children: [
            Icon(
              icon,
              color: currentTab == index
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
            Text(
              label,
              style: TextStyle(
                color: currentTab == index
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
