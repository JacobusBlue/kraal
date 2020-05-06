import 'package:flutter/material.dart';
import 'package:kraal/screens/CreateAd.dart';
import 'package:kraal/screens/CreateNewAdd.dart';
import 'package:kraal/screens/userInfo.dart';



class landingPage extends StatefulWidget {
  @override
  _landingPageState createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  int _currentIndex = 2;
  List<Widget> _children = [
    CreatNewAddPage(),
    CreateAd(),
    // publish(),
    // Home(),
    UserInfo(),
    //newAddPage(),
    //createNewAdd(),
  ];
  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar:  BottomNavigationBar(
        
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
           BottomNavigationBarItem(
           icon: Icon(Icons.camera),
           title: Text('New add')
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           title: new Text('Home'),
         ),
         
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('Profile')
         ),
        
        ],
        
         showUnselectedLabels: true,
        // backgroundColor: Colors.grey,
         fixedColor: Colors.red[900],
         unselectedItemColor: Colors.red[700],
         showSelectedLabels: true,
        // elevation: 1.0,
        // iconSize: 30.0,
        
      ),

      
    );
  }
}