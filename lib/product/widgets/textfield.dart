import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.showError,
      required this.errorText,
      required this.hintText,
      required this.controller,
      this.counterText,
      required this.obscureText});
  final String errorText, hintText;
  final String? counterText;
  final bool showError;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: 300,
        child: TextField(
          decoration: InputDecoration(
              counterText: counterText,
              errorText: showError ? errorText : null,
              hintText: hintText,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(
                width: 1,
              )),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.red))),
          obscureText: obscureText,
          controller: controller,
        ),
      ),
    );
  }
}

class TextFieldParameters {
  String? errorText, hintText, suffixText;
  bool? obscureText;
  TextEditingController? controller;
  TextFieldParameters(
      {this.controller,
      this.errorText,
      this.hintText,
      this.obscureText,
      this.suffixText});
}
