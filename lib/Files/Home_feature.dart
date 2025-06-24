import 'package:flutter/material.dart';

class Home_feature extends StatefulWidget{
  const Home_feature({super.key});

  @override
  State<Home_feature> createState() => _Home_featureState();
}

class _Home_featureState extends State<Home_feature> {
  GlobalKey<FormState> _searchKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Home screen'),
    );
  }
}

