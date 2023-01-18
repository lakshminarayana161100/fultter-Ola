import 'package:flutte_ola/tab_Pages/earning_tab.dart';
import 'package:flutte_ola/tab_Pages/home_tab.dart';
import 'package:flutte_ola/tab_Pages/profile_tab.dart';
import 'package:flutte_ola/tab_Pages/ratings_tab.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget
{
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin
{
  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index =selectedIndex;
    });

  }

  @override
  void initState() {
    super.initState();

    tabController =TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          HomeTabPage(),
          EarningsTabPage(),
          RatingsTabPage(),
          ProfileTabPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Earnings',
            backgroundColor: Colors.yellowAccent,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Ratings',
            backgroundColor: Colors.green,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
            backgroundColor: Colors.pink,
          ),

        ],
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 14),
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}
