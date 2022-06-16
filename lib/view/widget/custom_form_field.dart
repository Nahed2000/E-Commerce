import 'package:flutter/material.dart';

import 'custome_text.dart';

class CustomFormField extends StatelessWidget {
  final String text;
  final String hint;

  final void Function(String? value) onSaved;

  final String Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(text: text, fontSize: 14, color: Colors.grey),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
          decoration: InputDecoration(
              hintText: hint,
              fillColor: Colors.white,
              hintStyle: const TextStyle(fontSize: 14, color: Colors.black),
          ),

        )
      ],
    );
  }

  const CustomFormField({
    Key? key,
    required this.text,
    required this.hint,
    required this.onSaved,
    required this.validator,
  }) : super(key: key);
}
