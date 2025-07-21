import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main(){
  runApp(const Login());
}

class Login extends StatelessWidget{
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Page(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English
      ],
    );
  }
}

class Page extends StatefulWidget{
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwrdController = TextEditingController();
  String? _mailError_txt;
  String? _passwordError_txt;
  bool _uppercase = false;
  bool _lowercase = false;
  bool _spcharacter = false;
  bool _numb = false;
  bool _length = false;
  bool _passVisibility = false;

  void _visibility(){
    setState(() {
      _passVisibility= !_passVisibility;
    });
  }

  void _validateInput() {
    setState((){
      _mailError_txt= _emailController.text.isEmpty?"Enter your mail Pls!!":null;
      _passwordError_txt= _passwrdController.text.isEmpty ? "This field is required." : null;
      if (_emailController.text.isEmpty || _passwrdController.text.isEmpty) {
        _mailError_txt;
        _passwordError_txt;

      }else if (_emailController.text.length < 2) {
        _mailError_txt = 'Must be at least 3 characters';

      }else {
        _mailError_txt = null; // No error
      }
    });
  }

  void _validatepsswrd(String psswrd) {
    setState(() {
      _passwordError_txt =_passwrdController.text.isEmpty ? "Enter your Password" : null;
      _uppercase = psswrd.contains(RegExp(r'[A-Z]'));
      _lowercase = psswrd.contains(RegExp(r'[a-z]'));
      _spcharacter = psswrd.contains(RegExp(r'[~!@#$%^&*(),.?":{}|<>]'));
      _numb = psswrd.contains(RegExp(r'[1234567890]'));
      _length = psswrd.length >= 8;
    });
    if (_passwrdController.text == null || _passwrdController.text.isEmpty) {
      _passwordError_txt;
    }
  }

  void validateEmail() {
    String email = _emailController.text.trim();
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
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
      backgroundColor: Color(0xff34a0a4),
      body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/Images/login 6.png'),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Positioned(
              bottom: 125,
              height: 65,
              left: 55,
              right: 55,
              child: ElevatedButton(
                onPressed: (){
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Color(0xffedf2fb),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(25))
                      ),
                      builder: (context)=>Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: Form(
                              key: _loginKey,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              child: Stack(
                                children: [Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 15,),
                                    // Text("Login", style: TextStyle(fontSize: 24)),
                                    TextFormField(
                                      controller: _emailController,
                                      maxLines: 1,
                                      keyboardType: TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          errorText: _mailError_txt,
                                            labelText: "Email:",
                                          labelStyle: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'SourceSansPro',
                                            color:Color(0xff33415c),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        validator:(v){
                                          if(v!.isEmpty){
                                            return "This field is Required";
                                          }else{
                                            return null;
                                          }
                                        }
                                    ),
                                    TextFormField(
                                        controller: _passwrdController,
                                        // keyboardType: TextInputType.visiblePassword,
                                        maxLines: 1,
                                        obscureText: _passVisibility,
                                        decoration: InputDecoration(
                                          errorText: _passwordError_txt,
                                            suffixIcon:IconButton(onPressed: (){
                                              setState(() {
                                                _passVisibility= !_passVisibility;
                                              });
                                            },
                                              icon: Icon(_passVisibility ? Icons.visibility_off : Icons.visibility),
                                            ),
                                            labelText: "Password:",
                                          labelStyle: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'SourceSansPro',
                                            color: Color(0xff33415c),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      onChanged: _validatepsswrd,
                                        validator: (v){
                                          if(v!.isEmpty){
                                            return "This field is required";
                                          }else{
                                            return null;
                                          }
                                        }
                                    ),
                                    const SizedBox(height: 5,),
                                    _psswrdRequirement(_length, "Password must be at least 8 characters"),
                                    _psswrdRequirement(_uppercase, "At least 1Uppercase"),
                                    _psswrdRequirement(_lowercase, "At least 1 lowercase"),
                                    _psswrdRequirement(_spcharacter, "Add some special characters"),
                                    _psswrdRequirement(_numb, "At least one Number"),
                                    SizedBox(height: 50),
                                    Container(
                                      height: 115,
                                      width: 235,
                                      padding: EdgeInsets.only(bottom: 21,top: 15,left: 15, right: 15),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (_loginKey.currentState!.validate()) {
                                            _loginKey.currentState!.save();
                                            _validateInput();
                                            validateEmail();
                                            // Navigator.pushNamed(context, '/news');
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
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
                                        child: Text("Login"),
                                      ),
                                    ),
                                  ],
                                ),]
                              ),
                            ),
                          ))
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xff002855),
                  shadowColor:Color(0xffb6ccfe),
                  textStyle: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'SourceSansPro',
                  ),
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Container(padding: EdgeInsets.only(bottom: 5),child: Text('Login')),
              ),
            ),
            // SizedBox(height: 5,),
            Positioned(
              bottom: 85,
              left: 65,
              child: RichText(
                  text: TextSpan(
                      text: 'Are you new here? ',
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontFamily: 'SourceSansPro',
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = (){
                              //Loading...
                            },
                          text: 'Sign Up...',
                          style: TextStyle(
                            fontSize: 25,
                            color:Color(0xffeda268),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SourceSansPro',
                          ),)
                      ]
                  )
              ),
            )
          ]
      ),
    );
  }
}