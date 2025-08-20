import 'package:cnn/data/auth/auth_service.dart';
import 'package:cnn/features/presentation/routes/login_page.dart';
import 'package:cnn/features/presentation/routes/signUp.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget{
  const AuthLayout({
    super.key,
    this.pageNotConnected,
  });

  final Widget? pageNotConnected;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService,
      builder: (context, authService, child) {
        return StreamBuilder(
            stream: authService.authStateChanges,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else if(snapshot.hasData){
                return const Login_screen();
              }else{
                return pageNotConnected ?? const SignUp();
              }
            }
        );
      }
    );
  }
}