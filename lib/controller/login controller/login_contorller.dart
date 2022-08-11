import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isObscure = true.obs;
  RxBool isChecked = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey();
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  void handleRemeberme(bool value) {
    isChecked.value = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', email_controller.text);
        prefs.setString('password', password_controller.text);
      },
    );
  }

  void loadUserEmailPassword() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;
      if (_remeberMe) {
        isChecked.value = true;
        email_controller.text = _email ?? "";
        password_controller.text = _password ?? "";
      }
    } catch (e) {
      print(e);
    }
  }
}
