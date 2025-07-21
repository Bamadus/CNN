import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const Login());
}

class Login extends StatelessWidget{
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
              height: 55,
              left: 55,
              right: 55,
              child: ElevatedButton(
                  onPressed: (){},
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
              bottom: 95,
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
                            color:Color(0xff002855),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SourceSansPro',
                          ),)
                    ]
                  )
              ),
            )
          ]
        ),
      )
    );
  }
}