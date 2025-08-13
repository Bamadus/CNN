// //
// // class SoftPay{
// //
// //   static Widget plainTextField(
// //       { TextEditingController? controller,
// //         String? hintText,
// //         String? type,
// //         TextInputType textInputType = TextInputType.text,
// //         FormFieldValidator<String>? validator,
// //         int maxLines=1,
// //         int? maxLength,
// //         dynamic suffix,
// //         Widget? suffixWidget,
// //         bool enable=true,
// //         Function? onTap,
// //         List<TextInputFormatter>? inputFormatters}){
// //     return TextFormField(
// //       controller: controller,
// //       onChanged: (v){
// //         controller!.text = v.replaceAll(',', '');
// //         controller.selection = TextSelection.collapsed(offset: v.length);
// //       },
// //       keyboardType: textInputType,
// //       maxLength: maxLength,
// //       enabled:  enable,
// //       inputFormatters:[
// //         type=='pin'? FilteringTextInputFormatter.digitsOnly:
// //         FilteringTextInputFormatter.deny(RegExp(r'\s'))],
// //       decoration: InputDecoration(
// //         isDense: true,
// //         hintText: hintText,
// //         counterText: "",
// //         suffixIcon: suffix,
// //         suffix: suffixWidget,
// //         hintStyle: const TextStyle(
// //             fontSize: 14, fontWeight: FontWeight.w400, color: gray),
// //         focusedBorder: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(5),
// //             borderSide: const BorderSide(
// //                 style: BorderStyle.solid, width: 1.0, color: gray)),
// //         errorBorder: const OutlineInputBorder(
// //             borderSide: BorderSide(width: 1.0, color: Colors.red)),
// //         border: OutlineInputBorder(
// //             borderSide: BorderSide(
// //               width: 1,
// //               color: "#092C4C".toColor(),
// //             ),
// //             borderRadius: const BorderRadius.all(
// //               Radius.circular(5.0),
// //             )),
// //         contentPadding:
// //         const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
// //       ),
// //       style: TextStyle(color: Colors.black),
// //       maxLines: maxLines,
// //       validator: validator,
// //     );
// //   }
// //   static Widget accountTextField(
// //       {
// //         ValueChanged? onChanged,
// //         TextEditingController? controller,
// //         String? hintText,
// //         TextInputType textInputType=TextInputType.phone,
// //         FormFieldValidator<String>? validator,
// //         int? maxLines=1,
// //         int? maxLength,
// //         dynamic suffix,
// //         Widget? suffixWidget,
// //         bool enable=true,
// //         Function? onTap
// //       }){
// //     return TextFormField(
// //       controller: controller,
// //       onChanged:onChanged,
// //       keyboardType: textInputType,
// //       maxLength: maxLength,
// //
// //       enabled: enable,
// //       inputFormatters: [
// //         FilteringTextInputFormatter.digitsOnly, // Allow only digits
// //         LengthLimitingTextInputFormatter(10),],
// //       decoration: InputDecoration(
// //         isDense: true,
// //         hintText: hintText,
// //         counterText: "",
// //         suffixIcon: suffix,
// //         suffix: suffixWidget,
// //         hintStyle: const TextStyle(
// //             fontSize: 14, fontWeight: FontWeight.w400, color: gray),
// //         focusedBorder: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(5),
// //             borderSide: const BorderSide(
// //                 style: BorderStyle.solid, width: 1.0, color: gray)),
// //         errorBorder: const OutlineInputBorder(
// //             borderSide: BorderSide(width: 1.0, color: Colors.red)),
// //         border: OutlineInputBorder(
// //             borderSide: BorderSide(
// //               width: 1,
// //               color: "#092C4C".toColor(),
// //             ),
// //             borderRadius: const BorderRadius.all(
// //               Radius.circular(5.0),
// //             )),
// //         contentPadding:
// //         const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
// //       ),
// //       style: TextStyle(color: Colors.black),
// //       maxLines: maxLines,
// //       validator: validator,
// //     );
// //   }
// //   static Widget darkAppTextField({
// //     ValueChanged? onChanged,
// //     TextEditingController? controller,
// //     String? hintText,
// //     TextInputType textInputType=TextInputType.text,
// //     FormFieldValidator<String>? validator,
// //     int maxLines=1,
// //     Function? onTap
// //   }){
// //     return TextFormField(
// //       controller: controller,
// //       decoration: InputDecoration(
// //         isDense: true,
// //         hintText: hintText,
// //         hintStyle: TextStyle(
// //             fontSize: 14,
// //             fontWeight: FontWeight.w400,
// //             color: gray),
// //         focusedBorder: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(5),
// //             borderSide: const BorderSide(
// //                 style: BorderStyle.solid, width: 1.0, color: gray)),
// //         errorBorder: const OutlineInputBorder(
// //             borderSide: BorderSide(width: 1.0, color: Colors.red)),
// //         border: OutlineInputBorder(
// //             borderSide: BorderSide(
// //               width: 1,
// //               color: "#092C4C".toColor(),
// //             ),
// //             borderRadius: const BorderRadius.all(
// //               Radius.circular(5.0),
// //             )),
// //         enabledBorder: OutlineInputBorder(
// //             borderSide: BorderSide(
// //               width: 1,
// //               color: "#092C4C".toColor(),
// //             ),
// //             borderRadius: const BorderRadius.all(
// //               Radius.circular(5.0),
// //             )),
// //         contentPadding:
// //         const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
// //       ),
// //       validator: validator,
// //     );
// //   }
// //   static Widget placeHolder({required String title, bool symbol=false}) {
// //     return Row(
// //       children: [
// //         Text(title,
// //             style: TextStyle(
// //               fontWeight: FontWeight.w400,
// //               fontSize: 16,
// //               fontFamily: "SourceSanPro",
// //             )),
// //         symbol?Text("*", style: TextStyle(color: Colors.red)):Container(),
// //       ],
// //     );
// //   }
// // }
//
// class AppPassword extends StatefulWidget {
//   final ValueChanged? onChanged;
//   final TextEditingController? controller;
//   final String? hintText;
//   bool obscureText;
//   bool isPasswordobscure;
//   final TextInputType textInputType;
//   final FormFieldValidator<String>? validator;
//   final int? maxLines;
//   final Function? onTap;
//
//   AppPassword(
//       {Key? key,
//         required this.controller,
//         required this.hintText,
//         this.textInputType = TextInputType.text,
//         this.validator,
//         this.onChanged,
//         this.obscureText = true,
//         this.isPasswordobscure = false,
//         this.maxLines = 1,
//         this.onTap})
//       : super(key: key);
//
//   @override
//   State<AppPassword> createState() => _AppPasswordState();
// }
//
// class _AppPasswordState extends State<AppPassword> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//       decoration: InputDecoration(
//         isDense: true,
//         hintText: widget.hintText,
//         hintStyle: const TextStyle(
//             fontSize: 14, fontWeight: FontWeight.w400, color: gray),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5),
//             borderSide: const BorderSide(
//                 style: BorderStyle.solid, width: 1, color: gray)),
//         errorBorder: const OutlineInputBorder(
//           borderSide: BorderSide(width: 1, color: Colors.red),
//         ),
//         border: OutlineInputBorder(
//             borderSide: BorderSide(
//               width: 1,
//               color: Theme.of(context).dividerColor,
//             ),
//             borderRadius: const BorderRadius.all(
//               Radius.circular(5.0),
//             )),
//         contentPadding:
//         const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
//         suffixIcon: IconButton(
//             onPressed: () {
//               setState(() {
//                 !widget.obscureText
//                     ? widget.obscureText = true
//                     : widget.obscureText = false;
//               });
//             },
//             icon: widget.isPasswordobscure
//                 ? Container(
//               width: 2,
//             )
//                 : widget.obscureText
//                 ? const Icon(Icons.visibility_off_outlined)
//                 : const Icon(Icons.visibility)),
//       ),
//       onChanged: widget.onChanged,
//       obscureText: widget.obscureText,
//       validator: widget.validator,
//     );
//   }
// }