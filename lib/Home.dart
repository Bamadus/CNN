import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'Home_feature.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int myIndex = 0;
  List<Widget> widgetList = const [
    Home_feature(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(children: widgetList,index: myIndex,),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.red,
            unselectedItemColor:const Color(0Xff8C8E90),
            selectedLabelStyle: TextStyle(
              fontFamily: 'SourceSansPro',
              fontSize: 15,
              color:Colors.red,
              fontWeight: FontWeight.w400,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'SourceSansPro',
              fontSize: 15,
              color:Colors.white54,
              fontWeight: FontWeight.w400,
            ),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                myIndex = index;
              });
            },
            currentIndex: myIndex,
            items: const [
              BottomNavigationBarItem(
                // Still gat work to do on the home Icon
                activeIcon: InkWell(child: Icon(Icons.refresh)),
                icon: Icon(Icons.newspaper_sharp),label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports_soccer), label: "Football"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.slow_motion_video_outlined), label: "Video"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: "Squad"),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),label: "Me",
              )
            ]),
      );
  }
}