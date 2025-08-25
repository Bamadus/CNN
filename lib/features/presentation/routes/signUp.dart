import 'package:cnn/data/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cnn/features/presentation/widget/login_abst/namefield.dart';
import '../widget/login_abst/mailfield.dart';
import '../widget/sign_up/pwordfield.dart';
import 'login_page.dart';

class SignUp extends StatefulWidget{
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();

  String errormessage= '';
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _mailController = TextEditingController();
  String? _mailError_txt;
  String? _passwordError_txt;
  String? _nameError_txt;

  _validateInput() {
    if (_mailController.text.length < 2) {
      return _mailError_txt = 'Must be at least 3 characters';
    }
  }

  void register()async{
    try{
      await authService.value.createAccount(
          email: _mailController.text,
          password: _passwordController.text,
          username: _usernameController.text,
      );
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Sign Up Successfully...",
              style: TextStyle(
                fontSize: 19,
                color: Color(0xff33415c),
                fontWeight: FontWeight.normal,
                fontFamily: 'SourceSansPro',
              ),
            ),
            elevation: 5,
            backgroundColor: Color(0xffedf6f9).withOpacity(0.89),
            padding: EdgeInsets.all(15),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(bottom: 100, left: 20, right: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          )
      );
      } on FirebaseAuthException catch(e){
      setState(() {
        errormessage = e.message!;
      });
    }
  }

  // Future<void> createUSer()async{
  //   final userCredentials= await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email:_mailController.text.trim(),
  //       password:_passwordController.text.trim());
  //   print(userCredentials);
  // }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign Up",
            style: TextStyle(
              fontSize: 35,
              color: Color(0xff33415c),
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontFamily: 'SourceSansPro',
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xffbde0fe),
        ),
        backgroundColor:Color(0xffbde0fe),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 50),
              child:  Form(
                key: _signUpKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child:Column(
                  children: [
                    Namefield(
                      controller: _usernameController,
                      labelText: 'Username:',
                      validator: (v){
                        if(v!.isEmpty){
                          return "This field is required";
                        }else{
                          return null;
                        }
                      },
                      maxLength: 15,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 15,),
                    mailfield(
                      controller:_mailController,
                      labelText: 'Mail:',
                      errorText: _mailError_txt,
                      validator: (v){
                        if(v!.isEmpty){
                          return "This field is required";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 15,),
                    AppPassword(
                      controller: _passwordController,
                      labelText: 'Password:',
                      isPasswordobscure: true,
                      validator: (v){
                        if(v!.isEmpty){
                          return "This field is Required";
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 115,
                      width: 235,
                      padding: EdgeInsets.only(bottom: 21,top: 15,left: 15, right: 15),
                      child: ElevatedButton(
                        onPressed: (){
                          if (_signUpKey.currentState!.validate()){
                            register();
                            // if(_mailError_txt == null){
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context)=> Login_screen())
                            //   );
                            //   Navigator.pop(context);
                            // }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          elevation: 8,
                          shadowColor:Color(0xffb6ccfe),
                          textStyle: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'SourceSansPro',
                          ),
                          backgroundColor: Color(0xff33415c),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text("Sign Up"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}