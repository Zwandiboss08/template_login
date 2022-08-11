import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isObscure = true.obs;
  final GlobalKey<FormState> formKey = GlobalKey();
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }
}
