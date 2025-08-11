// // import 'package:flutter/material.dart';
// //
// // class Login_Page extends StatefulWidget{
// //   String? _mailError_txt;
// //   String? _passwordError_txt;
// //   final TextEditingController? controller;
// //
// //   @override
// //   State<Login_Page> createState()=> _Login_PageState();
// // }
// //
// // class _Login_PageState extends State<Login_Page> {
// //   @override
// //   Widget build(BuildContext context){
// //
// //     void _visibility(){
// //       setState((){
// //         _passVisibility= !_passVisibility;
// //         if(_passVisibility == true){
// //           eye = open_eye;
// //         }else{
// //           eye = close_eye;
// //         }
// //       });
// //     }
// //
// //     void _validateInput() {
// //       setState((){
// //         _mailError_txt= _emailController.text.isEmpty?"Enter your mail Pls!!":null;
// //         _passwordError_txt= _passwrdController.text.isEmpty ? "This field is required." : null;
// //         if (_emailController.text.isEmpty || _passwrdController.text.isEmpty) {
// //           _mailError_txt;
// //           _passwordError_txt;
// //
// //         }else if (_emailController.text.length < 2) {
// //           _mailError_txt = 'Must be at least 3 characters';
// //
// //         }else {
// //           _mailError_txt = null; // No error
// //         }
// //       });
// //     }
// //
// //     void _validatepsswrd(String psswrd) {
// //       setState(() {
// //         // _passwordError_txt =_passwrdController.text.isEmpty ? "Enter your Password" : null;
// //         _uppercase = psswrd.contains(RegExp(r'[A-Z]'));
// //         _lowercase = psswrd.contains(RegExp(r'[a-z]'));
// //         _spcharacter = psswrd.contains(RegExp(r'[~!@#$%^&*(),.?":{}|<>]'));
// //         _numb = psswrd.contains(RegExp(r'[1234567890]'));
// //         _length = psswrd.length >= 8;
// //       });
// //       if (_passwrdController.text.isEmpty){
// //         _passwordError_txt;
// //       }
// //     }
// //
// //     void validateEmail(){
// //       String email = _emailController.text.trim();
// //       final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
// //       if (email.isEmpty) {
// //         _mailError_txt;
// //       } else if (!emailRegex.hasMatch(email)) {
// //         _mailError_txt;
// //       } else {
// //         null;
// //       }
// //     }
// //
// //     Widget _psswrdRequirement(bool psswrd, String text) {
// //       return Row(
// //         children: [
// //           Icon(
// //             psswrd ? Icons.check_circle : Icons.cancel,
// //             color: psswrd ? Color(0xff33415c) : Colors.deepOrangeAccent,
// //             size: 20,
// //           ),
// //           const SizedBox(width: 10),
// //           Text(text),
// //         ],
// //       );
// //     }
// //   }
// //   }
// //   }
//
// class SoftPay{
//
//   static Widget plainTextField(
//       { TextEditingController? controller,
//         String? hintText,
//         String? type,
//         TextInputType textInputType = TextInputType.text,
//         FormFieldValidator<String>? validator,
//         int maxLines=1,
//         int? maxLength,
//         dynamic suffix,
//         Widget? suffixWidget,
//         bool enable=true,
//         Function? onTap,
//         List<TextInputFormatter>? inputFormatters}){
//     return TextFormField(
//       controller: controller,
//       onChanged: (v){
//         controller!.text = v.replaceAll(',', '');
//         controller.selection = TextSelection.collapsed(offset: v.length);
//       },
//       keyboardType: textInputType,
//       maxLength: maxLength,
//       enabled:  enable,
//       inputFormatters:[
//         type=='pin'? FilteringTextInputFormatter.digitsOnly:
//         FilteringTextInputFormatter.deny(RegExp(r'\s'))],
//       decoration: InputDecoration(
//         isDense: true,
//         hintText: hintText,
//         counterText: "",
//         suffixIcon: suffix,
//         suffix: suffixWidget,
//         hintStyle: const TextStyle(
//             fontSize: 14, fontWeight: FontWeight.w400, color: gray),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5),
//             borderSide: const BorderSide(
//                 style: BorderStyle.solid, width: 1.0, color: gray)),
//         errorBorder: const OutlineInputBorder(
//             borderSide: BorderSide(width: 1.0, color: Colors.red)),
//         border: OutlineInputBorder(
//             borderSide: BorderSide(
//               width: 1,
//               color: "#092C4C".toColor(),
//             ),
//             borderRadius: const BorderRadius.all(
//               Radius.circular(5.0),
//             )),
//         contentPadding:
//         const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
//       ),
//       style: TextStyle(color: Colors.black),
//       maxLines: maxLines,
//       validator: validator,
//     );
//   }
//   static Widget accountTextField(
//       {
//         ValueChanged? onChanged,
//         TextEditingController? controller,
//         String? hintText,
//         TextInputType textInputType=TextInputType.phone,
//         FormFieldValidator<String>? validator,
//         int? maxLines=1,
//         int? maxLength,
//         dynamic suffix,
//         Widget? suffixWidget,
//         bool enable=true,
//         Function? onTap
//       }){
//     return TextFormField(
//       controller: controller,
//       onChanged:onChanged,
//       keyboardType: textInputType,
//       maxLength: maxLength,
//
//       enabled: enable,
//       inputFormatters: [
//         FilteringTextInputFormatter.digitsOnly, // Allow only digits
//         LengthLimitingTextInputFormatter(10),],
//       decoration: InputDecoration(
//         isDense: true,
//         hintText: hintText,
//         counterText: "",
//         suffixIcon: suffix,
//         suffix: suffixWidget,
//         hintStyle: const TextStyle(
//             fontSize: 14, fontWeight: FontWeight.w400, color: gray),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5),
//             borderSide: const BorderSide(
//                 style: BorderStyle.solid, width: 1.0, color: gray)),
//         errorBorder: const OutlineInputBorder(
//             borderSide: BorderSide(width: 1.0, color: Colors.red)),
//         border: OutlineInputBorder(
//             borderSide: BorderSide(
//               width: 1,
//               color: "#092C4C".toColor(),
//             ),
//             borderRadius: const BorderRadius.all(
//               Radius.circular(5.0),
//             )),
//         contentPadding:
//         const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
//       ),
//       style: TextStyle(color: Colors.black),
//       maxLines: maxLines,
//       validator: validator,
//     );
//   }
//   static Widget darkAppTextField({
//     ValueChanged? onChanged,
//     TextEditingController? controller,
//     String? hintText,
//     TextInputType textInputType=TextInputType.text,
//     FormFieldValidator<String>? validator,
//     int maxLines=1,
//     Function? onTap
//   }){
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         isDense: true,
//         hintText: hintText,
//         hintStyle: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w400,
//             color: gray),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5),
//             borderSide: const BorderSide(
//                 style: BorderStyle.solid, width: 1.0, color: gray)),
//         errorBorder: const OutlineInputBorder(
//             borderSide: BorderSide(width: 1.0, color: Colors.red)),
//         border: OutlineInputBorder(
//             borderSide: BorderSide(
//               width: 1,
//               color: "#092C4C".toColor(),
//             ),
//             borderRadius: const BorderRadius.all(
//               Radius.circular(5.0),
//             )),
//         enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               width: 1,
//               color: "#092C4C".toColor(),
//             ),
//             borderRadius: const BorderRadius.all(
//               Radius.circular(5.0),
//             )),
//         contentPadding:
//         const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
//       ),
//       validator: validator,
//     );
//   }
//   static Widget placeHolder({required String title, bool symbol=false}) {
//     return Row(
//       children: [
//         Text(title,
//             style: TextStyle(
//               fontWeight: FontWeight.w400,
//               fontSize: 16,
//               fontFamily: "SourceSanPro",
//             )),
//         symbol?Text("*", style: TextStyle(color: Colors.red)):Container(),
//       ],
//     );
//   }
// }
