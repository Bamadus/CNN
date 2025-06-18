import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myIndex = 0;
  List<Widget> widgetList = const [

  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 16,
      child: Scaffold(
        appBar: AppBar(

          toolbarHeight: 100,
          bottom: const TabBar(
            tabAlignment: TabAlignment.center,
            labelPadding: EdgeInsets.all(5),
            labelStyle:TextStyle(fontWeight: FontWeight.w600,fontSize: 21,fontFamily: 'SourceSansPro', color: Colors.black),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,fontFamily: 'SourceSansPro', color:Color(0Xff8C8E90)),
            unselectedLabelColor: Color(0Xff8C8E90),
            isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.red,
              tabs:[
                Tab(child: Text('Following',),),
                Tab(child: Text('For you',),),
                Tab(child: Text('Politics',)),
                Tab(child: Text('Club World Cup',)),
                Tab(child: Text('Entertainment')),
                Tab(child: Text('Football',)),
                Tab(child: Text('Business',)),
                Tab(child: Text('Relationships')),
                Tab(child: Text('Fashion&Beauty',)),
                Tab(child: Text('LifeStyle',)),
                Tab(child: Text('Headlines')),
                Tab(child: Text('Sports',)),
                Tab(child: Text('Technology')),
                Tab(child: Text('Motoring')),
                Tab(child: Text('Career&Jobs',)),
                Tab(child: Text('Travel',))
              ]),
          title: Padding(
            padding: const EdgeInsets.only(top: 111,bottom: 135),
            child: Container(
              padding: const EdgeInsets.only(left: 5,top: 29,bottom: 5),
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Container(
                    color: Colors.red,
                    child: Text("Hello"),
                  )
                ],
              ),
            ),
          ),
        ),
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
      ),
    );
  }
}