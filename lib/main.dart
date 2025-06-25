import 'package:flutter/material.dart';
import 'package:cnn/features/presentation/Politics/politics.dart';

void main(){
  runApp(const Politics());
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