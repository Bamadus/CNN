import 'package:cnn/features/presentation/Login/signUp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cnn/features/presentation/News/news.dart';
import 'package:cnn/features/domain/login/abstract.dart';

class Login_screen extends StatefulWidget{
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwrdController = TextEditingController();
  String? _mailError_txt = "This field is required.";
  String? _passwordError_txt;


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

  void validateEmail() {
    String email = _emailController.text.trim();
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          margin: EdgeInsets.only(bottom: 66),
          backgroundColor: Colors.white60.withOpacity(.6),
          hitTestBehavior: HitTestBehavior.translucent,
          dismissDirection: DismissDirection.horizontal,
          padding: EdgeInsets.all(19),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 4,
          // backgroundColor: Colors.white.withOpacity(.7),
          content: Text('Welcome!!!, to CNN'),
          duration: Duration(seconds: 8),
        ),
      );
    });
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
                      backgroundColor: Color(0xffedf2fb).withOpacity(0.89),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(25))
                      ),
                      builder: (context)=>AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        padding: EdgeInsets.all(15),
                        child: Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Container(
                              padding: EdgeInsets.all(15),
                              height: MediaQuery.of(context).size.height * 0.5,
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
                                        user_Gate.userTextFormField(
                                          controller: _emailController,
                                          hintText: 'news@gmail.com',
                                          errorText: _mailError_txt,
                                          labelText: "Email:",
                                          validator: (v){
                                            if(v!.isEmpty){
                                              return "This field is Required";
                                            }else{
                                              return null;
                                            }
                                          },
                                          enable: true,
                                          maxLines: 1,
                                          maxLength: 59,
                                          textInputType: TextInputType.emailAddress,
                                          keyboardType: TextInputType.emailAddress,
                                        ),
                                        user_Gate.userTextFormField(
                                          controller: _passwrdController,
                                          hintText: 'password',
                                          errorText: _passwordError_txt,
                                          labelText: "Password:",
                                          validator: (v){
                                            if(v!.isEmpty){
                                              return "This field is required";
                                            }else{
                                              return null;
                                            }
                                          },
                                          keyboardType: TextInputType.visiblePassword,
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: TextButton(onPressed: (){}, child: Text('Forgot Password?',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xff33415c),
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              fontFamily: 'SourceSansPro',
                                            ),
                                          )),
                                        ),
                                        SizedBox(height: 45),
                                        Container(
                                          height: 115,
                                          width: 235,
                                          padding: EdgeInsets.only(bottom: 21,top: 15,left: 15, right: 15),
                                          child: ElevatedButton(
                                            onPressed: (){
                                              if (_loginKey.currentState!.validate()){
                                                _validateInput();
                                                validateEmail();
                                                if(_mailError_txt == null && _passwordError_txt == null){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsPage()));
                                                }
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
                            )),
                      )
                  ).whenComplete((){
                    _emailController.clear();
                    _passwrdController.clear();
                    setState(() {
                      _mailError_txt;
                      _passwordError_txt;
                    });
                  });
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=> const SignUp())
                            );
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