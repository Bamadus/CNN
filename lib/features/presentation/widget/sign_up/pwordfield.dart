import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppPassword extends StatefulWidget{
  final ValueChanged? onChanged;
  final TextEditingController? controller;
  final String? labelText;
  bool obscureText;
  bool isPasswordobscure;
  final TextInputType textInputType;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final int? maxlength;
  final Function? onTap;

  AppPassword({
    Key? key,
    required this.controller,
    required this.labelText,
    this.textInputType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.obscureText = true,
    this.isPasswordobscure = false,
    this.maxLines = 1,
    this.maxlength = 8,
    this.onTap,
}):super(key: key);

  @override
  State<AppPassword> createState() => _AppPasswordState();
}

class _AppPasswordState extends State<AppPassword>{

  bool _uppercase = false;
  bool _lowercase = false;
  bool _spcharacter = false;
  bool _numb = false;
  bool _length = false;

  _validatepsswrd(String psswrd){
    setState((){
      _uppercase = psswrd.contains(RegExp(r'[A-Z]'));
      _lowercase = psswrd.contains(RegExp(r'[a-z]'));
      _spcharacter = psswrd.contains(RegExp(r'[~!@#$%^&*(),.?":{}|<>]'));
      _numb = psswrd.contains(RegExp(r'[1234567890]'));
      _length = psswrd.length >= 8;
    });
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
  Widget build(BuildContext context){
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          maxLength: 8,
          buildCounter: (
              BuildContext context, {
                required int currentLength,
                required bool isFocused,
                required int? maxLength,
              }) => null,
          decoration: InputDecoration(
            isDense: true,
            labelText: widget.labelText,
            labelStyle: const TextStyle(
              fontSize:19,
              fontFamily: 'SourceSansPro',
              color:Color(0xff33415c),
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                style: BorderStyle.solid,
                width: 1,
                color: Color(0xff33415c),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                style: BorderStyle.solid,
                width: 1,
                color: Color(0xff33415c),
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.red,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Color(0xff33415c),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
            suffixIcon: IconButton(
              onPressed: (){
                setState(() {
                  !widget.obscureText ?
                  widget.obscureText = true
                      : widget.obscureText = false;
                });
              },
              icon:widget.obscureText
                  ? const Icon(Icons.visibility_off_outlined, color:Color(0xff33415c),)
                  : const Icon(Icons.visibility, color:Color(0xff33415c),),
          ),
        ),
          onChanged: _validatepsswrd,
          obscureText: widget.obscureText,
          validator: widget.validator,
        ),
        SizedBox(height: 8,),
        _psswrdRequirement(_length, "Password must be at least 8 characters"),
        _psswrdRequirement(_uppercase, "At least 1Uppercase"),
        _psswrdRequirement(_lowercase, "At least 1 lowercase"),
        _psswrdRequirement(_spcharacter, "Add some special characters"),
        _psswrdRequirement(_numb, "At least one Number"),
        SizedBox(height: 25,),
      ],
    );
  }
}