import 'package:flutter/material.dart';
import 'package:lesson54_provider_email_app/ui/fonts/app_fonts.dart';
import '../../provider/email_provider.dart';
import '../../model/email_model.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.vm,
    required this.controllerName,
    required this.controllerLastName,
    required this.controllerEmail,
    required this.controllerPhone,
    required this.controllerMessage,
  });

  final EmailProvider vm;
  final TextEditingController controllerName;
  final TextEditingController controllerLastName;
  final TextEditingController controllerEmail;
  final TextEditingController controllerPhone;
  final TextEditingController controllerMessage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 270,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffE12828),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () async {
          await vm.sendMessage(
            model: EmailModel(
              name: controllerName.text,
              lastName: controllerLastName.text,
              email: controllerEmail.text,
              phone: controllerPhone.text,
              message: controllerMessage.text,
            ),
          );
          vm.isSuccess
              // ignore: use_build_context_synchronously
              ? showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    backgroundColor: Colors.amber,
                    content: Text(
                      'Message sent successfully !',
                      style: AppFonts.textStyle,
                    ),
                  ),
                )
              // ignore: use_build_context_synchronously
              : showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    backgroundColor: Colors.red,
                    icon: Icon(Icons.error),
                    title: Text('Dio Error !'),
                  ),
                );
        },
        child: const Text(
          'Enter',
          style: AppFonts.buttonStyle,
        ),
      ),
    );
  }
}