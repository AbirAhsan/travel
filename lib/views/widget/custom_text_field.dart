import '../../views/variables/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? prefixText;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final Widget? prefixIcon;
  final TextStyle? style;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  const CustomTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.suffixIcon,
    this.prefixText,
    this.style,
    this.inputFormatters,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.onChanged,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 242, 241, 241),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: TextFormField(
          onTap: onTap,
          readOnly: readOnly,
          keyboardType: keyboardType,
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          style: style,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: '',
            labelText: labelText,
            labelStyle: normalBoldStyle,
            hintText: hintText,
            prefixIcon: prefixIcon,
            prefixText: prefixText,
            prefixStyle: normalBoldStyle,
            suffixIcon: suffixIcon,
          ),
          onChanged: onChanged,
        ));
  }
}
