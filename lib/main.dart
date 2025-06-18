import 'package:flutter/material.dart';
import 'Home.dart';

void main() {
  runApp(const Home_page());
}

class Home_page extends StatelessWidget{
  const Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
    ),
    home:const Home(),
    );
  }
}


