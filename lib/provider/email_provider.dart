import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lesson54_provider_email_app/core/app_consts.dart';
import 'package:lesson54_provider_email_app/core/dio_settings.dart';
import '../model/email_model.dart';

class EmailProvider extends ChangeNotifier {
  final Dio dio = DioSettings().dio;
  bool isSuccess = false;

  Future<void> sendMessage({required EmailModel model}) async {
    try {
      final Response response =
          await dio.post('https://api.emailjs.com/api/v1.0/email/send', data: {
        "service_id": AppConsts.serviceId,
        "template_id": AppConsts.templateId,
        "user_id": AppConsts.userId,
        "accessToken": AppConsts.accessToken,
        "template_params": {
          "name": model.name,
          "last_name": model.lastName,
          "email": model.email,
          "phone": model.phone,
          "message": model.message,
          "from": 'Nick Darby',
        },
      });
      if (response.statusCode == 200) {
        isSuccess = true;
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
