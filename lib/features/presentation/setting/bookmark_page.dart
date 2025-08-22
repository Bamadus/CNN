import 'package:flutter/material.dart';
import 'package:cnn/features/presentation/bloc/bloc.dart';

class Bookmark_Page extends StatelessWidget{
  const Bookmark_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 45),
          child: Text("Bookmarks",style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 32,
            fontFamily: 'SourceSansPro',
            color: Color(0xff000000),
          ),),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              // child: ,
            );
          }
      )
    );
  }
}