import 'package:flutter/material.dart';
import 'package:kalamullah/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalamullah/views/home_views/main_view.dart';
import 'package:kalamullah/views/home_views/quran_view.dart';
import 'package:kalamullah/views/home_views/prayers_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  final List<Widget> _widgetsList = <Widget>[
    const QuranView(),
    const MainView(),
    const PrayersView()
  ];

  List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        label: "Quran", icon: FaIcon(FontAwesomeIcons.bookOpen)),
    const BottomNavigationBarItem(
        label: "Home", icon: FaIcon(FontAwesomeIcons.house)),
    const BottomNavigationBarItem(
        label: "Prayers", icon: FaIcon(FontAwesomeIcons.handsPraying)),
  ];

  void _updateIndex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetsList.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: items,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          selectedLabelStyle: theme.textTheme.titleSmall,
          iconSize: 18,
          backgroundColor: wClr,
          selectedItemColor: gClr,
          unselectedItemColor: gClr.withAlpha(100),
          onTap: _updateIndex,
        ),
      ),
    );
  }
}
