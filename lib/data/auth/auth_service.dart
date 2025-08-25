import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/presentation/routes/login_page.dart';

ValueNotifier<AuthService> authService= ValueNotifier(AuthService());  //This is a built-in state management in flutter

class AuthService{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  BuildContext? get context => null;

  Future<UserCredential> login({
    required String email,
    required String password,
}) async{
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

  }

  Future<String?> createAccount({
    required String email,
    required String password,
    required String username,
}) async{
    try{
      UserCredential userCredential = await
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password
      );

      await userCredential.user?.updateDisplayName(username);
      await userCredential.user?.reload();
      return "Success";
    }on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        return 'The password provided is too weak.';
      }else if(e.code == 'email-already-in-use'){
        return 'The account already exists for that email';
      }else{
        Navigator.push(
            context!,
            MaterialPageRoute(
                builder: (context)=> Login_screen())
        );

      }
      return e.message;
    } catch(e){
      return e.toString();
    }
    // return await firebaseAuth.createUserWithEmailAndPassword(
    //   email: email,
    //   password: password,
    // );
  }

  Future<void> signOut() async{
    await firebaseAuth.signOut();
  }

  Future<void> resetPassword({
    required String email,
}) async{
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateUsername({
    required String username,
}) async{
    await currentUser!.updateDisplayName(username);
  }

  Future<void> deleteAccount({
    required String password,
    required String email,
}) async{
    AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.delete();
    await firebaseAuth.signOut();
  }

  Future<void> resetPasswordFromCurrentPassword({
    required String email,
    required String newpassword,
    required String currentPassword,
}) async{
    AuthCredential credential = EmailAuthProvider.credential(email: email, password: currentPassword);
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.updatePassword(newpassword);
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }





}