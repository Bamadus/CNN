import 'package:cnn/video_feature.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:cnn/Files/Football_feature.dart';
import 'package:cnn/Home_feature.dart';
import 'package:cnn/Me_feature.dart';
import 'package:cnn/Squad_feature.dart';


class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int myIndex = 0;
  List<Widget> widgetList = const [
    Home_feature(),
    Football_feature(),
    Video_feature(),
    Squad_feature(),
    Me_feature(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: IndexedStack(children: widgetList,index: myIndex,),

    );
  }
}