import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../fonts/app_fonts.dart';

class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget({
    super.key,
    required this.controllerPhone,
  });

  final TextEditingController controllerPhone;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controllerPhone,
      dropdownIconPosition: IconPosition.trailing,
      flagsButtonPadding: const EdgeInsets.only(left: 11),
      initialCountryCode: 'KG',
      decoration: InputDecoration(
        labelText: 'Phone',
        labelStyle: AppFonts.labelStyle,
        hintText: '(555) 000-0000',
        hintStyle: AppFonts.hintStyle,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(Icons.phone_outlined),
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
