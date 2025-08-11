import 'package:flutter/material.dart';

import 'package:cnn/features/presentation/widget/login_abst/abstract.dart';
import 'login_page.dart';

class SignUp extends StatefulWidget{
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _mailController = TextEditingController();
  String? _mailError_txt;
  String? _passwordError_txt;
  bool _uppercase = false;
  bool _lowercase = false;
  bool _spcharacter = false;
  bool _numb = false;
  bool _length = false;
  bool _passVisibility = false;
  late final IconData _eye = close_eye;
  final IconData open_eye = Icons.visibility;
  final IconData close_eye = Icons.visibility_off;

  Widget _visibility(IconData onShow){
    setState(() {
      _passVisibility= !_passVisibility;
      if(_passVisibility == true){
        onShow = open_eye;
      }else{
        onShow = close_eye;
      }
    });
    return Icon(onShow);
  }

  void _validateInput() {
    setState((){
      _mailError_txt= _mailController.text.isEmpty?"Mail required":null;
      _passwordError_txt= _passwordController.text.isEmpty ? "This field is required." : null;
      if (_mailController.text.isEmpty || _passwordController.text.isEmpty) {
        _mailError_txt;
        _passwordError_txt;

      }else if (_mailController.text.length < 2) {
        _mailError_txt = 'Must be at least 3 characters';

      }else {
        _mailError_txt = null; // No error
      }
    });
  }

  void _validatepsswrd(String psswrd){
    setState((){
      _passwordError_txt =_passwordController.text.isEmpty ? "This field is required" : null;
      _uppercase = psswrd.contains(RegExp(r'[A-Z]'));
      _lowercase = psswrd.contains(RegExp(r'[a-z]'));
      _spcharacter = psswrd.contains(RegExp(r'[~!@#$%^&*(),.?":{}|<>]'));
      _numb = psswrd.contains(RegExp(r'[1234567890]'));
      _length = psswrd.length >= 8;
    });
    if (_passwordController.text.isEmpty){
      _passwordError_txt;
    }
  }

  void validateEmail() {
    String email = _mailController.text.trim();
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (email.isEmpty) {
      _mailError_txt;
    } else if (!emailRegex.hasMatch(email)) {
      _mailError_txt;
    } else {
      null;
    }
  }

  Widget _psswrdRequirement(bool psswrd, String text) {
    return Row(
      children: [
        Icon(
          psswrd ? Icons.check_circle : Icons.cancel,
          color: psswrd ? Color(0xff33415c) : Colors.deepOrangeAccent,
          size: 20,
        ),
        const SizedBox(width: 10),
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xffbde0fe),
      body: ListView(
        children: [
          // Opacity(
          //   opacity: .6,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage('assets/Images/login 5.png'),
          //         fit: BoxFit.cover
          //       )
          //     ),
          //   ),
          // ),
        Container(
          padding: EdgeInsets.all(15),
          child:  Form(
            key: _signUpKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // user_Gate.userTextField(
                //   controller: _usernameController,
                //   labelText: 'Username:',
                //   validator: (v){
                //     if(v!.isEmpty){
                //       return "This field is Required";
                //     }else{
                //       return null;
                //     }
                //   },
                //   enable: true,
                //   maxLines: 1,
                //   maxLength: 15,
                //   keyboardType: TextInputType.name,
                // ),
                SizedBox(height: 5,),
                user_Gate.userTextField(
                  controller:_mailController,
                  labelText: 'Mail:',
                  validator: (v){
                    if(v!.isEmpty){
                      return "This field is Required";
                    }else{
                      return null;
                    }
                  },
                  enable: true,
                  maxLines: 1,
                  maxLength: 49,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 5,),
                user_Gate.passwordTextField(
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: _passVisibility,
                    hintText: '*******',
                    labelText: 'Password:',
                    validator: (v){
                      if(v!.isEmpty){
                        return "This field is Required";
                      }else{
                        _validatepsswrd(v);
                      }
                    },
                    enable: true,
                    maxLines: 1,
                    maxLength: 15,
                  suffixIcon: InkWell(onTap: ()=>_visibility(_eye)),
                ),
                // const SizedBox(height: 5,),
                // _psswrdRequirement(_length, "Password must be at least 8 characters"),
                // _psswrdRequirement(_uppercase, "At least 1Uppercase"),
                // _psswrdRequirement(_lowercase, "At least 1 lowercase"),
                // _psswrdRequirement(_spcharacter, "Add some special characters"),
                // _psswrdRequirement(_numb, "At least one Number"),
                // SizedBox(height: 25,),
              ],
            ),
          ),
        ),
         // Container(
         //   height: 115,
         //   width: 235,
         //   padding: EdgeInsets.only(bottom: 21,top: 15,left: 15, right: 15),
         //   child: ElevatedButton(
         //     onPressed: (){
         //       if (_signUpKey.currentState!.validate()){
         //         _validateInput();
         //         validateEmail();
         //         _validatepsswrd(_passwordController.text);
         //         if(_mailError_txt == null && _passwordError_txt == null){
         //           Navigator.push(context, MaterialPageRoute(builder: (context)=> Login_screen()));
         //         }
         //
         //       }
         //     },
         //     style: ElevatedButton.styleFrom(
         //       foregroundColor: Colors.white,
         //       shadowColor:Color(0xffb6ccfe),
         //       textStyle: TextStyle(
         //         fontSize: 45,
         //         fontWeight: FontWeight.bold,
         //         fontStyle: FontStyle.italic,
         //         fontFamily: 'SourceSansPro',
         //       ),
         //       backgroundColor: Color(0xff33415c),
         //       shape: RoundedRectangleBorder(
         //         borderRadius: BorderRadius.circular(8),
         //       ),
         //     ),
         //     child: Text("Sign Up"),
         //   ),
         // )
        ],
      ),
    );
  }
}