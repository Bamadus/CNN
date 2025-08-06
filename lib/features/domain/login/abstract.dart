import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class user_Gate{
  final _emailController = TextEditingController();
  final _passwrdController = TextEditingController();
  String? _mailError_txt = "This field is required.";
  String? _passwordError_txt;

  static Widget plainTextFormField({
    TextEditingController? controller,
    String? hintText,
    String? type,
    TextInputType textInputType = TextInputType.text,
    FormFieldValidator<String>? validator,
    int maxLines=1,
    int? maxLength,
    bool enable=true,
    Function? onTap,
}){
    return TextFormField(
      controller: controller,
      onChanged: (v){
        controller!.text = v.replaceAll(',', '');
        controller.selection = TextSelection.collapsed(offset: v.length);
      },
      keyboardType: textInputType,
      maxLength: maxLength,
      enabled: enable,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        counterText: "",
        ),
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
      validator: validator,
    );
  }

  static Widget userTextFormField({
    TextEditingController? controller,
    String? hintText,
    String? errorText,
    String? labelText,
    TextInputType textInputType = TextInputType.text,
    FormFieldValidator<String>? validator,
    int maxLines=1,
    int? maxLength,
    bool enable=true,
    required TextInputType keyboardType,
}){
   return TextFormField(
     controller: controller,
     onChanged: (v){
       controller!.text = v.replaceAll(',', '');
       controller.selection = TextSelection.collapsed(offset: v.length);
     },
     keyboardType: textInputType,
     maxLength: maxLength,
     enabled: enable,
     decoration: InputDecoration(
       errorText: errorText,
       labelText: labelText,
       labelStyle: TextStyle(
         fontSize:19,
         fontFamily: 'SourceSansPro',
         color:Color(0xff33415c),
         fontWeight: FontWeight.bold,
       ),
       isDense: true,
       hintText: hintText,
       counterText: "",
     ),
     style: TextStyle(
         fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
     validator: validator,
   );
  }
}