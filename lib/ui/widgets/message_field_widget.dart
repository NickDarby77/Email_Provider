import 'package:flutter/material.dart';
import 'package:lesson54_provider_email_app/ui/fonts/app_fonts.dart';

class MessageFieldWidget extends StatefulWidget {
  const MessageFieldWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<MessageFieldWidget> createState() => _MessageFieldWidgetState();
}

class _MessageFieldWidgetState extends State<MessageFieldWidget> {
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
                errorText = 'Message cannot be empty';
              }
            });
          },
          maxLines: 7,
          controller: widget.controller,
          decoration: InputDecoration(
            errorText: errorText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: RichText(
              text: const TextSpan(
                text: 'Message',
                style: AppFonts.labelStyle,
                children: [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            hintText: 'Your message',
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
