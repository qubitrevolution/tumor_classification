import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:tumor_detection/pages/classifier.dart';

import 'pages/Start.dart';

class HomePage extends StatefulWidget {
  @override 
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  List listOfPage = [
    Container(
      color: Colors.grey[300],
      child: StartPage(),
    ),
    Container(
      child: BrainTumorClassifier(),
    ),
  ];
  @override 
  Widget build(BuildContext context) {
    return Scaffold(

    body: listOfPage[currentIndex],
    backgroundColor: Colors.grey[300],

   
    bottomNavigationBar:
     Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavyBar(
          showElevation: true,
          mainAxisAlignment:MainAxisAlignment.center,

          selectedIndex: currentIndex,
          onItemSelected: (index){
            setState(() {
                currentIndex = index;      
                    });
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Colors.pinkAccent,
              inactiveColor: Colors.black,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.face_outlined),
              title: Text('User'),
              activeColor: Colors.pinkAccent,
              inactiveColor: Colors.black,
            ),
          ],
        ),
      ),
    ),);
  }
}