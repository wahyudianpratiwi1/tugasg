import 'package:flutter/material.dart';
import 'package:mbech/page/Detail/new.dart';
import 'package:mbech/page/Homepage/Beranda.dart';
import 'package:mbech/page/Homepage/Jelajah.dart';
import 'package:mbech/page/Homepage/Sop.dart';
import 'package:mbech/page/Homepage/Trading.dart';
import 'package:mbech/util/constant.dart';
import 'package:mbech/page/Homepage/profile.dart';
import 'package:mbech/page/Auth/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedindex = 0;
  final List<Widget> _children = [
    const Beranda(),
    Jelajah(),
    const Trading(),
    const Profile(),
  ];
  static const List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  void autologin() async {
    final pref = await SharedPreferences.getInstance();
    // final mytoken = pref.getString('token');
    final myexp = pref.getString("expiresAt");

    if (myexp == null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => const Login()));
    } else {
      DateTime myexpiresAt = DateTime.parse(myexp);
      DateTime nowDate = DateTime.now();
      if (nowDate.isBefore(myexpiresAt)) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const Login()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Sop()));
        },
        backgroundColor: const Color(0xffF9A826),
        child: Image.asset(
          'assets/image/sop.png',
          width: 30,
        ),
      );
    }

    Widget customNavigation() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 5,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            unselectedLabelStyle: medium,
            selectedLabelStyle: bold,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Jelajah',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long),
                label: 'Trading',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedindex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ),
      );
    }

    Widget body() {
      return _children[_selectedindex];
    }

    return Scaffold(
      body: body(),
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customNavigation(),
    );
  }
}
