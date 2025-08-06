library main;
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/presentation/bloc/bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cnn/features/presentation/Login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';



void main()async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,
  // );
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
      home: const Login_screen(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}