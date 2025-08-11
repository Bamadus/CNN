import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class user_Gate{

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

  static Widget userTextField({
    TextEditingController? controller,
    String? errorText,
    String? labelText,
    TextInputType textInputType = TextInputType.text,
    int maxLines=1,
    int? maxLength,
    bool enable=true,
    required TextInputType keyboardType,
    required String? Function(dynamic v) validator,
}){
    return TextField(
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
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
                style: BorderStyle.solid,
                width: 1.0,
                color: Color(0xff33415c)
            )),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1.0, color: Colors.red)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Color(0xff33415c),
        )
      ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Color(0xff33415c),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
      )
    ))
    );
}

  static Widget passwordTextField({
    TextEditingController? controller,
    String? hintText,
    String? errorText,
    String? labelText,
    required bool obscureText,
    TextInputType textInputType = TextInputType.text,
    int maxLines=1,
    int? maxLength,
    bool enable=true,
    bool eye = true,
    final IconData open_eye = Icons.visibility,
    final IconData close_eye = Icons.visibility_off,
    required Widget suffixIcon,
    required TextInputType keyboardType,
    required String? Function(dynamic v) validator,
  }){
    return TextField(
        controller: controller,
        onChanged: (v){
          controller!.text = v.replaceAll(',', '');
          controller.selection = TextSelection.collapsed(offset: v.length);
        },
        keyboardType: textInputType,
        maxLength: maxLength,
        enabled: enable,
        obscureText: obscureText,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
            errorText: errorText,
            labelText: labelText,
            labelStyle: TextStyle(
              fontSize:19,
              fontFamily: 'SourceSansPro',
              color:Color(0xff33415c),
              fontWeight: FontWeight.bold,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                    style: BorderStyle.solid,
                    width: 1.0,
                    color: Color(0xff33415c)
                )),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1.0, color: Colors.red)),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Color(0xff33415c),
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Color(0xff33415c),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5.0),
                )
            ))
    );
  }
}