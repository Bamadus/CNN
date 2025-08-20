import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

ValueNotifier<AuthService> authService= ValueNotifier(AuthService());  //This is a built-in state management in flutter

class AuthService{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<UserCredential> login({
    required String email,
    required String password,
}) async{
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> createAccount({
    required String email,
    required String password,
}) async{
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
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