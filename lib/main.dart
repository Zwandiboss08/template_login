import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/login controller/login_contorller.dart';

void main() {
  runApp(
    MaterialApp(
      home: loginScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class loginScreen extends StatelessWidget {
  loginScreen({Key? key}) : super(key: key);
  var controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => MaterialApp(
            home: Scaffold(
          appBar: AppBar(
            title: Text('Template Apps'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
                child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Text(
                    'Hello Again!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text('Welcome back, you have been missed!'),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black))),
                    controller: controller.email_controller,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    obscureText: controller.isObscure.value,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            (controller.isObscure.value)
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            (controller.isObscure.value)
                                ? controller.isObscure.value = false
                                : controller.isObscure.value = true;
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black))),
                    controller: controller.password_controller,
                  ),
                ],
              ),
            )),
          ),
        )));
  }
}
