import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class mailfield extends StatefulWidget{
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType textInputType = TextInputType.text;
  final FormFieldValidator<String>? validator;
  final int maxLines=1;
  final bool enable=true;
  final Function? onTap;

  mailfield({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.hintText,
    required TextInputType keyboardType,
    this.onTap,
  }):super(key:key);

  @override
  State<mailfield> createState() => _mailfieldState();
}
class _mailfieldState extends State<mailfield> {

  String? _mailError_txt= "Error in field";

  _validateEmail(){
    String email = widget.controller!.text.trim();
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      _mailError_txt;
    } else {
      null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      buildCounter: (
          BuildContext context,{
            required int currentLength,
            required bool isFocused,
            required int? maxLength,})=>null,
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
      ),
      validator: widget.validator,
      onChanged: _validateEmail,
    );
  }
}