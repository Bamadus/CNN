library main;
import 'package:flutter/material.dart';
import 'package:cnn/features/presentation/News/news.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/presentation/bloc/bloc.dart';


void main(){
  runApp(
      BlocProvider(
    create: (context) => BookmarkBloc(),
    child: const Politics(),
  ));
}

class Politics extends StatelessWidget{
  const Politics({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewsPage(),
    );
  }
}