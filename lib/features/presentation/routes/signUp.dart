import 'package:flutter/material.dart';

import 'package:cnn/features/presentation/widget/login_abst/abstract.dart';
import '../widget/sign_up/pwordfield.dart';
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
  String? _nameError_txt;
  // bool _uppercase = false;
  // bool _lowercase = false;
  // bool _spcharacter = false;
  // bool _numb = false;
  // bool _length = false;
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
      _mailError_txt= _mailController.text.isEmpty?"This field is required":null;
      _passwordError_txt= _passwordController.text.isEmpty ? "This field is required." : null;
      _nameError_txt= _usernameController.text.isEmpty ? "This field is required." : null;
      if (_mailController.text.isEmpty || _passwordController.text.isEmpty || _usernameController.text.isEmpty) {
        _mailError_txt;
        _passwordError_txt;
        _nameError_txt;

      }else if (_mailController.text.length < 2) {
        _mailError_txt = 'Must be at least 3 characters';

      }else {
        _mailError_txt = null; // No error
      }
    });
  }

  void validateEmail(){
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
                    user_Gate.userTextField(
                      controller: _usernameController,
                      labelText: 'Username:',
                      errorText: _nameError_txt,
                      validator: (v){
                        if(v!.isEmpty){
                          return "This field is Required";
                        }else{
                          return null;
                        }
                      },
                      enable: true,
                      maxLines: 1,
                      maxLength: 15,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 15,),
                    user_Gate.userTextField(
                      controller:_mailController,
                      labelText: 'Mail:',
                      errorText: _mailError_txt,
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
                            _validateInput();
                            validateEmail();
                            if(_mailError_txt == null && _passwordError_txt == null && _nameError_txt == null){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Login_screen()));
                            }
                            // Navigator.pushNamed(context, '/news');
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