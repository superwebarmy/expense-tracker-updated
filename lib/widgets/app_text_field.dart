import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final String hintText;
  const AppTextField({Key? key, required this.controller, required this.textInputAction, required this.textInputType, required this.hintText}) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: GoogleFonts.oswald(),
          filled: true,
          fillColor: Colors.grey[300],
          border: UnderlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10.0))
      ),
    );
  }
}
