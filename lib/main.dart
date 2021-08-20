import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: BottomNav(),
    );
  }
}

class BottomNav extends StatefulWidget {
  BottomNav({Key key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text('here'),
      ),
      bottomNavigationBar: TabBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        tabs: [
          Tab(
            icon: Icons.people_outline,
            label: 'Refer & Earn',
            selected: _selectedIndex == 0,
          ),
          Tab(
            icon: Icons.schedule_outlined,
            label: 'Timesheet',
            selected: _selectedIndex == 1,
          ),
          Tab(
            icon: Icons.home_outlined,
            label: 'Home',
            selected: _selectedIndex == 2,
          ),
          Tab(
            icon: Icons.local_mall_outlined,
            label: 'Products',
            selected: _selectedIndex == 3,
          ),
          Tab(
            icon: Icons.person_outline,
            label: 'Account',
            selected: _selectedIndex == 4,
          ),
        ],
      ),
    );
  }
}

class TabBar extends StatelessWidget {
  const TabBar({
    Key key,
    this.tabs,
    this.onTap,
    this.unselectedColor,
  }) : super(key: key);

  final List<Tab> tabs;
  final Color unselectedColor;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      color: Colors.white,
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(tabs.length, (int index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                onTap(index);
              },
              child: tabs[index],
            ),
          );
        }),
      ),
    );
  }
}

class Tab extends StatelessWidget {
  const Tab({
    Key key,
    this.icon,
    this.label,
    this.selected = false,
    this.indicatorColor = Colors.black,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final bool selected;
  final Color indicatorColor;

  @override
  Widget build(BuildContext context) {
    final color = selected ? indicatorColor : Colors.black.withOpacity(0.4);

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
      transform: Matrix4.translationValues(0, selected ? -6 : 0, 0),
      child: Column(
        children: [
          Icon(icon, color: color),
          SizedBox(
            height: 6,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            transform: Matrix4.translationValues(0, selected ? 0 : 50, 0),
            curve: Curves.linear,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}