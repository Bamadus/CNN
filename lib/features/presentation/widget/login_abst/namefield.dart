import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Namefield extends StatefulWidget{
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType textInputType = TextInputType.text;
  final FormFieldValidator<String>? validator;
  final int maxLines=1;
  final int? maxLength;
  final bool enable=true;
  final Function? onTap;

  Namefield({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.onTap,
    this.maxLength,
    this.hintText,
    required TextInputType keyboardType,
}):super(key:key);

  @override
  State<Namefield> createState() => _NamefieldState();
}
class _NamefieldState extends State<Namefield> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        maxLength: widget.maxLength,
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
        );
  }
}