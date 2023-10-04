import 'package:flutter/material.dart';
import 'package:lesson54_provider_email_app/ui/fonts/app_fonts.dart';

class EmailFieldWidget extends StatefulWidget {
  const EmailFieldWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<EmailFieldWidget> createState() => _EmailFieldWidgetState();
}

class _EmailFieldWidgetState extends State<EmailFieldWidget> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              if (value.contains('@')) {
                errorText = null;
              } else {
                errorText = 'Email must contain @';
              }
            });
          },
          controller: widget.controller,
          decoration: InputDecoration(
            errorText: errorText,
            suffixIcon: const Icon(Icons.email_outlined),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: RichText(
              text: const TextSpan(
                text: 'E-mail',
                style: AppFonts.labelStyle,
                children: [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            hintText: 'yourmail@gmail.com',
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
