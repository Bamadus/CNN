import 'package:flutter/material.dart';

class Login_Page extends StatefulWidget{
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  @override
  Widget build(BuildContext context) {
    String? _mailError_txt;

    String? _passwordError_txt;

    bool _uppercase = false;

    bool _lowercase = false;

    bool _spcharacter = false;

    bool _numb = false;

    bool _length = false;

    bool _passVisibility = false;

    late IconData eye = Icons.visibility_off;

    final IconData open_eye = Icons.visibility;

    final IconData close_eye = Icons.visibility_off;

    void _visibility(){
      setState(() {
        _passVisibility= !_passVisibility;
        if(_passVisibility == true){
          eye = open_eye;
        }else{
          eye = close_eye;
        }
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
        // _passwordError_txt =_passwrdController.text.isEmpty ? "Enter your Password" : null;
        _uppercase = psswrd.contains(RegExp(r'[A-Z]'));
        _lowercase = psswrd.contains(RegExp(r'[a-z]'));
        _spcharacter = psswrd.contains(RegExp(r'[~!@#$%^&*(),.?":{}|<>]'));
        _numb = psswrd.contains(RegExp(r'[1234567890]'));
        _length = psswrd.length >= 8;
      });
      if (_passwrdController.text.isEmpty){
        _passwordError_txt;
      }
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
  }
  }

  }
