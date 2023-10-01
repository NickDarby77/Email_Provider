import 'package:flutter/material.dart';
import 'package:lesson54_provider_email_app/ui/fonts/app_fonts.dart';

class NameTextFieldWidget extends StatefulWidget {
  const NameTextFieldWidget({
    super.key,
    required this.controllerName,
    required this.controllerLastName,
  });

  final TextEditingController controllerName;
  final TextEditingController controllerLastName;

  @override
  State<NameTextFieldWidget> createState() => _NameTextFieldWidgetState();
}

class _NameTextFieldWidgetState extends State<NameTextFieldWidget> {
  String? errorText;
  String? errorText2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: (value) {
              if (value.isNotEmpty) {
                errorText = null;
              } else {
                errorText = 'Field cannot be empty';
              }
              setState(() {});
            },
            controller: widget.controllerName,
            decoration: InputDecoration(
              errorText: errorText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              label: RichText(
                text: const TextSpan(
                  text: 'First name ',
                  style: AppFonts.labelStyle,
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              hintText: 'Name',
              hintStyle: AppFonts.hintStyle,
              contentPadding: const EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(width: 27),
        Expanded(
          child: TextField(
            onChanged: (value) {
              if (value.isNotEmpty) {
                errorText2 = null;
              } else {
                errorText2 = 'Field cannot be empty';
              }
              setState(() {});
            },
            controller: widget.controllerLastName,
            decoration: InputDecoration(
              errorText: errorText2,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              label: RichText(
                text: const TextSpan(
                  text: 'Last name ',
                  style: AppFonts.labelStyle,
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              hintText: 'Lastname',
              hintStyle: AppFonts.hintStyle,
              contentPadding: const EdgeInsets.all(16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
