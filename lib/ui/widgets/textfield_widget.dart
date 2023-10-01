import 'package:flutter/material.dart';
import 'package:lesson54_provider_email_app/ui/fonts/app_fonts.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.labelText,
    this.maxLines,
    this.suffixIcon,
    this.prefixIcon,
    required this.controller,
  });

  final String labelText;
  final String hintText;
  final int? maxLines;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final TextEditingController controller;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty) {
                errorText = null;
              } else {
                errorText = 'Field must contain @ or cannot be empty';
              }
            });
          },
          maxLines: widget.maxLines,
          controller: widget.controller,
          decoration: InputDecoration(
            errorText: errorText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: RichText(
              text: TextSpan(
                text: widget.labelText,
                style: AppFonts.labelStyle,
                children: const [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            hintText: widget.hintText,
            hintStyle: AppFonts.hintStyle,
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
